usingnamespace @import("gll_parser.zig");
usingnamespace @import("parser_literal.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn OneOfContext(comptime Value: type) type {
    return []const *const Parser(Value);
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
/// different parse paths, it will yield:
///
/// ```
/// stream(
///     OneOfValue(Parser1Value1),
///     OneOfValue(Parser1Value2),
///     OneOfValue(Parser1Value3),
///     OneOfValue(Parser2Value1),
///     OneOfValue(Parser2Value2),
///     OneOfValue(Parser2Value3),
/// )
/// ```
///
pub fn OneOfValue(comptime Value: type) type {
    return Value;
}

/// Matches one of the given `input` parsers.
///
/// The `input` parsers must remain alive for as long as the `OneOf` parser will be used.
pub fn OneOf(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(OneOfValue(Value)) = Parser(OneOfValue(Value)).init(parse, hash),
        input: OneOfContext(Value),

        const Self = @This();

        pub fn init(input: OneOfContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn hash(parser: *const Parser(Value), hash_cache: *std.AutoHashMap(usize, u64)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("OneOf");
            for (self.input) |in_parser| {
                v +%= try in_parser.hash(hash_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(Value), in_ctx: *const Context(void, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            var buffer = try ResultStream(Result(OneOfValue(Value))).init(ctx.allocator, ctx.state_hash);
            defer buffer.deinit();
            for (self.input) |in_parser| {
                const child_hash = try in_parser.hash(&in_ctx.memoizer.hash_cache);
                var child_ctx = try ctx.with({}).initChild(Value, child_hash, ctx.offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try in_parser.parse(&child_ctx);
                var sub = child_ctx.results.subscribe(ctx.state_hash, ctx.path);
                while (sub.next()) |next| {
                    try buffer.add(next);
                }
            }
            buffer.close();

            var gotValues: usize = 0;
            var gotErrors: usize = 0;
            var sub = buffer.subscribe(ctx.state_hash, ctx.path);
            while (sub.next()) |next| {
                switch (next.result) {
                    .err => gotErrors += 1,
                    else => gotValues += 1,
                }
            }
            if (gotValues > 0) {
                // At least one parse path succeeded, so discard all error'd parse paths.
                var sub2 = buffer.subscribe(ctx.state_hash, ctx.path);
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
            try ctx.results.add(Result(OneOfValue(Value)).initError(ctx.offset, "expected OneOf"));
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

        const ctx = try Context(void, OneOfValue(void)).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*const Parser(void) = &.{
            &Literal.init("ello").parser,
            &Literal.init("world").parser,
        };
        var helloOrWorld = OneOf(void, void).init(parsers);
        try helloOrWorld.parser.parse(&ctx);
        var sub = ctx.results.subscribe(ctx.state_hash, ctx.path);
        testing.expectEqual(@as(?Result(OneOfValue(void)), Result(OneOfValue(void)).init(4, .{})), sub.next());
        testing.expect(sub.next() == null); // stream closed
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

        const ctx = try Context(void, OneOfValue(void)).init(allocator, "elloworld", {});
        defer ctx.deinit();

        const parsers: []*const Parser(void) = &.{
            &Literal.init("ello").parser,
            &Literal.init("elloworld").parser,
        };
        var helloOrWorld = OneOf(void, void).init(parsers);
        try helloOrWorld.parser.parse(&ctx);
        var sub = ctx.results.subscribe(ctx.state_hash, ctx.path);
        testing.expectEqual(@as(?Result(OneOfValue(void)), Result(OneOfValue(void)).init(4, .{})), sub.next());
        testing.expectEqual(@as(?Result(OneOfValue(void)), Result(OneOfValue(void)).init(9, .{})), sub.next());
        testing.expect(sub.next() == null); // stream closed
    }
}
