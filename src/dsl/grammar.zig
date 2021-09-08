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
const Always = combn.Always;

const String = @import("String.zig");
const Node = @import("Node.zig");
const Compilation = @import("Compilation.zig");
const Identifier = @import("identifier.zig").Identifier;
const CompilerContext = @import("CompilerContext.zig");

const std = @import("std");
const mem = std.mem;
const testing = std.testing;

pub fn mapLiteralToNone(in: Result(LiteralValue), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(?Compilation) {
    _ = compiler_context;
    _ = _allocator;
    _ = path;
    _ = key;
    return switch (in.result) {
        .err => Result(?Compilation).initError(in.offset, in.result.err),
        else => Result(?Compilation).init(in.offset, null),
    };
}

pub fn whitespaceOneOrMore(allocator: *mem.Allocator) !*Parser(*CompilerContext, ?Compilation) {
    const newline = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try OneOf(*CompilerContext, LiteralValue).init(allocator, &.{
            (try Literal(*CompilerContext).init(allocator, "\r\n")).ref(),
            (try Literal(*CompilerContext).init(allocator, "\r")).ref(),
            (try Literal(*CompilerContext).init(allocator, "\n")).ref(),
        }, .copy)).ref(),
        .mapTo = mapLiteralToNone,
    });

    const space = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try OneOf(*CompilerContext, LiteralValue).init(allocator, &.{
            (try Literal(*CompilerContext).init(allocator, " ")).ref(),
            (try Literal(*CompilerContext).init(allocator, "\t")).ref(),
        }, .copy)).ref(),
        .mapTo = mapLiteralToNone,
    });

    const whitespace = try OneOf(*CompilerContext, ?Compilation).init(allocator, &.{
        newline.ref(),
        space.ref(),
    }, .copy);

    // Whitespace+
    return try MapTo(*CompilerContext, RepeatedValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Repeated(*CompilerContext, ?Compilation).init(allocator, .{
            .parser = whitespace.ref(),
            .min = 1,
            .max = -1,
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = _allocator;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        // optimization: newline and space parsers produce no compilations, so no
                        // need for us to pay any attention to repeated results.
                        return Result(?Compilation).init(in.offset, null);
                    },
                }
            }
        }.mapTo,
    });
}
