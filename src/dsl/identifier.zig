usingnamespace @import("../combn/combn.zig");

const String = @import("String.zig");
const Compilation = @import("Compilation.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

/// Matches the identifier `input` string.
///
/// The `input` string must remain alive for as long as the `Identifier` parser will be used.
pub const Identifier = struct {
    parser: Parser(Compilation) = Parser(Compilation).init(parse, nodeName, null),

    const Self = @This();

    pub fn init() Self {
        return Self{};
    }

    pub fn nodeName(parser: *const Parser(Compilation), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
        const self = @fieldParentPtr(Self, "parser", parser);

        var v = std.hash_map.hashString("Identifier");
        return v;
    }

    pub fn parse(parser: *const Parser(Compilation), in_ctx: *const Context(void, Compilation)) callconv(.Async) !void {
        const self = @fieldParentPtr(Self, "parser", parser);
        var ctx = in_ctx.with({});
        defer ctx.results.close();

        const src = ctx.src[ctx.offset..];

        var offset: usize = 0;
        if (src.len == 0) {
            try ctx.results.add(Result(Compilation).initError(ctx.offset, "expected Identifier"));
            return;
        }
        {
            var isUpper = src[offset] >= 'A' and src[offset] <= 'Z';
            var isLower = src[offset] >= 'a' and src[offset] <= 'z';
            if (!isUpper and !isLower) {
                try ctx.results.add(Result(Compilation).initError(ctx.offset + 1, "Identifier must start with a-zA-Z"));
                return;
            }
        }
        while (offset < src.len) {
            var isDigit = src[offset] >= '0' and src[offset] <= '9';
            var isUpper = src[offset] >= 'A' and src[offset] <= 'Z';
            var isLower = src[offset] >= 'a' and src[offset] <= 'z';
            if (!isDigit and !isUpper and !isLower and src[offset] != '_') {
                break;
            }
            offset += 1;
        }
        try ctx.results.add(Result(Compilation).init(ctx.offset + offset, Compilation.initIdentifier(try String.init(ctx.allocator, src[0..offset]))));
    }
};

test "identifier" {
    nosuspend {
        const allocator = testing.allocator;

        var ctx = try Context(void, Compilation).init(allocator, "Grammar2", {});
        defer ctx.deinit();

        var l = Identifier.init();
        try l.parser.parse(&ctx);
        defer ctx.results.deinitAll(ctx.allocator);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(Compilation).initError(ctx.offset, "matches only the empty language"));
        var r1 = sub.next().?;
        testing.expectEqual(@as(usize, 8), r1.offset);
        testing.expectEqualStrings("Grammar2", r1.result.value.value.identifier.value.items);
        testing.expect(sub.next() == null);
    }
}
