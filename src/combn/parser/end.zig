usingnamespace @import("../engine/engine.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const EndValue = struct {
    pub fn deinit(self: @This()) void {}
};

/// Matches the end of the `input` string.
pub const End = struct {
    parser: Parser(EndValue) = Parser(EndValue).init(parse, nodeName),

    const Self = @This();

    pub fn init() Self {
        return Self{};
    }

    pub fn nodeName(parser: *const Parser(EndValue), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
        const self = @fieldParentPtr(Self, "parser", parser);
        return std.hash_map.hashString("End");
    }

    pub fn parse(parser: *const Parser(EndValue), in_ctx: *const Context(void, EndValue)) callconv(.Async) !void {
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

test "end" {
    nosuspend {
        const allocator = testing.allocator;

        var ctx = try Context(void, EndValue).init(allocator, "", {});
        defer ctx.deinit();

        var e = End.init();
        try e.parser.parse(&ctx);
        defer ctx.results.deinitAll();
        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(EndValue).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(EndValue), Result(EndValue).init(0, .{})), sub.next());
        testing.expectEqual(@as(?Result(EndValue), null), sub.next());
    }
}
