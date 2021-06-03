usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OneOfAmbiguousContext(comptime Payload: type, comptime Value: type) type {
    return []const *const Parser(Payload, Value);
}

/// Represents values from one parse path.
///
/// In the case of a non-ambiguous `OneOfAmbiguous` grammar of `Parser1 | Parser2`, the combinator will
/// yield:
///
/// ```
/// stream(OneOfAmbiguousValue(Parser1Value))
/// ```
///
/// Or:
///
/// ```
/// stream(OneOfAmbiguousValue(Parser2Value))
/// ```
///
/// In the case of an ambiguous grammar `Parser1 | Parser2` where either parser can produce three
/// different parse paths, it will yield:
///
/// ```
/// stream(
///     OneOfAmbiguousValue(Parser1Value1),
///     OneOfAmbiguousValue(Parser1Value2),
///     OneOfAmbiguousValue(Parser1Value3),
///     OneOfAmbiguousValue(Parser2Value1),
///     OneOfAmbiguousValue(Parser2Value2),
///     OneOfAmbiguousValue(Parser2Value3),
/// )
/// ```
///
pub fn OneOfAmbiguousValue(comptime Value: type) type {
    return Value;
}

/// Matches one of the given `input` parsers, supporting ambiguous and unambiguous grammars.
///
/// The `input` parsers must remain alive for as long as the `OneOfAmbiguous` parser will be used.
pub fn OneOfAmbiguous(comptime Payload: type, comptime Value: type) type {
    return struct {
        parser: Parser(Payload, OneOfAmbiguousValue(Value)) = Parser(Payload, OneOfAmbiguousValue(Value)).init(parse, nodeName, deinit),
        input: OneOfAmbiguousContext(Payload, Value),

        const Self = @This();

        pub fn init(input: OneOfAmbiguousContext(Payload, Value)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *const Parser(Payload, Value), allocator: *mem.Allocator) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            for (self.input) |in_parser| {
                in_parser.deinit(allocator);
            }
        }

        pub fn nodeName(parser: *const Parser(Payload, Value), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("OneOfAmbiguous");
            for (self.input) |in_parser| {
                v +%= try in_parser.nodeName(node_name_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const Context(Payload, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            var buffer = try ResultStream(Result(OneOfAmbiguousValue(Value))).init(ctx.allocator, ctx.key, false);
            defer buffer.deinit();
            for (self.input) |in_parser| {
                const child_node_name = try in_parser.nodeName(&in_ctx.memoizer.node_name_cache);
                var child_ctx = try in_ctx.initChild(Value, child_node_name, ctx.offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try in_parser.parse(&child_ctx);
                var sub = child_ctx.subscribe();
                while (sub.next()) |next| {
                    try buffer.add(next);
                }
            }
            buffer.close();

            var gotValues: usize = 0;
            var gotErrors: usize = 0;
            var sub = buffer.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
            while (sub.next()) |next| {
                switch (next.result) {
                    .err => gotErrors += 1,
                    else => gotValues += 1,
                }
            }
            if (gotValues > 0) {
                // At least one parse path succeeded, so discard all error'd parse paths.
                //
                // TODO(slimsag): would the client not want to enumerate error'd paths that made some
                // progress?
                var sub2 = buffer.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
                while (sub2.next()) |next| {
                    switch (next.result) {
                        .err => {},
                        else => try ctx.results.add(next),
                    }
                }
                return;
            }
            // All parse paths failed, so return a nice error.
            //
            // TODO(slimsag): include names of expected input parsers
            //
            // TODO(slimsag): collect and return the furthest error if a parse path made
            // progress and failed.
            try ctx.results.add(Result(OneOfAmbiguousValue(Value)).initError(ctx.offset, "expected OneOfAmbiguous"));
        }
    };
}

// Confirms that the following grammar works as expected:
//
// ```ebnf
// Grammar = "ello" | "world" ;
// ```
//
test "oneof" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, OneOfAmbiguousValue(LiteralValue)).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*const Parser(Payload, LiteralValue) = &.{
            &Literal(Payload).init("ello").parser,
            &Literal(Payload).init("world").parser,
        };
        var helloOrWorld = OneOfAmbiguous(Payload, LiteralValue).init(parsers);
        try helloOrWorld.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        try testing.expectEqual(Result(OneOfAmbiguousValue(LiteralValue)).init(4, .{ .value = "ello" }), first);
        try testing.expect(sub.next() == null); // stream closed
    }
}

// Confirms that the following grammar works as expected:
//
// ```ebnf
// Grammar = "ello" | "elloworld" ;
// ```
//
test "oneof_ambiguous" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, OneOfAmbiguousValue(LiteralValue)).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*const Parser(Payload, LiteralValue) = &.{
            &Literal(Payload).init("ello").parser,
            &Literal(Payload).init("elloworld").parser,
        };
        var helloOrWorld = OneOfAmbiguous(Payload, LiteralValue).init(parsers);
        try helloOrWorld.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var r1 = sub.next().?;
        try testing.expectEqual(@as(usize, 4), r1.offset);
        try testing.expectEqualStrings("ello", r1.result.value.value);
        var r2 = sub.next().?;
        try testing.expectEqual(@as(usize, 9), r2.offset);
        try testing.expectEqualStrings("elloworld", r2.result.value.value);
        try testing.expect(sub.next() == null); // stream closed
    }
}
