usingnamespace @import("../engine/engine.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const LiteralContext = []const u8;

pub const LiteralValue = struct {
    /// The `input` string itself.
    value: []const u8,

    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        _ = self;
        _ = allocator;
    }
};

/// Matches the literal `input` string.
///
/// The `input` string must remain alive for as long as the `Literal` parser will be used.
pub fn Literal(comptime Payload: type) type {
    return struct {
        parser: Parser(Payload, LiteralValue) = Parser(Payload, LiteralValue).init(parse, nodeName, null, null),
        input: LiteralContext,

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: LiteralContext) !*Parser(Payload, LiteralValue) {
            const self = Self{ .input = input };
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: LiteralContext) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(Payload, LiteralValue), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            _ = node_name_cache;
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Literal");
            v +%= std.hash_map.hashString(self.input);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, LiteralValue), in_ctx: *const Context(Payload, LiteralValue)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const src = ctx.src[ctx.offset..];
            if (!mem.startsWith(u8, src, ctx.input)) {
                // TODO(slimsag): include what literal was expected
                try ctx.results.add(Result(LiteralValue).initError(ctx.offset + 1, "expected literal"));
                return;
            }
            try ctx.results.add(Result(LiteralValue).init(ctx.offset + ctx.input.len, .{ .value = self.input }));
            return;
        }
    };
}

test "literal" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try Context(Payload, LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        var want = "hello";
        var l = try Literal(Payload).init(allocator, want);
        defer l.deinit(allocator, null);
        try l.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(LiteralValue).init(want.len, .{ .value = "hello" }), first);
        try testing.expect(sub.next() == null);
    }
}
