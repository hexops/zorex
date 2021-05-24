usingnamespace @import("combn.zig");

const std = @import("std");
const mem = std.mem;
const testing = std.testing;

// Confirms that a direct left-recursive grammar for an empty language actually rejects
// all input strings, and does not just hang indefinitely:
//
// ```ebnf
// Expr = Expr ;
// Grammar = Expr ;
// ```
//
// See https://cs.stackexchange.com/q/138447/134837
test "direct_left_recursion_empty_language" {
    nosuspend {
        const allocator = testing.allocator;

        const node = struct {
            name: []const u8,

            pub fn deinit(self: *const @This(), _allocator: *mem.Allocator) void {}
        };

        const Payload = void;
        const ctx = try Context(Payload, node).init(allocator, "abcabcabc123abc", {});
        defer ctx.deinit();

        var parsers = [_]*Parser(Payload, node){
            undefined, // placeholder for left-recursive Expr itself
        };
        var expr = MapTo(Payload, SequenceAmbiguousValue(node), node).init(.{
            .parser = &SequenceAmbiguous(Payload, node).init(&parsers).parser,
            .mapTo = struct {
                fn mapTo(in: Result(SequenceAmbiguousValue(node)), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(node) {
                    switch (in.result) {
                        .err => return Result(node).initError(in.offset, in.result.err),
                        else => {
                            var flattened = try in.result.value.flatten(_allocator, key, path);
                            defer flattened.deinit();
                            return Result(node).init(in.offset, node{ .name = "Expr" });
                        },
                    }
                }
            }.mapTo,
        });
        parsers[0] = &expr.parser;
        try expr.parser.parse(&ctx);

        defer ctx.results.deinitAll(ctx.allocator);
        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(node).initError(ctx.offset, "matches only the empty language"));
        var first = sub.next().?;
        try testing.expect(sub.next() == null); // stream closed

        // TODO(slimsag): perhaps better if it's not an error?
        try testing.expectEqual(@as(usize, 0), first.offset);
        try testing.expectEqualStrings("matches only the empty language", first.result.err);
    }
}

// Confirms that a direct left-recursive grammar for a valid languages works:
//
// ```ebnf
// Expr = Expr?, "abc" ;
// Grammar = Expr ;
// ```
//
test "direct_left_recursion" {
    const allocator = testing.allocator;

    const node = struct {
        name: std.ArrayList(u8),

        pub fn deinit(self: *const @This(), _allocator: *mem.Allocator) void {
            self.name.deinit();
        }
    };

    const Payload = void;
    const ctx = try Context(Payload, node).init(allocator, "abcabcabc123abc", {});
    defer ctx.deinit();

    var abcAsNode = MapTo(Payload, LiteralValue, node).init(.{
        .parser = &Literal(Payload).init("abc").parser,
        .mapTo = struct {
            fn mapTo(in: Result(LiteralValue), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(node) {
                switch (in.result) {
                    .err => return Result(node).initError(in.offset, in.result.err),
                    else => {
                        var name = std.ArrayList(u8).init(_allocator);
                        try name.appendSlice("abc");
                        return Result(node).init(in.offset, node{ .name = name });
                    },
                }
            }
        }.mapTo,
    });

    var parsers = [_]*Parser(Payload, node){
        undefined, // placeholder for left-recursive Expr itself
        &abcAsNode.parser,
    };
    var expr = Reentrant(Payload, node).init(&MapTo(Payload, SequenceAmbiguousValue(node), node).init(.{
        .parser = &SequenceAmbiguous(Payload, node).init(&parsers).parser,
        .mapTo = struct {
            fn mapTo(in: Result(SequenceAmbiguousValue(node)), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(node) {
                switch (in.result) {
                    .err => return Result(node).initError(in.offset, in.result.err),
                    else => {
                        var name = std.ArrayList(u8).init(_allocator);

                        var flattened = try in.result.value.flatten(_allocator, key, path);
                        defer flattened.deinit();
                        nosuspend {
                            var sub = flattened.subscribe(key, path, Result(node).initError(0, "matches only the empty language"));
                            try name.appendSlice("(");
                            var prev = false;
                            while (sub.next()) |next| {
                                if (prev) {
                                    try name.appendSlice(",");
                                }
                                prev = true;
                                try name.appendSlice(next.result.value.name.items);
                                next.result.value.name.deinit();
                            }
                            try name.appendSlice(")");
                        }
                        return Result(node).init(in.offset, node{ .name = name });
                    },
                }
            }
        }.mapTo,
    }).parser);
    var optionalExpr = MapTo(Payload, ?node, node).init(.{
        .parser = &Optional(Payload, node).init(&expr.parser).parser,
        .mapTo = struct {
            fn mapTo(in: Result(?node), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!Result(node) {
                switch (in.result) {
                    .err => return Result(node).initError(in.offset, in.result.err),
                    else => {
                        if (in.result.value == null) {
                            var name = std.ArrayList(u8).init(_allocator);
                            try name.appendSlice("null");
                            return Result(node).init(in.offset, node{ .name = name });
                        }
                        defer in.result.value.?.name.deinit();

                        var name = std.ArrayList(u8).init(_allocator);
                        try name.appendSlice(in.result.value.?.name.items);
                        return Result(node).init(in.offset, node{ .name = name });
                    },
                }
            }
        }.mapTo,
    });
    parsers[0] = &optionalExpr.parser;
    try expr.parser.parse(&ctx);

    defer ctx.results.deinitAll(ctx.allocator);
    var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(node).initError(ctx.offset, "matches only the empty language"));
    var first = sub.next().?;
    try testing.expect(sub.next() == null); // stream closed

    try testing.expectEqual(@as(usize, 0), first.offset);
    try testing.expectEqualStrings("(((null,abc),abc),abc)", first.result.value.name.items);
}
