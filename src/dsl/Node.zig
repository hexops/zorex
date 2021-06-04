//! The result of executing a Compilation is a tree of nodes describing the parsed language.

const String = @import("String.zig");

const std = @import("std");
const mem = std.mem;

name: String,
value: ?String,
children: ?std.ArrayList(@This()),

pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
    self.name.deinit(allocator);
    if (self.value) |v| {
        v.deinit(allocator);
    }
    if (self.children) |children| {
        children.deinit();
    }
}
