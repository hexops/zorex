//! A Program is the result of parsing a program in Zorex's DSL syntax. That is, a parser parses
//! the Zorex DSL and produces a Program (which is itself a parser) in order to parse the syntax
//! described by the DSL.

usingnamespace @import("../combn/combn.zig");

const String = @import("String.zig");
const Node = @import("Node.zig");

const std = @import("std");
const mem = std.mem;

value: union(ValueTag) {
    parser: *const Parser(Node),
    identifier: String,
},

pub const ValueTag = enum {
    parser,
    identifier,
};

pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
    switch (self.value) {
        .parser => |v| v.deinit(allocator),
        .identifier => |v| v.deinit(allocator),
    }
}
