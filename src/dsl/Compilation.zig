//! A Compilation is the result of parsing Zorex's DSL syntax. That is, the Zorex DSL is parsed to
//! produce a Compilation (not e.g. an AST) which is itself a parser which, when invoked, parses
//! the syntax described by the DSL.

usingnamespace @import("../combn/combn.zig");

const String = @import("String.zig");
const Node = @import("Node.zig");

const std = @import("std");
const mem = std.mem;

value: union(ValueTag) {
    parser: *const Parser(Node),
    identifier: String,
},
deinit_slice: ?[]*const Parser(Node),

pub const ValueTag = enum {
    parser,
    identifier,
};

pub fn initParser(parser: *const Parser(Node)) @This() {
    return .{
        .value = .{ .parser = parser },
        .deinit_slice = null,
    };
}

pub fn initIdentifier(identifier: String) @This() {
    return .{
        .value = .{ .identifier = identifier },
        .deinit_slice = null,
    };
}

pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
    switch (self.value) {
        .parser => |v| v.deinit(allocator),
        .identifier => |v| v.deinit(allocator),
    }
    if (self.deinit_slice) |p| {
        allocator.free(p);
    }
}
