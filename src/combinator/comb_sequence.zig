usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");
usingnamespace @import("comb_mapto.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn SequenceContext(comptime Value: type) type {
    return []const *const Parser(Value);
}

pub fn SequenceValue(comptime Value: type) type {
    return std.ArrayList(Result(Value));
}

/// Matches the `input` parsers sequentially, requiring that all successfully match in order.
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

        pub fn parse(parser: *const Parser(SequenceValue(Value)), in_ctx: Context(void, SequenceValue(Value))) callconv(.Inline) Error!?Result(SequenceValue(Value)) {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);

            var sub_ctx = Context(void, Value){
                .input = {},
                .allocator = ctx.allocator,
                .src = ctx.src,
                .offset = ctx.offset,
                .gll_trampoline = null,
            };
            if (ctx.gll_trampoline != null) {
                sub_ctx.gll_trampoline = try ctx.gll_trampoline.?.initWith(ctx.allocator, Value);
            }
            defer sub_ctx.deinit();

            var list = std.ArrayList(Result(Value)).init(ctx.allocator);
            var consumed: usize = 0;
            for (ctx.input) |in_parser| {
                const next = try in_parser.parse(sub_ctx);
                if (next == null) {
                    list.deinit();
                    if (list.items.len > 0) {
                        return Result(SequenceValue(Value)){
                            .consumed = consumed,
                            .result = .{ .err = "expected next" }, // TODO(slimsag): include what was expected next
                        };
                    }
                    return null;
                }
                switch (next.?.result) {
                    .err => {
                        // TODO(slimsag): syntax errors should not be treated the same as other errors
                        list.deinit();
                        if (list.items.len > 0) {
                            return Result(SequenceValue(Value)){
                                .consumed = consumed,
                                .result = .{ .err = "expected next" }, // TODO(slimsag): include what was expected next
                            };
                        }
                        return null;
                    },
                    .value => {},
                }
                consumed = next.?.consumed;
                sub_ctx.offset = next.?.consumed;
                try list.append(next.?);
            }
            if (list.items.len == 0) {
                return null;
            }
            return Result(SequenceValue(Value)){
                .consumed = consumed,
                .result = .{ .value = list },
            };
        }
    };
}

test "sequence" {
    const allocator = testing.allocator;

    const ctx = Context(void, SequenceValue(void)){
        .input = {},
        .allocator = allocator,
        .src = "abc123abc456_123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(SequenceValue(void)).init(allocator),
    };
    defer ctx.deinit();

    var seq = Sequence(void, void).init(&.{
        &Literal.init("abc").parser,
        &Literal.init("123").parser,
        &Literal.init("abc").parser,
        &Literal.init("456").parser,
    });
    const x = try seq.parser.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = SequenceValue(void).init(allocator);
    defer wantMatches.deinit();
    try wantMatches.append(Result(void){
        .consumed = 3,
        .result = .{
            .value = {},
        },
    });
    try wantMatches.append(Result(void){
        .consumed = 6,
        .result = .{
            .value = {},
        },
    });
    try wantMatches.append(Result(void){
        .consumed = 9,
        .result = .{
            .value = {},
        },
    });
    try wantMatches.append(Result(void){
        .consumed = 12,
        .result = .{
            .value = {},
        },
    });
    var want = Result(SequenceValue(void)){
        .consumed = 12,
        .result = .{
            .value = wantMatches,
        },
    };
    testing.expectEqual(want.consumed, x.?.consumed);
    testing.expectEqualSlices(Result(void), want.result.value.items, x.?.result.value.items);
}
