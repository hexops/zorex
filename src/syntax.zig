const std = @import("std");
const Allocator = std.mem.Allocator;
const comb = @import("combinator.zig");

const RegexNode = union {
    escapedLiteral: []const u8,
    literal: []const u8,

    pub fn deinit(self: RegexNode, allocator: *Allocator) void {
        switch (self) {
            .literal => allocator.free(self.literal),
        }
    } 
};

/// returns a parser for parsing regex syntax.
pub fn regex(comptime Reader: type) comb.Parser(RegexNode, Reader) {
    return struct {
        pub const parser = comb.Parser(RegexNode, Reader){.parse = parse};

        /// parses regex syntax.
        ///
        /// Caller is responsible for calling deinit() on the result, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?RegexNode {
            return RegexNode{
                .literal = "",
            };
        }
    }.parser;
}

/// returns a parser for parsing escaped regex literals (e.g. `\*`).
pub fn escapedLiteral(comptime Reader: type) comb.Parser([]comb.Rune, Reader) {
    return comb.sequence(comb.Rune, Reader, .{
        comb.rune(comb.Rune.fromString("\\") catch unreachable, Reader),
        comb.anyRune(Reader),
    });
}

test "literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    std.debug.print("result: {any}\n", .{syntaxTree.?});
}

test "escapedLiteral" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("\\abcdef");

    var result = try escapedLiteral(@TypeOf(reader)).parse(allocator, &reader);
    defer allocator.free(result.?);
    const str = try comb.Rune.toString(allocator, result.?);
    defer allocator.free(str);
    std.testing.expectEqualStrings("\\a", str);
}