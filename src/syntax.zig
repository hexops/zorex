const std = @import("std");
const Allocator = std.mem.Allocator;
const Parser = @import("parser.zig").Parser;
const OneOf = @import("parser.zig").OneOf;
const Error = @import("parser.zig").Error;

pub fn Literal(comptime Reader: type) type {
    return struct {
        parser: Parser([]u8, Reader) = .{
            ._parse = parse,
        },
        want: []const u8,

        const Self = @This();

        pub fn init(want: []const u8) Self {
            return Self{
                .want = want
            };
        }

        fn parse(parser: *Parser([]u8, Reader), allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?[]u8 {
            const self = @fieldParentPtr(Self, "parser", parser);
            const buf = try allocator.alloc(u8, self.want.len);
            const read = try src.reader().readAll(buf);
            if (read < self.want.len or !std.mem.eql(u8, buf, self.want)) {
                try src.seekableStream().seekBy(-@intCast(i64, read));
                allocator.free(buf);
                return null;
            }
            return buf;
        }
    };
}

test "literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    var want: []const u8 = "abc";
    var literal = Literal(@TypeOf(reader)).init(want);
    const p = &literal.parser;
    var result = try p.parse(allocator, &reader);
    std.testing.expectEqualStrings(want, result.?);
    if (result) |r| {
        allocator.free(r);
    }
}

test "oneof_literal" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("catdogsheep");

    // Define our parser.
    var one_of = OneOf([]u8, @TypeOf(reader)).init(&.{
        &Literal(@TypeOf(reader)).init("dog").parser,
        &Literal(@TypeOf(reader)).init("sheep").parser,
        &Literal(@TypeOf(reader)).init("cat").parser,
    });
    var p = &one_of.parser;

    // Parse!
    var result = try p.parse(allocator, &reader);
    std.testing.expectEqualStrings("cat", result.?);
    if (result) |r| {
        allocator.free(r);
    }
}

// comptime parsing will be possible once there is a comptime allocator:
// https://github.com/ziglang/zig/issues/1291
// test "literal_comptime" {
//     comptime {
//         var buffer: [10*1024*1024]u8 = undefined;
//         var fixed = std.heap.FixedBufferAllocator.init(buffer[0..]);
//         var allocator = &fixed.allocator;
//         var reader = std.io.fixedBufferStream("abcdef");
//         var want: []const u8 = "abc";
//         var literal = Literal(@TypeOf(reader)).init(want);
//         const p = &literal.parser;
//         var result = try p.parse(allocator, &reader);
//         std.testing.expectEqualStrings(want, result.?);
//         if (result) |r| {
//             allocator.free(r);
//         }
//     }
// }