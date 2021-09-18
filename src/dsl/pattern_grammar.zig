const combn = @import("../combn/combn.zig");
const Result = combn.gllparser.Result;
const Parser = combn.gllparser.Parser;
const Error = combn.gllparser.Error;
const Context = combn.gllparser.Context;
const PosKey = combn.gllparser.PosKey;
const ParserPath = combn.gllparser.ParserPath;
const MapTo = combn.combinator.MapTo;
const Repeated = combn.combinator.Repeated;
const RepeatedValue = combn.combinator.repeated.Value;
const ByteRange = combn.parser.ByteRange;
const ByteRangeValue = combn.parser.byte_range.Value;

const Compilation = @import("Compilation.zig");
const CompilerContext = @import("CompilerContext.zig");

const std = @import("std");
const mem = std.mem;

pub fn init(allocator: *mem.Allocator) !*Parser(*CompilerContext, ?Compilation) {
    // Pattern matching grammar
    //
    // ```ebnf
    // Pattern = TBD ;
    // ```
    //

    const any_byte = try ByteRange(*CompilerContext).init(allocator, .{.from = 0, .to = 255});
    const any_bytes = try Repeated(*CompilerContext, ByteRangeValue).init(allocator, .{
        .parser = any_byte.ref(),
        .min = 0,
        .max = 1, // TODO(slimsag): make this parse more byte literals
    });

    const literal_any_bytes = try MapTo(*CompilerContext,combn.combinator.repeated.Value(ByteRangeValue), ?Compilation).init(allocator, .{
        .parser = any_bytes.ref(),
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(ByteRangeValue)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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
    return literal_any_bytes;
}
