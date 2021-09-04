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

            pub fn deinit(self: *const @This(), _allocator: *mem.Allocator) void {
                _ = self;
                _ = _allocator;
            }
        };

        const Payload = void;
        const ctx = try Context(Payload, node).init(allocator, "abcabcabc123abc", {});
        defer ctx.deinit();

        var parsers = [_]*Parser(Payload, node){
            undefined, // placeholder for left-recursive Expr itself
        };
        var expr = try MapTo(Payload, SequenceAmbiguousValue(node), node).init(allocator, .{
            .parser = (&SequenceAmbiguous(Payload, node).init(&parsers).parser).ref(),
            .mapTo = struct {
                fn mapTo(in: Result(SequenceAmbiguousValue(node)), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(node) {
                    _ = payload;
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
        defer expr.deinit(allocator);
        parsers[0] = expr.ref();
        try expr.parse(&ctx);

        var sub = ctx.subscribe();
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
            _ = _allocator;
            self.name.deinit();
        }
    };

    const Payload = void;
    const ctx = try Context(Payload, node).init(allocator, "abcabcabc123abc", {});
    defer ctx.deinit();

    var abcAsNode = try MapTo(Payload, LiteralValue, node).init(allocator, .{
        .parser = (&Literal(Payload).init("abc").parser).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(LiteralValue), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(node) {
                _ = _allocator;
                _ = payload;
                _ = key;
                _ = path;
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
    defer abcAsNode.deinit(allocator);

    var parsers = [_]*Parser(Payload, node){
        undefined, // placeholder for left-recursive Expr itself
        abcAsNode.ref(),
    };
    var expr = Reentrant(Payload, node).init(
        try MapTo(Payload, SequenceAmbiguousValue(node), node).init(allocator, .{
            .parser = (&SequenceAmbiguous(Payload, node).init(&parsers).parser).ref(),
            .mapTo = struct {
                fn mapTo(in: Result(SequenceAmbiguousValue(node)), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(node) {
                    _ = payload;
                    switch (in.result) {
                        .err => return Result(node).initError(in.offset, in.result.err),
                        else => {
                            var name = std.ArrayList(u8).init(_allocator);

                            var flattened = try in.result.value.flatten(_allocator, key, path);
                            defer flattened.deinit();
                            var sub = flattened.subscribe(key, path, Result(node).initError(0, "matches only the empty language"));
                            try name.appendSlice("(");
                            var prev = false;
                            while (sub.next()) |next| {
                                if (prev) {
                                    try name.appendSlice(",");
                                }
                                prev = true;
                                try name.appendSlice(next.result.value.name.items);
                            }
                            try name.appendSlice(")");
                            return Result(node).init(in.offset, node{ .name = name });
                        },
                    }
                }
            }.mapTo,
        }),
    );
    var optionalExpr = try MapTo(Payload, ?node, node).init(allocator, .{
        .parser = (&Optional(Payload, node).init((&expr.parser).ref()).parser).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(?node), payload: Payload, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(node) {
                _ = payload;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(node).initError(in.offset, in.result.err),
                    else => {
                        if (in.result.value == null) {
                            var name = std.ArrayList(u8).init(_allocator);
                            try name.appendSlice("null");
                            return Result(node).init(in.offset, node{ .name = name });
                        }

                        var name = std.ArrayList(u8).init(_allocator);
                        try name.appendSlice(in.result.value.?.name.items);
                        return Result(node).init(in.offset, node{ .name = name });
                    },
                }
            }
        }.mapTo,
    });
    defer optionalExpr.deinit(allocator);
    parsers[0] = optionalExpr.ref();
    try expr.parser.parse(&ctx);

    var sub = ctx.subscribe();
    var first = sub.next().?;
    try testing.expect(sub.next() == null); // stream closed

    try testing.expectEqual(@as(usize, 0), first.offset);
    try testing.expectEqualStrings("(((null,abc),abc),abc)", first.result.value.name.items);
}
