usingnamespace @import("gll_parser.zig");
usingnamespace @import("parser_literal.zig");
usingnamespace @import("comb_mapto.zig");
usingnamespace @import("comb_optional.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn SequenceContext(comptime Value: type) type {
    return []const *const Parser(Value);
}

/// Represents a sequence of parsed values. 
///
/// In the case of a non-ambiguous grammar, a `Sequence` combinator will yield:
///
/// ```
/// SequenceValue{
///     node: value1,
///     next: ResultStream(SequenceValue{
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
/// SequenceValue{
///     node: value1,
///     next: ResultStream(
///         SequenceValue{
///             node: value2variant1,
///             next: ...,
///         },
///         SequenceValue{
///             node: value2variant2,
///             next: ...,
///         },
///     )
/// }
/// ```
///
pub fn SequenceValue(comptime Value: type) type {
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

/// Matches the `input` parsers sequentially. The parsers must produce the same data type (use
/// MapTo, if needed.)
///
/// The `input` parsers must remain alive for as long as the `Sequence` parser will be used.
pub fn Sequence(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(SequenceValue(Value)) = .{ ._parse = parse },
        input: SequenceContext(Value),

        const Self = @This();

        pub fn init(input: SequenceContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(SequenceValue(Value)), in_ctx: *const Context(void, SequenceValue(Value))) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            if (self.input.len == 0) {
                return;
            }

            // For a sequence of input parsers [A, B, C], each one may produce multiple different
            // possible parser paths (valid interpretations of the same input state) in the case of
            // an ambiguous grammar. For example, the sequence of parsers [A, B, C] where each
            // produces 2 possible parser paths (e.g. A1, A2) we need to emit:
            //
            // stream(
            //     (A1, stream(
            //         (B1, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //         (B2, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //     )),
            //     (A2, stream(
            //         (B1, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //         (B2, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //     )),
            // )
            //
            // This call to `Sequence.parse` is only responsible for emitting the top level
            // (A1, A2) and invoking Sequence(next) to produce the associated `stream()` for those
            // parse states.
            var child_ctx = try ctx.with({}).initChild(Value);
            defer child_ctx.deinitChild();

            // For every top-level value (A1, A2 in our example above.)
            try self.input[0].parse(&child_ctx);
            var sub = child_ctx.results.subscribe();
            while (sub.next()) |top_level| {
                switch (top_level.result) {
                    .err => {
                        try ctx.results.add(Result(SequenceValue(Value)).initError(top_level.offset, top_level.result.err));
                        continue;
                    },
                    else => {
                        // We got a non-error top-level value (e.g. A1, A2), consume if needed.
                        child_ctx.offset = top_level.offset;

                        // Now get the stream that continues down this path (i.e. the stream
                        // associated with A1, A2.)
                        var path_results = try ctx.allocator.create(ResultStream(Result(SequenceValue(Value))));
                        path_results.* = try ResultStream(Result(SequenceValue(Value))).init(ctx.allocator);

                        var path_ctx = try in_ctx.initChild(SequenceValue(Value));
                        defer path_ctx.deinitChild();
                        path_ctx.offset = child_ctx.offset;
                        var path = Sequence(Input, Value).init(self.input[1..]);
                        try path.parser.parse(&path_ctx);
                        var path_results_sub = path_ctx.results.subscribe();
                        while (path_results_sub.next()) |next| {
                            try path_results.add(next);
                        }
                        path_results.close();

                        // Emit our top-level value tuple (e.g. (A1, stream(...))
                        try ctx.results.add(Result(SequenceValue(Value)).init(child_ctx.offset, .{
                            .node = top_level,
                            .next = path_results,
                        }));
                    },
                }
            }
        }
    };
}

test "sequence" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, SequenceValue(void)).init(allocator, "abc123abc456_123abc", {});
        defer ctx.deinit();

        var seq = Sequence(void, void).init(&.{
            &Literal.init("abc").parser,
            &Literal.init("123ab").parser,
            &Literal.init("c45").parser,
            &Literal.init("6").parser,
        });
        try seq.parser.parse(&ctx);

        var sub = ctx.results.subscribe();
        var list = sub.next();
        testing.expect(sub.next() == null); // stream closed

        // first element
        testing.expectEqual(@as(usize, 3), list.?.offset);
        testing.expectEqual(@as(usize, 3), list.?.result.value.node.offset);

        // flatten the nested multi-dimensional array, since our grammar above is not ambiguous
        // this is fine to do and makes testing far easier.
        var flattened = try list.?.result.value.flatten(allocator);
        defer flattened.deinit();
        var flat = flattened.subscribe();
        testing.expectEqual(@as(usize, 3), flat.next().?.offset);
        testing.expectEqual(@as(usize, 8), flat.next().?.offset);
        testing.expectEqual(@as(usize, 11), flat.next().?.offset);
        testing.expectEqual(@as(usize, 12), flat.next().?.offset);
        testing.expect(flat.next() == null); // stream closed
    }
}
