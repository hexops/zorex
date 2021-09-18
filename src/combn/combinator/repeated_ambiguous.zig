const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const ParserNodeName = gllparser.ParserNodeName;
const ResultStream = gllparser.ResultStream;
const PosKey = gllparser.PosKey;
const ParserPath = gllparser.ParserPath;

const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").Value;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn Context(comptime Payload: type, comptime V: type) type {
    return struct {
        /// The parser which should be repeatedly parsed.
        parser: *Parser(Payload, V),

        /// The minimum number of times the parser must successfully match.
        min: usize,

        /// The maximum number of times the parser can match, or -1 for unlimited.
        max: isize,
    };
}

/// Represents a single value in the stream of repeated values.
///
/// In the case of a non-ambiguous grammar, a `RepeatedAmbiguous` combinator will yield:
///
/// ```
/// Value{
///     node: value1,
///     next: ResultStream(Value{
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
/// Value{
///     node: value1,
///     next: ResultStream(
///         Value{
///             node: value2variant1,
///             next: ...,
///         },
///         Value{
///             node: value2variant2,
///             next: ...,
///         },
///     )
/// }
/// ```
///
pub fn Value(comptime V: type) type {
    return struct {
        node: Result(V),
        next: *ResultStream(Result(@This())),

        pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
            self.next.deinit();
            self.node.deinit(allocator);
            allocator.destroy(self.next);
        }

        pub fn flatten(self: *const @This(), allocator: *mem.Allocator, subscriber: PosKey, path: ParserPath) Error!ResultStream(Result(V)) {
            var dst = try ResultStream(Result(V)).init(allocator, subscriber);
            try self.flatten_into(&dst, allocator, subscriber, path);
            dst.close(); // TODO(slimsag): why does deferring this not work?
            return dst;
        }

        pub fn flatten_into(self: *const @This(), dst: *ResultStream(Result(V)), allocator: *mem.Allocator, subscriber: PosKey, path: ParserPath) Error!void {
            try dst.add(self.node.toUnowned());

            var sub = self.next.subscribe(subscriber, path, Result(Value(V)).initError(0, "matches only the empty language"));
            nosuspend {
                while (sub.next()) |next_path| {
                    switch (next_path.result) {
                        .err => try dst.add(Result(V).initError(next_path.offset, next_path.result.err)),
                        else => try next_path.result.value.flatten_into(dst, allocator, subscriber, path),
                    }
                }
            }
        }
    };
}

/// Matches the `input` repeatedly, between `[min, max]` times (inclusive.)
///
/// The `input` parsers must remain alive for as long as the `RepeatedAmbiguous` parser will be used.
pub fn RepeatedAmbiguous(comptime Payload: type, comptime V: type) type {
    return struct {
        parser: Parser(Payload, Value(V)) = Parser(Payload, Value(V)).init(parse, nodeName, deinit, countReferencesTo),
        input: Context(Payload, V),

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: Context(Payload, V)) !*Parser(Payload, Value(V)) {
            const self = Self{ .input = input };
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: Context(Payload, V)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *Parser(Payload, Value(V)), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void)) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            self.input.parser.deinit(allocator, freed);
        }

        pub fn countReferencesTo(parser: *const Parser(Payload, Value(V)), other: usize, freed: *std.AutoHashMap(usize, void)) usize {
            const self = @fieldParentPtr(Self, "parser", parser);
            if (@ptrToInt(parser) == other) return 1;
            return self.input.parser.countReferencesTo(other, freed);
        }

        pub fn nodeName(parser: *const Parser(Payload, Value(V)), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("RepeatedAmbiguous");
            v +%= try self.input.parser.nodeName(node_name_cache);
            v +%= std.hash_map.getAutoHashFn(usize, void)({}, self.input.min);
            v +%= std.hash_map.getAutoHashFn(isize, void)({}, self.input.max);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value(V)), in_ctx: *const ParserContext(Payload, Value(V))) callconv(.Async) Error!void {
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
            // we then invoke RepeatedAmbiguous(child) on the proceeding states to get the associated stream:
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
            var child_ctx = try in_ctx.initChild(V, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try self.input.parser.parse(&child_ctx);

            // For every top-level value (A, B, C in our example above.)
            var num_values: usize = 0;
            var sub = child_ctx.subscribe();
            var offset: usize = ctx.offset;
            while (sub.next()) |top_level| {
                if (num_values >= ctx.input.max and ctx.input.max != -1) break;
                num_values += 1;
                switch (top_level.result) {
                    .err => {
                        // Going down the path of this top-level value terminated with an error.
                        if (num_values < 1 or num_values < ctx.input.min) {
                            try ctx.results.add(Result(Value(V)).initError(top_level.offset, top_level.result.err));
                        }
                        continue;
                    },
                    else => {
                        // We got a non-error top-level value (e.g. A, B, C).
                        // TODO(slimsag): if no consumption, could get stuck forever!
                        offset = top_level.offset;

                        // Now get the stream that continues down this path (i.e. the stream
                        // associated with A, B, C.)
                        var path_results = try ctx.allocator.create(ResultStream(Result(Value(V))));
                        path_results.* = try ResultStream(Result(Value(V))).init(ctx.allocator, ctx.key);
                        var path = RepeatedAmbiguous(Payload, V).initStack(.{
                            .parser = self.input.parser,
                            .min = self.input.min,
                            .max = if (self.input.max == -1) -1 else self.input.max - 1,
                        });
                        const path_node_name = try path.parser.nodeName(&in_ctx.memoizer.node_name_cache);
                        var path_ctx = try in_ctx.initChild(Value(V), path_node_name, top_level.offset);
                        defer path_ctx.deinitChild();
                        if (!path_ctx.existing_results) try path.parser.parse(&path_ctx);
                        var path_results_sub = path_ctx.subscribe();
                        while (path_results_sub.next()) |next| {
                            try path_results.add(next.toUnowned());
                        }
                        path_results.close();

                        // Emit our top-level value tuple (e.g. (A, stream(...))
                        try ctx.results.add(Result(Value(V)).init(top_level.offset, .{
                            .node = top_level.toUnowned(),
                            .next = path_results,
                        }));
                    },
                }
            }
            if (num_values < ctx.input.min) {
                // TODO(slimsag): include number of expected/found matches
                try ctx.results.add(Result(Value(V)).initError(offset, "expected more"));
                return;
            }
            return;
        }
    };
}

test "repeated" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try ParserContext(Payload, Value(LiteralValue)).init(allocator, "abcabcabc123abc", {});
        defer ctx.deinit();

        var abcInfinity = try RepeatedAmbiguous(Payload, LiteralValue).init(allocator, .{
            .parser = (try Literal(Payload).init(allocator, "abc")).ref(),
            .min = 0,
            .max = -1,
        });
        defer abcInfinity.deinit(allocator, null);
        try abcInfinity.parse(&ctx);

        var sub = ctx.subscribe();
        var list = sub.next();
        try testing.expect(sub.next() == null); // stream closed

        // first element
        try testing.expectEqual(@as(usize, 3), list.?.offset);
        try testing.expectEqual(@as(usize, 3), list.?.result.value.node.offset);

        // flatten the nested multi-dimensional array, since our grammar above is not ambiguous
        // this is fine to do and makes testing far easier.
        var flattened = try list.?.result.value.flatten(allocator, ctx.key, ctx.path);
        defer flattened.deinit();
        var flat = flattened.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        try testing.expectEqual(@as(usize, 3), flat.next().?.offset);
        try testing.expectEqual(@as(usize, 6), flat.next().?.offset);
        try testing.expectEqual(@as(usize, 9), flat.next().?.offset);
        try testing.expect(flat.next() == null); // stream closed
    }
}
