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
pub fn escapedLiteral(comptime Reader: type) comb.Parser(u8, Reader) {
    return struct {
        pub const parser = comb.Parser(u8, Reader){.parse = parse};

        /// parses regex syntax.
        ///
        /// Caller is responsible for calling deinit() on the result, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?u8 {
            // Read the backslash "\" escape character.
            const want = '\\';
            const buf: [1]u8;
            const read = try src.reader().readAll(&buf);
            if (read < want.len or !std.mem.eql(u8, buf, want)) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                return null;
            }

            // Read the next (escaped) character.
            const read = try src.reader().readAll(&buf);
            if (read < want.len) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                return null;
            }
            return buf[0];
        }
    }.parser;
}


test "literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    std.debug.print("result: {any}\n", .{syntaxTree.?});
}
