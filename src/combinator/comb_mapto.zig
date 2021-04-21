usingnamespace @import("gll_parser.zig");
usingnamespace @import("parser_literal.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn MapToContext(comptime Value: type, comptime Target: type) type {
    return struct {
        parser: *const Parser(Value),
        mapTo: fn (in: Result(Value), allocator: *mem.Allocator, state_hash: u64, path: ParserPath) Error!Result(Target),
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

            var sub = child_ctx.results.subscribe(ctx.state_hash, ctx.path);
            while (sub.next()) |next| {
                try ctx.results.add(try ctx.input.mapTo(next, ctx.allocator, ctx.state_hash, ctx.path));
            }
        }
    };
}

test "oneof" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, []const u8).init(allocator, "hello world", {});
        defer ctx.deinit();

        const mapTo = MapTo(void, void, []const u8).init(.{
            .parser = &Literal.init("hello").parser,
            .mapTo = struct {
                fn mapTo(in: Result(void), _allocator: *mem.Allocator, state_hash: u64, path: ParserPath) Error!Result([]const u8) {
                    switch (in.result) {
                        .err => return Result([]const u8).initError(in.offset, in.result.err),
                        else => return Result([]const u8).init(in.offset, "hello"),
                    }
                }
            }.mapTo,
        });

        try mapTo.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.state_hash, ctx.path);
        testing.expectEqual(@as(?Result([]const u8), Result([]const u8).init(5, "hello")), sub.next());
        testing.expectEqual(@as(?Result([]const u8), null), sub.next());
    }
}
