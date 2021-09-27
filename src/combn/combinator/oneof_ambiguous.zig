const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;
const ResultStream = gllparser.ResultStream;

const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").Value;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn Context(comptime Payload: type, comptime Value: type) type {
    return []const *Parser(Payload, Value);
}

pub const Ownership = enum {
    borrowed,
    owned,
    copy,
};

/// Matches one of the given `input` parsers, supporting ambiguous and unambiguous grammars.
///
/// The `input` parsers must remain alive for as long as the `OneOfAmbiguous` parser will be used.
///
/// In the case of a non-ambiguous `OneOfAmbiguous` grammar of `Parser1 | Parser2`, the combinator will
/// yield:
///
/// ```
/// stream(Parser1Value)
/// ```
///
/// Or:
///
/// ```
/// stream(Parser2Value)
/// ```
///
/// In the case of an ambiguous grammar `Parser1 | Parser2` where either parser can produce three
/// different parse paths, it will yield:
///
/// ```
/// stream(
///     Parser1Value1,
///     Parser1Value2,
///     Parser1Value3,
///     Parser2Value1,
///     Parser2Value2,
///     Parser2Value3,
/// )
/// ```
///
pub fn OneOfAmbiguous(comptime Payload: type, comptime Value: type) type {
    return struct {
        parser: Parser(Payload, Value) = Parser(Payload, Value).init(parse, nodeName, deinit, countReferencesTo),
        input: Context(Payload, Value),
        ownership: Ownership,

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: Context(Payload, Value), ownership: Ownership) !*Parser(Payload, Value) {
            var self = Self{ .input = input, .ownership = ownership };
            if (ownership == .copy) {
                const Elem = std.meta.Elem(@TypeOf(input));
                var copy = try allocator.alloc(Elem, input.len);
                std.mem.copy(Elem, copy, input);
                self.input = copy;
                self.ownership = .owned;
            }
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: Context(Payload, Value), ownership: Ownership) Self {
            if (ownership == Ownership.copy) unreachable;
            return Self{ .input = input, .ownership = ownership };
        }

        pub fn deinit(parser: *Parser(Payload, Value), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void), recursive: bool) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            if (recursive) {
                for (self.input) |in_parser| in_parser.deinit(allocator, freed, true);
            }
            if (self.ownership == .owned) allocator.free(self.input);
        }

        pub fn countReferencesTo(parser: *const Parser(Payload, Value), other: usize, freed: *std.AutoHashMap(usize, void)) usize {
            const self = @fieldParentPtr(Self, "parser", parser);
            if (@ptrToInt(parser) == other) return 1;
            var count: usize = 0;
            for (self.input) |in_parser| {
                count += in_parser.countReferencesTo(other, freed);
            }
            return count;
        }

        pub fn nodeName(parser: *const Parser(Payload, Value), node_name_cache: *std.AutoHashMap(usize, NodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("OneOfAmbiguous");
            for (self.input) |in_parser| {
                v +%= try in_parser.nodeName(node_name_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const ParserContext(Payload, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            var buffer = try ResultStream(Result(Value)).init(ctx.allocator, ctx.key);
            defer buffer.deinit();
            for (self.input) |in_parser| {
                const child_node_name = try in_parser.nodeName(&in_ctx.memoizer.node_name_cache);
                var child_ctx = try in_ctx.initChild(Value, child_node_name, ctx.offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try in_parser.parse(&child_ctx);
                var sub = child_ctx.subscribe();
                while (sub.next()) |next| {
                    try buffer.add(next.toUnowned());
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
            try ctx.results.add(Result(Value).initError(ctx.offset, "expected OneOfAmbiguous"));
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
        const ctx = try ParserContext(Payload, LiteralValue).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*Parser(Payload, LiteralValue) = &.{
            (try Literal(Payload).init(allocator, "ello")).ref(),
            (try Literal(Payload).init(allocator, "world")).ref(),
        };
        var helloOrWorld = try OneOfAmbiguous(Payload, LiteralValue).init(allocator, parsers, .borrowed);
        defer helloOrWorld.deinit(allocator, null, true);
        try helloOrWorld.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        try testing.expectEqual(Result(LiteralValue).init(4, .{ .value = "ello" }).toUnowned(), first);
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
        const ctx = try ParserContext(Payload, LiteralValue).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*Parser(Payload, LiteralValue) = &.{ (try Literal(Payload).init(allocator, "ello")).ref(), (try Literal(Payload).init(allocator, "elloworld")).ref() };
        var helloOrWorld = try OneOfAmbiguous(Payload, LiteralValue).init(allocator, parsers, .borrowed);
        defer helloOrWorld.deinit(allocator, null, true);
        try helloOrWorld.parse(&ctx);

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
