usingnamespace @import("../engine/engine.zig");
const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").LiteralValue;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn RepeatedContext(comptime Payload: type, comptime Value: type) type {
    return struct {
        /// The parser which should be repeatedly parsed.
        parser: *Parser(Payload, Value),

        /// The minimum number of times the parser must successfully match.
        min: usize,

        /// The maximum number of times the parser can match, or -1 for unlimited.
        max: isize,
    };
}

/// Represents a single value in the stream of repeated values.
///
/// In the case of a non-ambiguous grammar, a `Repeated` combinator will yield:
///
/// ```
/// stream(value1, value2)
/// ```
///
/// In the case of an ambiguous grammar, it would yield a stream with only the first parse path.
/// Use RepeatedAmbiguous if ambiguou parse paths are desirable.
pub fn RepeatedValue(comptime Value: type) type {
    return struct {
        results: *ResultStream(Result(Value)),

        pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
            self.results.deinit();
            allocator.destroy(self.results);
        }
    };
}

/// Matches the `input` repeatedly, between `[min, max]` times (inclusive.) If ambiguous parse paths
/// are desirable, use RepeatedAmbiguous.
///
/// The `input` parsers must remain alive for as long as the `Repeated` parser will be used.
pub fn Repeated(comptime Payload: type, comptime Value: type) type {
    return struct {
        parser: Parser(Payload, RepeatedValue(Value)) = Parser(Payload, RepeatedValue(Value)).init(parse, nodeName, deinit, countReferencesTo),
        input: RepeatedContext(Payload, Value),

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: RepeatedContext(Payload, Value)) !*Parser(Payload, RepeatedValue(Value)) {
            const self = Self{ .input = input };
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: RepeatedContext(Payload, Value)) Self {
            return Self{ .input = input };
        }

        pub fn deinit(parser: *Parser(Payload, RepeatedValue(Value)), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void)) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            self.input.parser.deinit(allocator, freed);
        }

        pub fn countReferencesTo(parser: *const Parser(Payload, RepeatedValue(Value)), other: usize, freed: *std.AutoHashMap(usize, void)) usize {
            const self = @fieldParentPtr(Self, "parser", parser);
            if (@ptrToInt(parser) == other) return 1;
            return self.input.parser.countReferencesTo(other, freed);
        }

        pub fn nodeName(parser: *const Parser(Payload, RepeatedValue(Value)), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Repeated");
            v +%= try self.input.parser.nodeName(node_name_cache);
            v +%= std.hash_map.getAutoHashFn(usize, void)({}, self.input.min);
            v +%= std.hash_map.getAutoHashFn(isize, void)({}, self.input.max);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, RepeatedValue(Value)), in_ctx: *const Context(Payload, RepeatedValue(Value))) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            // Invoke the child parser repeatedly to produce each of our results. Each time we ask
            // the child parser to parse, it can produce a set of results (its result stream) which
            // are varying parse paths / interpretations, we take the first successful one.

            // Return early if we're not trying to parse anything (stream close signals to the
            // consumer there were no matches).
            if (ctx.input.max == 0) {
                return;
            }

            var buffer = try ctx.allocator.create(ResultStream(Result(Value)));
            errdefer ctx.allocator.destroy(buffer);
            errdefer buffer.deinit();
            buffer.* = try ResultStream(Result(Value)).init(ctx.allocator, ctx.key);

            var num_values: usize = 0;
            var offset: usize = ctx.offset;
            while (true) {
                const child_node_name = try self.input.parser.nodeName(&in_ctx.memoizer.node_name_cache);
                var child_ctx = try in_ctx.initChild(Value, child_node_name, offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try self.input.parser.parse(&child_ctx);

                var num_local_values: usize = 0;
                var sub = child_ctx.subscribe();
                while (sub.next()) |next| {
                    switch (next.result) {
                        .err => {
                            offset = next.offset;
                            if (num_values < ctx.input.min) {
                                buffer.close();
                                buffer.deinit();
                                ctx.allocator.destroy(buffer);
                                try ctx.results.add(Result(RepeatedValue(Value)).initError(next.offset, next.result.err));
                                return;
                            }
                            buffer.close();
                            try ctx.results.add(Result(RepeatedValue(Value)).init(offset, .{ .results = buffer }));
                            return;
                        },
                        else => {
                            // TODO(slimsag): need path committal functionality
                            if (num_local_values == 0) {
                                offset = next.offset;
                                // TODO(slimsag): if no consumption, could get stuck forever!
                                try buffer.add(next.toUnowned());
                            }
                            num_local_values += 1;
                        },
                    }
                }

                num_values += 1;
                if (num_values >= ctx.input.max and ctx.input.max != -1) break;
            }
            buffer.close();
            try ctx.results.add(Result(RepeatedValue(Value)).init(offset, .{ .results = buffer }));
        }
    };
}

test "repeated" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, RepeatedValue(LiteralValue)).init(allocator, "abcabcabc123abc", {});
        defer ctx.deinit();

        var abcInfinity = try Repeated(Payload, LiteralValue).init(allocator, .{
            .parser = (try Literal(Payload).init(allocator, "abc")).ref(),
            .min = 0,
            .max = -1,
        });
        defer abcInfinity.deinit(allocator, null);
        try abcInfinity.parse(&ctx);

        var sub = ctx.subscribe();
        var repeated = sub.next().?.result.value;
        try testing.expect(sub.next() == null); // stream closed

        var repeatedSub = repeated.results.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        try testing.expectEqual(@as(usize, 3), repeatedSub.next().?.offset);
        try testing.expectEqual(@as(usize, 6), repeatedSub.next().?.offset);
        try testing.expectEqual(@as(usize, 9), repeatedSub.next().?.offset);
        try testing.expect(repeatedSub.next() == null); // stream closed
    }
}
