const std = @import("std");
const testing = std.testing;
const mem = std.mem;

/// A ResultStream iterator.
pub fn Iterator(comptime T: type) type {
    return struct {
        stream: *ResultStream(T),
        index: usize = 0,

        const Self = @This();

        /// Gets the next value, or null if the end of values has been reached.
        ///
        /// If the next value is not yet available, the frame is suspended and will be resumed once
        /// a new value is added.
        fn next(self: *Self) callconv(.Async) ?T {
            if (self.stream.past_values.items.len == 0 or self.index >= self.stream.past_values.items.len) {
                if (self.stream.closed) {
                    return null; // no more results
                }
                // set ourselves up to be resumed later:
                self.stream.listeners.append(@frame()) catch unreachable;
                suspend; // wait for more results, or stream close
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

        const Self = @This();

        pub fn init(allocator: *mem.Allocator) !Self {
            return Self{
                .past_values = std.ArrayList(T).init(allocator),
                .listeners = std.ArrayList(anyframe).init(allocator),
                .closed = false,
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
        pub fn deinit(self: *Self) void {
            self.past_values.deinit();
            self.listeners.deinit();
        }

        /// subscribes to all past and future values of the stream, producing an async iterator.
        ///
        /// Uses of the returned iterator are valid for as long as the result stream is not
        /// deinitialized.
        pub fn subscribe(self: *Self) Iterator(T) {
            return Iterator(T){.stream = self};
        }
    };
}

test "result_stream" {
    nosuspend {
        var stream = try ResultStream(i32).init(testing.allocator);
        defer stream.deinit();

        // Subscribe and begin to query a value (next() will suspend) before any values have been added
        // to the stream.
        var sub1 = stream.subscribe();
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
        var sub2 = stream.subscribe();
        testing.expectEqual(@as(?i32, 1), sub2.next());
        testing.expectEqual(@as(?i32, 2), sub2.next());
        testing.expectEqual(@as(?i32, null), sub2.next());
    }
}