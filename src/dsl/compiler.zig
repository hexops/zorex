const combn = @import("../combn/combn.zig");
const Result = combn.engine.Result;
const Parser = combn.engine.Parser;
const Error = combn.engine.Error;
const Context = combn.engine.Context;
const ParserPosKey = combn.engine.ParserPosKey;
const ParserPath = combn.engine.ParserPath;
const Sequence = combn.engine.Sequence;
const SequenceValue = combn.combinator.sequence.Value;
const Repeated = combn.combinator.Repeated;
const RepeatedValue = combn.combinator.repeated.Value;
const Literal = combn.parser.Literal;
const LiteralValue = combn.parser.literal.Value;
const OneOf = combn.combinator.OneOf;
const MapTo = combn.combinator.MapTo;
const Optional = combn.combinator.Optional;

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
