const Parser = @import("gll_parser.zig").Parser;
const ParserNodeName = @import("gll_parser.zig").ParserNodeName;
const ParserPosKey = @import("gll_parser.zig").ParserPosKey;
const Result = @import("gll_parser.zig").Result;
const Error = @import("gll_parser.zig").Error;
const Context = @import("gll_parser.zig").Context;
const ResultStream = @import("gll_result_stream.zig").ResultStream;
const ParserPath = @import("gll_parser_path.zig").ParserPath;

const std = @import("std");
const testing = std.testing;
const mem = std.mem;

pub fn ReentrantContext(comptime Value: type) type {
    return *const Parser(Value);
}

/// Wraps the `input.parser`, allowing it to be reentrant (such as in the case of a left recursive
/// grammar.)
///
/// This has relatively small overhead (so you may use it to wrap any reentrant parser), but is
/// only strictly required for reentrant parsers where invoking the parser multiple times at the
/// same exact position in the input string is required to emit a different result. For example:
///
/// ```ebnf
/// Expr = Expr?, "abc" ;
/// Grammar = Expr ;
/// ```
///
/// Without a Reentrant wrapper, parsing the above Grammar would match only a singular
/// `(null, abc)` match, because `Expr` is not invoked recursively. However, with a reentrant
/// wrapper it would match `(((null,abc),abc),abc)` instead.
///
/// The `input.parser` must remain alive for as long as the `Reentrant` parser will be used.
pub fn Reentrant(comptime Input: type, comptime Value: type) type {
    return struct {
        parser: Parser(Value) = Parser(Value).init(parse, nodeName),
        input: ReentrantContext(Value),

        const Self = @This();

        pub fn init(input: ReentrantContext(Value)) Self {
            return Self{ .input = input };
        }

        pub fn nodeName(parser: *const Parser(Value), node_name_cache: *std.AutoHashMap(usize, ParserNodeName)) Error!u64 {
            const self = @fieldParentPtr(Self, "parser", parser);

            var v = std.hash_map.hashString("Reentrant");
            v +%= try self.input.nodeName(node_name_cache);
            return v;
        }

        pub fn parse(parser: *const Parser(Value), in_ctx: *const Context(void, Value)) callconv(.Async) !void {
            const self = @fieldParentPtr(Self, "parser", parser);
            var ctx = in_ctx.with(self.input);
            defer ctx.results.close();

            // See gll_parser.zig:Memoizer.get for details on what this is doing and why.
            var retrying = false;
            var retrying_max_depth: ?usize = null;
            while (true) {
                const child_node_name = try ctx.input.nodeName(&in_ctx.memoizer.node_name_cache);
                const child_ctx = try ctx.with({}).initChildRetry(Value, child_node_name, ctx.offset, retrying_max_depth);
                defer child_ctx.deinitChild();
                if (!child_ctx.existing_results) try ctx.input.parse(&child_ctx);

                var buf = try ctx.allocator.create(ResultStream(Result(Value)));
                defer ctx.allocator.destroy(buf);
                defer buf.deinit();
                buf.* = try ResultStream(Result(Value)).init(ctx.allocator, ctx.key);
                var sub = child_ctx.results.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
                while (sub.next()) |next| {
                    try buf.add(next);
                }
                buf.close();

                if ((sub.cyclic_closed or retrying) and !child_ctx.isRetrying(child_node_name, ctx.offset)) {
                    child_ctx.results.deinitAll();
                    child_ctx.results.deinit();
                    if (retrying and sub.cyclic_closed) {
                        if (retrying_max_depth.? > 0) retrying_max_depth.? -= 1;
                        retrying = false;
                        continue;
                    }
                    retrying = true;
                    if (retrying_max_depth == null) {
                        retrying_max_depth = 0;
                    }
                    retrying_max_depth.? += 1;
                    continue;
                } else {
                    var sub2 = buf.subscribe(ctx.key, ctx.path, Result(Value).initError(ctx.offset, "matches only the empty language"));
                    while (sub2.next()) |next| {
                        try ctx.results.add(next);
                    }
                    break;
                }
            }
        }
    };
}
