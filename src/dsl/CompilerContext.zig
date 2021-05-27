const std = @import("std");
const mem = std.mem;

const Compilation = @import("Compilation.zig");

const CompilerContext = @This();

identifiers: Compilation.HashMap,

pub fn init(allocator: *mem.Allocator) !*CompilerContext {
    const compilerContext = try allocator.create(CompilerContext);
    compilerContext.* = CompilerContext{
        .identifiers = Compilation.HashMap.init(allocator),
    };
    return compilerContext;
}

pub fn deinit(self: *CompilerContext, allocator: *mem.Allocator) void {
    var iter = self.identifiers.iterator();
    while (iter.next()) |e| {
        e.key.deinit(allocator);
        e.value.deinit(allocator);
    }
    self.identifiers.deinit();
    allocator.destroy(self);
}
