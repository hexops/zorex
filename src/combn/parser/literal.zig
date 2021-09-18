const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Context = []const u8;

pub const Value = struct {
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
        parser: Parser(Payload, Value) = Parser(Payload, Value).init(parse, nodeName, null, null),
        input: Context,

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: Context) !*Parser(Payload, Value) {
            const self = Self{ .input = input };
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: Context) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(Payload, Value), node_name_cache: *std.AutoHashMap(usize, NodeName)) Error!u64 {
            _ = node_name_cache;
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Literal");
            v +%= std.hash_map.hashString(self.input);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const ParserContext(Payload, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const src = ctx.src[ctx.offset..];
            if (!mem.startsWith(u8, src, ctx.input)) {
                // TODO(slimsag): include what literal was expected
                try ctx.results.add(Result(Value).initError(ctx.offset + 1, "expected literal"));
                return;
            }
            try ctx.results.add(Result(Value).init(ctx.offset + ctx.input.len, .{ .value = self.input }));
            return;
        }
    };
}

test "literal" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try ParserContext(Payload, Value).init(allocator, "hello world", {});
        defer ctx.deinit();

        var want = "hello";
        var l = try Literal(Payload).init(allocator, want);
        defer l.deinit(allocator, null);
        try l.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(Value).init(want.len, .{ .value = "hello" }), first);
        try testing.expect(sub.next() == null);
    }
}
