const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;
const ResultStream = gllparser.ResultStream;
const PosKey = gllparser.PosKey;
const ParserPath = gllparser.ParserPath;

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
/// In the case of a non-ambiguous grammar, a `SequenceAmbiguous` combinator will yield:
///
/// ```
/// Value{
///     node: value1,
///     next: ResultStream(Value{
///         node: value2,
///         next: ...,
///     })
/// }
/// ```
///
/// In the case of an ambiguous grammar, it would yield streams with potentially multiple values
/// (each representing one possible parse path / interpretation of the grammar):
///
/// ```
/// Value{
///     node: value1,
///     next: ResultStream(
///         Value{
///             node: value2variant1,
///             next: ...,
///         },
///         Value{
///             node: value2variant2,
///             next: ...,
///         },
///     )
/// }
/// ```
///
pub fn Value(comptime V: type) type {
    return struct {
        node: Result(V),
        next: *ResultStream(Result(@This())),

        pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
            self.next.deinit();
            self.node.deinit(allocator);
            allocator.destroy(self.next);
        }

        pub fn flatten(self: *const @This(), allocator: *mem.Allocator, subscriber: PosKey, path: ParserPath) Error!ResultStream(Result(V)) {
            var dst = try ResultStream(Result(V)).init(allocator, subscriber);
            try self.flatten_into(&dst, allocator, subscriber, path);
            dst.close(); // TODO(slimsag): why does deferring this not work?
            return dst;
        }

        pub fn flatten_into(self: *const @This(), dst: *ResultStream(Result(V)), allocator: *mem.Allocator, subscriber: PosKey, path: ParserPath) Error!void {
            try dst.add(self.node.toUnowned());

            var sub = self.next.subscribe(subscriber, path, Result(Value(V)).initError(0, "matches only the empty language"));
            nosuspend {
                while (sub.next()) |next_path| {
                    switch (next_path.result) {
                        .err => try dst.add(Result(V).initError(next_path.offset, next_path.result.err)),
                        else => try next_path.result.value.flatten_into(dst, allocator, subscriber, path),
                    }
                }
            }
        }
    };
}

pub const Ownership = enum {
    borrowed,
    owned,
    copy,
};

/// Matches the `input` parsers sequentially. The parsers must produce the same data type (use
/// MapTo, if needed.)
///
/// The `input` parsers must remain alive for as long as the `SequenceAmbiguous` parser will be used.
pub fn SequenceAmbiguous(comptime Payload: type, comptime V: type) type {
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
            return Self{ .input = input, .ownership = ownership };
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

            var v = std.hash_map.hashString("SequenceAmbiguous");
            for (self.input) |in_parser| {
                v +%= try in_parser.nodeName(node_name_cache);
            }
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value(V)), in_ctx: *const ParserContext(Payload, Value(V))) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            if (self.input.len == 0) {
                return;
            }

            // For a sequence of input parsers [A, B, C], each one may produce multiple different
            // possible parser paths (valid interpretations of the same input state) in the case of
            // an ambiguous grammar. For example, the sequence of parsers [A, B, C] where each
            // produces 2 possible parser paths (e.g. A1, A2) we need to emit:
            //
            // stream(
            //     (A1, stream(
            //         (B1, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //         (B2, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //     )),
            //     (A2, stream(
            //         (B1, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //         (B2, stream(
            //             (C1, None),
            //             (C2, None),
            //         )),
            //     )),
            // )
            //
            // This call to `SequenceAmbiguous.parse` is only responsible for emitting the top level
            // (A1, A2) and invoking SequenceAmbiguous(next) to produce the associated `stream()` for those
            // parse states.
            const child_node_name = try self.input[0].nodeName(&in_ctx.memoizer.node_name_cache);
            var child_ctx = try in_ctx.initChild(V, child_node_name, ctx.offset);
            defer child_ctx.deinitChild();
            if (!child_ctx.existing_results) try self.input[0].parse(&child_ctx);

            // For every top-level value (A1, A2 in our example above.)
            var sub = child_ctx.subscribe();
            while (sub.next()) |top_level| {
                switch (top_level.result) {
                    .err => {
                        try ctx.results.add(Result(Value(V)).initError(top_level.offset, top_level.result.err));
                        continue;
                    },
                    else => {
                        // We got a non-error top-level value (e.g. A1, A2).

                        // Now get the stream that continues down this path (i.e. the stream
                        // associated with A1, A2.)
                        var path_results = try ctx.allocator.create(ResultStream(Result(Value(V))));
                        path_results.* = try ResultStream(Result(Value(V))).init(ctx.allocator, ctx.key);
                        var path = SequenceAmbiguous(Payload, V).initStack(self.input[1..], .borrowed);
                        const path_node_name = try path.parser.nodeName(&in_ctx.memoizer.node_name_cache);
                        var path_ctx = try in_ctx.initChild(Value(V), path_node_name, top_level.offset);
                        defer path_ctx.deinitChild();
                        if (!path_ctx.existing_results) try path.parser.parse(&path_ctx);
                        var path_results_sub = path_ctx.subscribe();
                        while (path_results_sub.next()) |next| {
                            try path_results.add(next.toUnowned());
                        }
                        path_results.close();

                        // Emit our top-level value tuple (e.g. (A1, stream(...))
                        try ctx.results.add(Result(Value(V)).init(top_level.offset, .{
                            .node = top_level.toUnowned(),
                            .next = path_results,
                        }));
                    },
                }
            }
        }
    };
}

test "sequence" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try ParserContext(Payload, Value(LiteralValue)).init(allocator, "abc123abc456_123abc", {});
        defer ctx.deinit();

        var seq = try SequenceAmbiguous(Payload, LiteralValue).init(allocator, &.{
            (try Literal(Payload).init(allocator, "abc")).ref(),
            (try Literal(Payload).init(allocator, "123ab")).ref(),
            (try Literal(Payload).init(allocator, "c45")).ref(),
            (try Literal(Payload).init(allocator, "6")).ref(),
        }, .borrowed);
        defer seq.deinit(allocator, null);
        try seq.parse(&ctx);

        var sub = ctx.subscribe();
        var list = sub.next();
        try testing.expect(sub.next() == null); // stream closed

        // first element
        try testing.expectEqual(@as(usize, 3), list.?.offset);
        try testing.expectEqual(@as(usize, 3), list.?.result.value.node.offset);

        // flatten the nested multi-dimensional array, since our grammar above is not ambiguous
        // this is fine to do and makes testing far easier.
        var flattened = try list.?.result.value.flatten(allocator, ctx.key, ctx.path);
        defer flattened.deinit();
        var flat = flattened.subscribe(ctx.key, ctx.path, Result(LiteralValue).initError(ctx.offset, "matches only the empty language"));
        try testing.expectEqual(@as(usize, 3), flat.next().?.offset);
        try testing.expectEqual(@as(usize, 8), flat.next().?.offset);
        try testing.expectEqual(@as(usize, 11), flat.next().?.offset);
        try testing.expectEqual(@as(usize, 12), flat.next().?.offset);
        try testing.expect(flat.next() == null); // stream closed
    }
}
