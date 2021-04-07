usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");
//usingnamespace @import("comb_repeated.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OptionalContext(comptime Value: type) type {
    return *const Parser(Value);
}

/// Wraps the `input.parser`, making it an optional parser producing an optional value.
///
/// The `input.parser` must remain alive for as long as the `Optional` parser will be used.
pub fn Optional(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(?Value) = .{ ._parse = parse },
        input: OptionalContext(Value),

        const Self = @This();

        pub fn init(input: OptionalContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(?Value), in_ctx: Context(void, ?Value)) callconv(.Inline) ?Result(?Value) {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);

            const child_ctx = ctx.with({}).initChild(Value) catch |err| return Result(?Value).initError(err);
            defer child_ctx.deinitChild();

            const value = ctx.input.parse(child_ctx);
            if (value == null) {
                return Result(?Value).init(0, null);
            }
            // TODO(slimsag): handle parser errors here
            return Result(?Value).init(value.?.consumed, value.?.result.value);
        }
    };
}

test "optional_some" {
    const allocator = testing.allocator;

    const ctx = Context(void, ?void){
        .input = {},
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(?void).init(allocator),
    };
    defer ctx.deinit();

    const optional = Optional(void, void).init(&Literal.init("hello").parser);

    const x = optional.parser.parse(ctx);
    testing.expectEqual(@as(usize, 5), x.?.consumed);
    testing.expectEqual({}, x.?.result.value.?);
}

test "optional_none" {
    const allocator = testing.allocator;

    const ctx = Context(void, ?void){
        .input = {},
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(?void).init(allocator),
    };
    defer ctx.deinit();

    const optional = Optional(void, void).init(&Literal.init("world").parser);

    const x = optional.parser.parse(ctx);
    testing.expectEqual(@as(usize, 0), x.?.consumed);
    testing.expectEqual(@as(?void, null), x.?.result.value);
}
