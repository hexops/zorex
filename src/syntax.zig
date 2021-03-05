const std = @import("std");
const Allocator = std.mem.Allocator;
const comb = @import("combinator.zig");

const NodeDataTag = enum {
    escapedLiteral,
    literal,
};

pub const NodeData = union(NodeDataTag) {
    /// An escaped metacharacter / literal, e.g. `\.\*`. Escape characters are included.
    escapedLiteral: []const u8,

    /// A literal, e.g. `foobar`
    literal: []const u8,

    pub fn deinit(self: NodeData, allocator: *Allocator) void {
        switch (self) {
            .escapedLiteral => allocator.free(self.escapedLiteral), 
            .literal => allocator.free(self.literal),
        }
    }

    pub fn writeTo(self: NodeData, writer: anytype) !void {
        switch (self) {
            .escapedLiteral => try std.fmt.format(writer, "{s}", .{self.escapedLiteral}),
            .literal => try std.fmt.format(writer, "{s}", .{self.literal}),
        }
    }
};

/// A repetition operator, e.g. `*`, `+`, `?`
pub const RepetitionOperator = struct {
    /// Minimum number of times to expect sequence.
    min: usize,

    /// Maximum number of times to expect sequence, or -1 for unlimited.
    max: isize,

    pub fn writeTo(self: RepetitionOperator, writer: anytype) !void {
        if (self.min == 0 and self.max == -1) {
            // zero or more, prefer more.
            return try std.fmt.format(writer, "*", .{});
        } else if (self.min == 1 and self.max == -1) {
            // one or more, prefer more.
            return try std.fmt.format(writer, "+", .{});
        } else if (self.min == 0 and self.max == 1) {
            // zero or one, prefer one.
            return try std.fmt.format(writer, "?", .{});
        } else if (self.min == self.max) {
            // exactly N
            return try std.fmt.format(writer, "{{d}}", .{self.min});
        } else if (self.max == -1) {
            // N or more, prefer more.
            return try std.fmt.format(writer, "{{d},}", .{self.min});
        }
        // [min, max] number of matches, prefer more.
        return try std.fmt.format(writer, "{{d},{d}}", .{self.min, self.max});
        // TODO(slimsag): future: support non-greedy variants
        // x*?, x+?, x??, x{n,m}?, x{n,}?, x{n}?
    }
};

pub const Node = struct {
    data: NodeData,
    children: std.ArrayList(*Node),
    repetition: ?RepetitionOperator,

    pub fn init(allocator: *Allocator, data: NodeData) !*Node {
        const n = try allocator.create(Node);
        n.* = Node{
            .data = data,
            .children = std.ArrayList(*Node).init(allocator),
            .repetition = null,
        };
        return n;
    }

    pub fn deinit(self: *Node, allocator: *Allocator) void {
        self.data.deinit(allocator);
        for (self.children.items) |child| {
            child.deinit(allocator);
        }
        self.children.deinit();
        allocator.destroy(self);
    }

    pub fn writeTo(self: *Node, writer: anytype) !void {
        try self.data.writeTo(writer);
    }
};

/// returns a parser for parsing regex syntax.
pub fn regex(comptime Reader: type) comb.Parser(*Node, Reader) {
    return comb.oneOf(*Node, Reader, .{
        escapedLiteral(Reader),
        unescapedLiteral(Reader),
    });
}

fn repetitionOperator(comptime Reader: type) comb.Parser(RepetitionOperator, Reader) {
    return comb.oneOf(RepetitionOperator, Reader, .{
        repetitionOperatorSimple(Reader, "*", .{.min = 0, .max = -1}),
        repetitionOperatorSimple(Reader, "+", .{.min = 1, .max = -1}),
        repetitionOperatorSimple(Reader, "?", .{.min = 0, .max = 1}),
        // TODO(slimsag): handle x{n}, x{n,m}, x{n,}
    });
}

fn repetitionOperatorSimple(comptime Reader: type, rune: []const u8, value: RepetitionOperator) comb.Parser(RepetitionOperator, Reader) {
    const v = struct {
        pub const parser = comb.Parser(RepetitionOperator, Reader){ .parse = parse };
        pub const target: comb.Rune;
        pub const mapTo: RepetitionOperator;

        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?RepetitionOperator {
            const v = try target.parse(allocator, src);
            if (v == null) {
                return null;
            }
            return mapTo;
        }
    };
    v.target = comb.rune(comb.Rune.fromString(rune) catch unreachable, Reader);
    v.mapTo = value;
    return v.parser;
}

/// returns a parser for parsing one or more escaped regex literals (e.g. `\*`),
/// followed by an optional repetition operator.
fn escapedLiteral(comptime Reader: type) comb.Parser(*Node, Reader) {
    return struct {
        pub const parser = comb.Parser(*Node, Reader){ .parse = parse };

        /// parses an escaped literal node.
        ///
        /// Caller is responsible for calling deinit() on the result, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?*Node {
            const inner = comb.repeated(
                []comb.Rune,
                Reader,
                1,
                -1,
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
            for (v.?.items) |runes| {
                for (runes) |rune| {
                    strLen += rune.len;
                }
            }
            var str = try allocator.alloc(u8, strLen);
            var i: usize = 0;
            for (v.?.items) |runes| {
                for (runes) |rune| {
                    std.mem.copy(u8, str[i .. i + rune.len], rune.buf[0..rune.len]);
                    i += rune.len;
                }
                allocator.free(runes);
            }
            return Node.init(allocator, .{ .escapedLiteral = str });
        }
    }.parser;
}

/// returns a parser for parsing one or more unescaped regex literals (e.g. `abc123`)
/// without parsing regex metacharacters (e.g. `*`), followed by an optional repetition
/// operator.
fn unescapedLiteral(comptime Reader: type) comb.Parser(*Node, Reader) {
    return struct {
        pub const parser = comb.Parser(*Node, Reader){ .parse = parse };

        /// parses an unescaped literal node.
        ///
        /// Caller is responsible for calling deinit() on the result, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) comb.Error!?*Node {
            const inner = comb.repeated(
                comb.Rune,
                Reader,
                1,
                -1,
                comb.nextIfNot(
                    comb.Rune,
                    Reader,
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
            for (v.?.items) |rune| {
                strLen += rune.len;
            }
            var str = try allocator.alloc(u8, strLen);
            var i: usize = 0;
            for (v.?.items) |rune| {
                std.mem.copy(u8, str[i .. i + rune.len], rune.buf[0..rune.len]);
                i += rune.len;
            }
            return Node.init(allocator, .{ .literal = str });
        }
    }.parser;
}

test "literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    defer syntaxTree.?.deinit(allocator);

    var buf = std.ArrayList(u8).init(allocator);
    defer buf.deinit();
    try syntaxTree.?.writeTo(buf.writer());
    std.testing.expectEqualStrings("abcdef", buf.items);
}

test "escapedLiteral" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("\\a\\bcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    defer syntaxTree.?.deinit(allocator);

    var buf = std.ArrayList(u8).init(allocator);
    defer buf.deinit();
    try syntaxTree.?.writeTo(buf.writer());
    std.testing.expectEqualStrings("\\a\\b", buf.items);
}
