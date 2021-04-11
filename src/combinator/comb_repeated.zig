usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");

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

// The first stream represents potential parse paths (i.e. different interpretations of the
// parse), and the inner stream represents the

// Represents a single value in the stream of repeated values.
//
// In the case of a non-ambiguous grammar, a `Repeated` combinator will yield:
//
//  RepeatedValue{
//      node: value1,
//      next: ResultStream(RepeatedValue{
//          node: value2,
//          next: ...,
//      })
//  }
//
// In the case of an ambiguous grammar, it would yield streams with potentially multiple values
// (each representing one possible parse path / interpretation of the grammar):
//
//  RepeatedValue{
//      node: value1,
//      next: ResultStream(
//          RepeatedValue{
//              node: value2variant1,
//              next: ...,
//          },
//          RepeatedValue{
//              node: value2variant2,
//              next: ...,
//          },
//      )
//  }
//
pub fn RepeatedValue(comptime Value: type) type {
    return struct {
        node: Result(Value),
        next: *ResultStream(Result(@This())),

        pub fn flatten(self: *const @This(), allocator: *mem.Allocator) Error!ResultStream(Result(Value)) {
            var dst = try ResultStream(Result(Value)).init(allocator);
            try self.flatten_into(&dst, allocator);
            dst.close(); // TODO(slimsag): why does deferring this not work?
            return dst;
        }

        pub fn flatten_into(self: *const @This(), dst: *ResultStream(Result(Value)), allocator: *mem.Allocator) Error!void {
            try dst.add(self.node);

            defer allocator.destroy(self.next);
            defer self.next.deinit();
            var sub = self.next.subscribe();

            nosuspend {
                while (sub.next()) |next_path| {
                    switch (next_path.result) {
                        .err => try dst.add(Result(Value).initError(next_path.offset, next_path.result.err)),
                        else => try next_path.result.value.flatten_into(dst, allocator),
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
        parser: Parser(RepeatedValue(Value)) = .{ ._parse = parse },
        input: RepeatedContext(Value),

        const Self = @This();

        pub fn init(input: RepeatedContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(RepeatedValue(Value)), in_ctx: Context(void, RepeatedValue(Value))) callconv(.Async) Error!void {
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
            var child_results = try ResultStream(Result(Value)).init(ctx.allocator);
            var child_ctx = Context(void, Value){
                .input = {},
                .allocator = ctx.allocator,
                .src = ctx.src,
                .offset = ctx.offset,
                .gll_trampoline = null,
                .results = &child_results,
            };
            if (ctx.gll_trampoline != null) {
                child_ctx.gll_trampoline = try ctx.gll_trampoline.?.initChild(ctx.allocator, Value);
            }
            defer child_ctx.deinitChild();

            // For every top-level value (A, B, C in our example above.)
            var num_values: usize = 0;
            try self.input.parser.parse(child_ctx);
            var sub = child_ctx.results.subscribe();
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
                        // We got a non-error top-level value (e.g. A, B, C), consume if needed.
                        //
                        // TODO(slimsag): if no consumption, could get stuck forever!
                        child_ctx.offset = top_level.offset;

                        // Now get the stream that continues down this path (i.e. the stream
                        // associated with A, B, C.)
                        var path_results = try ctx.allocator.create(ResultStream(Result(RepeatedValue(Value))));
                        path_results.* = try ResultStream(Result(RepeatedValue(Value))).init(ctx.allocator);
                        var path_ctx = in_ctx;
                        path_ctx.offset = child_ctx.offset;
                        path_ctx.results = path_results;
                        var path = Repeated(Input, Value).init(.{
                            .parser = self.input.parser,
                            .min = self.input.min,
                            .max = if (self.input.max == -1) -1 else self.input.max - 1,
                        });
                        try path.parser.parse(path_ctx);

                        // Emit our top-level value tuple (e.g. (A, stream(...))
                        try ctx.results.add(Result(RepeatedValue(Value)).init(child_ctx.offset, .{
                            .node = top_level,
                            .next = path_ctx.results,
                        }));
                    },
                }
            }
            if (num_values < ctx.input.min) {
                // TODO(slimsag): include number of expected/found matches
                try ctx.results.add(Result(RepeatedValue(Value)).initError(child_ctx.offset, "expected more"));
                return;
            }
            return;
        }
    };
}

test "repeated" {
    nosuspend {
        const allocator = testing.allocator;

        var results = try ResultStream(Result(RepeatedValue(void))).init(allocator);
        const ctx = Context(void, RepeatedValue(void)){
            .input = {},
            .allocator = allocator,
            .src = "abcabcabc123abc",
            .offset = 0,
            .gll_trampoline = try GLLTrampoline(RepeatedValue(void)).init(allocator),
            .results = &results,
        };
        defer ctx.deinit();

        var abcInfinity = Repeated(void, void).init(.{
            .parser = &Literal.init("abc").parser,
            .min = 0,
            .max = -1,
        });
        try abcInfinity.parser.parse(ctx);

        var sub = ctx.results.subscribe();
        var list = sub.next();
        testing.expect(sub.next() == null); // stream closed

        // first element
        testing.expectEqual(@as(usize, 3), list.?.offset);
        testing.expectEqual(@as(usize, 3), list.?.result.value.node.offset);

        // flatten the nested multi-dimensional array, since our grammer above is not ambiguous
        // this is fine to do and makes testing far easier.
        var flattened = try list.?.result.value.flatten(allocator);
        defer flattened.deinit();
        var flat = flattened.subscribe();
        testing.expectEqual(@as(usize, 3), flat.next().?.offset);
        testing.expectEqual(@as(usize, 6), flat.next().?.offset);
        testing.expectEqual(@as(usize, 9), flat.next().?.offset);
        testing.expect(flat.next() == null); // stream closed
    }
}
