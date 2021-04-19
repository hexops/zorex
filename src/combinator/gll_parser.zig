pub usingnamespace @import("gll_result_stream.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub const Error = error{OutOfMemory};

const ResultTag = enum {
    value,
    err,
};

/// A parser result, one of:
///
/// 1. A `value` and new `offset` into the input `src`.
/// 2. An `err` and new `offset` ito the input `src` ((i.e. position of error).
///
pub fn Result(comptime Value: type) type {
    return struct {
        offset: usize,
        result: union(ResultTag) {
            value: Value,
            err: []const u8,
        },

        pub fn init(offset: usize, value: Value) @This() {
            return .{
                .offset = offset,
                .result = .{ .value = value },
            };
        }

        pub fn initError(offset: usize, err: []const u8) @This() {
            return .{
                .offset = offset,
                .result = .{ .err = err },
            };
        }
    };
}

const MemoizeKey = struct {
    src_ptr: usize,
    offset: usize,
};

// value is an untyped pointer *ResultStream(Result(Value))
const MemoizeHashMap = std.AutoHashMap(MemoizeKey, usize);

const MemoizedParser = struct {
    hash: u64,
    src_ptr: usize,
    offset: usize,
};

fn MemoizedResult(comptime Value: type) type {
    return struct {
        results: *ResultStream(Result(Value)),
        was_cached: bool,
    };
}

const Memoizer = struct {
    // Parser node names -> localized parser memoization maps
    parser_nodes: std.AutoHashMap(u64, *MemoizeHashMap),

    pub fn get(self: *@This(), comptime Value: type, allocator: *mem.Allocator, parser: MemoizedParser) !MemoizedResult(Value) {
        // Does a localized hashmap for this parser node exist already?
        const v = try self.parser_nodes.getOrPut(parser.hash);
        if (!v.found_existing) {
            // Create a new localized hashmap for this parser node.
            var localized = try allocator.create(MemoizeHashMap);
            localized.* = MemoizeHashMap.init(allocator);
            v.entry.value = localized;
        }

        // Does the localized hashmap for this node contain an existing result stream for the input
        // state?
        var localized = v.entry.value;
        const l = try localized.getOrPut(MemoizeKey{
            .src_ptr = parser.src_ptr,
            .offset = parser.offset,
        });
        if (!l.found_existing) {
            // Create a new result stream for this input state.
            var results = try allocator.create(ResultStream(Result(Value)));
            results.* = try ResultStream(Result(Value)).init(allocator);
            l.entry.value = @ptrToInt(results);
        }
        return MemoizedResult(Value){
            .results = @intToPtr(*ResultStream(Result(Value)), l.entry.value),
            .was_cached = l.found_existing,
        };
    }

    pub fn init(allocator: *mem.Allocator) !*@This() {
        var self = try allocator.create(@This());
        self.* = .{
            .parser_nodes = std.AutoHashMap(u64, *MemoizeHashMap).init(allocator),
        };
        return self;
    }

    pub fn deinit(self: *@This(), allocator: *mem.Allocator) void {
        var parser_nodes = self.parser_nodes.iterator();
        while (parser_nodes.next()) |parser_node| {
            var localized = parser_node.value;
            defer allocator.destroy(localized);
            defer localized.deinit();

            var local_entries = localized.iterator();
            while (local_entries.next()) |local_entry| {
                // TODO(slimsag): really brittle, may not work with streams using non-void result
                // types.
                var results = @intToPtr(*ResultStream(Result(void)), local_entry.value);
                results.deinit();
                allocator.destroy(results);
            }
        }
        self.parser_nodes.deinit();
        allocator.destroy(self);
    }
};

/// Describes context to be given to a `Parser`, such as `input` parameters, an `allocator`, and
/// the actual `src` to parse.
pub fn Context(comptime Input: type, comptime Value: type) type {
    return struct {
        input: Input,
        allocator: *mem.Allocator,
        src: []const u8,
        offset: usize,
        results: *ResultStream(Result(Value)),
        existing_results: bool,
        memoizer: *Memoizer,

        pub fn init(allocator: *mem.Allocator, src: []const u8, input: Input) !@This() {
            var results = try allocator.create(ResultStream(Result(Value)));
            results.* = try ResultStream(Result(Value)).init(allocator);
            return @This(){
                .input = input,
                .allocator = allocator,
                .src = src,
                .offset = 0,
                .results = results,
                .existing_results = false,
                .memoizer = try Memoizer.init(allocator),
            };
        }

        pub fn initChild(self: @This(), comptime NewValue: type, parser_hash: u64, offset: usize) !Context(Input, NewValue) {
            var child_ctx = Context(Input, NewValue){
                .input = self.input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = offset,
                .results = undefined,
                .existing_results = false,
                .memoizer = self.memoizer,
            };

            var memoized = try self.memoizer.get(NewValue, self.allocator, .{
                .hash = parser_hash,
                .src_ptr = @ptrToInt(&self.src[0]),
                .offset = offset,
            });
            child_ctx.results = memoized.results;
            if (memoized.was_cached) {
                child_ctx.existing_results = true;
            }
            return child_ctx;
        }

        pub fn with(self: @This(), new_input: anytype) Context(@TypeOf(new_input), Value) {
            return Context(@TypeOf(new_input), Value){
                .input = new_input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = self.offset,
                .results = self.results,
                .existing_results = self.existing_results,
                .memoizer = self.memoizer,
            };
        }

        pub fn deinit(self: @This()) void {
            self.results.deinit();
            self.allocator.destroy(self.results);
            self.memoizer.deinit(self.allocator);
            return;
        }

        pub fn deinitChild(self: @This()) void {
            return;
        }
    };
}

/// An interface whose implementation can be swapped out at runtime. It carries an arbitrary
/// `Context` to make the type signature generic.
pub fn Parser(comptime Value: type) type {
    return struct {
        const Self = @This();
        _parse: fn (self: *const Self, ctx: *const Context(void, Value)) callconv(.Async) Error!void,
        _hash: fn (self: *const Self) u64,

        pub fn init(
            parseImpl: fn (self: *const Self, ctx: *const Context(void, Value)) callconv(.Async) Error!void,
            hashImpl: fn (self: *const Self) u64,
        ) @This() {
            return .{ ._parse = parseImpl, ._hash = hashImpl };
        }

        pub fn parse(self: *const Self, ctx: *const Context(void, Value)) callconv(.Async) Error!void {
            var frame = try std.heap.page_allocator.allocAdvanced(u8, 16, @frameSize(self._parse), std.mem.Allocator.Exact.at_least);
            defer std.heap.page_allocator.free(frame);
            return try await @asyncCall(frame, {}, self._parse, .{ self, ctx });
        }

        pub fn hash(self: *const Self) u64 {
            return self._hash(self);
        }
    };
}

test "syntax" {
    const p = Parser([]u8);
}
