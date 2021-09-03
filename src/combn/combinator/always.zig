usingnamespace @import("../engine/engine.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const AlwaysVoid = struct {
    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        _ = self;
        _ = allocator;
    }
};

/// If the result is not `null`, its `.offset` value will be updated to reflect the current parse
/// position before Always returns it.
pub fn AlwaysContext(comptime Value: type) type {
    return ?Result(Value);
}

/// Always yields the input value (once/unambiguously), or no value (if the input value is null).
///
/// The `input` value is taken ownership of by the parser, and deinitialized once the parser is.
pub fn Always(comptime Payload: type, comptime Value: type) type {
    return struct {
        parser: Parser(Payload, Value) = Parser(Payload, Value).init(parse, nodeName, deinit, null),
        input: AlwaysContext(Value),

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, input: AlwaysContext(Value)) !*Parser(Payload, Value) {
            const self = Self{ .input = input };
            return try self.parser.heapAlloc(allocator, self);
        }

        pub fn deinit(parser: *Parser(Payload, Value), allocator: *mem.Allocator, freed: ?*std.AutoHashMap(usize, void)) void {
            _ = freed;
            const self = @fieldParentPtr(Self, "parser", parser);
            if (self.input) |input| input.deinit(allocator);
        }

        pub fn nodeName(parser: *const Parser(Payload, Value), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            _ = node_name_cache;
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Always");
            v +%= std.hash_map.getAutoHashFn(?Result(Value), void)({}, self.input);
            return v;
        }

        pub fn parse(parser: *const Parser(Payload, Value), in_ctx: *const Context(Payload, Value)) callconv(.Async) Error!void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            if (self.input) |input| {
                var tmp = input.toUnowned();
                tmp.offset = ctx.offset;
                try ctx.results.add(tmp);
            }
        }
    };
}

test "always" {
    nosuspend {
        const allocator = testing.allocator;

        const Payload = void;
        const ctx = try Context(Payload, AlwaysVoid).init(allocator, "hello world", {});
        defer ctx.deinit();

        const noop = try Always(Payload, AlwaysVoid).init(allocator, null);
        defer noop.deinit(allocator, null);

        try noop.parse(&ctx);

        var sub = ctx.subscribe();
        try testing.expect(sub.next() == null);
    }
}
