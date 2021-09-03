usingnamespace @import("../engine/engine.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const ByteRangeContext = struct {
    // from byte (inclusive)
    from: u8,

    // to byte (inclusive)
    to: u8,
};

pub const ByteRangeValue = struct {
    value: u8,

    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        _ = self;
        _ = allocator;
    }
};

/// Matches any single byte in the specified range.
pub fn ByteRange(comptime Payload: type) type {
    return struct {
        parser: Parser(Payload, ByteRangeValue) = Parser(Payload, ByteRangeValue).init(parse, nodeName, null, null),
        input: ByteRangeContext,

        const Self = @This();

        pub fn init(input: ByteRangeContext) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(Payload, ByteRangeValue), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            _ = node_name_cache;
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("ByteRange");
            v +%= self.input.from;
            v +%= self.input.to;
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, ByteRangeValue), in_ctx: *const Context(Payload, ByteRangeValue)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const src = ctx.src[ctx.offset..];
            if (src.len == 0 or src[0] < self.input.from or src[0] > self.input.to) {
                // TODO(slimsag): include in error message the expected range (or "any byte" if full range)
                try ctx.results.add(Result(ByteRangeValue).initError(ctx.offset + 1, "expected byte range"));
                return;
            }
            try ctx.results.add(Result(ByteRangeValue).init(ctx.offset + 1, .{ .value = src[0] }));
            return;
        }
    };
}

test "byte_range" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try Context(Payload, ByteRangeValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        var any_byte = ByteRange(Payload).init(.{ .from = 0, .to = 255 });
        try any_byte.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(ByteRangeValue).init(1, .{ .value = 'h' }), first);
        try testing.expect(sub.next() == null);
    }
}
