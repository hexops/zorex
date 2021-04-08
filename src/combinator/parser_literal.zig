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

    pub fn parse(parser: *const Parser(void), in_ctx: Context(void, void)) callconv(.Inline) !void {
        const self = @fieldParentPtr(Self, "parser", parser);
        var ctx = in_ctx.with(self.input);
        defer ctx.results.close();

        const src = ctx.src[ctx.offset..];
        if (ctx.input.len > 0 and src.len > 0 and ctx.input[0] != src[0]) {
            return;
        }
        if (!mem.startsWith(u8, src, ctx.input)) {
            // TODO(slimsag): include what literal was expected
            try ctx.results.add(Result(void).initSyntaxError(ctx.offset + 1, "expected literal"));
            return;
        }
        try ctx.results.add(Result(void).init(ctx.offset + ctx.input.len, {}));
        return;
    }
};

test "literal" {
    nosuspend {
        const allocator = testing.allocator;

        var src = "hello world";

        var results = try ResultStream(?Result(void)).init(allocator);
        var ctx = Context(void, void){
            .input = {},
            .allocator = allocator,
            .src = src,
            .offset = 0,
            .gll_trampoline = null,
            .results = &results,
        };
        defer ctx.deinit();

        var want = "hello";
        var l = Literal.init(want);
        try l.parser.parse(ctx);
        var sub = ctx.results.subscribe();
        testing.expectEqual(@as(??Result(void), Result(void).init(want.len, {})), sub.next());
        testing.expectEqual(@as(??Result(void), null), sub.next());
    }
}
