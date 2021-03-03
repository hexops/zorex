const std = @import("std");
const regex = @import("syntax.zig").regex;

test "syntax_parsing" {
    const allocator = std.testing.allocator;
    var reader = std.io.fixedBufferStream("abcdef");
    const syntaxTree = try regex(@TypeOf(reader)).parse(allocator, &reader);
    defer syntaxTree.?.deinit(allocator);
    std.debug.print("result: {any}\n", .{syntaxTree.?});
}
