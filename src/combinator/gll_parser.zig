pub usingnamespace @import("gll_result_stream.zig");
pub usingnamespace @import("gll_parser_path.zig");

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

const MemoizeValue = struct {
    results: usize, // untyped pointer *ResultStream(Result(Value))
    deinit: fn (results: usize, allocator: *mem.Allocator) void,
};

const MemoizeHashMap = std.AutoHashMap(MemoizeKey, MemoizeValue);

const MemoizedParser = struct {
    hash: u64,
    src_ptr: usize,
    offset: usize,

    pub fn state_hash(self: MemoizedParser) u64 {
        return std.hash_map.getAutoHashFn(@This())(self);
    }
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

    // *Parser(T) -> computed hash.
    hash_cache: std.AutoHashMap(usize, u64),

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
            results.* = try ResultStream(Result(Value)).init(allocator, parser.state_hash());
            l.entry.value = .{
                .results = @ptrToInt(results),
                .deinit = struct {
                    fn deinit(_resultsPtr: usize, _allocator: *mem.Allocator) void {
                        var _results = @intToPtr(*ResultStream(Result(Value)), _resultsPtr);
                        _results.deinit();
                        _allocator.destroy(_results);
                    }
                }.deinit,
            };
        }
        return MemoizedResult(Value){
            .results = @intToPtr(*ResultStream(Result(Value)), l.entry.value.results),
            .was_cached = l.found_existing,
        };
    }

    pub fn init(allocator: *mem.Allocator) !*@This() {
        var self = try allocator.create(@This());
        self.* = .{
            .parser_nodes = std.AutoHashMap(u64, *MemoizeHashMap).init(allocator),
            .hash_cache = std.AutoHashMap(usize, u64).init(allocator),
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
                local_entry.value.deinit(local_entry.value.results, allocator);
            }
        }
        self.parser_nodes.deinit();
        self.hash_cache.deinit();
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
        state_hash: u64,
        path: ParserPath,

        pub fn init(allocator: *mem.Allocator, src: []const u8, input: Input) !@This() {
            const state_hash = (MemoizedParser{
                .hash = 0,
                .src_ptr = @ptrToInt(&src[0]),
                .offset = 0,
            }).state_hash();

            var results = try allocator.create(ResultStream(Result(Value)));
            results.* = try ResultStream(Result(Value)).init(allocator, state_hash);
            return @This(){
                .input = input,
                .allocator = allocator,
                .src = src,
                .offset = 0,
                .results = results,
                .existing_results = false,
                .memoizer = try Memoizer.init(allocator),
                .state_hash = state_hash,
                .path = ParserPath.init(),
            };
        }

        pub fn initChild(self: @This(), comptime NewValue: type, parser_hash: u64, offset: usize) !Context(Input, NewValue) {
            const memoized_parser = MemoizedParser{
                .hash = parser_hash,
                .src_ptr = @ptrToInt(&self.src[0]),
                .offset = offset,
            };
            var child_ctx = Context(Input, NewValue){
                .input = self.input,
                .allocator = self.allocator,
                .src = self.src,
                .offset = offset,
                .results = undefined,
                .existing_results = false,
                .memoizer = self.memoizer,
                .state_hash = memoized_parser.state_hash(),
                .path = try self.path.clone(self.allocator),
            };
            try child_ctx.path.push(child_ctx.state_hash, self.allocator);

            var memoized = try self.memoizer.get(NewValue, self.allocator, memoized_parser);
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
                .state_hash = self.state_hash,
                .path = self.path,
            };
        }

        pub fn deinit(self: @This()) void {
            self.results.deinit();
            self.allocator.destroy(self.results);
            self.memoizer.deinit(self.allocator);
            self.path.deinit(self.allocator);
            return;
        }

        pub fn deinitChild(self: @This()) void {
            self.path.deinit(self.allocator);
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
        _hash: fn (self: *const Self, hash_cache: *std.AutoHashMap(usize, u64)) Error!u64,

        pub fn init(
            parseImpl: fn (self: *const Self, ctx: *const Context(void, Value)) callconv(.Async) Error!void,
            hashImpl: fn (self: *const Self, hash_cache: *std.AutoHashMap(usize, u64)) Error!u64,
        ) @This() {
            return .{ ._parse = parseImpl, ._hash = hashImpl };
        }

        pub fn parse(self: *const Self, ctx: *const Context(void, Value)) callconv(.Async) Error!void {
            var frame = try std.heap.page_allocator.allocAdvanced(u8, 16, @frameSize(self._parse), std.mem.Allocator.Exact.at_least);
            defer std.heap.page_allocator.free(frame);
            return try await @asyncCall(frame, {}, self._parse, .{ self, ctx });
        }

        pub fn hash(self: *const Self, hash_cache: *std.AutoHashMap(usize, u64)) Error!u64 {
            var v = try hash_cache.getOrPut(@ptrToInt(self));
            if (!v.found_existing) {
                v.entry.value = try self._hash(self, hash_cache);
            }
            return v.entry.value;
        }
    };
}

test "syntax" {
    const p = Parser([]u8);
}
