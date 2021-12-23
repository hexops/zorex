const combn = @import("../combn/combn.zig");
const Result = combn.gllparser.Result;
const Parser = combn.gllparser.Parser;
const Error = combn.gllparser.Error;
const Context = combn.gllparser.Context;
const PosKey = combn.gllparser.PosKey;
const ParserPath = combn.gllparser.ParserPath;
const NodeName = combn.gllparser.NodeName;

const String = @import("String.zig");
const Compilation = @import("Compilation.zig");
const CompilerContext = @import("CompilerContext.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

/// Matches the identifier `input` string.
///
/// The `input` string must remain alive for as long as the `Identifier` parser will be used.
pub const Identifier = struct {
    parser: Parser(*CompilerContext, ?Compilation) = Parser(*CompilerContext, ?Compilation).init(parse, nodeName, null, null),

    const Self = @This();

    pub fn init(allocator: mem.Allocator) !*Parser(*CompilerContext, ?Compilation) {
        const self = Self{};
        return try self.parser.heapAlloc(allocator, self);
    }

    pub fn initStack() Self {
        return Self{};
    }

    pub fn nodeName(parser: *const Parser(*CompilerContext, ?Compilation), node_name_cache: *std.AutoHashMap(usize, NodeName)) Error!u64 {
        _ = parser;
        _ = node_name_cache;
        var v = std.hash_map.hashString("Identifier");
        return v;
    }

    pub fn parse(parser: *const Parser(*CompilerContext, ?Compilation), in_ctx: *const Context(*CompilerContext, ?Compilation)) callconv(.Async) !void {
        _ = parser;
        var ctx = in_ctx.with({});
        defer ctx.results.close();

        const src = ctx.src[ctx.offset..];

        var offset: usize = 0;
        if (src.len == 0) {
            try ctx.results.add(Result(?Compilation).initError(ctx.offset, "expected Identifier"));
            return;
        }
        {
            var isUpper = src[offset] >= 'A' and src[offset] <= 'Z';
            var isLower = src[offset] >= 'a' and src[offset] <= 'z';
            if (!isUpper and !isLower) {
                try ctx.results.add(Result(?Compilation).initError(ctx.offset + 1, "Identifier must start with a-zA-Z"));
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
        try ctx.results.add(Result(?Compilation).init(ctx.offset + offset, Compilation.initIdentifier(String.init(src[0..offset]))));
    }
};

test "identifier" {
    nosuspend {
        const allocator = testing.allocator;

        var compilerContext = try CompilerContext.init(allocator);
        defer compilerContext.deinit(allocator);
        var ctx = try Context(*CompilerContext, ?Compilation).init(allocator, "Grammar2", compilerContext);
        defer ctx.deinit();

        var l = try Identifier.init(allocator);
        defer l.deinit(allocator, null);
        try l.parse(&ctx);

        var sub = ctx.subscribe();
        var r1 = sub.next().?;
        try testing.expectEqual(@as(usize, 8), r1.offset);
        try testing.expectEqualStrings("Grammar2", r1.result.value.?.value.identifier.value);
        try testing.expect(sub.next() == null);
    }
}
