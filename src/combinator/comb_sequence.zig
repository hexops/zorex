usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");
usingnamespace @import("comb_mapto.zig");
usingnamespace @import("comb_optional.zig");
usingnamespace @import("comb_oneof.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn SequenceContext(comptime Value: type) type {
    return []const *const Parser(Value);
}

pub fn SequenceValue(comptime Value: type) type {
    return std.ArrayList(Result(Value));
}

/// Matches the `input` parsers sequentially, requiring that all successfully match in order.
///
/// The `input` parsers must remain alive for as long as the `Sequence` parser will be used.
pub fn Sequence(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(SequenceValue(Value)) = .{ ._parse = parse },
        input: SequenceContext(Value),

        const Self = @This();

        pub fn init(input: SequenceContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(SequenceValue(Value)), in_ctx: Context(void, SequenceValue(Value))) callconv(.Inline) ?Result(SequenceValue(Value)) {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);

            var sub_ctx = Context(void, Value){
                .input = {},
                .allocator = ctx.allocator,
                .src = ctx.src,
                .offset = ctx.offset,
                .gll_trampoline = null,
            };
            if (ctx.gll_trampoline != null) {
                sub_ctx.gll_trampoline = ctx.gll_trampoline.?.initChild(ctx.allocator, Value) catch |err| return Result(SequenceValue(Value)).initError(err);
            }
            defer sub_ctx.deinitChild();

            var freeLater = std.ArrayList([]*const Parser(Value)).init(ctx.allocator);
            defer {
                for (freeLater.items) |item| {
                    ctx.allocator.free(item);
                }
                freeLater.deinit();
            }
            var list = std.ArrayList(Result(Value)).init(ctx.allocator);
            var consumed: usize = 0;
            for (ctx.input) |in_parser| {
                if (sub_ctx.gll_trampoline != null) {
                    const entry = GLLStackEntry(Value){
                        .position = ctx.offset + consumed,
                        .alternate = in_parser,
                    };
                    const setEntry = entry.setEntry();
                    if (sub_ctx.gll_trampoline.?.set.contains(setEntry)) {
                        continue;
                    }
                    sub_ctx.gll_trampoline.?.set.put(setEntry, {}) catch |err| return Result(SequenceValue(Value)).initError(err);
                }

                const next = in_parser.parse(sub_ctx);
                if (next == null) {
                    list.deinit();
                    if (list.items.len > 0) {
                        // TODO(slimsag): include what was expected next
                        return Result(SequenceValue(Value)).initSyntaxError(consumed, "expected next");
                    }
                    return null;
                }
                switch (next.?.result) {
                    .syntax_err => {
                        // TODO(slimsag): syntax errors should not be treated the same as other errors
                        list.deinit();
                        if (list.items.len > 0) {
                            // TODO(slimsag): include what was expected next
                            return Result(SequenceValue(Value)).initSyntaxError(consumed, "expected next");
                        }
                        return null;
                    },
                    .err => return Result(SequenceValue(Value)).initError(next.?.result.err),
                    .value => {},
                }
                consumed = next.?.consumed;
                sub_ctx.offset = next.?.consumed;
                list.append(next.?) catch |err| return Result(SequenceValue(Value)).initError(err);
            }
            if (list.items.len == 0) {
                return null;
            }
            return Result(SequenceValue(Value)).init(consumed, list);
        }
    };
}

test "sequence" {
    const allocator = testing.allocator;

    const ctx = Context(void, SequenceValue(void)){
        .input = {},
        .allocator = allocator,
        .src = "abc123abc456_123abc",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(SequenceValue(void)).init(allocator),
    };
    defer ctx.deinit();

    var seq = Sequence(void, void).init(&.{
        &Literal.init("abc").parser,
        &Literal.init("123").parser,
        &Literal.init("abc").parser,
        &Literal.init("456").parser,
    });
    const x = seq.parser.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = SequenceValue(void).init(allocator);
    defer wantMatches.deinit();
    try wantMatches.append(Result(void).init(3, {}));
    try wantMatches.append(Result(void).init(6, {}));
    try wantMatches.append(Result(void).init(9, {}));
    try wantMatches.append(Result(void).init(12, {}));
    var want = Result(SequenceValue(void)).init(12, wantMatches);
    testing.expectEqual(want.consumed, x.?.consumed);
    testing.expectEqualSlices(Result(void), want.result.value.items, x.?.result.value.items);
}

// Confirms that the following grammar works as expected:
//
// ```ebnf
// Expr = [ Expr ] , "abc" ;
// Grammar = Expr ;
// ```
//
test "sequence_left_recursion" {
    const allocator = testing.allocator;

    const dynamicStr = std.ArrayList(u8);

    const ctx = Context(void, SequenceValue(dynamicStr)){
        .input = {},
        .allocator = allocator,
        .src = "abcabcabcabc123456",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline(SequenceValue(dynamicStr)).init(allocator),
    };
    defer ctx.deinit();

    const abc = MapTo(void, void, dynamicStr).init(.{
        .parser = &Literal.init("abc").parser,
        .mapTo = struct {
            fn mapTo(in: ?Result(void)) ?Result(dynamicStr) {
                if (in == null) return null;
                var str = dynamicStr.init(allocator);
                str.appendSlice("(abc)") catch |err| return Result(dynamicStr).initError(err);
                return Result(dynamicStr).init(in.?.consumed, str);
            }
        }.mapTo,
    });

    var parsers: [2]*const Parser(dynamicStr) = .{
        undefined, // placeholder for left-recursive expr itself
        &abc.parser,
    };
    const expr = Sequence(void, dynamicStr).init(&parsers);
    const optionalExpr = Optional(void, SequenceValue(dynamicStr)).init(&expr.parser);
    const exprAsStringType = MapTo(void, ?SequenceValue(dynamicStr), dynamicStr).init(.{
        .parser = &optionalExpr.parser,
        .mapTo = struct {
            fn mapTo(in: ?Result(?SequenceValue(dynamicStr))) ?Result(dynamicStr) {
                if (in == null) return null;
                var str = dynamicStr.init(allocator);
                if (in.?.result.value != null) {
                    defer in.?.result.value.?.deinit();
                    for (in.?.result.value.?.items) |r| {
                        str.appendSlice("(") catch |err| return Result(dynamicStr).initError(err);
                        str.appendSlice(r.result.value.items) catch |err| return Result(dynamicStr).initError(err);
                        str.appendSlice(")") catch |err| return Result(dynamicStr).initError(err);
                        r.result.value.deinit();
                    }
                } else {
                    str.appendSlice("(none)") catch |err| return Result(dynamicStr).initError(err);
                }
                return Result(dynamicStr).init(in.?.consumed, str);
            }
        }.mapTo,
    });
    parsers[0] = &exprAsStringType.parser;
    const x = expr.parser.parse(ctx);
    defer x.?.result.value.deinit();

    var wantMatches = SequenceValue(dynamicStr).init(allocator);
    defer wantMatches.deinit();

    testing.expectEqual(@as(usize, 6), x.?.consumed); // TODO(slimsag): should be 12
    const gotSlice = x.?.result.value.items;
    testing.expectEqual(@as(usize, 2), gotSlice.len);

    defer gotSlice[0].result.value.deinit();
    testing.expectEqual(@as(usize, 3), gotSlice[0].consumed);
    testing.expectEqualStrings("((abc))", gotSlice[0].result.value.items);

    defer gotSlice[1].result.value.deinit();
    testing.expectEqual(@as(usize, 6), gotSlice[1].consumed);
    testing.expectEqualStrings("(abc)", gotSlice[1].result.value.items);
}
