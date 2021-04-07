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

        pub fn parse(parser: *const Parser(RepeatedValue(Value)), in_ctx: Context(void, RepeatedValue(Value))) callconv(.Inline) ?Result(RepeatedValue(Value)) {
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
                sub_ctx.gll_trampoline = ctx.gll_trampoline.?.initChild(ctx.allocator, Value) catch |err| return Result(RepeatedValue(Value)).initError(err);
            }
            defer sub_ctx.deinitChild();

            var list = std.ArrayList(Result(Value)).init(ctx.allocator);
            var consumed: usize = 0;
            while (list.items.len < ctx.input.max or ctx.input.max == -1) {
                const next = ctx.input.parser.parse(sub_ctx);
                if (next == null) {
                    break;
                }
                switch (next.?.result) {
                    .syntax_err => break, // TODO(slimsag): syntax errors should not be treated the same as other errors
                    .err => return Result(RepeatedValue(Value)).initError(next.?.result.err),
                    .value => {},
                }
                consumed = next.?.consumed;
                sub_ctx.offset = next.?.consumed;
                list.append(next.?) catch |err| return Result(RepeatedValue(Value)).initError(err);
            }
            if (list.items.len == 0) {
                return null;
            }
            if (list.items.len < ctx.input.min) {
                // TODO(slimsag): include number of expected/found matches
                return Result(RepeatedValue(Value)).initSyntaxError(consumed, "expected more");
            }
            return Result(RepeatedValue(Value)).init(consumed, list);
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
    const x = abcInfinity.parser.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = RepeatedValue(void).init(allocator);
    defer wantMatches.deinit();
    try wantMatches.append(Result(void).init(3, {}));
    try wantMatches.append(Result(void).init(6, {}));
    try wantMatches.append(Result(void).init(9, {}));
    var want = Result(RepeatedValue(void)).init(9, wantMatches);
    testing.expectEqual(want.consumed, x.?.consumed);
    testing.expectEqualSlices(Result(void), want.result.value.items, x.?.result.value.items);
}
