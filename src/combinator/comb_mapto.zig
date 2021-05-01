usingnamespace @import("gll_parser.zig");
usingnamespace @import("parser_literal.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn MapToContext(comptime Value: type, comptime Target: type) type {
    return struct {
        parser: *const Parser(Value),
        mapTo: fn (in: Result(Value), allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(Target),
    };
}

/// Wraps the `input.parser`, mapping its value to the `dst` type.
///
/// The `input.parser` must remain alive for as long as the `MapTo` parser will be used.
pub fn MapTo(comptime Input: type, comptime Value: type, comptime Target: type) type {
    return struct {
        parser: Parser(Target) = Parser(Target).init(parse, hash),
        input: MapToContext(Value, Target),

        const Self = @This();

        pub fn init(input: MapToContext(Value, Target)) Self {
            return Self{ .input = input };
        }

        pub fn hash(parser: *const Parser(Target), hash_cache: *std.AutoHashMap(usize, u64)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("MapTo");
            v +%= try self.input.parser.hash(hash_cache);
            v +%= @ptrToInt(self.input.mapTo);
            return v;
        }

        pub fn parse(parser: *const Parser(Target), in_ctx: *const Context(void, Target)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const child_hash = try ctx.input.parser.hash(&in_ctx.memoizer.hash_cache);
            const child_ctx = try ctx.with({}).initChild(Value, child_hash, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try ctx.input.parser.parse(&child_ctx);

            var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
            while (sub.next()) |next| {
                try ctx.results.add(try ctx.input.mapTo(next, ctx.allocator, ctx.key, ctx.path));
            }
        }
    };
}

test "oneof" {
    nosuspend {
        const allocator = testing.allocator;

        const String = struct {
            value: []const u8,

            pub fn init(value: []const u8) @This() {
                return .{ .value = value };
            }

            pub fn deinit(self: @This()) void {}
        };

        const ctx = try Context(void, String).init(allocator, "hello world", {});
        defer ctx.deinit();

        const mapTo = MapTo(void, LiteralValue, String).init(.{
            .parser = &Literal.init("hello").parser,
            .mapTo = struct {
                fn mapTo(in: Result(LiteralValue), _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(String) {
                    switch (in.result) {
                        .err => return Result(String).initError(in.offset, in.result.err),
                        else => return Result(String).init(in.offset, String.init("hello")),
                    }
                }
            }.mapTo,
        });

        try mapTo.parser.parse(&ctx);

        defer ctx.results.deinitAll();
        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(String).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(String), Result(String).init(5, String.init("hello"))), sub.next());
        testing.expectEqual(@as(?Result(String), null), sub.next());
    }
}
