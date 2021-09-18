//! Maintains the path which a parser took, i.e. which parser states were taken
//! and in which order by maintaining a stack of parser position keys.

stack: std.atomic.Stack(PosKey),

const std = @import("std");
const mem = std.mem;
const PosKey = @import("parser.zig").PosKey;
const ParserPath = @This();

pub fn init() ParserPath {
    return .{
        .stack = std.atomic.Stack(PosKey).init(),
    };
}

pub fn deinit(self: ParserPath, allocator: *mem.Allocator) void {
    var next = self.stack.root;
    while (next != null) {
        const tmp = next.?.next;
        allocator.destroy(next.?);
        next = tmp;
    }
}

pub fn push(self: *ParserPath, key: PosKey, allocator: *mem.Allocator) !void {
    const Node = std.atomic.Stack(PosKey).Node;
    const pathNode = try allocator.create(Node);
    pathNode.* = .{
        .next = undefined,
        .data = key,
    };
    self.stack.push(pathNode);
}

pub fn clone(self: ParserPath, allocator: *mem.Allocator) !ParserPath {
    var new = ParserPath.init();
    var next = self.stack.root;
    while (next != null) : (next = next.?.next) {
        try new.push(next.?.data, allocator);
    }
    return new;
}

pub fn contains(self: ParserPath, key: PosKey) bool {
    var next = self.stack.root;
    const eql = std.hash_map.getAutoEqlFn(PosKey, void);
    while (next != null) : (next = next.?.next) {
        if (eql({}, next.?.data, key)) return true;
    }
    return false;
}

pub fn print(self: ParserPath) void {
    var next = self.stack.root;
    std.debug.print("PATH", .{});
    while (next != null) : (next = next.?.next) {
        std.debug.print(" -> {}", .{next.?.data});
    }
    std.debug.print("\n", .{});
}
