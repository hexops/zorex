const std = @import("std");
const Allocator = std.mem.Allocator;

pub const Error = error {
    EndOfStream,
    Utf8InvalidStartByte,
} || std.fs.File.ReadError || std.fs.File.SeekError || std.mem.Allocator.Error;

pub fn Parser(comptime Value: type, comptime Reader: type) type {
    return struct {
        parse: fn(allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?Value,
    };
}

/// returns a parser for matching the literal string `s`.
///
/// `s` must remain alive for as long as `parse` may be called.
pub fn literal(s: []const u8, comptime Reader: type) Parser([]u8, Reader) {
    const v = struct {
        pub var want: []const u8 = undefined;
        pub const parser = Parser([]u8, Reader){.parse = parse};

        /// parses a literal.
        ///
        /// Caller is responsible for freeing the returned string, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?[]u8 {
            const buf = try allocator.alloc(u8, want.len);
            const read = try src.reader().readAll(buf);
            if (read < want.len or !std.mem.eql(u8, buf, want)) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                allocator.free(buf);
                return null;
            }
            return buf;
        }
    };
    v.want = s;
    return v.parser;
}

// Describes a single UTF-8 codepoint as a sequence of bytes.
pub const Rune = struct {
    buf: [4]u8,
    len: u3,

    pub fn fromString(s: []const u8) !Rune {
        const len = try std.unicode.utf8ByteSequenceLength(s[0]);
        var r: Rune = undefined;
        std.mem.copy(u8, &r.buf, s[0..len]);
        r.len = len;
        return r;
    }

    // toString turns the given runes into a string of bytes.
    //
    // The caller is responsible for freeing the returned string.
    pub fn toString(allocator: *Allocator, runes: []const Rune) ![]u8 {
        var len: usize = 0;
        for (runes) | r | {
            len += r.len;
        }
        const str = try allocator.alloc(u8, len);
        var i: usize = 0;
        for (runes) | r | {
            std.mem.copy(u8, str[i..i+r.len], r.buf[0..r.len]);
            i += r.len;
        }
        return str;
    }
};

/// returns a parser for matching the literal UTF-8 codepoint `r`.
pub fn rune(r: Rune, comptime Reader: type) Parser(Rune, Reader) {
    const v = struct {
        pub var want: Rune = undefined;
        pub const parser = Parser(Rune, Reader){.parse = parse};

        /// parses a rune.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?Rune {
            // Read the rune.
            var got: Rune = undefined;
            const read = try src.reader().readAll(got.buf[0..want.len]);
            if (read < want.len or !std.mem.eql(u8, got.buf[0..read], want.buf[0..want.len])) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                return null;
            }

            // Is the rune we got a different length?
            got.len = try std.unicode.utf8ByteSequenceLength(got.buf[0]);
            if (got.len != want.len) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                return null;
            }
            return got;
        }
    };
    v.want = r;
    return v.parser;
}

/// returns a parser for matching any single UTF-8 rune.
pub fn anyRune(comptime Reader: type) Parser(Rune, Reader) {
    return struct {
        pub const parser = Parser(Rune, Reader){.parse = parse};

        /// parses any rune.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?Rune {
            // Read the first byte.
            var r: Rune = undefined;
            r.len = 1;
            var read = try src.reader().readAll(r.buf[0..1]);
            if (read != r.len) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                return null;
            }

            // Is the byte describing a multi-byte UTF-8 rune?
            r.len = try std.unicode.utf8ByteSequenceLength(r.buf[0]);
            if (r.len != 1) {
                // Read the multi-byte rune.
                try src.seekableStream().seekBy(-@intCast(i64, read));
                read = try src.reader().readAll(r.buf[0..r.len]);
                if (read != r.len) {
                    try src.seekableStream().seekBy(-@intCast(i64, read));
                    return null;
                }
            }
            return r;
        }
    }.parser;
}

/// returns a parser for matching a sequence of parsers.
///
/// `parsers` must live for as long as `parse` is to be called.
pub fn sequence(
    comptime Value: type,
    comptime Reader: type,
    parsers: anytype,
) Parser([]Value, Reader) {
    const v = struct {
        pub var seq: @TypeOf(parsers) = undefined;
        pub const parser = Parser([]Value, Reader){.parse = parse};

        /// parses a sequence.
        ///
        /// Caller is responsible for freeing the returned slice, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?[]Value {
            const startPos = try src.seekableStream().getPos();

            const values = try allocator.alloc(Value, seq.len);
            errdefer allocator.free(values);

            comptime var i: usize = 0;
            inline while (i < seq.len) : (i += 1) {
                const p = seq[i];
                const v = try p.parse(allocator, src);
                if (v == null) {
                    try src.seekableStream().seekTo(startPos);
                    allocator.free(values);
                    return null;
                }
                values[i] = v.?;
            }
            return values;
        }
    };
    v.seq = parsers;
    return v.parser;
}

/// returns a parser for matching the given parser `min` to `max` times.
///
/// If `max` is -1, no limit is placed.
pub fn repeated(
    comptime Value: type,
    comptime Reader: type,
    min: usize,
    max: isize,
    p: Parser(Value, Reader),
) Parser(std.ArrayList(Value), Reader) {
    const v = struct {
        pub var minValues: usize = undefined;
        pub var maxValues: usize = undefined;
        pub var sub: Parser(Value, Reader) = undefined;
        pub const parser = Parser(std.ArrayList(Value), Reader){.parse = parse};

        /// Parses N or more values using the underlying parser.
        ///
        /// Caller is responsible for freeing the returned array list, if any.
        fn parse(allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?std.ArrayList(Value) {
            const startPos = try src.seekableStream().getPos();

            var values = try std.ArrayList(Value).initCapacity(allocator, minValues);
            errdefer values.deinit();

            var i: usize = 0;
            while (i < maxValues) : (i += 1) {
                const v = try sub.parse(allocator, src);
                if (v == null) {
                    break;
                }
                try values.append(v.?);
            }
            if (values.items.len < minValues) {
                try src.seekableStream().seekTo(startPos);
                values.deinit();
                return null;
            }
            return values;
        }
    };
    v.minValues = min;
    if (max == -1) {
        v.maxValues = 1 << 63;
    } else {
        v.maxValues = @intCast(usize, max);
    }
    v.sub = p;
    return v.parser;
}

test "literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const want = "abc";
    const result = try literal(want, @TypeOf(reader)).parse(allocator, &reader);
    std.testing.expectEqualStrings(want, result.?);
    if (result) |r| {
        allocator.free(r);
    }
}

test "rune" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const want = try Rune.fromString("a");
    const result = try rune(want, @TypeOf(reader)).parse(allocator, &reader);
    std.testing.expectEqualStrings(want.buf[0..want.len], result.?.buf[0..result.?.len]);
}

test "anyRune" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    var result = try anyRune(@TypeOf(reader)).parse(allocator, &reader);
    std.testing.expectEqualStrings("a", result.?.buf[0..result.?.len]);
    result = try anyRune(@TypeOf(reader)).parse(allocator, &reader);
    std.testing.expectEqualStrings("b", result.?.buf[0..result.?.len]);
}

test "sequence" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");

    var result = try sequence(Rune, @TypeOf(reader), .{
        rune(try Rune.fromString("a"), @TypeOf(reader)),
        anyRune(@TypeOf(reader)),
    }).parse(allocator, &reader);
    defer allocator.free(result.?);
    const str = try Rune.toString(allocator, result.?);
    defer allocator.free(str);
    std.testing.expectEqualStrings("ab", str);
}

test "repeated_zero_or_more" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("aaabcdef");

    const sub = rune(try Rune.fromString("aaa"), @TypeOf(reader));
    var result = try repeated(Rune, @TypeOf(reader), 0, -1, sub).parse(allocator, &reader);
    defer result.?.deinit();
    const str = try Rune.toString(allocator, result.?.items);
    defer allocator.free(str);
    std.testing.expectEqualStrings("aaa", str);
}

test "repeated_four_or_more" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("aaabcdef");

    const sub = rune(try Rune.fromString("aaa"), @TypeOf(reader));
    var result = try repeated(Rune, @TypeOf(reader), 4, -1, sub).parse(allocator, &reader);
    std.testing.expect(result == null);
}

test "repeated_one_to_three" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("aaaabcdef");

    const sub = rune(try Rune.fromString("aaaa"), @TypeOf(reader));
    var result = try repeated(Rune, @TypeOf(reader), 1, 3, sub).parse(allocator, &reader);
    defer result.?.deinit();
    const str = try Rune.toString(allocator, result.?.items);
    defer allocator.free(str);
    std.testing.expectEqualStrings("aaa", str);
}
