usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OptionalContext(comptime Payload: type, comptime Value: type) type {
    return *const Parser(Payload, Value);
}

/// Wraps the `input.parser`, making it an optional parser producing an optional value.
///
/// The `input.parser` must remain alive for as long as the `Optional` parser will be used.
pub fn Optional(comptime Payload: type, comptime Value: type) type {
    return struct {
        parser: Parser(Payload, ?Value) = Parser(Payload, ?Value).init(parse, nodeName, deinit),
        input: OptionalContext(Payload, Value),

        const Self = @This();

        pub fn init(input: OptionalContext(Payload, Value)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *const Parser(Payload, ?Value), allocator: *mem.Allocator) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            self.input.deinit(allocator);
        }

        pub fn nodeName(parser: *const Parser(Payload, ?Value), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Optional");
            v +%= try self.input.nodeName(node_name_cache);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, ?Value), in_ctx: *const Context(Payload, ?Value)) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const child_node_name = try ctx.input.nodeName(&in_ctx.memoizer.node_name_cache);
            const child_ctx = try in_ctx.initChild(Value, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try ctx.input.parse(&child_ctx);

            var sub = child_ctx.subscribe();
            while (sub.next()) |next| {
                switch (next.result) {
                    .err => try ctx.results.add(Result(?Value).init(ctx.offset, null)),
                    else => try ctx.results.add(Result(?Value).init(next.offset, next.result.value)),
                }
            }
            return;
        }
    };
}

test "optional_some" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, ?LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        const optional = Optional(Payload, LiteralValue).init(&Literal(Payload).init("hello").parser);

        try optional.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var r1 = sub.next().?;
        defer r1.deinit(ctx.allocator);
        try testing.expectEqual(@as(usize, 5), r1.offset);
        try testing.expectEqualStrings("hello", r1.result.value.?.value);
        try testing.expectEqual(@as(?Result(?LiteralValue), null), sub.next());
    }
}

test "optional_none" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, ?LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        const optional = Optional(Payload, LiteralValue).init(&Literal(Payload).init("world").parser);

        try optional.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        defer first.deinit(ctx.allocator);
        try testing.expectEqual(Result(?LiteralValue).init(0, null), first);
        try testing.expect(sub.next() == null);
    }
}
