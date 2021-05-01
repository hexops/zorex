usingnamespace @import("gll_parser.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const LiteralContext = []const u8;

pub const LiteralValue = struct {
    pub fn deinit(self: @This()) void {}
};

/// Matches the literal `input` string.
///
/// The `input` string must remain alive for as long as the `Literal` parser will be used.
pub const Literal = struct {
    parser: Parser(LiteralValue) = Parser(LiteralValue).init(parse, hash),
    input: LiteralContext,

    const Self = @This();

    pub fn init(input: LiteralContext) Self {
        return Self{ .input = input };
    }

    pub fn hash(parser: *const Parser(LiteralValue), hash_cache: *std.AutoHashMap(usize, u64)) Error!u64 {
        const self = @fieldParentPtr(Self, "parser", parser);

        var v = std.hash_map.hashString("Literal");
        v +%= std.hash_map.hashString(self.input);
        return v;
    }

    pub fn parse(parser: *const Parser(LiteralValue), in_ctx: *const Context(void, LiteralValue)) callconv(.Async) !void {
        const self = @fieldParentPtr(Self, "parser", parser);
        var ctx = in_ctx.with(self.input);
        defer ctx.results.close();

        const src = ctx.src[ctx.offset..];
        if (!mem.startsWith(u8, src, ctx.input)) {
            // TODO(slimsag): include what literal was expected
            try ctx.results.add(Result(LiteralValue).initError(ctx.offset + 1, "expected literal"));
            return;
        }
        try ctx.results.add(Result(LiteralValue).init(ctx.offset + ctx.input.len, .{}));
        return;
    }
};

test "literal" {
    nosuspend {
        const allocator = testing.allocator;

        var ctx = try Context(void, LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        var want = "hello";
        var l = Literal.init(want);
        try l.parser.parse(&ctx);
        defer ctx.results.deinitAll();
        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(LiteralValue), Result(LiteralValue).init(want.len, .{})), sub.next());
        testing.expectEqual(@as(?Result(LiteralValue), null), sub.next());
    }
}
