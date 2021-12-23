//! A string that is either unowned (e.g. a slice into another string) or owned, and able to deinit
//! itself accordingly.

const std = @import("std");
const mem = std.mem;

value: []const u8,
owned: bool,

pub fn initOwned(value: []const u8) !@This() {
    return .{ .value = value, .owned = false };
}

pub fn init(value: []const u8) @This() {
    return .{ .value = value, .owned = false };
}

pub fn deinit(self: *const @This(), allocator: mem.Allocator) void {
    if (self.owned) allocator.free(self.value);
}
