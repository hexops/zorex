usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OneOfContext(comptime Value: type) type {
    return []const *const Parser(Value);
}

/// Matches one of the given `input` parsers.
///
/// If `ctx.gll_trampoline` is initialized then ambiguous and left-recursive grammars are allowed and
/// implemented in O(n^3) time using GLL combinators (https://stackoverflow.com/a/31879560) however
/// only the first match will be returned (enumerating all possible ambiguous matches is not
/// supported.)
///
/// The `input` parsers must remain alive for as long as the `OneOf` parser will be used.
pub fn OneOf(comptime Input: type, comptime Value: type) type {
    return struct {
        interface: Parser(Value) = .{ ._parse = parse },
        input: OneOfContext(Value),

        const Self = @This();

        pub fn init(input: OneOfContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(interface: *const Parser(Value), in_ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value) {
            const self = @fieldParentPtr(Self, "interface", interface);
            var ctx = in_ctx.with(self.input);

            const Node = std.atomic.Stack(GLLStackEntry(Value)).Node;

            if (ctx.gll_trampoline) |gll_trampoline| {
                // Runtime combinator
                for (ctx.input) |parser| {
                    const entry = GLLStackEntry(Value){
                        .position = 0,
                        .alternate = parser,
                    };
                    const setEntry = entry.setEntry();
                    if (gll_trampoline.set.contains(setEntry)) {
                        continue;
                    }

                    const node = try ctx.allocator.create(Node);
                    node.* = Node{
                        .next = undefined,
                        .data = entry,
                    };
                    gll_trampoline.stack.push(node);
                    try gll_trampoline.set.put(setEntry, {});
                }
                while (gll_trampoline.stack.pop()) |next| {
                    defer ctx.allocator.destroy(next);
                    var node = next.data;
                    const result = try node.alternate.parse(ctx.with({}));
                    if (result != null) {
                        while (gll_trampoline.stack.pop()) |unused| {
                            ctx.allocator.destroy(unused);
                        }
                        return result.?;
                    }
                }
                return null;
            } else {
                // At comptime, we can't easily implement GLL today.
                for (ctx.input) |parser| {
                    const result = try parser.parse(ctx.with({}));
                    if (result != null) {
                        return result.?;
                    }
                }
                return null;
            }
        }
    };
}

test "oneof" {
    const allocator = testing.allocator;

    const ctx = Context(void, void){
        .input = {},
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(void).init(allocator),
    };
    defer ctx.deinit(allocator);

    const parsers: []*const Parser(void) = &.{
        &Literal.init("hello").interface,
        &Literal.init("world").interface,
    };
    var helloOrWorld = OneOf(void, void).init(parsers);
    const x = try helloOrWorld.interface.parse(ctx);
    testing.expectEqual(Result(void){ .consumed = 5, .result = .{ .value = {} } }, x.?);
}

test "oneof_ambiguous" {
    const allocator = testing.allocator;

    const ctx = Context(void, void){
        .input = {},
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(void).init(allocator),
    };
    defer ctx.deinit(allocator);

    const parsers: []*const Parser(void) = &.{
        &Literal.init("hello world").interface,
        &Literal.init("hello wor").interface,
    };
    var ambiguous = OneOf(void, void).init(parsers);

    const x = try ambiguous.interface.parse(ctx);
    testing.expectEqual(Result(void){ .consumed = 9, .result = .{ .value = {} } }, x.?);
}
