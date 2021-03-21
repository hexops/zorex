const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn repeated(allocator: *const mem.Allocator) void {
    comptime const x = allocator;
    _ = x;
    return;
}

test "repeated_comptime" {
    comptime {
        const allocator = testing.failing_allocator;
        _ = repeated(allocator);
    }
}
