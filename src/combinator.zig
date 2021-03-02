const std = @import("std");
const Allocator = std.mem.Allocator;

pub const Error = error {
    EndOfStream,
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
