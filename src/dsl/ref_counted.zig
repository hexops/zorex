const std = @import("std");
const mem = std.mem;

pub fn RefCounted(comptime T: type) type {
    return struct {
        value: T,
        refs: usize,

        pub fn init(allocator: *mem.Allocator, value: T) !*@This() {
            var self = try allocator.create(@This());
            self.* = .{
                .value = value,
                .refs = 1,
            };
            return self;
        }

        pub fn ref(self: *@This()) callconv(.Inline) *@This() {
            self.refs += 1;
            return self;
        }

        pub fn deinit(self: *@This(), allocator: *mem.Allocator) void {
            self.refs -= 1;
            if (self.refs != 0) {
                return;
            }
            self.value.deinit(allocator);
            allocator.destroy(self);
        }
    };
}
