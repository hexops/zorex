const std = @import("std");
const mem = std.mem;

const CompilerContext = @This();

pub fn init(allocator: *mem.Allocator) !*CompilerContext {
    const compilerContext = try allocator.create(CompilerContext);
    compilerContext.* = CompilerContext{};
    return compilerContext;
}

pub fn deinit(self: *const CompilerContext, allocator: *mem.Allocator) void {
    allocator.destroy(self);
}
