const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Value = struct {
    pub fn deinit(self: *const @This(), allocator: mem.Allocator) void {
        _ = self;
        _ = allocator;
    }
};

/// Matches the end of the `input` string.
pub fn End(comptime Payload: type) type {
    return struct {
        parser: Parser(Payload, Value) = Parser(Payload, Value).init(parse, nodeName, null, null),

        const Self = @This();

        pub fn init(allocator: mem.Allocator) !*Parser(Payload, Value) {
            const self = Self{};
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack() Self {
            return Self{};
        }

        pub fn nodeName(parser: *const Parser(Payload, Value), node_name_cache: *std.AutoHashMap(usize, NodeName)) Error!u64 {
            _ = parser;
            _ = node_name_cache;
            return std.hash_map.hashString("End");
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const ParserContext(Payload, Value)) callconv(.Async) !void {
            _ = parser;
            var ctx = in_ctx.with({});
            defer ctx.results.close();

            if (ctx.offset != ctx.src.len) {
                try ctx.results.add(Result(Value).initError(ctx.offset + 1, "expected end of input"));
                return;
            }
            try ctx.results.add(Result(Value).init(ctx.offset, .{}));
            return;
        }
    };
}

test "end" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try ParserContext(Payload, Value).init(allocator, "", {});
        defer ctx.deinit();

        var e = try End(Payload).init(allocator);
        defer e.deinit(allocator, null);
        try e.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(Value).init(0, .{}), first);
        try testing.expect(sub.next() == null);
    }
}
