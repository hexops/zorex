usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OneOfContext(comptime Value: type) type {
    return []const *const ParserInterface(Value);
}

/// Returns a `Parser` which matches one of the given input `parsers`.
///
/// If ctx.gll_trampoline is initialized (only possible at runtime, requires heap allocation),
/// then ambiguous and left-recursive grammars are allowed and implemented in O(n^3) time using
/// GLL combinators: https://stackoverflow.com/a/31879560 - however only the first match will be
/// returned (enumerating all possible ambiguous matches is not supported.)
///
/// `parsers` must remain alive for as long as the parser will be used.
pub fn oneOf(comptime Input: type, comptime Value: type) Parser(OneOfContext(Value), Value) {
    return struct {
        pub fn parse(in_ctx: Context(OneOfContext(Value), Value)) callconv(.Inline) Error!?Result(Value) {
            var ctx = in_ctx;
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
    }.parse;
}

/// Returns a `ParserInterface` which matches one of the given `ParserInterface`s.
///
/// See `oneOf` for guarantees around ambiguous and left-recursive grammars.
///
/// `parsers` must remain alive for as long as the parser will be used.
pub fn OneOf(comptime Input: type, comptime Value: type) type {
    return Wrap(OneOfContext(Value), Value, oneOf(Input, Value));
}

test "oneof_comptime" {
    comptime {
        const allocator = testing.allocator;
        const ctx = Context(void, void){
            .input = {},
            .allocator = allocator,
            .src = "hello world",
            .offset = 0,
            .gll_trampoline = null,
        };
        defer ctx.deinit(allocator);

        const parsers: []const *const ParserInterface(void) = &.{
            &Literal.init("hello").interface,
            &Literal.init("world").interface,
        };
        var x = try oneOf(void, void)(ctx.with(parsers));
        testing.expectEqual(Result(void){ .consumed = 5, .result = .{ .value = {} } }, x.?);
    }
}

test "oneof_runtime" {
    const allocator = testing.allocator;

    const ctx = Context(void, void){
        .input = {},
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(void).init(allocator),
    };
    defer ctx.deinit(allocator);

    const parsers: []*const ParserInterface(void) = &.{
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

    const parsers: []*const ParserInterface(void) = &.{
        &Literal.init("hello world").interface,
        &Literal.init("hello wor").interface,
    };
    var ambiguous = OneOf(void, void).init(parsers);

    const x = try ambiguous.interface.parse(ctx);
    testing.expectEqual(Result(void){ .consumed = 9, .result = .{ .value = {} } }, x.?);
}
