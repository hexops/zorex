usingnamespace @import("gll_parser.zig");
usingnamespace @import("parser_literal.zig");

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
        parser: Parser(?Value) = Parser(?Value).init(parse, hash),
        input: OptionalContext(Value),

        const Self = @This();

        pub fn init(input: OptionalContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn hash(parser: *const Parser(?Value), hash_cache: *std.AutoHashMap(usize, u64)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Optional");
            v +%= try self.input.hash(hash_cache);
            return v;
        }

        pub fn parse(parser: *const Parser(?Value), in_ctx: *const Context(void, ?Value)) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const child_hash = try ctx.input.hash(&in_ctx.memoizer.hash_cache);
            const child_ctx = try ctx.with({}).initChild(Value, child_hash, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try ctx.input.parse(&child_ctx);

            var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
            while (sub.next()) |next| {
                switch (next.result) {
                    .err => try ctx.results.add(Result(?Value).init(0, null)),
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

        const ctx = try Context(void, ?void).init(allocator, "hello world", {});
        defer ctx.deinit();

        const optional = Optional(void, void).init(&Literal.init("hello").parser);

        try optional.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(?void).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(?void), Result(?void).init(5, {})), sub.next());
        testing.expectEqual(@as(?Result(?void), null), sub.next());
    }
}

test "optional_none" {
    nosuspend {
        const allocator = testing.allocator;

        const ctx = try Context(void, ?void).init(allocator, "hello world", {});
        defer ctx.deinit();

        const optional = Optional(void, void).init(&Literal.init("world").parser);

        try optional.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(?void).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(?void), Result(?void).init(0, null)), sub.next());
        testing.expectEqual(@as(?Result(?void), null), sub.next());
    }
}
