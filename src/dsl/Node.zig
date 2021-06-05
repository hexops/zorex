//! The result of executing a Compilation is a tree of nodes describing the parsed language.

const String = @import("String.zig");

const std = @import("std");
const mem = std.mem;

name: String,
value: ?String,
refs: usize,

const Node = @This();

pub fn init(allocator: *mem.Allocator, name: String, value: ?String) !*Node {
    var self = try allocator.create(Node);
    self.* = .{
        .name = name,
        .value = value,
        .refs = 1,
    };
    return self;
}

pub fn ref(self: *Node) *Node {
    self.refs += 1;
    return self;
}

pub fn deinit(self: *Node, allocator: *mem.Allocator) void {
    self.refs -= 1;
    if (self.refs == 0) {
        self.name.deinit(allocator);
        if (self.value) |v| {
            v.deinit(allocator);
        }
        allocator.destroy(self);
    }
    if (self.refs < 0) unreachable;
}

pub fn writeJSON(self: *const Node, allocator: *mem.Allocator, out_stream: anytype) !void {
    var w = std.json.WriteStream(@TypeOf(out_stream), 6).init(out_stream);
    try w.beginObject();
    try w.objectField("name");
    try w.emitString(self.name.value);
    try w.objectField("value");
    if (self.value) |value| try w.emitString(value.value) else try w.emitNull();
    try w.endObject();
}
