usingnamespace @import("combinator.zig");
usingnamespace @import("parser_literal.zig");
//usingnamespace @import("comb_repeated.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn MapToContext(comptime Value: type, comptime Target: type) type {
    return struct {
        parser: *const Parser(Value),
        mapTo: fn (?Result(Value)) ?Result(Target),
    };
}

/// Wraps the `input.parser`, mapping its value to the `dst` type.
///
/// The `input.parser` must remain alive for as long as the `MapTo` parser will be used.
pub fn MapTo(comptime Input: type, comptime Value: type, comptime Target: type) type {
    return struct {
        parser: Parser(Target) = .{ ._parse = parse },
        input: MapToContext(Value, Target),

        const Self = @This();

        pub fn init(input: MapToContext(Value, Target)) Self {
            return Self{ .input = input };
        }

        pub fn parse(parser: *const Parser(Target), in_ctx: Context(void, Target)) callconv(.Inline) ?Result(Target) {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);

            const child_ctx = ctx.with({}).initChild(Value) catch |err| return Result(Target).initError(err);
            defer child_ctx.deinitChild();
            const value = ctx.input.parser.parse(child_ctx);
            return ctx.input.mapTo(value);
        }
    };
}

test "oneof" {
    const allocator = testing.allocator;

    const ctx = Context(void, []const u8){
        .input = {},
        .allocator = allocator,
        .src = "hello world",
        .offset = 0,
        .gll_trampoline = try GLLTrampoline([]const u8).init(allocator),
    };
    defer ctx.deinit();

    const mapTo = MapTo(void, void, []const u8).init(.{
        .parser = &Literal.init("hello").parser,
        .mapTo = struct {
            fn mapTo(in: ?Result(void)) ?Result([]const u8) {
                if (in == null) return null;
                return Result([]const u8).init(in.?.consumed, "hello");
            }
        }.mapTo,
    });

    const x = mapTo.parser.parse(ctx);
    testing.expectEqual(@as(usize, 5), x.?.consumed);
    testing.expectEqualStrings("hello", x.?.result.value);
}
