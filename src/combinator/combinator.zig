pub usingnamespace @import("gll_result_stream.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Error = error{OutOfMemory};

const ResultTag = enum {
    value,
    syntax_err,
};

/// A parser result, one of:
///
/// 1. A `value` and number of `consumed` bytes.
/// 2. A `syntax_err` with number of `consumed` bytes (i.e. position of error).
/// 3. A fatal parse `err` (e.g. OOM), with no indication of `consumed` bytes.
///
pub fn Result(comptime Value: type) type {
    return struct {
        consumed: usize,
        result: union(ResultTag) {
            value: Value,
            syntax_err: []const u8,
        },

        pub fn init(consumed: usize, value: Value) @This() {
            return .{
                .consumed = consumed,
                .result = .{ .value = value },
            };
        }

        pub fn initSyntaxError(consumed: usize, syntax_err: []const u8) @This() {
            return .{
                .consumed = consumed,
                .result = .{ .syntax_err = syntax_err },
            };
        }
    };
}

pub fn GLLStackEntry(comptime Value: type) type {
    return struct {
        position: usize,
        alternate: *const Parser(Value),

        pub fn setEntry(self: *const @This()) callconv(.Inline) GLLSetEntry {
            return .{ .position = self.position, .alternate_ptr = @ptrToInt(self.alternate) };
        }
    };
}

const GLLSetEntry = struct {
    position: usize,
    alternate_ptr: usize,
};

pub fn GLLTrampoline(comptime ParserValue: type) type {
    return struct {
        /// Used to keep track of pending alternations.
        stack: std.atomic.Stack(GLLStackEntry(ParserValue)),

        /// Used to prevent adding an alternation to the stack that was already
        /// added previously.
        set: *std.AutoArrayHashMap(GLLSetEntry, void),

        _set: std.AutoArrayHashMap(GLLSetEntry, void),

        const Self = @This();

        pub fn init(allocator: *mem.Allocator) !*Self {
            const self = try allocator.create(Self);
            self.* = Self{
                .stack = std.atomic.Stack(GLLStackEntry(ParserValue)).init(),
                ._set = std.AutoArrayHashMap(GLLSetEntry, void).init(allocator),
                .set = undefined,
            };
            self.set = &self._set;
            return self;
        }

        pub fn initChild(self: *Self, allocator: *mem.Allocator, comptime NewStackType: type) !*GLLTrampoline(NewStackType) {
            const New = GLLTrampoline(NewStackType);
            const new = try allocator.create(New);
            new.* = New{
                .stack = std.atomic.Stack(GLLStackEntry(NewStackType)).init(),
                ._set = undefined,
                .set = self.set,
            };
            return new;
        }

        pub fn deinit(self: *Self, allocator: *mem.Allocator) void {
            self.set.deinit();
            allocator.destroy(self);
        }

        pub fn deinitChild(self: *Self, allocator: *mem.Allocator) void {
            allocator.destroy(self);
        }
    };
}

/// Describes context to be given to a `Parser`, such as `input` parameters, an `allocator`, and
/// the actual `src` to parse.
pub fn Context(comptime Input: type, comptime Value: type) type {
    return struct {
        input: Input,
        allocator: *mem.Allocator,
        src: []const u8,
        offset: usize,
        gll_trampoline: ?*GLLTrampoline(Value),
        results: *ResultStream(?Result(Value)),

        pub fn with(self: @This(), new_input: anytype) Context(@TypeOf(new_input), Value) {
            return Context(@TypeOf(new_input), Value){
                .input = new_input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = self.offset,
                .gll_trampoline = self.gll_trampoline,
                .results = self.results,
            };
        }

        pub fn initChild(self: @This(), comptime NewValue: type, new_results: *ResultStream(?Result(NewValue))) !Context(Input, NewValue) {
            var new_ctx = Context(Input, NewValue){
                .input = self.input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = self.offset,
                .gll_trampoline = null,
                .results = new_results,
            };
            if (self.gll_trampoline) |gll_trampoline| {
                new_ctx.gll_trampoline = try gll_trampoline.initChild(self.allocator, NewValue);
            }
            return new_ctx;
        }

        pub fn deinit(self: @This()) void {
            if (self.gll_trampoline) |gll_trampoline| {
                gll_trampoline.deinit(self.allocator);
            }
            self.results.deinit();
            return;
        }

        pub fn deinitChild(self: @This()) void {
            if (self.gll_trampoline) |gll_trampoline| {
                gll_trampoline.deinitChild(self.allocator);
            }
            self.results.deinit();
            return;
        }
    };
}

/// An interface whose implementation can be swapped out at runtime. It carries an arbitrary
/// `Context` to make the type signature generic.
pub fn Parser(comptime Value: type) type {
    return struct {
        const Self = @This();
        _parse: fn (self: *const Self, ctx: Context(void, Value)) callconv(.Async) Error!void,

        pub fn init(parseImpl: fn (self: *const Self, ctx: Context(void, Value)) callconv(.Async) Error!void) @This() {
            return .{ ._parse = parseImpl };
        }

        pub fn parse(self: *const Self, ctx: Context(void, Value)) callconv(.Async) Error!void {
            var frame = try std.heap.page_allocator.allocAdvanced(u8, 16, @frameSize(self._parse), std.mem.Allocator.Exact.at_least);
            defer std.heap.page_allocator.free(frame);
            return try await @asyncCall(frame, {}, self._parse, .{ self, ctx });
        }
    };
}

test "syntax" {
    const p = Parser([]u8);
}
