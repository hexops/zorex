usingnamespace @import("gll_parser.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const LiteralContext = []const u8;

/// Matches the literal `input` string.
///
/// The `input` string must remain alive for as long as the `Literal` parser will be used.
pub const Literal = struct {
    parser: Parser(void) = Parser(void).init(parse, hash),
    input: LiteralContext,

    const Self = @This();

    pub fn init(input: LiteralContext) Self {
        return Self{ .input = input };
    }

    pub fn hash(parser: *const Parser(void), hash_cache: *std.AutoHashMap(usize, u64)) Error!u64 {
        const self = @fieldParentPtr(Self, "parser", parser);

        var v = std.hash_map.hashString("Literal");
        v +%= std.hash_map.hashString(self.input);
        return v;
    }

    pub fn parse(parser: *const Parser(void), in_ctx: *const Context(void, void)) callconv(.Async) !void {
        const self = @fieldParentPtr(Self, "parser", parser);
        var ctx = in_ctx.with(self.input);
        defer ctx.results.close();

        const src = ctx.src[ctx.offset..];
        if (!mem.startsWith(u8, src, ctx.input)) {
            // TODO(slimsag): include what literal was expected
            try ctx.results.add(Result(void).initError(ctx.offset + 1, "expected literal"));
            return;
        }
        try ctx.results.add(Result(void).init(ctx.offset + ctx.input.len, {}));
        return;
    }
};

test "literal" {
    nosuspend {
        const allocator = testing.allocator;

        var ctx = try Context(void, void).init(allocator, "hello world", {});
        defer ctx.deinit();

        var want = "hello";
        var l = Literal.init(want);
        try l.parser.parse(&ctx);
        var sub = ctx.results.subscribe(ctx.state_hash, ctx.path);
        testing.expectEqual(@as(?Result(void), Result(void).init(want.len, {})), sub.next());
        testing.expectEqual(@as(?Result(void), null), sub.next());
    }
}
