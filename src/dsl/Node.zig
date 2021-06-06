//! The result of executing a Compilation is a tree of nodes describing the parsed language.

const String = @import("String.zig");

const std = @import("std");
const mem = std.mem;

const Node = @This();

name: String,
value: ?String,
refs: usize,
children: ?[]*Node,

pub const Error = error{OutOfMemory};

pub fn init(allocator: *mem.Allocator, name: String, value: ?String) !*Node {
    var self = try allocator.create(Node);
    self.* = .{
        .name = name,
        .value = value,
        .refs = 1,
        .children = null,
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
        if (self.value) |v| v.deinit(allocator);
        if (self.children) |children| {
            for (children) |child| child.deinit(allocator);
            allocator.free(children);
        }
        allocator.destroy(self);
    }
    if (self.refs < 0) unreachable;
}

pub fn writeJSON(self: *const Node, allocator: *mem.Allocator, out_stream: anytype) Error!void {
    var w = std.json.WriteStream(@TypeOf(out_stream), 5).init(out_stream);

    var ptrToID = std.AutoHashMap(*const Node, i32).init(allocator);
    defer ptrToID.deinit();

    try w.beginArray();
    try self._writeJSON(&w, &ptrToID);
    try w.endArray();
}

fn _writeJSON(self: *const Node, w: anytype, ptrToID: *std.AutoHashMap(*const Node, i32)) Error!void {
    if (self.children) |children| for (children) |child| try child._writeJSON(w, ptrToID);

    var v = try ptrToID.getOrPut(self);
    if (v.found_existing) return; // visited already

    v.entry.value = @intCast(i32, ptrToID.count()-1);
    try w.arrayElem();
    try w.beginObject();
    try w.objectField("name");
    try w.emitString(self.name.value);
    if (self.value) |value| {
        try w.objectField("value");
        try w.emitString(value.value);
    }
    if (self.children) |children| {
        try w.objectField("children");
        try w.beginArray();
        for (children) |child| {
            try w.arrayElem();
            try w.emitNumber(ptrToID.get(child).?);
        }
        try w.endArray();
    }
    try w.endObject();
}