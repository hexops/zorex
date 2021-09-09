const combn = @import("../combn/combn.zig");
const Result = combn.Result;
const Parser = combn.Parser;
const Error = combn.Error;
const Context = combn.Context;
const ParserPosKey = combn.ParserPosKey;
const ParserPath = combn.ParserPath;
const Sequence = combn.Sequence;
const SequenceValue = combn.SequenceValue;
const Repeated = combn.Repeated;
const RepeatedValue = combn.RepeatedValue;
const Literal = combn.Literal;
const LiteralValue = combn.LiteralValue;
const OneOf = combn.OneOf;
const MapTo = combn.MapTo;
const Optional = combn.Optional;

const String = @import("String.zig");
const Node = @import("Node.zig");
const Compilation = @import("Compilation.zig");
const Identifier = @import("identifier.zig").Identifier;
const CompilerContext = @import("CompilerContext.zig");

const grammar = @import("grammar.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;
const assert = std.debug.assert;

pub const CompilerResult = struct {
    compilation: Result(Compilation),
    ctx: Context(*CompilerContext, Compilation),
    compilerContext: *CompilerContext,

    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        self.ctx.deinit();
        self.compilerContext.deinit(allocator);
    }
};

pub fn compile(allocator: *mem.Allocator, syntax: []const u8) !CompilerResult {
    const dsl_parser = try grammar.init(allocator);
    defer dsl_parser.deinit(allocator, null);

    var compilerContext = try CompilerContext.init(allocator);
    var ctx = try Context(*CompilerContext, Compilation).init(allocator, syntax, compilerContext);
    try dsl_parser.parse(&ctx);

    var sub = ctx.subscribe();
    var compilation = sub.next();
    assert(sub.next() == null); // our grammar is never ambiguous
    if (compilation == null) {
        return CompilerResult{
            .compilation = Result(Compilation).initError(ctx.offset, "failed to compile"),
            .compilerContext = compilerContext,
            .ctx = ctx,
        };
    }
    return CompilerResult{
        .compilation = compilation.?,
        .compilerContext = compilerContext,
        .ctx = ctx,
    };
}

test "DSL" {
    nosuspend {
        const allocator = testing.allocator;

        // Compile the regexp.
        var compilerResult = try compile(allocator, "//");
        defer compilerResult.deinit(allocator);
        switch (compilerResult.compilation.result) {
            .err => |e| @panic(e),
            .value => {},
        }
        var program = compilerResult.compilation.result.value;

        // Run the regexp.
        var input = "//";
        var ctx = try Context(void, *Node).init(allocator, input, {});
        defer ctx.deinit();

        try program.value.parser.ptr.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        try testing.expectEqualStrings("TODO(slimsag): value from parsing regexp!", first.result.value.name.value);
        try testing.expectEqual(@as(usize, 0), first.offset);
        try testing.expect(sub.next() == null);
    }
}
