const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Error = error{OutOfMemory};

const ResultTag = enum {
    syntax_err,
    value,
};

/// A parser result, one of:
///
/// 1. A `value` and number of `consumed` bytes.
/// 2. A `syntax_err` with number of `consumed` bytes (i.e. position of error).
///
pub fn Result(comptime Value: type) type {
    return struct {
        consumed: usize,
        result: union(ResultTag) {
            syntax_err: []const u8,
            value: Value,
        },
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

        pub fn with(self: @This(), new_input: anytype) Context(@TypeOf(new_input), Value) {
            return Context(@TypeOf(new_input), Value){
                .input = new_input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = self.offset,
                .gll_trampoline = self.gll_trampoline,
            };
        }

        pub fn initChild(self: @This(), comptime NewValue: type) !Context(Input, NewValue) {
            var new_ctx = Context(Input, NewValue){
                .input = self.input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = self.offset,
                .gll_trampoline = null,
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
            return;
        }

        pub fn deinitChild(self: @This()) void {
            if (self.gll_trampoline) |gll_trampoline| {
                gll_trampoline.deinitChild(self.allocator);
            }
            return;
        }
    };
}

/// An interface whose implementation can be swapped out at runtime. It carries an arbitrary
/// `Context` to make the type signature generic.
pub fn Parser(comptime Value: type) type {
    return struct {
        const Self = @This();
        _parse: fn (self: *const Self, ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value),

        pub fn parse(self: *const Self, ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value) {
            return self._parse(self, ctx);
        }
    };
}

test "syntax" {
    const p = Parser([]u8);
}
