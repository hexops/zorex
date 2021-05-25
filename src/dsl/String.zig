//! A heap-allocated string that is growable with dynamic capacity.

const std = @import("std");
const mem = std.mem;

value: std.ArrayList(u8),

pub fn init(allocator: *mem.Allocator, value: []const u8) !@This() {
    var self = @This(){
        .value = try std.ArrayList(u8).initCapacity(allocator, value.len),
    };
    try self.value.appendSlice(value);
    return self;
}

pub fn clone(self: *const @This(), allocator: *mem.Allocator) !@This() {
    return init(allocator, self.value.items);
}

pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
    self.value.deinit();
}
