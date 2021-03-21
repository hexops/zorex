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

pub fn RepeatedValue(comptime Value: type, comptime heap_alloc: bool) type {
    if (heap_alloc) {
        return std.ArrayList(Result(Value));
    }
    return []const Result(Value);
}

/// Returns a `Parser` which matches an input `parser` between `[min, max]` times (inclusive.)
///
/// `heap_alloc` indicates whether or not to allocate the results on the heap or stack. If true,
/// the context must have a `gll_trampoline` initialized.
pub fn repeated(comptime Input: type, comptime Value: type, comptime heap_alloc: bool) Parser(RepeatedContext(Value), RepeatedValue(Value, heap_alloc)) {
    return struct {
        pub fn parse(ctx: Context(RepeatedContext(Value), RepeatedValue(Value, heap_alloc))) callconv(.Inline) Error!?Result(RepeatedValue(Value, heap_alloc)) {
            if (heap_alloc) {
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
                        .err => break, // TODO(slimsag): decide how syntax errors get handled here
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
                    return Result(RepeatedValue(Value, heap_alloc)){
                        .consumed = consumed,
                        .result = .{ .err = "expected more" }, // TODO(slimsag): include number
                    };
                }
                return Result(RepeatedValue(Value, heap_alloc)){
                    .consumed = consumed,
                    .result = .{ .value = list },
                };
            } else comptime {
                comptime const x = ctx;
                _ = x;

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

                var list: []const Result(Value) = &[0]Result(Value){};
                var consumed: usize = 0;
                var list_len = 0;
                // inline while (list.len < ctx.input.max or ctx.input.max == -1) {
                //     const next = try ctx.input.parser.parse(sub_ctx);
                //     if (next == null) {
                //         break;
                //     }
                //     switch (next.?.result) {
                //     .err => break, // TODO(slimsag): decide how syntax errors get handled here
                //     .value => {},
                //     }
                //     consumed = next.?.consumed;
                //     sub_ctx.offset = next.?.consumed;
                //     var newList = list ++ [1]Result(Value){next.?};
                //     list = newList[0..];
                // }
                if (list.len == 0) {
                    return null;
                }
                if (list.len < ctx.input.min) {
                    return Result(RepeatedValue(Value, heap_alloc)){
                        .consumed = consumed,
                        .result = .{ .err = "expected more" }, // TODO(slimsag): include number
                    };
                }
                return Result(RepeatedValue(Value, heap_alloc)){ .consumed = consumed, .result = .{ .value = list[0..] } };
            }
        }
    }.parse;
}

/// Returns a `ParserInterface` which matches an input `parser` between `[min, max]` times
/// (inclusive.)
pub fn Repeated(comptime Input: type, comptime Value: type, comptime heap_alloc: bool) type {
    return Wrap(RepeatedContext(Value), RepeatedValue(Value, heap_alloc), repeated(Input, Value, heap_alloc));
}

//test "oneof_comptime" {
//     comptime {
//         const allocator = testing.allocator;
//         const ctx = Context(void, void){
//             .input={},
//             .allocator=allocator,
//             .src="hello world",
//             .gll_trampoline = null,
//         };
//         defer ctx.deinit(allocator);

//         const parsers: []const *const ParserInterface(void) = &.{
//             &Literal.init("hello").interface,
//             &Literal.init("world").interface,
//         };
//         var x = oneOf(void, void)(ctx.with(parsers));
//         testing.expectEqual(Result(void){.consumed = 5, .result = .{.value = {}}}, x.?);
//     }
// }

test "repeated_comptime" {
    comptime const x = try struct {
        fn do() !?Result(RepeatedValue(void, false)) {
            const allocator = testing.failing_allocator;
            const ctx = Context(void, RepeatedValue(void, false)){
                .input = {},
                .allocator = allocator,
                .src = "abcabcabc123abc",
                .offset = 0,
                .gll_trampoline = null,
            };
            defer ctx.deinit(allocator);

            var x = repeated(void, void, false)(ctx.with(RepeatedContext(void){
                .parser = &Literal.init("abc").interface,
                .min = 0,
                .max = -1,
            }));
            return x;
        }
    }.do();

    // const wantMatches = &[_]Result(void){
    // };
    // var want = Result(RepeatedValue(void, false)){
    //     .consumed = 9,
    //     .result = .{
    //         .value = wantMatches[0..],
    //     },
    // };
    // testing.expectEqual(want.consumed, x.?.consumed);
    // testing.expectEqualSlices(Result(void), want.result.value, x.?.result.value);
}

test "repeated_runtime" {
    const allocator = testing.allocator;

    const ctx = Context(void, RepeatedValue(void, true)){
        .input = {},
        .allocator = allocator,
        .src = "abcabcabc123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(RepeatedValue(void, true)).init(allocator),
    };
    defer ctx.deinit(allocator);

    var abcInfinity = Repeated(void, void, true).init(.{
        .parser = &Literal.init("abc").interface,
        .min = 0,
        .max = -1,
    });
    const x = try abcInfinity.interface.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = RepeatedValue(void, true).init(allocator);
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
    var want = Result(RepeatedValue(void, true)){
        .consumed = 9,
        .result = .{
            .value = wantMatches,
        },
    };
    testing.expectEqual(want.consumed, x.?.consumed);
    testing.expectEqualSlices(Result(void), want.result.value.items, x.?.result.value.items);
}
