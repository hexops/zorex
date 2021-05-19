//! The public interface for compiling and running Zorex programs.

const compiler = @import("compiler.zig");
const Compilation = @import("Compilation.zig");
const Node = @import("Node.zig");

const combn = @import("../combn/combn.zig");
const Context = combn.Context;
const Result = combn.Result;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;
const assert = std.debug.assert;

const Program = @This();

/// If compile() fails, this error message and offset explains why and where.
error_message: ?[]const u8,
error_offset: usize,

/// The source of the program, null after successful compilation.
src: ?[]const u8,

/// The compiled program.
program: ?Compilation,

allocator: *mem.Allocator,

pub const Error = error{
    OutOfMemory,
    CompilationFailed,
};

/// Initializes a new program with the given source, which is borrowed until compile() is called
/// and returns.
pub fn init(allocator: *mem.Allocator, src: []const u8) Program {
    return Program{
        .error_message = null,
        .error_offset = 0,
        .src = src,
        .program = null,
        .allocator = allocator,
    };
}

/// Compiles the program, returning an error if compilation fails.
pub fn compile(self: *Program) !void {
    // Compile the syntax.
    var compilation = try compiler.compile(self.allocator, self.src.?);
    switch (compilation.result) {
        .err => |e| {
            self.error_message = e;
            self.error_offset = compilation.offset;
            return Error.CompilationFailed;
        },
        .value => {},
    }
    self.program = compilation.result.value;
    self.src = null;
}

/// Executes the program with the given input.
pub fn execute(self: *const Program, input: []const u8) !Node {
    nosuspend {
        var ctx = try Context(void, Node).init(self.allocator, input, {});
        defer ctx.deinit();

        try self.program.?.value.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(Node).initError(ctx.offset, "matches only the empty language"));
        var first = sub.next().?;
        assert(sub.next() == null); // no ambiguous parse paths here
        return first.result.value;
    }
}

pub fn deinit(self: *const Program) void {
    if (self.program) |prog| {
        prog.deinit(self.allocator);
    }
}

test "example_regexp" {
    const allocator = testing.allocator;

    const String = @import("String.zig");

    // Compile the regexp.
    var program = Program.init(allocator, "//");
    defer program.deinit();
    program.compile() catch |err| switch (err) {
        Error.CompilationFailed => @panic(program.error_message.?),
        else => unreachable,
    };

    // Execute the regexp.
    const input = "hmmm";
    const result = try program.execute(input);
    defer result.deinit(allocator);

    try testing.expectEqualStrings(result.name.value.items, "TODO(slimsag): value from parsing regexp!");
    try testing.expect(result.value == null);
    try testing.expect(result.children == null);

    // TODO(slimsag): Node type is not JSON-serializable for some reason.
    //const stdout = std.io.getStdOut().writer();
    //try std.json.stringify(result, std.json.StringifyOptions{}, stdout);
}
