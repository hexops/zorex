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

pub fn RepeatedValue(comptime Value: type) type {
    return std.ArrayList(Result(Value));
}

/// Matches the `input` number repetitively, between `[min, max]` times (inclusive.)
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

        pub fn parse(parser: *const Parser(RepeatedValue(Value)), in_ctx: Context(void, RepeatedValue(Value))) callconv(.Inline) Error!?Result(RepeatedValue(Value)) {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);

            var sub_ctx = Context(Value, void){
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
            while (list.items.len < ctx.input.max or ctx.input.max == -1) {
                const next = try ctx.input.parser.parse(sub_ctx);
                if (next == null) {
                    break;
                }
                switch (next.?.result) {
                    .err => break, // TODO(slimsag): syntax errors should not be treated the same as other errors
                    .value => {},
                }
                consumed = next.?.consumed;
                sub_ctx.offset = next.?.consumed;
                try list.append(next.?);
            }
            if (list.items.len == 0) {
                return null;
            }
            if (list.items.len < ctx.input.min) {
                return Result(RepeatedValue(Value)){
                    .consumed = consumed,
                    .result = .{ .err = "expected more" }, // TODO(slimsag): include number of expected/found matches
                };
            }
            return Result(RepeatedValue(Value)){
                .consumed = consumed,
                .result = .{ .value = list },
            };
        }
    };
}

test "repeated" {
    const allocator = testing.allocator;

    const ctx = Context(void, RepeatedValue(void)){
        .input = {},
        .allocator = allocator,
        .src = "abcabcabc123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(RepeatedValue(void)).init(allocator),
    };
    defer ctx.deinit();

    var abcInfinity = Repeated(void, void).init(.{
        .parser = &Literal.init("abc").parser,
        .min = 0,
        .max = -1,
    });
    const x = try abcInfinity.parser.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = RepeatedValue(void).init(allocator);
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
    var want = Result(RepeatedValue(void)){
        .consumed = 9,
        .result = .{
            .value = wantMatches,
        },
    };
    testing.expectEqual(want.consumed, x.?.consumed);
    testing.expectEqualSlices(Result(void), want.result.value.items, x.?.result.value.items);
}
