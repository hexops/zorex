usingnamespace @import("../engine/engine.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const EndValue = struct {
    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {}
};

/// Matches the end of the `input` string.
pub fn End(comptime Payload: type) type {
    return struct {
        parser: Parser(Payload, EndValue) = Parser(Payload, EndValue).init(parse, nodeName, null),

        const Self = @This();

        pub fn init() Self {
            return Self{};
        }

        pub fn nodeName(parser: *const Parser(Payload, EndValue), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);
            return std.hash_map.hashString("End");
        }

        pub fn parse(parser: *const Parser(Payload, EndValue), in_ctx: *const Context(Payload, EndValue)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with({});
            defer ctx.results.close();

            if (ctx.offset != ctx.src.len) {
                try ctx.results.add(Result(EndValue).initError(ctx.offset + 1, "expected end of input"));
                return;
            }
            try ctx.results.add(Result(EndValue).init(ctx.offset, .{}));
            return;
        }
    };
}

test "end" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try Context(Payload, EndValue).init(allocator, "", {});
        defer ctx.deinit();

        var e = End(Payload).init();
        try e.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(EndValue).initError(ctx.offset, "matches only the empty language"));
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(EndValue).init(0, .{}), first);
        try testing.expect(sub.next() == null);
    }
}
