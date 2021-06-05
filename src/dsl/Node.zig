//! The result of executing a Compilation is a tree of nodes describing the parsed language.

const String = @import("String.zig");

const std = @import("std");
const mem = std.mem;

name: String,
value: ?String,

pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
    self.name.deinit(allocator);
    if (self.value) |v| {
        v.deinit(allocator);
    }
}

pub fn writeJSON(self: *const @This(), allocator: *mem.Allocator, out_stream: anytype) !void {
    var w = std.json.WriteStream(@TypeOf(out_stream), 6).init(out_stream);
    try w.beginObject();
    try w.objectField("name");
    try w.emitString(self.name.value);
    try w.objectField("value");
    if (self.value) |value| try w.emitString(value.value) else try w.emitNull();
    try w.endObject();
}
