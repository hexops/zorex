const std = @import("std");
const Allocator = std.mem.Allocator;
const comb = @import("combinator.zig");

const NodeTag = enum {
    escapedLiteral,
    literal,
};

pub const Node = union(NodeTag) {
    /// An escaped metacharacter / literal, e.g. `\.\*`. Escape characters are included.
    escapedLiteral: []const u8,

    /// A literal, e.g. `foobar`
    literal: []const u8,

    pub fn deinit(self: Node, allocator: *Allocator) void {
        switch (self) {
            .escapedLiteral => allocator.free(self.escapedLiteral),
            .literal => allocator.free(self.literal),
        }
    } 
};

/// returns a parser for parsing regex syntax.
pub fn regex(comptime Reader: type) comb.Parser(Node, Reader) {
    return comb.oneOf(Node, Reader, .{
        escapedLiteral(Reader),
        unescapedLiteral(Reader),
    });
}

/// returns a parser for parsing one or more escaped regex literals (e.g. `\*`).
fn escapedLiteral(comptime Reader: type) comb.Parser(Node, Reader) {
    return struct {
        pub const parser = comb.Parser(Node, Reader){.parse = parse};

        /// parses an escaped literal node.
        ///
        /// Caller is responsible for calling deinit() on the result, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?Node {
            const inner = comb.repeated([]comb.Rune, Reader, 1, -1,
                comb.sequence(comb.Rune, Reader, .{
                    comb.rune(comb.Rune.fromString("\\") catch unreachable, Reader),
                    comb.anyRune(Reader),
                }),
            );

            const v = try inner.parse(allocator, src);
            if (v == null) {
                return null;
            }
            defer v.?.deinit();
            var strLen: usize = 0;
            for (v.?.items) | runes | {
                for (runes) | rune | {
                    strLen += rune.len;
                }
            }
            var str = try allocator.alloc(u8, strLen);
            var i: usize = 0;
            for (v.?.items) | runes | {
                for (runes) | rune | {
                    strLen += rune.len;
                    std.mem.copy(u8, str[i..i+rune.len], rune.buf[0..rune.len]);
                    i += rune.len;
                }
                allocator.free(runes);
            }
            return Node{.escapedLiteral = str};
        }
    }.parser;
}

/// returns a parser for parsing one or more unescaped regex literals (e.g. `abc123`)
/// without parsing regex metacharacters (e.g. `*`).
fn unescapedLiteral(comptime Reader: type) comb.Parser(Node, Reader) {
    return struct {
        pub const parser = comb.Parser(Node, Reader){.parse = parse};

        /// parses an unescaped literal node.
        ///
        /// Caller is responsible for calling deinit() on the result, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?Node {
            const inner = comb.repeated(comb.Rune, Reader, 1, -1,
                comb.nextIfNot(comb.Rune, Reader,
                    // any rune
                    comb.anyRune(Reader),
                    // not preceded by these:
                    comb.oneOf(comb.Rune, Reader, .{
                        comb.rune(comb.Rune.fromString("\\") catch unreachable, Reader),
                    }),
                ),
            );

            const v = try inner.parse(allocator, src);
            if (v == null) {
                return null;
            }
            defer v.?.deinit();
            var strLen: usize = 0;
            for (v.?.items) | rune | {
                strLen += rune.len;
            }
            var str = try allocator.alloc(u8, strLen);
            var i: usize = 0;
            for (v.?.items) | rune | {
                strLen += rune.len;
                std.mem.copy(u8, str[i..i+rune.len], rune.buf[0..rune.len]);
                i += rune.len;
            }
            return Node{.literal = str};
        }
    }.parser;
}

test "literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    defer syntaxTree.?.deinit(allocator);
    std.testing.expectEqualStrings("abcdef", syntaxTree.?.literal);
}

test "escapedLiteral" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("\\a\\bcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    defer syntaxTree.?.deinit(allocator);
    std.testing.expectEqualStrings("\\a\\b", syntaxTree.?.escapedLiteral);
}