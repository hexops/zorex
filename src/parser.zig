const std = @import("std");
const Allocator = std.mem.Allocator;

pub const Error = error{
    EndOfStream,
    Utf8InvalidStartByte,
} || std.fs.File.ReadError || std.fs.File.SeekError || std.mem.Allocator.Error;

pub fn Parser(comptime Value: type, comptime Reader: type) type {
    return struct {
        const Self = @This();
        _parse: fn(self: *Self, allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?Value,

        pub fn parse(self: *Self, allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?Value {
            return self._parse(self, allocator, src);
        }
    };
}

pub fn OneOf(comptime Value: type, comptime Reader: type) type {
    return struct {
        parser: Parser(Value, Reader) = .{
            ._parse = parse,
        },
        parsers: []*Parser(Value, Reader),

        const Self = @This();

        // `parsers` slice must stay alive for as long as the parser will be
        // used.
        pub fn init(parsers: []*Parser(Value, Reader)) Self {
            return Self{
                .parsers = parsers,
            };
        }

        // Caller is responsible for freeing the value, if any.
        fn parse(parser: *Parser(Value, Reader), allocator: *Allocator, src: *Reader) callconv(.Inline) Error!?Value {
            const self = @fieldParentPtr(Self, "parser", parser);
            for (self.parsers) | one_of_parser | {
                const result = try one_of_parser.parse(allocator, src);
                if (result != null) {
                    return result;
                }
            }
            return null;
        }
    };
}
