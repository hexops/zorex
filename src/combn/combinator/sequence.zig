usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;
const MapTo = @import("mapto.zig").MapTo;
const MapToValue = @import("mapto.zig").MapToValue;

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
/// stream(value1, value2)
/// ```
///
/// In the case of an ambiguous grammar, it would yield a stream with only the first parse path.
/// Use SequenceAmbiguous if ambiguou parse paths are desirable.
pub fn SequenceValue(comptime Value: type) type {
    return Value;
}

/// Matches the `input` parsers sequentially. The parsers must produce the same data type (use
/// MapTo, if needed.) If ambiguous parse paths are desirable, use SequenceAmbiguous.
///
/// The `input` parsers must remain alive for as long as the `Sequence` parser will be used.
pub fn Sequence(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(SequenceValue(Value)) = Parser(SequenceValue(Value)).init(parse, nodeName),
        input: SequenceContext(Value),

        const Self = @This();

        pub fn init(input: SequenceContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(SequenceValue(Value)), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Sequence");
            for (self.input) |in_parser| {
                v +%= try in_parser.nodeName(node_name_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(SequenceValue(Value)), in_ctx: *const Context(void, SequenceValue(Value))) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            // Invoke each child parser to produce each of our results. Each time we ask a child
            // parser to parse, it can produce a set of results (its result stream) which are
            // varying parse paths / interpretations, we take the first successful one.

            // Return early if we're not trying to parse anything (stream close signals to the
            // consumer there were no matches).
            if (self.input.len == 0) {
                return;
            }

            var offset: usize = 0;
            for (self.input) |child_parser| {
                const child_node_name = try child_parser.nodeName(&in_ctx.memoizer.node_name_cache);
                var child_ctx = try ctx.with({}).initChild(Value, child_node_name, offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try child_parser.parse(&child_ctx);

                var num_local_values: usize = 0;
                var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
                while (sub.next()) |next| {
                    switch (next.result) {
                        .err => {
                            try ctx.results.add(Result(SequenceValue(Value)).initError(next.offset, next.result.err));
                            return;
                        },
                        else => {
                            // TODO(slimsag): need path committal functionality
                            if (num_local_values == 0) {
                                // TODO(slimsag): if no consumption, could get stuck forever!
                                offset = next.offset;
                                try ctx.results.add(next);
                            }
                            num_local_values += 1;
                        },
                    }
                }
            }
        }
    };
}

test "sequence" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, SequenceValue(LiteralValue)).init(allocator, "abc123abc456_123abc", {});
        defer ctx.deinit();

        var seq = Sequence(void, LiteralValue).init(&.{
            &Literal.init("abc").parser,
            &Literal.init("123ab").parser,
            &Literal.init("c45").parser,
            &Literal.init("6").parser,
        });
        try seq.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(SequenceValue(LiteralValue)).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(usize, 3), sub.next().?.offset);
        testing.expectEqual(@as(usize, 8), sub.next().?.offset);
        testing.expectEqual(@as(usize, 11), sub.next().?.offset);
        testing.expectEqual(@as(usize, 12), sub.next().?.offset);
        testing.expect(sub.next() == null); // stream closed
    }
}
