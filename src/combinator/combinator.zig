const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Error = error{OutOfMemory};

const ResultTag = enum {
    err,
    value,
};

/// A parser result, one of:
///
/// 1. A `value` and number of `consumed` bytes.
/// 2. A syntax `err`or with number of `consumed` bytes (i.e. position of error).
///
pub fn Result(comptime Value: type) type {
    return struct {
        consumed: usize,
        result: union(ResultTag) {
            err: []const u8,
            value: Value,
        },
    };
}

pub fn GLLStackEntry(comptime Value: type) type {
    return struct {
        position: usize,
        alternate: *const ParserInterface(Value),

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
        set: std.AutoArrayHashMap(GLLSetEntry, void),

        const Self = @This();

        pub fn init(allocator: *mem.Allocator) !*Self {
            const self = try allocator.create(Self);
            self.* = Self{
                .stack = std.atomic.Stack(GLLStackEntry(ParserValue)).init(),
                .set = std.AutoArrayHashMap(GLLSetEntry, void).init(allocator),
            };
            return self;
        }

        pub fn initWith(self: *Self, allocator: *mem.Allocator, comptime NewStackType: type) !*GLLTrampoline(NewStackType) {
            const New = GLLTrampoline(NewStackType);
            const new = try allocator.create(New);
            new.* = New{
                .stack = std.atomic.Stack(GLLStackEntry(NewStackType)).init(),
                .set = self.set,
            };
            return new;
        }

        pub fn deinit(self: *Self, allocator: *mem.Allocator) void {
            self.set.deinit();
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

        pub fn deinit(self: @This(), allocator: *mem.Allocator) void {
            if (self.gll_trampoline) |gll_trampoline| {
                gll_trampoline.deinit(allocator);
            }
            return;
        }
    };
}

/// The type of all parser functions, producing either a result (value or syntax error) or
/// a hard error (OOM).
///
/// Callers of a parser are responsible for freeing the resulting value if needed.
pub fn Parser(comptime Input: type, comptime Value: type) type {
    return fn (Context(Input, Value)) callconv(.Inline) Error!?Result(Value);
}

/// An interface whose implementation is a `Parser` which can be swapped out at runtime. It carries
/// an arbitrary `Context` to make the type signature generic.
pub fn ParserInterface(comptime Value: type) type {
    return struct {
        const Self = @This();
        _parse: fn (self: *const Self, ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value),

        pub fn parse(self: *const Self, ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value) {
            return self._parse(self, ctx);
        }
    };
}

/// Wraps a `Parser` by providing a `ParserInterface` implementation which carries arbitrary
/// `Context`.
pub fn Wrap(comptime Input: type, comptime Value: type, comptime parser: Parser(Input, Value)) type {
    return struct {
        interface: ParserInterface(Value) = .{ ._parse = parse },
        input: Input,

        const Self = @This();

        pub fn init(input: Input) Self {
            return Self{ .input = input };
        }

        pub fn parse(interface: *const ParserInterface(Value), ctx: Context(void, Value)) callconv(.Inline) Error!?Result(Value) {
            const self = @fieldParentPtr(Self, "interface", interface);
            return parser(ctx.with(self.input));
        }
    };
}

test "syntax" {
    const parserInterface = ParserInterface([]u8);
    const parser = Parser([]u8, []u8);
}
