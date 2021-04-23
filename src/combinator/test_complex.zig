usingnamespace @import("gll_parser.zig");
usingnamespace @import("parser_literal.zig");
usingnamespace @import("comb_sequence.zig");
usingnamespace @import("comb_mapto.zig");
usingnamespace @import("comb_optional.zig");

const std = @import("std");
const mem = std.mem;
const testing = std.testing;

// Confirms that a direct left-recursive grammar for an empty languages actually rejects
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
        };

        const ctx = try Context(void, node).init(allocator, "abcabcabc123abc", {});
        defer ctx.deinit();

        var parsers = [_]*Parser(node){
            undefined, // placeholder for left-recursive Expr itself
        };
        var expr = MapTo(void, SequenceValue(node), node).init(.{
            .parser = &Sequence(void, node).init(&parsers).parser,
            .mapTo = struct {
                fn mapTo(in: Result(SequenceValue(node)), _allocator: *mem.Allocator, state_hash: u64, path: ParserPath) Error!Result(node) {
                    switch (in.result) {
                        .err => return Result(node).initError(in.offset, in.result.err),
                        else => {
                            var flattened = try in.result.value.flatten(_allocator, state_hash, path);
                            defer flattened.deinit();
                            return Result(node).init(in.offset, node{ .name = "Expr" });
                        },
                    }
                }
            }.mapTo,
        });
        parsers[0] = &expr.parser;
        try expr.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.state_hash, ctx.path);
        testing.expect(sub.next() == null); // stream closed
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
    };

    const ctx = try Context(void, node).init(allocator, "abcabcabc123abc", {});
    defer ctx.deinit();

    var abcAsNode = MapTo(void, void, node).init(.{
        .parser = &Literal.init("abc").parser,
        .mapTo = struct {
            fn mapTo(in: Result(void), _allocator: *mem.Allocator, state_hash: u64, path: ParserPath) Error!Result(node) {
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

    var parsers = [_]*Parser(node){
        undefined, // placeholder for left-recursive Expr itself
        &abcAsNode.parser,
    };
    var expr = MapTo(void, SequenceValue(node), node).init(.{
        .parser = &Sequence(void, node).init(&parsers).parser,
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(node)), _allocator: *mem.Allocator, state_hash: u64, path: ParserPath) Error!Result(node) {
                switch (in.result) {
                    .err => return Result(node).initError(in.offset, in.result.err),
                    else => {
                        var name = std.ArrayList(u8).init(_allocator);

                        var flattened = try in.result.value.flatten(_allocator, state_hash, path);
                        defer flattened.deinit();
                        nosuspend {
                            var sub = flattened.subscribe(state_hash, path);
                            try name.appendSlice("Expr(");
                            while (sub.next()) |next| {
                                try name.appendSlice(next.result.value.name.items);
                                try name.appendSlice(",");
                                next.result.value.name.deinit();
                            }
                            try name.appendSlice(")");
                        }
                        return Result(node).init(in.offset, node{ .name = name });
                    },
                }
            }
        }.mapTo,
    });
    var optionalExpr = MapTo(void, ?node, node).init(.{
        .parser = &Optional(void, node).init(&expr.parser).parser,
        .mapTo = struct {
            fn mapTo(in: Result(?node), _allocator: *mem.Allocator, state_hash: u64, path: ParserPath) Error!Result(node) {
                switch (in.result) {
                    .err => return Result(node).initError(in.offset, in.result.err),
                    else => {
                        std.debug.print("\nGOT RESULT {s}\n", .{in.result.value});
                        if (in.result.value == null) {
                            var name = std.ArrayList(u8).init(_allocator);
                            try name.appendSlice("Optional(null)");
                            return Result(node).init(in.offset, node{ .name = name });
                        }
                        defer in.result.value.?.name.deinit();

                        var name = std.ArrayList(u8).init(_allocator);
                        try name.appendSlice("Optional(");
                        try name.appendSlice(in.result.value.?.name.items);
                        try name.appendSlice(")");
                        return Result(node).init(in.offset, node{ .name = name });
                    },
                }
            }
        }.mapTo,
    });
    parsers[0] = &optionalExpr.parser;
    try expr.parser.parse(&ctx);

    var sub = ctx.results.subscribe(ctx.state_hash, ctx.path);
    // TODO(slimsag): Should emit "abc" 3 times! It does not!
    testing.expect(sub.next() == null); // stream closed
}
