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
const RefCounted = @import("ref_counted.zig").RefCounted;

value: union(ValueTag) {
    parser: *RefCountedParser,
    identifier: String,
},

pub const RefCountedParser = RefCounted(struct {
    ptr: *const Parser(*CompilerContext, Node),
    slice: ?[]*const Parser(*CompilerContext, Node),
    refs: ?[]*RefCountedParser,

    pub fn deinit(self: @This(), allocator: *mem.Allocator) void {
        self.ptr.deinit(allocator);
        if (self.slice) |slice| {
            allocator.free(slice);
        }
        if (self.refs) |refs| {
            for (refs) |ref| {
                ref.deinit(allocator);
            }
            allocator.free(refs);
        }
    }
});

pub const ValueTag = enum {
    parser,
    identifier,
};

pub fn initParser(parser: *RefCountedParser) Compilation {
    return .{ .value = .{ .parser = parser } };
}

pub fn initIdentifier(identifier: String) Compilation {
    return .{ .value = .{ .identifier = identifier } };
}

pub fn clone(self: *const Compilation, allocator: *mem.Allocator) !Compilation {
    return Compilation{
        .value = switch (self.value) {
            .parser => .{ .parser = self.value.parser.ref() },
            .identifier => .{ .identifier = try self.value.identifier.clone(allocator) },
        },
    };
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
            .parser => |bb| aa.value.ptr == bb.value.ptr,
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
        .parser => |p| @ptrToInt(p.value.ptr),
        .identifier => |ident| std.hash_map.hashString(ident.value.items),
    };
}
