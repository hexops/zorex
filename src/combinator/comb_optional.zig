usingnamespace @import("combinator.zig");
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
        parser: Parser(?Value) = .{ ._parse = parse },
        input: OptionalContext(Value),

        const Self = @This();

        pub fn init(input: OptionalContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(?Value), in_ctx: Context(void, ?Value)) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            var child_results = try ResultStream(Result(Value)).init(ctx.allocator);
            const child_ctx = try ctx.with({}).initChild(Value, &child_results);
            defer child_ctx.deinitChild();

            try ctx.input.parse(child_ctx);

            var sub = child_ctx.results.subscribe();
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

        var results = try ResultStream(Result(?void)).init(allocator);
        const ctx = Context(void, ?void){
            .input = {},
            .allocator = allocator,
            .src = "hello world",
            .offset = 0,
            .gll_trampoline = try GLLTrampoline(?void).init(allocator),
            .results = &results,
        };
        defer ctx.deinit();

        const optional = Optional(void, void).init(&Literal.init("hello").parser);

        try optional.parser.parse(ctx);

        var sub = ctx.results.subscribe();
        testing.expectEqual(@as(?Result(?void), Result(?void).init(5, {})), sub.next());
        testing.expectEqual(@as(?Result(?void), null), sub.next());
    }
}

test "optional_none" {
    nosuspend {
        const allocator = testing.allocator;

        var results = try ResultStream(Result(?void)).init(allocator);
        const ctx = Context(void, ?void){
            .input = {},
            .allocator = allocator,
            .src = "hello world",
            .offset = 0,
            .gll_trampoline = try GLLTrampoline(?void).init(allocator),
            .results = &results,
        };
        defer ctx.deinit();

        const optional = Optional(void, void).init(&Literal.init("world").parser);

        try optional.parser.parse(ctx);

        var sub = ctx.results.subscribe();
        testing.expectEqual(@as(?Result(?void), Result(?void).init(0, null)), sub.next());
        testing.expectEqual(@as(?Result(?void), null), sub.next());
    }
}
