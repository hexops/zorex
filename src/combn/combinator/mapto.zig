const engine = @import("../engine/engine.zig");
const Error = engine.Error;
const Parser = engine.Parser;
const ParserContext = engine.Context;
const Result = engine.Result;
const ParserNodeName = engine.ParserNodeName;
const ParserPosKey = engine.ParserPosKey;
const ParserPath = engine.ParserPath;

const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn Context(comptime Payload: type, comptime Value: type, comptime Target: type) type {
    return struct {
        parser: *Parser(Payload, Value),
        mapTo: fn (in: Result(Value), payload: Payload, allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Target),
    };
}

/// Wraps the `input.parser`, mapping its value to the `dst` type.
///
/// The `input.parser` must remain alive for as long as the `MapTo` parser will be used.
pub fn MapTo(comptime Payload: type, comptime Value: type, comptime Target: type) type {
    return struct {
        parser: Parser(Payload, Target) = Parser(Payload, Target).init(parse, nodeName, deinit, countReferencesTo),
        input: Context(Payload, Value, Target),

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: Context(Payload, Value, Target)) !*Parser(Payload, Target) {
            const self = Self{ .input = input };
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: Context(Payload, Value, Target)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *Parser(Payload, Target), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void)) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            self.input.parser.deinit(allocator, freed);
        }

        pub fn countReferencesTo(parser: *const Parser(Payload, Target), other: usize, freed: *std.AutoHashMap(usize, void)) usize {
            const self = @fieldParentPtr(Self, "parser", parser);
            if (@ptrToInt(parser) == other) return 1;
            return self.input.parser.countReferencesTo(other, freed);
        }

        pub fn nodeName(parser: *const Parser(Payload, Target), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("MapTo");
            v +%= try self.input.parser.nodeName(node_name_cache);
            v +%= @ptrToInt(self.input.mapTo);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Target), in_ctx: *const ParserContext(Payload, Target)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const child_node_name = try ctx.input.parser.nodeName(&in_ctx.memoizer.node_name_cache);
            const child_ctx = try in_ctx.initChild(Value, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try ctx.input.parser.parse(&child_ctx);

            var sub = child_ctx.subscribe();
            var closed = false;
            while (sub.next()) |next| {
                if (closed) {
                    continue;
                }
                var frame = try std.heap.page_allocator.allocAdvanced(u8, 16, @frameSize(self.input.mapTo), std.mem.Allocator.Exact.at_least);
                defer std.heap.page_allocator.free(frame);
                const mapped = try await @asyncCall(frame, {}, self.input.mapTo, .{ next, in_ctx.input, ctx.allocator, ctx.key, ctx.path });
                if (mapped == null) {
                    closed = true;
                    continue;
                }
                try ctx.results.add(mapped.?);
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

            pub fn deinit(self: *const @This(), _allocator: *mem.Allocator) void {
                _ = self;
                _ = _allocator;
            }
        };

        const Payload = void;
        const ctx = try ParserContext(Payload, String).init(allocator, "hello world", {});
        defer ctx.deinit();

        const mapTo = try MapTo(Payload, LiteralValue, String).init(allocator, .{
            .parser = (try Literal(Payload).init(allocator, "hello")).ref(),
            .mapTo = struct {
                fn mapTo(in: Result(LiteralValue), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(String) {
                    _ = payload;
                    _ = _allocator;
                    _ = key;
                    _ = path;
                    switch (in.result) {
                        .err => return Result(String).initError(in.offset, in.result.err),
                        else => return Result(String).init(in.offset, String.init("hello")),
                    }
                }
            }.mapTo,
        });
        defer mapTo.deinit(allocator, null);

        try mapTo.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        try testing.expectEqual(Result(String).init(5, String.init("hello")), first);
        try testing.expect(sub.next() == null);
    }
}
