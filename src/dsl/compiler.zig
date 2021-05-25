const combn = @import("../combn/combn.zig");
const Result = combn.Result;
const Parser = combn.Parser;
const Error = combn.Error;
const Context = combn.Context;
const ParserPosKey = combn.ParserPosKey;
const ParserPath = combn.ParserPath;
const Sequence = combn.Sequence;
const SequenceValue = combn.SequenceValue;
const Repeated = combn.Repeated;
const RepeatedValue = combn.RepeatedValue;
const Literal = combn.Literal;
const LiteralValue = combn.LiteralValue;
const OneOf = combn.OneOf;
const MapTo = combn.MapTo;
const Optional = combn.Optional;
const Always = combn.Always;

const String = @import("String.zig");
const Node = @import("Node.zig");
const Compilation = @import("Compilation.zig");
const Identifier = @import("identifier.zig").Identifier;
const CompilerContext = @import("CompilerContext.zig");

const std = @import("std");
const testing = std.testing;
const mem = std.mem;
const assert = std.debug.assert;

fn mapLiteralToNone(in: Result(LiteralValue), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(Compilation) {
    switch (in.result) {
        .err => return Result(Compilation).initError(in.offset, in.result.err),
        else => {
            var always_none = Always(*CompilerContext, Node).init(null);
            return Result(Compilation).init(in.offset, Compilation.initParser(try always_none.parser.heapAlloc(_allocator, always_none)));
        },
    }
}

/// Maps a SequenceValue(Node) -> singular Node with no name and children (each of the nodes in the
/// sequence.)
fn mapNodeSequence(in: Result(SequenceValue(Node)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(Node) {
    switch (in.result) {
        .err => return Result(Node).initError(in.offset, in.result.err),
        else => {
            var sequence = in.result.value;
            defer _allocator.destroy(sequence.results);
            defer sequence.results.deinit();

            // TODO(slimsag): mapTo should be async
            nosuspend {
                // Collect all the children nodes.
                var children = std.ArrayList(Node).init(_allocator);
                errdefer children.deinit();
                var sub = sequence.results.subscribe(key, path, Result(Node).initError(in.offset, "matches only the empty language"));
                var offset = in.offset;
                while (sub.next()) |next| {
                    offset = next.offset;
                    try children.append(next.result.value);
                }

                return Result(Node).init(in.offset, Node{
                    .name = try String.init(_allocator, "unknown"),
                    .value = null,
                    .children = children,
                });
            }
        },
    }
}

/// Maps a SequenceValue(Compilation) -> singular Compilation which parses all compilations in sequence,
/// emitting a single unnamed Node with children.
fn mapCompilationSequence(in: Result(SequenceValue(Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(Compilation) {
    switch (in.result) {
        .err => return Result(Compilation).initError(in.offset, in.result.err),
        else => {
            var sequence = in.result.value;
            defer _allocator.destroy(sequence.results);
            defer sequence.results.deinit();

            // TODO(slimsag): mapTo should be async
            nosuspend {
                // Collect all the parser compilations.
                var parsers = std.ArrayList(*const Parser(*CompilerContext, Node)).init(_allocator);
                var sub = sequence.results.subscribe(key, path, Result(Compilation).initError(in.offset, "matches only the empty language"));
                var offset = in.offset;
                while (sub.next()) |next| {
                    offset = next.offset;
                    const compilation = next.result.value;
                    try parsers.append(compilation.value.parser);
                }
                var slice = parsers.toOwnedSlice();

                // Build a parser which maps the many Parser(*CompilerContext, Node) compilations into a single Parser(*CompilerContext, Node)
                // which has each node as a child.
                var sequence_compilation = Sequence(*CompilerContext, Node).init(slice);
                var mapped = MapTo(*CompilerContext, SequenceValue(Node), Node).init(.{
                    .parser = try sequence_compilation.parser.heapAlloc(_allocator, sequence_compilation),
                    .mapTo = mapNodeSequence,
                });

                var result_compilation = Compilation.initParser(try mapped.parser.heapAlloc(_allocator, mapped));
                result_compilation.deinit_slice = slice;
                return Result(Compilation).init(offset, result_compilation);
            }
        },
    }
}

pub fn compile(allocator: *mem.Allocator, syntax: []const u8) !Result(Compilation) {
    // DSL grammar
    //
    // ```ebnf
    // Newline = "\r\n" | "\r" | "\n" ;
    // Space = " " | "\t" ;
    // Whitespace = Newline | Space ;
    // Assignment = "=" ;
    // Semicolon = ";" ;
    // Identifier = /[A-Z][[:alnum:]_]*/
    // RegExpr = "/", RegexpGrammar, "/" ;
    // Expr = RegExpr | Identifier ;
    // ExprList = (ExprList, ",")? , Expr ;
    // Definition = Identifier , Whitespace+, Assignment, Whitespace+, ExprList, Semicolon ;
    // Grammar = (Definition | Expr | Whitespace+)+, EOF ;
    // ```
    //
    var newline = MapTo(*CompilerContext, LiteralValue, Compilation).init(.{
        .parser = &OneOf(*CompilerContext, LiteralValue).init(&.{
            &Literal(*CompilerContext).init("\r\n").parser,
            &Literal(*CompilerContext).init("\r").parser,
            &Literal(*CompilerContext).init("\n").parser,
        }).parser,
        .mapTo = mapLiteralToNone,
    });
    var space = MapTo(*CompilerContext, LiteralValue, Compilation).init(.{
        .parser = &OneOf(*CompilerContext, LiteralValue).init(&.{
            &Literal(*CompilerContext).init(" ").parser,
            &Literal(*CompilerContext).init("\t").parser,
        }).parser,
        .mapTo = mapLiteralToNone,
    });

    var whitespace = OneOf(*CompilerContext, Compilation).init(&.{
        &newline.parser,
        &space.parser,
    });
    var whitespace_one_or_more = MapTo(*CompilerContext, RepeatedValue(Compilation), Compilation).init(.{
        .parser = &Repeated(*CompilerContext, Compilation).init(.{
            .parser = &whitespace.parser,
            .min = 1,
            .max = -1,
        }).parser,
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        defer in.deinit(_allocator);
                        // optimization: newline and space parsers produce always_none compilations, so
                        // no need for us to pay any attention to repeated results.
                        var always_none = Always(*CompilerContext, Node).init(null);
                        return Result(Compilation).init(in.offset, Compilation.initParser(try always_none.parser.heapAlloc(_allocator, always_none)));
                    },
                }
            }
        }.mapTo,
    });

    var assignment = MapTo(*CompilerContext, LiteralValue, Compilation).init(.{
        .parser = &Literal(*CompilerContext).init("=").parser,
        .mapTo = mapLiteralToNone,
    });
    var semicolon = MapTo(*CompilerContext, LiteralValue, Compilation).init(.{
        .parser = &Literal(*CompilerContext).init(";").parser,
        .mapTo = mapLiteralToNone,
    });
    var forward_slash = MapTo(*CompilerContext, LiteralValue, Compilation).init(.{
        .parser = &Literal(*CompilerContext).init("/").parser,
        .mapTo = mapLiteralToNone,
    });

    var reg_expr = MapTo(*CompilerContext, SequenceValue(Compilation), Compilation).init(.{
        .parser = &Sequence(*CompilerContext, Compilation).init(&.{
            &forward_slash.parser,
            // TODO(slimsag): define the regular expression grammar!
            //&reg_expr_grammar.parser,
            &forward_slash.parser,
        }).parser,
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;
                        //defer _allocator.destroy(sequence.results);
                        //defer sequence.results.deinit();

                        // TODO(slimsag): actually compose the compilation to parse this regexp!
                        defer in.deinit(_allocator);
                        const success = Result(Node).init(in.offset, Node{
                            .name = try String.init(_allocator, "TODO(slimsag): value from parsing regexp!"),
                            .value = null,
                            .children = null,
                        });
                        var always_success = Always(*CompilerContext, Node).init(success);
                        return Result(Compilation).init(in.offset, Compilation.initParser(try always_success.parser.heapAlloc(_allocator, always_success)));
                    },
                }
            }
        }.mapTo,
    });

    var identifier_expr = MapTo(*CompilerContext, Compilation, Compilation).init(.{
        .parser = &Identifier.init().parser,
        .mapTo = struct {
            fn mapTo(in: Result(Compilation), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        defer in.deinit(_allocator);

                        // TODO(slimsag): lookup compilation to actually parse the thing described by
                        // this identifier!
                        const success = Result(Node).init(in.offset, Node{
                            .name = try String.init(_allocator, "success definition!"),
                            .value = null,
                            .children = null,
                        });
                        var always_success = Always(*CompilerContext, Node).init(success);
                        return Result(Compilation).init(in.offset, Compilation.initParser(try always_success.parser.heapAlloc(_allocator, always_success)));
                    },
                }
            }
        }.mapTo,
    });
    var expr = OneOf(*CompilerContext, Compilation).init(&.{
        &reg_expr.parser,
        &identifier_expr.parser,
    });

    // ExprList = (ExprList, ",")? , Expr ;
    var expr_list_parsers = [_]*Parser(*CompilerContext, Compilation){
        undefined, // placeholder for left-recursive `(ExprList, ",")?`
        &expr.parser,
    };
    var expr_list = MapTo(*CompilerContext, SequenceValue(Compilation), Compilation).init(.{
        .parser = &Sequence(*CompilerContext, Compilation).init(&expr_list_parsers).parser,
        .mapTo = mapCompilationSequence,
    });
    // (ExprList, ",")
    var comma = MapTo(*CompilerContext, LiteralValue, Compilation).init(.{
        .parser = &Literal(*CompilerContext).init(",").parser,
        .mapTo = mapLiteralToNone,
    });
    var expr_list_inner_left = MapTo(*CompilerContext, SequenceValue(Compilation), Compilation).init(.{
        .parser = &Sequence(*CompilerContext, Compilation).init(&.{
            &expr_list.parser,
            &comma.parser,
        }).parser,
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;
                        defer _allocator.destroy(sequence.results);
                        defer sequence.results.deinit();
                        var sub = sequence.results.subscribe(key, path, Result(Compilation).initError(in.offset, "matches only the empty language"));

                        var _expr_list = sub.next().?;
                        _ = sub.next().?; // non-capturing compilation for comma
                        assert(sub.next() == null);
                        return _expr_list;
                    },
                }
            }
        }.mapTo,
    });
    var optional_expr_list_inner_left = MapTo(*CompilerContext, ?Compilation, Compilation).init(.{
        .parser = &Optional(*CompilerContext, Compilation).init(&expr_list_inner_left.parser).parser,
        .mapTo = struct {
            fn mapTo(in: Result(?Compilation), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        if (in.result.value == null) {
                            var always_none = Always(*CompilerContext, Node).init(null);
                            return Result(Compilation).init(in.offset, Compilation.initParser(try always_none.parser.heapAlloc(_allocator, always_none)));
                        }
                        return Result(Compilation).init(in.offset, in.result.value.?);
                    },
                }
            }
        }.mapTo,
    });
    expr_list_parsers[0] = &optional_expr_list_inner_left.parser;

    var definition = MapTo(*CompilerContext, SequenceValue(Compilation), Compilation).init(.{
        .parser = &Sequence(*CompilerContext, Compilation).init(&.{
            &Identifier.init().parser,
            &whitespace_one_or_more.parser,
            &assignment.parser,
            &whitespace_one_or_more.parser,
            &expr_list.parser,
            &semicolon.parser,
        }).parser,
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;
                        defer _allocator.destroy(sequence.results);
                        defer sequence.results.deinit();
                        var sub = sequence.results.subscribe(key, path, Result(Compilation).initError(in.offset, "matches only the empty language"));

                        var identifier = sub.next().?;
                        _ = sub.next().?; // non-capturing compilation for whitespace
                        _ = sub.next().?; // non-capturing compilation for assignment `=` operator
                        _ = sub.next().?; // non-capturing compilation for whitespace
                        var _expr_list = sub.next().?;
                        var last = sub.next().?; // non-capturing compilation for semicolon
                        assert(sub.next() == null);

                        // TODO(slimsag): set identifier=_expr_list so that future expression
                        // usages of the identifier can be looked up.
                        identifier.deinit(_allocator);
                        _expr_list.deinit(_allocator);

                        // A definition assignment yields no nodes.
                        var always_none = Always(*CompilerContext, Node).init(null);
                        return Result(Compilation).init(in.offset, Compilation.initParser(try always_none.parser.heapAlloc(_allocator, always_none)));
                    },
                }
            }
        }.mapTo,
    });

    var definition_or_expr_or_whitespace = OneOf(*CompilerContext, Compilation).init(&.{
        &definition.parser,
        &expr.parser,
        &whitespace_one_or_more.parser,
    });

    // TODO(slimsag): match EOF
    var grammar = MapTo(*CompilerContext, RepeatedValue(Compilation), Compilation).init(.{
        .parser = &Repeated(*CompilerContext, Compilation).init(.{
            .parser = &definition_or_expr_or_whitespace.parser,
            .min = 1,
            .max = -1,
        }).parser,
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        var repeated = in.result.value;
                        defer _allocator.destroy(repeated.results);
                        defer repeated.results.deinit();
                        var sub = repeated.results.subscribe(key, path, Result(Compilation).initError(in.offset, "matches only the empty language"));

                        var offset = in.offset;
                        var compilation = sub.next();
                        if (compilation == null) {
                            // Grammar does not have a root expression
                            return Result(Compilation).initError(offset, "root expression missing");
                        }

                        // All other parse paths should yield no compilations.
                        assert(sub.next() == null);

                        return compilation.?;
                    },
                }
            }
        }.mapTo,
    });

    var compilerContext = try CompilerContext.init(allocator);
    defer compilerContext.deinit(allocator);
    var ctx = try Context(*CompilerContext, Compilation).init(allocator, syntax, compilerContext);
    defer ctx.deinit();
    try grammar.parser.parse(&ctx);

    var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(Compilation).initError(ctx.offset, "matches only the empty language"));
    var compilation = sub.next();
    assert(sub.next() == null); // our grammar is never ambiguous
    if (compilation == null) {
        return Result(Compilation).initError(ctx.offset, "failed to compile");
    }
    return compilation.?;
}

test "DSL" {
    nosuspend {
        const allocator = testing.allocator;

        // Compile the regexp.
        var compilation = try compile(allocator, "//");
        switch (compilation.result) {
            .err => |e| @panic(e),
            .value => {},
        }
        var program = compilation.result.value;
        defer program.deinit(allocator);

        // Run the regexp.
        var input = "//";
        var compilerContext = try CompilerContext.init(allocator);
        defer compilerContext.deinit(allocator);
        var ctx = try Context(*CompilerContext, Node).init(allocator, input, compilerContext);
        defer ctx.deinit();

        defer ctx.results.deinitAll(allocator);
        try program.value.parser.parse(&ctx);

        var sub = ctx.results.subscribe(ctx.key, ctx.path, Result(Node).initError(ctx.offset, "matches only the empty language"));
        var first = sub.next().?;
        try testing.expectEqualStrings("TODO(slimsag): value from parsing regexp!", first.result.value.name.value.items);
        try testing.expectEqual(@as(usize, 0), first.offset);
        try testing.expect(sub.next() == null);
    }
}
