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
pub fn execute(self: *const Program, input: []const u8) !Node {
    nosuspend {
        var compilerContext = try CompilerContext.init(self.allocator);
        defer compilerContext.deinit(self.allocator);
        var ctx = try Context(*CompilerContext, Node).init(self.allocator, input, compilerContext);
        // TODO(slimsag): remove?
        //defer ctx.deinit();

        const compilation = self.program.?.compilation.result.value;
        try compilation.value.parser.value.ptr.parse(&ctx);

        var sub = ctx.subscribe();
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

// test "example_regex" {
//     const allocator = testing.allocator;

//     const String = @import("String.zig");

//     // Compile the regexp.
//     var program = Program.init(allocator, "//");
//     defer program.deinit();
//     program.compile() catch |err| switch (err) {
//         Error.CompilationFailed => @panic(program.error_message.?),
//         else => unreachable,
//     };

//     // Execute the regexp.
//     const input = "hmmm";
//     const result = try program.execute(input);

//     try testing.expectEqualStrings("TODO(slimsag): value from parsing regexp!", result.name.value.items);
//     try testing.expect(result.value == null);
//     try testing.expect(result.children == null);

//     // TODO(slimsag): Node type is not JSON-serializable for some reason.
//     //const stdout = std.io.getStdOut().writer();
//     //try std.json.stringify(result, std.json.StringifyOptions{}, stdout);
// }
