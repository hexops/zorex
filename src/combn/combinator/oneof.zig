usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OneOfContext(comptime Payload: type, comptime Value: type) type {
    return []const *const Parser(Payload, Value);
}

/// Represents values from one parse path.
///
/// In the case of a non-ambiguous `OneOf` grammar of `Parser1 | Parser2`, the combinator will
/// yield:
///
/// ```
/// stream(OneOfValue(Parser1Value))
/// ```
///
/// Or:
///
/// ```
/// stream(OneOfValue(Parser2Value))
/// ```
///
/// In the case of an ambiguous grammar `Parser1 | Parser2` where either parser can produce three
/// different parse paths, it will always yield the first successful path.
pub fn OneOfValue(comptime Value: type) type {
    return Value;
}

/// Matches one of the given `input` parsers, matching the first parse path. If ambiguous grammar
/// matching is desired, see `OneOfAmbiguous`.
///
/// The `input` parsers must remain alive for as long as the `OneOf` parser will be used.
pub fn OneOf(comptime Payload: type, comptime Value: type) type {
    return struct {
        parser: Parser(Payload, OneOfValue(Value)) = Parser(Payload, OneOfValue(Value)).init(parse, nodeName, deinit),
        input: OneOfContext(Payload, Value),

        const Self = @This();

        pub fn init(input: OneOfContext(Payload, Value)) Self {
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

            var v = std.hash_map.hashString("OneOf");
            for (self.input) |in_parser| {
                v +%= try in_parser.nodeName(node_name_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const Context(Payload, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            var gotValues: usize = 0;
            for (self.input) |in_parser| {
                const child_node_name = try in_parser.nodeName(&in_ctx.memoizer.node_name_cache);
                var child_ctx = try in_ctx.initChild(Value, child_node_name, ctx.offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try in_parser.parse(&child_ctx);
                var sub = child_ctx.subscribe();
                while (sub.next()) |next| {
                    switch (next.result) {
                        .err => {},
                        else => {
                            // TODO(slimsag): need path committal functionality
                            if (gotValues == 0) try ctx.results.add(next);
                            gotValues += 1;
                        },
                    }
                }
            }
            if (gotValues == 0) {
                // All parse paths failed, so return a nice error.
                //
                // TODO(slimsag): include names of expected input parsers
                //
                // TODO(slimsag): collect and return the furthest error if a parse path made
                // progress and failed.
                try ctx.results.add(Result(OneOfValue(Value)).initError(ctx.offset, "expected OneOf"));
            }
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
        const ctx = try Context(Payload, OneOfValue(LiteralValue)).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*const Parser(Payload, LiteralValue) = &.{
            &Literal(Payload).init("ello").parser,
            &Literal(Payload).init("world").parser,
        };
        var helloOrWorld = OneOf(Payload, LiteralValue).init(parsers);
        try helloOrWorld.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var r1 = sub.next().?;
        defer r1.deinit(ctx.allocator);
        try testing.expectEqual(@as(usize, 4), r1.offset);
        try testing.expectEqualStrings("ello", r1.result.value.value);
        try testing.expect(sub.next() == null); // stream closed
    }
}

// Confirms behavior of the following grammar, which is ambiguous and should use OneOfAmbiguous
// instead of OneOf:
//
// ```ebnf
// Grammar = "ello" | "elloworld" ;
// ```
//
test "oneof_ambiguous_first" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, OneOfValue(LiteralValue)).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*const Parser(Payload, LiteralValue) = &.{
            &Literal(Payload).init("ello").parser,
            &Literal(Payload).init("elloworld").parser,
        };
        var helloOrWorld = OneOf(Payload, LiteralValue).init(parsers);
        try helloOrWorld.parser.parse(&ctx);

        var sub = ctx.subscribe();
        var r1 = sub.next().?;
        defer r1.deinit(ctx.allocator);
        try testing.expectEqual(@as(usize, 4), r1.offset);
        try testing.expectEqualStrings("ello", r1.result.value.value);
        try testing.expect(sub.next() == null); // stream closed
    }
}
