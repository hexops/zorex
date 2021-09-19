const Collator = @import("ziglyph").Collator;
const Grapheme = @import("ziglyph").Grapheme;
const GraphemeIterator = Grapheme.GraphemeIterator;

const gllparser = @import("../gllparser/gllparser.zig");
const Error = gllparser.Error;
const Parser = gllparser.Parser;
const ParserContext = gllparser.Context;
const Result = gllparser.Result;
const NodeName = gllparser.NodeName;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Context = struct {
    // If present, only graphemes that sort after or equal to this one are matched.
    from: ?[]const u8,

    // If present, only graphemes that sort before or equal to this one are matched.
    to: ?[]const u8,
};

pub const Value = struct {
    value: []const u8,

    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        _ = self;
        _ = allocator;
    }
};

/// Matches any single grapheme cluster in the specified range according to the Unicode Collation
/// Algorithm.
pub fn GraphemeRange(comptime Payload: type) type {
    return struct {
        parser: Parser(Payload, Value) = Parser(Payload, Value).init(parse, nodeName, deinit, null),
        input: Context,
        collator: *Collator,

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: Context) !*Parser(Payload, Value) {
            const self = try Self.initStack(input, allocator);
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn initStack(input: Context, allocator: *mem.Allocator) !Self {
            // TODO(perf): allocation like this is not optimal, needed because parse takes `*const Parser`
            const collator = try allocator.create(Collator);
            collator.* = try Collator.init(allocator);
            return Self{
                .input = input,
                .collator = collator,
            };
        }

        pub fn nodeName(parser: *const Parser(Payload, Value), node_name_cache: *std.AutoHashMap(usize, NodeName)) Error!u64 {
            _ = node_name_cache;
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("ByteRange");
            if (self.input.from) |from| v +%= std.hash_map.hashString(from);
            if (self.input.to) |to| v +%= std.hash_map.hashString(to);
            return v;
        }

        pub fn deinit(parser: *Parser(Payload, Value), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void)) void {
            _ = freed;
            const self = @fieldParentPtr(Self, "parser", parser);
            self.collator.deinit();
            allocator.destroy(self.collator);
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const ParserContext(Payload, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            const src = ctx.src[ctx.offset..];
            // TODO(perf): we only need one grapheme, but Ziglyph doesn't expose a way to do this
            // without an iterator. adding this would reduce overhead.
            var iter = GraphemeIterator.init(ctx.allocator, src) catch {
                try ctx.results.add(Result(Value).initError(ctx.offset, "failed to create grapheme iterator"));
                return;
            };
            defer iter.deinit();

            var grapheme = iter.next();
            const offset = ctx.offset + grapheme.?.bytes.len;
            if (grapheme == null) {
                // TODO(parser): include in error message the expected range (or "any grapheme" if full range)
                try ctx.results.add(Result(Value).initError(offset, "expected grapheme range"));
                return;
            }

            const grapheme_key = self.collator.sortKey(grapheme.?.bytes) catch {
                try ctx.results.add(Result(Value).initError(offset, "failed to create sort key"));
                return;
            };
            if (self.input.from) |from| {
                const from_key = self.collator.sortKey(from) catch {
                    try ctx.results.add(Result(Value).initError(offset, "failed to create sort key"));
                    return;
                };
                const order = Collator.keyLevelCmp(grapheme_key, from_key, .tertiary);
                if (order == .lt) {
                    // TODO(parser): include in error message the expected range (or "any grapheme" if full range)
                    try ctx.results.add(Result(Value).initError(offset, "expected grapheme range"));
                    return;
                }
            }

            if (self.input.to) |to| {
                const to_key = self.collator.sortKey(to) catch {
                    try ctx.results.add(Result(Value).initError(offset, "failed to create sort key"));
                    return;
                };
                const order = Collator.keyLevelCmp(grapheme_key, to_key, .tertiary);
                if (order == .gt) {
                    // TODO(parser): include in error message the expected range (or "any grapheme" if full range)
                    try ctx.results.add(Result(Value).initError(offset, "expected grapheme range"));
                    return;
                }
            }

            try ctx.results.add(Result(Value).init(offset, .{ .value = grapheme.?.bytes }));
            return;
        }
    };
}

test "grapheme_range" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        var ctx = try ParserContext(Payload, Value).init(allocator, "d", {});
        defer ctx.deinit();

        var any_grapheme = try GraphemeRange(Payload).init(allocator, .{ .from = "b", .to = "d" });
        defer any_grapheme.deinit(allocator, null);
        try any_grapheme.parse(&ctx);

        var sub = ctx.subscribe();
        try testing.expectEqualStrings("d", sub.next().?.result.value.value);
        try testing.expect(sub.next() == null);
    }
}
