const std = @import("std");
const mem = std.mem;

/// Maintains the path which a parser took, i.e. which parser states were taken
/// and in which order by maintaining a stack of parser state hashes.
pub const ParserPath = struct {
    stack: std.atomic.Stack(u64),

    pub fn init() ParserPath {
        return .{
            .stack = std.atomic.Stack(u64).init(),
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

    pub fn push(self: *ParserPath, state_hash: u64, allocator: *mem.Allocator) !void {
        const Node = std.atomic.Stack(u64).Node;
        const pathNode = try allocator.create(Node);
        pathNode.* = .{
            .next = undefined,
            .data = state_hash,
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

    pub fn contains(self: ParserPath, state_hash: u64) bool {
        var next = self.stack.root;
        while (next != null) : (next = next.?.next) {
            if (next.?.data == state_hash) return true;
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
};
