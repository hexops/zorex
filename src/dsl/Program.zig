//! The public interface for compiling and running Zorex programs.

const compiler = @import("compiler.zig");
const CompilerResult = @import("compiler.zig").CompilerResult;
const Compilation = @import("Compilation.zig");
const Node = @import("Node.zig");
const CompilerContext = @import("CompilerContext.zig");

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
program: ?CompilerResult,

/// Context for the program.
context: ?Context(void, Node),

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
        .context = null,
        .allocator = allocator,
    };
}

/// Compiles the program, returning an error if compilation fails.
pub fn compile(self: *Program) !void {
    // Compile the syntax.
    var compilerResult = try compiler.compile(self.allocator, self.src.?);
    switch (compilerResult.compilation.result) {
        .err => |e| {
            self.error_message = e;
            self.error_offset = compilerResult.compilation.offset;
            compilerResult.deinit(self.allocator);
            return Error.CompilationFailed;
        },
        .value => {},
    }
    self.program = compilerResult;
    self.src = null;
}

/// Executes the program with the given input.
pub fn execute(self: *Program, input: []const u8) !Node {
    nosuspend {
        self.context = try Context(void, Node).init(self.allocator, input, {});

        const compilation = self.program.?.compilation.result.value;
        try compilation.value.parser.ptr.parse(&self.context.?);

        var sub = self.context.?.subscribe();
        var first = sub.next().?;
        assert(sub.next() == null); // no ambiguous parse paths here
        return first.result.value;
    }
}

pub fn deinit(self: *const Program) void {
    if (self.program) |prog| {
        self.context.?.deinit();
        prog.deinit(self.allocator);
    }
}

test "example_regex" {
    const allocator = testing.allocator;

    const String = @import("String.zig");

    // Compile the regex.
    var program = Program.init(allocator, "//");
    defer program.deinit();
    program.compile() catch |err| switch (err) {
        Error.CompilationFailed => @panic(program.error_message.?),
        else => unreachable,
    };

    // Execute the regex.
    const input = "hmmm";
    const result = try program.execute(input);

    // Serialize to JSON.
    var buffer = std.ArrayList(u8).init(allocator);
    defer buffer.deinit();
    try std.json.stringify(result, std.json.StringifyOptions{ .whitespace = std.json.StringifyOptions.Whitespace{} }, buffer.writer());

    // Confirm the results.
    try testing.expectEqualStrings(
        \\{
        \\    "name": {
        \\        "value": "TODO(slimsag): value from parsing regexp!",
        \\        "owned": false
        \\    },
        \\    "value": null
        \\}
    , buffer.items);
}

test "example_zorex" {
    const allocator = testing.allocator;

    const String = @import("String.zig");

    // Compile the zorex.
    var program = Program.init(allocator, "Date = //; Date");
    defer program.deinit();
    program.compile() catch |err| switch (err) {
        Error.CompilationFailed => @panic(program.error_message.?),
        else => unreachable,
    };

    // Execute the zorex.
    const input = "hmmm";
    const result = try program.execute(input);

    // Serialize to JSON.
    var buffer = std.ArrayList(u8).init(allocator);
    defer buffer.deinit();
    try std.json.stringify(result, std.json.StringifyOptions{ .whitespace = std.json.StringifyOptions.Whitespace{} }, buffer.writer());

    // Confirm the results.
    try testing.expectEqualStrings(
        \\{
        \\    "name": {
        \\        "value": "unknown",
        \\        "owned": false
        \\    },
        \\    "value": null
        \\}
    , buffer.items);
}
