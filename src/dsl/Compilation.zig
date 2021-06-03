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
    parser: CompiledParser,
    identifier: String,
},

pub const CompiledParser = struct {
    ptr: *const Parser(*CompilerContext, Node),
    slice: ?[]*const Parser(*CompilerContext, Node),

    pub fn deinit(self: @This(), allocator: *mem.Allocator) void {
        self.ptr.deinit(allocator);
        if (self.slice) |slice| {
            allocator.free(slice);
        }
    }
};

pub const ValueTag = enum {
    parser,
    identifier,
};

pub fn initParser(parser: CompiledParser) Compilation {
    return .{ .value = .{ .parser = parser } };
}

pub fn initIdentifier(identifier: String) Compilation {
    return .{ .value = .{ .identifier = identifier } };
}

pub fn deinit(self: *const Compilation, allocator: *mem.Allocator) void {
    switch (self.value) {
        .parser => |v| v.deinit(allocator),
        .identifier => |v| v.deinit(allocator),
    }
}

pub const HashMap = std.HashMap(Compilation, Compilation, hashFn, eqlFn, std.hash_map.default_max_load_percentage);

fn eqlFn(a: Compilation, b: Compilation) bool {
    return switch (a.value) {
        .parser => |aa| switch (b.value) {
            .parser => |bb| aa.ptr == bb.ptr,
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
        .parser => |p| @ptrToInt(p.ptr),
        .identifier => |ident| std.hash_map.hashString(ident.value.items),
    };
}
