usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn RepeatedContext(comptime Value: type) type {
    return struct {
        /// The parser which should be repeatedly parsed.
        parser: *const ParserInterface(Value),

        /// The minimum number of times the parser must successfully match.
        min: usize,

        /// The maximum number of times the parser can match, or -1 for unlimited.
        max: isize,
    };
}

pub fn RepeatedValue(comptime Value: type) type {
    return std.ArrayList(Result(Value));
}

/// Returns a `Parser` which matches an input `parser` between `[min, max]` times (inclusive.)
pub fn repeated(comptime Input: type, comptime Value: type) Parser(RepeatedContext(Value), RepeatedValue(Value)) {
    return struct {
        pub fn parse(ctx: Context(RepeatedContext(Value), RepeatedValue(Value))) callconv(.Inline) Error!?Result(RepeatedValue(Value)) {
            var sub_ctx = Context(Value, void){
                .input = {},
                .allocator = ctx.allocator,
                .src = ctx.src,
                .offset = ctx.offset,
                .gll_trampoline = null,
            };
            if (ctx.gll_trampoline != null) {
                sub_ctx.gll_trampoline = try ctx.gll_trampoline.?.initWith(ctx.allocator, Value);
            }
            defer sub_ctx.deinit(ctx.allocator);

            var list = std.ArrayList(Result(Value)).init(ctx.allocator);
            var consumed: usize = 0;
            while (list.items.len < ctx.input.max or ctx.input.max == -1) {
                const next = try ctx.input.parser.parse(sub_ctx);
                if (next == null) {
                    break;
                }
                switch (next.?.result) {
                    .err => break, // TODO(slimsag): syntax errors should not be treated the same as other errors
                    .value => {},
                }
                consumed = next.?.consumed;
                sub_ctx.offset = next.?.consumed;
                try list.append(next.?);
            }
            if (list.items.len == 0) {
                return null;
            }
            if (list.items.len < ctx.input.min) {
                return Result(RepeatedValue(Value)){
                    .consumed = consumed,
                    .result = .{ .err = "expected more" }, // TODO(slimsag): include number of expected/found matches
                };
            }
            return Result(RepeatedValue(Value)){
                .consumed = consumed,
                .result = .{ .value = list },
            };
        }
    }.parse;
}

/// Returns a `ParserInterface` which matches an input `parser` between `[min, max]` times
/// (inclusive.)
pub fn Repeated(comptime Input: type, comptime Value: type) type {
    return Wrap(RepeatedContext(Value), RepeatedValue(Value), repeated(Input, Value));
}

// TODO(slimsag): implementing this parser combinator at comptime is not
// actually possible, unless we mark the `ctx` parameter as `comptime`. This is
// because the Zig compiler cannot trace that `ctx` _is actually comptime_ without
// such an annotation in this case. See the `sg/comptime-bug-question-mark` branch for
// an explation of that problem.
//
// This means, similar to how we have comptime `literal` and runtime `Literal` we
// would further need a `comptimeRepeated` AND runtime `repeated`/`Repeated`.
// This is unfortunate, and hints that we likely _would_ be better off with just a
// runtime implementation, using mecha if needed for a comptime implementation (which
// may have some limitations like the data types it can emit being strings only), and
// ultimately just waiting until Zig gets comptime heap allocation support:
// https://github.com/ziglang/zig/issues/1291

test "repeated_runtime" {
    const allocator = testing.allocator;

    const ctx = Context(void, RepeatedValue(void)){
        .input = {},
        .allocator = allocator,
        .src = "abcabcabc123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(RepeatedValue(void)).init(allocator),
    };
    defer ctx.deinit(allocator);

    var abcInfinity = Repeated(void, void).init(.{
        .parser = &Literal.init("abc").interface,
        .min = 0,
        .max = -1,
    });
    const x = try abcInfinity.interface.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = RepeatedValue(void).init(allocator);
    defer wantMatches.deinit();
    try wantMatches.append(Result(void){
        .consumed = 3,
        .result = .{
            .value = {},
        },
    });
    try wantMatches.append(Result(void){
        .consumed = 6,
        .result = .{
            .value = {},
        },
    });
    try wantMatches.append(Result(void){
        .consumed = 9,
        .result = .{
            .value = {},
        },
    });
    var want = Result(RepeatedValue(void)){
        .consumed = 9,
        .result = .{
            .value = wantMatches,
        },
    };
    testing.expectEqual(want.consumed, x.?.consumed);
    testing.expectEqualSlices(Result(void), want.result.value.items, x.?.result.value.items);
}
