usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");
usingnamespace @import("comb_repeated.zig");

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
        parser: Parser(Value) = .{ ._parse = parse },
        input: OneOfContext(Value),

        const Self = @This();

        pub fn init(input: OneOfContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(Value), in_ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value) {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);

            const Node = std.atomic.Stack(GLLStackEntry(Value)).Node;

            if (ctx.gll_trampoline) |gll_trampoline| {
                // Runtime combinator
                for (ctx.input) |in_parser| {
                    const entry = GLLStackEntry(Value){
                        .position = ctx.offset,
                        .alternate = in_parser,
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
                for (ctx.input) |in_parser| {
                    const result = try in_parser.parse(ctx.with({}));
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
    defer ctx.deinit();

    const parsers: []*const Parser(void) = &.{
        &Literal.init("hello").parser,
        &Literal.init("world").parser,
    };
    var helloOrWorld = OneOf(void, void).init(parsers);
    const x = try helloOrWorld.parser.parse(ctx);
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
    defer ctx.deinit();

    const parsers: []*const Parser(void) = &.{
        &Literal.init("hello world").parser,
        &Literal.init("hello wor").parser,
    };
    var ambiguous = OneOf(void, void).init(parsers);

    const x = try ambiguous.parser.parse(ctx);
    testing.expectEqual(Result(void){ .consumed = 9, .result = .{ .value = {} } }, x.?);
}

test "oneof_left_recursion_basic" {
    const allocator = testing.allocator;

    const ctx = Context(void, void){
        .input = {},
        .allocator = allocator,
        .src = "abcabcabc123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(void).init(allocator),
    };
    defer ctx.deinit();

    // TODO(slimsag): stack ordering means left-recursive grammars must have
    // the "left" parser last in the list, which is counter-intuitive. Need to make this
    // ordering more well-defined/documented.
    var parsers: [2]*const Parser(void) = .{
        &Literal.init("abc").parser,
        undefined, // placeholder for left-recursive expr itself
    };
    const expr = OneOf(void, void).init(&parsers);
    parsers[1] = &expr.parser;
    const x = try expr.parser.parse(ctx);
    testing.expectEqual(Result(void){ .consumed = 3, .result = .{ .value = {} } }, x.?);
}

test "oneof_right_recursion_basic" {
    const allocator = testing.allocator;

    const ctx = Context(void, void){
        .input = {},
        .allocator = allocator,
        .src = "abcabcabc123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(void).init(allocator),
    };
    defer ctx.deinit();

    // TODO(slimsag): stack ordering means right-recursive grammars must have
    // the "right" parser first in the list, which is counter-intuitive. Need to make this
    // ordering more well-defined/documented.
    var parsers: [2]*const Parser(void) = .{
        undefined, // placeholder for right-recursive expr itself
        &Literal.init("abc").parser,
    };
    const expr = OneOf(void, void).init(&parsers);
    parsers[0] = &expr.parser;
    const x = try expr.parser.parse(ctx);
    testing.expectEqual(Result(void){ .consumed = 3, .result = .{ .value = {} } }, x.?);
}
