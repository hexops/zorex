const std = @import("std");
const testing = std.testing;
const mem = std.mem;

const Parser = @import("parser.zig").Parser;

/// HeapParser stores an existing parser/combinator (such as Literal, OneOf, etc.) on the heap.
///
/// It exposes the underlying `Parser(Value)` for use, and is otherwise type-agnostic
/// (`HeapParser(Value)` can be backed by any parser/combinator type.)
pub fn HeapParser(comptime Value: type) type {
    return struct {
        parser: *Parser(Value),
        memory: []u8,

        /// Allocates and stores the `parent` value (e.g. `Literal(...).init(...)`), which is
        /// expected to have a `Parser(Value)` accessible via `parent.parser`.
        pub fn init(allocator: *mem.Allocator, parent: anytype) !@This() {
            const Parent = @TypeOf(parent);
            var memory = try allocator.allocAdvanced(u8, @alignOf(Parent), @sizeOf(Parent), mem.Allocator.Exact.at_least);
            var parent_ptr = @ptrCast(*Parent, &memory[0]);
            parent_ptr.* = parent;
            return @This(){
                .parser = &parent_ptr.parser,
                .memory = memory,
            };
        }

        pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
            allocator.free(self.memory);
        }
    };
}

test "heap_parser" {
    nosuspend {
        const Context = @import("parser.zig").Context;
        const Result = @import("parser.zig").Result;
        const Literal = @import("../parser/literal.zig").Literal;
        const LiteralValue = @import("../parser/literal.zig").LiteralValue;
        const LiteralContext = @import("../parser/literal.zig").LiteralContext;

        const allocator = testing.allocator;

        var ctx = try Context(void, LiteralValue).init(allocator, "hello world", {});
        defer ctx.deinit();

        // The parser we'll store on the heap.
        var want = "hello";
        var literal_parser = Literal.init(want);
        var heap_parser = try HeapParser(LiteralValue).init(allocator, literal_parser);
        defer heap_parser.deinit(allocator);

        // Use it.
        try heap_parser.parser.parse(&ctx);
        defer ctx.results.deinitAll(ctx.allocator);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        testing.expectEqual(@as(?Result(LiteralValue), Result(LiteralValue).init(want.len, .{ .value = "hello" })), sub.next());
        testing.expectEqual(@as(?Result(LiteralValue), null), sub.next());
    }
}
