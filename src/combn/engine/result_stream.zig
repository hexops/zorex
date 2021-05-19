const std = @import("std");
const testing = std.testing;
const mem = std.mem;
const ParserPath = @import("parser_path.zig").ParserPath;
const ParserPosKey = @import("parser.zig").ParserPosKey;

/// A ResultStream iterator.
pub fn Iterator(comptime T: type) type {
    return struct {
        stream: *ResultStream(T),
        index: usize = 0,
        subscriber: ParserPosKey,
        path: ParserPath,
        cyclic_closed: bool = false,
        cyclic_error: ?T,

        const Self = @This();

        /// Gets the next value, or null if the end of values has been reached.
        ///
        /// If the next value is not yet available, the frame is suspended and will be resumed once
        /// a new value is added.
        pub fn next(self: *Self) callconv(.Async) ?T {
            if (self.stream.past_values.items.len == 0 or self.index >= self.stream.past_values.items.len) {
                if (self.stream.closed or self.cyclic_closed or self.cyclic_error == null) {
                    return null; // no more results
                }
                if (self.path.contains(self.subscriber)) {
                    // The parser waiting on these results (self.subscriber) is itself a part of
                    // a larger path of parsers which depend on this result in order to produce a
                    // result. This indicates a cyclic grammar which parses the empty language,
                    // e.g. in the most simple form:
                    //
                    //  Expr = Expr;
                    //  Grammar = Expr;
                    //
                    // In practice it may be a more complex form; but regardless this means that
                    // the subscriber should recieve no results.
                    self.cyclic_closed = true;
                    return self.cyclic_error.?;
                }
                // set ourselves up to be resumed later:
                self.stream.listeners.append(@frame()) catch unreachable;
                suspend {} // wait for more results, or stream close
                if (self.stream.closed) {
                    return null; // no more results
                }
            }
            // return the next result
            const v = self.stream.past_values.items[self.index];
            self.index += 1;
            return v;
        }
    };
}

/// A stream of results from a parser.
///
/// Listeners can be added at any time, and will recieve all past values upon
/// subscription.
///
/// New values can be added at any time.
pub fn ResultStream(comptime T: type) type {
    return struct {
        past_values: std.ArrayList(T),
        listeners: std.ArrayList(anyframe),
        closed: bool,
        source: ParserPosKey,

        const Self = @This();

        pub fn init(allocator: *mem.Allocator, source: ParserPosKey) !Self {
            return Self{
                .past_values = std.ArrayList(T).init(allocator),
                .listeners = std.ArrayList(anyframe).init(allocator),
                .closed = false,
                .source = source,
            };
        }

        /// adds a value to the stream, resuming the frames of any pending listeners.
        ///
        /// Returns only once all pending listeners' frames have been resumed.
        pub fn add(self: *Self, value: T) !void {
            try self.past_values.append(value);
            for (self.listeners.items) |listener| {
                resume listener;
            }
            self.listeners.shrinkRetainingCapacity(0);
        }

        /// closes the stream, signaling the end and waiting for all pending listeners' frames to
        /// be resumed.
        pub fn close(self: *Self) void {
            self.closed = true;
            for (self.listeners.items) |listener| {
                resume listener;
            }
            self.listeners.shrinkRetainingCapacity(0);
        }

        /// deinitializes the stream, all future calls to add, subscribe, and usage of iterators is
        /// forbidden.
        ///
        /// `close` must be called before deinit.
        pub fn deinit(self: *const Self) void {
            self.past_values.deinit();
            self.listeners.deinit();
        }

        pub fn deinitAll(self: *Self, allocator: *mem.Allocator) void {
            nosuspend {
                var sub = Iterator(T){
                    .stream = self,
                    .subscriber = mem.zeroes(ParserPosKey),
                    .path = ParserPath.init(),
                    .cyclic_error = null,
                };
                while (sub.next()) |next| {
                    next.deinit(allocator);
                }
            }
        }

        /// subscribes to all past and future values of the stream, producing an async iterator.
        ///
        /// Uses of the returned iterator are valid for as long as the result stream is not
        /// deinitialized.
        pub fn subscribe(self: *Self, subscriber: ParserPosKey, path: ParserPath, cyclic_error: T) Iterator(T) {
            return Iterator(T){
                .stream = self,
                .subscriber = subscriber,
                .path = path,
                .cyclic_error = cyclic_error,
            };
        }
    };
}

test "result_stream" {
    nosuspend {
        const subscriber = ParserPosKey{
            .node_name = 0,
            .src_ptr = 0,
            .offset = 0,
        };
        const source = subscriber;
        const path = ParserPath.init();
        var stream = try ResultStream(i32).init(testing.allocator, source);
        defer stream.deinit();

        // Subscribe and begin to query a value (next() will suspend) before any values have been added
        // to the stream.
        var sub1 = stream.subscribe(subscriber, path, -1);
        var sub1first = async sub1.next();

        // Add a value to the stream, our first subscription will get it.
        try stream.add(1);
        testing.expectEqual(@as(?i32, 1), await sub1first);

        // Query the next value (next() will suspend again), then add a value and close the stream for
        // good.
        var sub1second = async sub1.next();
        try stream.add(2);
        stream.close();

        // Confirm we get the remaining values, and the null terminator forever after that.
        testing.expectEqual(@as(?i32, 2), await sub1second);
        testing.expectEqual(@as(?i32, null), sub1.next());
        testing.expectEqual(@as(?i32, null), sub1.next());

        // Now that the stream is closed, add a new subscription and confirm we get all prior values.
        var sub2 = stream.subscribe(subscriber, path, -1);
        testing.expectEqual(@as(?i32, 1), sub2.next());
        testing.expectEqual(@as(?i32, 2), sub2.next());
        testing.expectEqual(@as(?i32, null), sub2.next());
    }
}
