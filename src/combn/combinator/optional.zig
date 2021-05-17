usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OptionalContext(comptime Value: type) type {
    return *const Parser(Value);
}

/// Wraps the `input.parser`, making it an optional parser producing an optional value.
///
/// The `input.parser` must remain alive for as long as the `Optional` parser will be used.
pub fn Optional(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(?Value) = Parser(?Value).init(parse, nodeName, deinit),
        input: OptionalContext(Value),

        const Self = @This();

        pub fn init(input: OptionalContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *const Parser(?Value), allocator: *mem.Allocator) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            self.input.deinit(allocator);
        }

        pub fn nodeName(parser: *const Parser(?Value), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Optional");
            v +%= try self.input.nodeName(node_name_cache);
            return v;
        }

        pub fn parse(parser: *const Parser(?Value), in_ctx: *const Context(void, ?Value)) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const child_node_name = try ctx.input.nodeName(&in_ctx.memoizer.node_name_cache);
            const child_ctx = try ctx.with({}).initChild(Value, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try ctx.input.parse(&child_ctx);

            var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
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

        const ctx = try Context(void, ?LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        const optional = Optional(void, LiteralValue).init(&Literal.init("hello").parser);

        try optional.parser.parse(&ctx);

        defer ctx.results.deinitAll(ctx.allocator);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(?LiteralValue).initError(ctx.offset, "matches only the empty language"));
        var r1 = sub.next().?;
        testing.expectEqual(@as(usize, 5), r1.offset);
        testing.expectEqualStrings("hello", r1.result.value.?.value);
        testing.expectEqual(@as(?Result(?LiteralValue), null), sub.next());
    }
}

test "optional_none" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, ?LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        const optional = Optional(void, LiteralValue).init(&Literal.init("world").parser);

        try optional.parser.parse(&ctx);

        defer ctx.results.deinitAll(ctx.allocator);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(?LiteralValue).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(?LiteralValue), Result(?LiteralValue).init(0, null)), sub.next());
        testing.expectEqual(@as(?Result(?LiteralValue), null), sub.next());
    }
}
