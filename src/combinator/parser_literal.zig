usingnamespace @import("combinator.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const LiteralContext = []const u8;

/// Matches the literal `input` string.
///
/// The `input` string must remain alive for as long as the `Literal` parser will be used.
pub const Literal = struct {
    parser: Parser(void) = .{ ._parse = parse },
    input: LiteralContext,

    const Self = @This();

    pub fn init(input: LiteralContext) Self {
        return Self{ .input = input };
    }

    pub fn parse(parser: *const Parser(void), in_ctx: Context(void, void)) callconv(.Inline) ?Result(void) {
        const self = @fieldParentPtr(Self, "parser", parser);
        var ctx = in_ctx.with(self.input);

        const src = ctx.src[ctx.offset..];
        if (ctx.input.len > 0 and src.len > 0 and ctx.input[0] != src[0]) {
            return null;
        }
        if (!mem.startsWith(u8, src, ctx.input)) {
            return Result(void){ .consumed = ctx.offset + 1, .result = .{ .syntax_err = "expected literal" } };
        }
        return Result(void){ .consumed = ctx.offset + ctx.input.len, .result = .{ .value = {} } };
    }
};

test "literal" {
    const allocator = testing.allocator;

    var input = "hello world";
    var want = "hello";
    var l = Literal.init(want);
    const x = l.parser.parse(.{
        .input = {},
        .allocator = allocator,
        .src = input,
        .offset = 0,
        .gll_trampoline = null,
    });
    testing.expectEqual(Result(void){ .consumed = 5, .result = .{ .value = {} } }, x.?);
}
