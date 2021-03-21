usingnamespace @import("combinator.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const LiteralContext = []const u8;

/// A `Parser` which matches the literal `str`.
///
/// `str` must remain alive for as long as the parser will be used.
pub fn literal(ctx: Context(LiteralContext, void)) callconv(.Inline) Error!?Result(void) {
    const src = ctx.src[ctx.offset..];
    if (ctx.input.len > 0 and src.len > 0 and ctx.input[0] != src[0]) {
        return null;
    }
    if (!mem.startsWith(u8, src, ctx.input)) {
        return Result(void){ .consumed = ctx.offset + 1, .result = .{ .err = "expected literal" } };
    }
    return Result(void){ .consumed = ctx.offset + ctx.input.len, .result = .{ .value = {} } };
}

// Returns a `ParserInterface` implementation which matches the literal `str`.
//
// `str` must remain alive for as long as the parser will be used.
pub const Literal = Wrap(LiteralContext, void, literal);

test "literal_comptime" {
    const allocator = testing.failing_allocator;
    const x = comptime try literal(.{
        .input = "hello",
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = null,
    });
    testing.expectEqual(Result(void){ .consumed = 5, .result = .{ .value = {} } }, x.?);
}

test "literal_runtime" {
    const allocator = testing.allocator;

    var input = "hello world";
    var want = "hello";
    var l = Literal.init(want);
    const x = try l.interface.parse(.{
        .input = {},
        .allocator = allocator,
        .src = input,
        .offset = 0,
        .gll_trampoline = null,
    });
    testing.expectEqual(Result(void){ .consumed = 5, .result = .{ .value = {} } }, x.?);
}
