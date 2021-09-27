const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Context = struct {
    // from byte (inclusive)
    from: u8,

    // to byte (inclusive)
    to: u8,
};

pub const Value = struct {
    value: u8,

    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        _ = self;
        _ = allocator;
    }
};

/// Matches any single byte in the specified range.
pub fn ByteRange(comptime Payload: type) type {
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

            var v = std.hash_map.hashString("ByteRange");
            v +%= self.input.from;
            v +%= self.input.to;
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const ParserContext(Payload, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const src = ctx.src[ctx.offset..];
            if (src.len == 0 or src[0] < self.input.from or src[0] > self.input.to) {
                // TODO(slimsag): include in error message the expected range (or "any byte" if full range)
                try ctx.results.add(Result(Value).initError(ctx.offset + 1, "expected byte range"));
                return;
            }
            try ctx.results.add(Result(Value).init(ctx.offset + 1, .{ .value = src[0] }));
            return;
        }
    };
}

test "byte_range" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try ParserContext(Payload, Value).init(allocator, "hello world", {});
        defer ctx.deinit();

        var any_byte = try ByteRange(Payload).init(allocator, .{ .from = 0, .to = 255 });
        defer any_byte.deinit(allocator, null, true);
        try any_byte.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(Value).init(1, .{ .value = 'h' }), first);
        try testing.expect(sub.next() == null);
    }
}
