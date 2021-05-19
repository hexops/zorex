usingnamespace @import("../engine/engine.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const AlwaysVoid = struct {
    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {}
};

/// If the result is not `null`, its `.offset` value will be updated to reflect the current parse
/// position before Always returns it.
pub fn AlwaysContext(comptime Value: type) type {
    return ?Result(Value);
}

/// Always yields the input value (once/unambiguously), or no value (if the input value is null).
///
/// The `input` must remain alive for as long as the `Always` parser will be used.
pub fn Always(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(Value) = Parser(Value).init(parse, nodeName, null),
        input: AlwaysContext(Value),

        const Self = @This();

        pub fn init(input: AlwaysContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(Value), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Always");
            v +%= std.hash_map.getAutoHashFn(?Result(Value))(self.input);
            return v;
        }

        pub fn parse(parser: *const Parser(Value), in_ctx: *const Context(void, Value)) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            if (self.input) |input| {
                var tmp = input;
                tmp.offset = ctx.offset;
                try ctx.results.add(tmp);
            }
        }
    };
}

test "always" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, AlwaysVoid).init(allocator, "hello world", {});
        defer ctx.deinit();

        const noop = Always(void, AlwaysVoid).init(null);

        try noop.parser.parse(&ctx);

        defer ctx.results.deinitAll(ctx.allocator);
        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(AlwaysVoid).initError(ctx.offset, "matches only the empty language"));
        try testing.expectEqual(@as(?Result(AlwaysVoid), null), sub.next());
    }
}
