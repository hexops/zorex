usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn MapToContext(comptime Payload: type, comptime Value: type, comptime Target: type) type {
    return struct {
        parser: *const Parser(Payload, Value),
        mapTo: fn (in: Result(Value), payload: Payload, allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(Target),
    };
}

/// Wraps the `input.parser`, mapping its value to the `dst` type.
///
/// The `input.parser` must remain alive for as long as the `MapTo` parser will be used.
pub fn MapTo(comptime Payload: type, comptime Value: type, comptime Target: type) type {
    return struct {
        parser: Parser(Payload, Target) = Parser(Payload, Target).init(parse, nodeName, deinit),
        input: MapToContext(Payload, Value, Target),

        const Self = @This();

        pub fn init(input: MapToContext(Payload, Value, Target)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *const Parser(Payload, Target), allocator: *mem.Allocator) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            self.input.parser.deinit(allocator);
        }

        pub fn nodeName(parser: *const Parser(Payload, Target), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("MapTo");
            v +%= try self.input.parser.nodeName(node_name_cache);
            v +%= @ptrToInt(self.input.mapTo);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Target), in_ctx: *const Context(Payload, Target)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const child_node_name = try ctx.input.parser.nodeName(&in_ctx.memoizer.node_name_cache);
            const child_ctx = try in_ctx.initChild(Value, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try ctx.input.parser.parse(&child_ctx);

            var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
            while (sub.next()) |next| {
                try ctx.results.add(try ctx.input.mapTo(next, in_ctx.input, ctx.allocator, ctx.key, ctx.path));
            }
        }
    };
}

test "mapto" {
    nosuspend {
        const allocator = testing.allocator;

        const String = struct {
            value: []const u8,

            pub fn init(value: []const u8) @This() {
                return .{ .value = value };
            }

            pub fn deinit(self: *const @This(), _allocator: *mem.Allocator) void {}
        };

        const Payload = void;
        const ctx = try Context(Payload, String).init(allocator, "hello world", {});
        defer ctx.deinit();

        const mapTo = MapTo(Payload, LiteralValue, String).init(.{
            .parser = &Literal(Payload).init("hello").parser,
            .mapTo = struct {
                fn mapTo(in: Result(LiteralValue), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(String) {
                    switch (in.result) {
                        .err => return Result(String).initError(in.offset, in.result.err),
                        else => return Result(String).init(in.offset, String.init("hello")),
                    }
                }
            }.mapTo,
        });

        try mapTo.parser.parse(&ctx);

        defer ctx.results.deinitAll(ctx.allocator);
        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(String).initError(ctx.offset, "matches only the empty language"));
        try testing.expectEqual(@as(?Result(String), Result(String).init(5, String.init("hello"))), sub.next());
        try testing.expectEqual(@as(?Result(String), null), sub.next());
    }
}
