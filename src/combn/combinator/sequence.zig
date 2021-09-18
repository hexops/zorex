const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;
const ResultStream = gllparser.ResultStream;

const Literal = @import("../parser/literal.zig").Literal;
const LiteralValue = @import("../parser/literal.zig").Value;
const MapTo = @import("mapto.zig").MapTo;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn Context(comptime Payload: type, comptime V: type) type {
    return []const *Parser(Payload, V);
}

/// Represents a sequence of parsed values. 
///
/// In the case of a non-ambiguous grammar, a `Sequence` combinator will yield:
///
/// ```
/// stream(value1, value2)
/// ```
///
/// In the case of an ambiguous grammar, it would yield a stream with only the first parse path.
/// Use SequenceAmbiguous if ambiguou parse paths are desirable.
pub fn Value(comptime V: type) type {
    return struct {
        results: *ResultStream(Result(V)),

        pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
            self.results.deinit();
            allocator.destroy(self.results);
        }
    };
}

pub const Ownership = enum {
    borrowed,
    owned,
    copy,
};

/// Matches the `input` parsers sequentially. The parsers must produce the same data type (use
/// MapTo, if needed.) If ambiguous parse paths are desirable, use SequenceAmbiguous.
///
/// The `input` parsers must remain alive for as long as the `Sequence` parser will be used.
pub fn Sequence(comptime Payload: type, comptime V: type) type {
    return struct {
        parser: Parser(Payload, Value(V)) = Parser(Payload, Value(V)).init(parse, nodeName, deinit, countReferencesTo),
        input: Context(Payload, V),
        ownership: Ownership,

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: Context(Payload, V), ownership: Ownership) !*Parser(Payload, Value(V)) {
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

        pub fn initStack(input: Context(Payload, V), ownership: Ownership) Self {
            if (ownership == Ownership.copy) unreachable;
            return Self{ .input = input };
        }

        pub fn deinit(parser: *Parser(Payload, Value(V)), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void)) void {
            const self = @fieldParentPtr(Self, "parser", parser);
            for (self.input) |child_parser| {
                child_parser.deinit(allocator, freed);
            }
            if (self.ownership == .owned) allocator.free(self.input);
        }

        pub fn countReferencesTo(parser: *const Parser(Payload, Value(V)), other: usize, freed: *std.AutoHashMap(usize, void)) usize {
            const self = @fieldParentPtr(Self, "parser", parser);
            if (@ptrToInt(parser) == other) return 1;
            var count: usize = 0;
            for (self.input) |in_parser| {
                count += in_parser.countReferencesTo(other, freed);
            }
            return count;
        }

        pub fn nodeName(parser: *const Parser(Payload, Value(V)), node_name_cache: *std.AutoHashMap(usize, NodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Sequence");
            for (self.input) |in_parser| {
                v +%= try in_parser.nodeName(node_name_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value(V)), in_ctx: *const ParserContext(Payload, Value(V))) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            // Invoke each child parser to produce each of our results. Each time we ask a child
            // parser to parse, it can produce a set of results (its result stream) which are
            // varying parse paths / interpretations, we take the first successful one.

            // Return early if we're not trying to parse anything (stream close signals to the
            // consumer there were no matches).
            if (self.input.len == 0) {
                return;
            }

            var buffer = try ctx.allocator.create(ResultStream(Result(V)));
            errdefer ctx.allocator.destroy(buffer);
            errdefer buffer.deinit();
            buffer.* = try ResultStream(Result(V)).init(ctx.allocator, ctx.key);

            var offset: usize = ctx.offset;
            for (self.input) |child_parser| {
                const child_node_name = try child_parser.nodeName(&in_ctx.memoizer.node_name_cache);
                var child_ctx = try in_ctx.initChild(V, child_node_name, offset);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try child_parser.parse(&child_ctx);

                var num_local_values: usize = 0;
                var sub = child_ctx.subscribe();
                while (sub.next()) |next| {
                    switch (next.result) {
                        .err => {
                            buffer.close();
                            buffer.deinit();
                            ctx.allocator.destroy(buffer);
                            try ctx.results.add(Result(Value(V)).initError(next.offset, next.result.err));
                            return;
                        },
                        else => {
                            // TODO(slimsag): need path committal functionality
                            if (num_local_values == 0) {
                                // TODO(slimsag): if no consumption, could get stuck forever!
                                offset = next.offset;
                                try buffer.add(next.toUnowned());
                            }
                            num_local_values += 1;
                        },
                    }
                }
            }
            buffer.close();
            try ctx.results.add(Result(Value(V)).init(offset, .{ .results = buffer }));
        }
    };
}

test "sequence" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try ParserContext(Payload, Value(LiteralValue)).init(allocator, "abc123abc456_123abc", {});
        defer ctx.deinit();

        var seq = try Sequence(Payload, LiteralValue).init(allocator, &.{
            (try Literal(Payload).init(allocator, "abc")).ref(),
            (try Literal(Payload).init(allocator, "123ab")).ref(),
            (try Literal(Payload).init(allocator, "c45")).ref(),
            (try Literal(Payload).init(allocator, "6")).ref(),
        }, .borrowed);
        defer seq.deinit(allocator, null);
        try seq.parse(&ctx);

        var sub = ctx.subscribe();
        var sequence = sub.next().?.result.value;
        try testing.expect(sub.next() == null); // stream closed

        var sequenceSub = sequence.results.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        try testing.expectEqual(@as(usize, 3), sequenceSub.next().?.offset);
        try testing.expectEqual(@as(usize, 8), sequenceSub.next().?.offset);
        try testing.expectEqual(@as(usize, 11), sequenceSub.next().?.offset);
        try testing.expectEqual(@as(usize, 12), sequenceSub.next().?.offset);
        try testing.expect(sequenceSub.next() == null); // stream closed
    }
}
