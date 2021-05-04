usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn RepeatedContext(comptime Value: type) type {
    return struct {
        /// The parser which should be repeatedly parsed.
        parser: *const Parser(Value),

        /// The minimum number of times the parser must successfully match.
        min: usize,

        /// The maximum number of times the parser can match, or -1 for unlimited.
        max: isize,
    };
}

/// Represents a single value in the stream of repeated values.
///
/// In the case of a non-ambiguous grammar, a `Repeated` combinator will yield:
///
/// ```
/// RepeatedValue{
///     node: value1,
///     next: ResultStream(RepeatedValue{
///         node: value2,
///         next: ...,
///     })
/// }
/// ```
///
/// In the case of an ambiguous grammar, it would yield streams with potentially multiple values
/// (each representing one possible parse path / interpretation of the grammar):
///
/// ```
/// RepeatedValue{
///     node: value1,
///     next: ResultStream(
///         RepeatedValue{
///             node: value2variant1,
///             next: ...,
///         },
///         RepeatedValue{
///             node: value2variant2,
///             next: ...,
///         },
///     )
/// }
/// ```
///
pub fn RepeatedValue(comptime Value: type) type {
    return struct {
        node: Result(Value),
        next: *ResultStream(Result(@This())),

        pub fn deinit(self: *const @This()) void {
            self.node.deinit();
            self.next.deinitAll();
            self.next.deinit();
            // TODO(slimsag):
            //allocator.destroy(self.next);
        }

        pub fn flatten(self: *const @This(), allocator: *mem.Allocator, subscriber: ParserPosKey, path: ParserPath) Error!ResultStream(Result(Value)) {
            var dst = try ResultStream(Result(Value)).init(allocator, subscriber);
            try self.flatten_into(&dst, allocator, subscriber, path);
            dst.close(); // TODO(slimsag): why does deferring this not work?
            return dst;
        }

        pub fn flatten_into(self: *const @This(), dst: *ResultStream(Result(Value)), allocator: *mem.Allocator, subscriber: ParserPosKey, path: ParserPath) Error!void {
            try dst.add(self.node);

            defer allocator.destroy(self.next);
            defer self.next.deinit();
            var sub = self.next.subscribe(subscriber, path, Result(RepeatedValue(Value)).initError(0, "matches only the empty language"));

            nosuspend {
                while (sub.next()) |next_path| {
                    switch (next_path.result) {
                        .err => try dst.add(Result(Value).initError(next_path.offset, next_path.result.err)),
                        else => try next_path.result.value.flatten_into(dst, allocator, subscriber, path),
                    }
                }
            }
        }
    };
}

/// Matches the `input` repeatedly, between `[min, max]` times (inclusive.)
///
/// The `input` parsers must remain alive for as long as the `Repeated` parser will be used.
pub fn Repeated(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(RepeatedValue(Value)) = Parser(RepeatedValue(Value)).init(parse, nodeName),
        input: RepeatedContext(Value),

        const Self = @This();

        pub fn init(input: RepeatedContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(RepeatedValue(Value)), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Repeated");
            v +%= try self.input.parser.nodeName(node_name_cache);
            v +%= std.hash_map.getAutoHashFn(usize)(self.input.min);
            v +%= std.hash_map.getAutoHashFn(isize)(self.input.max);
            return v;
        }

        pub fn parse(parser: *const Parser(RepeatedValue(Value)), in_ctx: *const Context(void, RepeatedValue(Value))) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            // Invoke the child parser repeatedly to produce each of our results. Each time we ask
            // the child parser to parse, it can produce a set of results (its result stream) which
            // are varying parse paths / interpretations. Our set of results (our result stream)
            // will contain many more possible paths, for example consider a parser:
            //
            //  S -> [A, B]
            //
            // Matched once, it can produce one or two separate parse paths / interpretations (A, B,
            // or A and B), and we may commit to producing certain ones. But match twice, and it
            // could produce:
            //
            //  S -> [AB, BA, AA, BB]
            //
            // There is an exponential number of repetitive parse paths to follow. Thus, we simply
            // follow each path in order, trying one at a time until we commit or reject the
            // unwanted paths. We also have two options in how we follow the paths - depth-first in
            // order:
            //
            //  AA, AB, BA, BB
            //
            // Or breadth-first in order:
            //
            //  AA, BA, AB, BB
            //
            // Depth-first vs. breadth-first could impact the performance of some grammars by
            // making it harder to bail out of a given parse path quicker. Similarly, iteration
            // order could be more expensive depending on the order of operations, this will be
            // slower:
            //
            //  Iteration 0: Try A
            //  Iteration 0: Try B -> Commit to B
            //  Iteration 1: Try A
            //  Iteration 1: Try B -> Commit to B
            //  Iteration 2: Try A
            //  Iteration 2: Try B -> Commit to B
            //
            // Than this:
            //
            //  Iteration 0: Try B -> Commit to B
            //  Iteration 1: Try B -> Commit to B
            //  Iteration 2: Try B -> Commit to B
            //
            // However, the most optimal order is not known ahead of time. Likely the best approach
            // would be to assume the next path will be the same as the past path, but in practice
            // this would involve more book-keeping and still be a guess. Instead, we just focus on
            // exploring all potential paths as quickly as possible (and future efforts will be
            // better spent on parallelization of exploring these paths.)

            // Return early if we're not trying to parse anything (stream close signals to the
            // consumer there were no matches).
            if (ctx.input.max == 0) {
                return;
            }

            // First we need to actually invoke the child parser. This will give us [A, B, C] and
            // we then invoke Repeated(child) on the proceeding states to get the associated stream:
            //
            //  stream(
            //      (A, stream(
            //          (A, stream(...),
            //          (B, stream(...),
            //          (C, stream(...),
            //      ),
            //      (B, stream(
            //          (A, stream(...),
            //          (B, stream(...),
            //          (C, stream(...),
            //      ),
            //      (C, stream(
            //          (A, stream(...),
            //          (B, stream(...),
            //          (C, stream(...),
            //      ),
            //  )
            //
            const child_node_name = try self.input.parser.nodeName(&in_ctx.memoizer.node_name_cache);
            var child_ctx = try ctx.with({}).initChild(Value, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try self.input.parser.parse(&child_ctx);

            // For every top-level value (A, B, C in our example above.)
            var num_values: usize = 0;
            var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
            var offset: usize = 0;
            while (sub.next()) |top_level| {
                if (num_values >= ctx.input.max and ctx.input.max != -1) break;
                num_values += 1;
                switch (top_level.result) {
                    .err => {
                        // Going down the path of this top-level value terminated with an error.
                        if (num_values < 1 or num_values < ctx.input.min) {
                            try ctx.results.add(Result(RepeatedValue(Value)).initError(top_level.offset, top_level.result.err));
                        }
                        continue;
                    },
                    else => {
                        // We got a non-error top-level value (e.g. A, B, C).
                        // TODO(slimsag): if no consumption, could get stuck forever!
                        offset = top_level.offset;

                        // Now get the stream that continues down this path (i.e. the stream
                        // associated with A, B, C.)
                        var path_results = try ctx.allocator.create(ResultStream(Result(RepeatedValue(Value))));
                        path_results.* = try ResultStream(Result(RepeatedValue(Value))).init(ctx.allocator, ctx.key);
                        var path = Repeated(Input, Value).init(.{
                            .parser = self.input.parser,
                            .min = self.input.min,
                            .max = if (self.input.max == -1) -1 else self.input.max - 1,
                        });
                        const path_node_name = try path.parser.nodeName(&in_ctx.memoizer.node_name_cache);
                        var path_ctx = try in_ctx.initChild(RepeatedValue(Value), path_node_name, top_level.offset);
                        defer path_ctx.deinitChild();
                        if (!path_ctx.existing_results) try path.parser.parse(&path_ctx);
                        var path_results_sub = path_ctx.results.subscribe(ctx.key, ctx.path, Result(RepeatedValue(Value)).initError(ctx.offset, "matches only the empty language"));
                        while (path_results_sub.next()) |next| {
                            try path_results.add(next);
                        }
                        path_results.close();

                        // Emit our top-level value tuple (e.g. (A, stream(...))
                        try ctx.results.add(Result(RepeatedValue(Value)).init(top_level.offset, .{
                            .node = top_level,
                            .next = path_results,
                        }));
                    },
                }
            }
            if (num_values < ctx.input.min) {
                // TODO(slimsag): include number of expected/found matches
                try ctx.results.add(Result(RepeatedValue(Value)).initError(offset, "expected more"));
                return;
            }
            return;
        }
    };
}

test "repeated" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, RepeatedValue(LiteralValue)).init(allocator, "abcabcabc123abc", {});
        defer ctx.deinit();

        var abcInfinity = Repeated(void, LiteralValue).init(.{
            .parser = &Literal.init("abc").parser,
            .min = 0,
            .max = -1,
        });
        try abcInfinity.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(RepeatedValue(LiteralValue)).initError(ctx.offset, "matches only the empty language"));
        var list = sub.next();
        testing.expect(sub.next() == null); // stream closed

        // first element
        testing.expectEqual(@as(usize, 3), list.?.offset);
        testing.expectEqual(@as(usize, 3), list.?.result.value.node.offset);

        // flatten the nested multi-dimensional array, since our grammar above is not ambiguous
        // this is fine to do and makes testing far easier.
        var flattened = try list.?.result.value.flatten(allocator, ctx.key, ctx.path);
        defer flattened.deinit();
        var flat = flattened.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(usize, 3), flat.next().?.offset);
        testing.expectEqual(@as(usize, 6), flat.next().?.offset);
        testing.expectEqual(@as(usize, 9), flat.next().?.offset);
        testing.expect(flat.next() == null); // stream closed
    }
}
