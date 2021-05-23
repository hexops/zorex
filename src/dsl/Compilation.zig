//! A Compilation is the result of parsing Zorex's DSL syntax. That is, the Zorex DSL is parsed to
//! produce a Compilation (not e.g. an AST) which is itself a parser which, when invoked, parses
//! the syntax described by the DSL.

const combn = @import("../combn/combn.zig");
const Parser = combn.Parser;

const String = @import("String.zig");
const Node = @import("Node.zig");
const CompilerContext = @import("CompilerContext.zig");

const std = @import("std");
const mem = std.mem;

const Compilation = @This();

value: union(ValueTag) {
    parser: *const Parser(*CompilerContext, Node),
    identifier: String,
},
deinit_slice: ?[]*const Parser(*CompilerContext, Node),

pub const ValueTag = enum {
    parser,
    identifier,
};

pub fn initParser(parser: *const Parser(*CompilerContext, Node)) Compilation {
    return .{
        .value = .{ .parser = parser },
        .deinit_slice = null,
    };
}

pub fn initIdentifier(identifier: String) Compilation {
    return .{
        .value = .{ .identifier = identifier },
        .deinit_slice = null,
    };
}

pub fn deinit(self: *const Compilation, allocator: *mem.Allocator) void {
    switch (self.value) {
        .parser => |v| v.deinit(allocator),
        .identifier => |v| v.deinit(allocator),
    }
    if (self.deinit_slice) |p| {
        allocator.free(p);
    }
}

pub const HashMap = std.HashMap(Compilation, Compilation, hashFn, eqlFn, std.hash_map.default_max_load_percentage);

fn eqlFn(a: Compilation, b: Compilation) bool {
    return switch (a.value) {
        .parser => |aa| switch (b.value) {
            .parser => |bb| aa == bb,
            .identifier => false,
        },
        .identifier => |aa| switch (b.value) {
            .parser => false,
            .identifier => |bb| std.mem.eql(u8, aa.value.items, bb.value.items),
        },
    };
}

fn hashFn(key: Compilation) u64 {
    return switch (key.value) {
        .parser => |p| @ptrToInt(p),
        .identifier => |ident| std.hash_map.hashString(ident.value.items),
    };
}
