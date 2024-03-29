const combn = @import("../combn/combn.zig");
const Result = combn.gllparser.Result;
const Parser = combn.gllparser.Parser;
const Error = combn.gllparser.Error;
const Context = combn.gllparser.Context;
const PosKey = combn.gllparser.PosKey;
const ParserPath = combn.gllparser.ParserPath;
const Sequence = combn.combinator.Sequence;
const SequenceValue = combn.combinator.sequence.Value;
const Repeated = combn.combinator.Repeated;
const RepeatedValue = combn.combinator.repeated.Value;
const Literal = combn.parser.Literal;
const LiteralValue = combn.parser.literal.Value;
const OneOf = combn.combinator.OneOf;
const MapTo = combn.combinator.MapTo;
const Optional = combn.combinator.Optional;

const String = @import("String.zig");
const Node = @import("Node.zig");
const Compilation = @import("Compilation.zig");
const Identifier = @import("identifier.zig").Identifier;
const CompilerContext = @import("CompilerContext.zig");
const pattern_grammar = @import("pattern_grammar.zig");

const std = @import("std");
const mem = std.mem;
const testing = std.testing;
const assert = std.debug.assert;

pub fn mapLiteralToNone(in: Result(LiteralValue), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) Error!?Result(?Compilation) {
    _ = compiler_context;
    _ = _allocator;
    _ = path;
    _ = key;
    return switch (in.result) {
        .err => Result(?Compilation).initError(in.offset, in.result.err),
        else => Result(?Compilation).init(in.offset, null),
    };
}

/// Maps a SequenceValue(*Node) -> singular *Node with no name and children (each of the nodes in
/// the sequence.)
fn mapNodeSequence(in: Result(SequenceValue(*Node)), program_context: void, _allocator: mem.Allocator, key: PosKey, path: ParserPath) Error!?Result(*Node) {
    _ = program_context;
    switch (in.result) {
        .err => return Result(*Node).initError(in.offset, in.result.err),
        else => {
            var sequence = in.result.value;

            // Collect all the children nodes.
            var children = std.ArrayList(*Node).init(_allocator);
            errdefer children.deinit();
            var sub = sequence.results.subscribe(key, path, Result(*Node).initError(in.offset, "matches only the empty language"));
            var offset = in.offset;
            while (sub.next()) |next| {
                offset = next.offset;
                try children.append(next.result.value.ref());
            }

            const node = try Node.init(_allocator, String.init("unknown"), null);
            node.children = children.toOwnedSlice();
            return Result(*Node).init(in.offset, node);
        },
    }
}

/// Maps a SequenceValue(?Compilation) -> singular ?Compilation which parses all compilations in sequence,
/// emitting a single unnamed Node with children.
fn mapCompilationSequence(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) Error!?Result(?Compilation) {
    _ = compiler_context;
    switch (in.result) {
        .err => return Result(?Compilation).initError(in.offset, in.result.err),
        else => {
            var sequence = in.result.value;

            // Collect all the parser compilations.
            var parsers = std.ArrayList(*Parser(void, *Node)).init(_allocator);
            var sub = sequence.results.subscribe(key, path, Result(?Compilation).initError(in.offset, "matches only the empty language"));
            var offset = in.offset;
            while (sub.next()) |next| {
                offset = next.offset;
                const compilation = next.result.value;
                if (compilation) |c| {
                    try parsers.append(c.value.parser.ptr.ref());
                }
            }
            var slice = parsers.toOwnedSlice();

            // Build a parser which maps the many Parser(void, *Node) compilations into a
            // single Parser(void, *Node) which has each node as a child.
            var mapped = try MapTo(void, SequenceValue(*Node), *Node).init(_allocator, .{
                .parser = (try Sequence(void, *Node).init(_allocator, slice, .borrowed)).ref(),
                .mapTo = mapNodeSequence,
            });

            var result_compilation = Compilation.initParser(Compilation.CompiledParser{
                .ptr = mapped.ref(),
                .slice = slice,
            });
            return Result(?Compilation).init(offset, result_compilation);
        },
    }
}

pub fn whitespaceOneOrMore(allocator: mem.Allocator) !*Parser(*CompilerContext, ?Compilation) {
    const newline = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try OneOf(*CompilerContext, LiteralValue).init(allocator, &.{
            (try Literal(*CompilerContext).init(allocator, "\r\n")).ref(),
            (try Literal(*CompilerContext).init(allocator, "\r")).ref(),
            (try Literal(*CompilerContext).init(allocator, "\n")).ref(),
        }, .copy)).ref(),
        .mapTo = mapLiteralToNone,
    });

    const space = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try OneOf(*CompilerContext, LiteralValue).init(allocator, &.{
            (try Literal(*CompilerContext).init(allocator, " ")).ref(),
            (try Literal(*CompilerContext).init(allocator, "\t")).ref(),
        }, .copy)).ref(),
        .mapTo = mapLiteralToNone,
    });

    const whitespace = try OneOf(*CompilerContext, ?Compilation).init(allocator, &.{
        newline.ref(),
        space.ref(),
    }, .copy);

    // Whitespace+
    return try MapTo(*CompilerContext, RepeatedValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Repeated(*CompilerContext, ?Compilation).init(allocator, .{
            .parser = whitespace.ref(),
            .min = 1,
            .max = -1,
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = _allocator;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        // optimization: newline and space parsers produce no compilations, so no
                        // need for us to pay any attention to repeated results.
                        return Result(?Compilation).init(in.offset, null);
                    },
                }
            }
        }.mapTo,
    });
}

pub fn init(allocator: mem.Allocator) !*Parser(*CompilerContext, Compilation) {
    // DSL grammar
    //
    // ```ebnf
    // Newline = "\r\n" | "\r" | "\n" ;
    // Space = " " | "\t" ;
    // Whitespace = Newline | Space ;
    // Assignment = "=" ;
    // Semicolon = ";" ;
    // Identifier = /[A-Z][[:alnum:]_]*/ ;
    // NestedPattern = "/", Pattern, "/" ;
    // Expr = NestedPattern | Identifier ;
    // ExprList = (ExprList, ",")? , Expr ;
    // Definition = Identifier , Whitespace+, Assignment, Whitespace+, ExprList, Semicolon ;
    // Grammar = (Definition | Expr | Whitespace+)+, EOF ;
    // ```
    //
    // TODO(dsl): Expr logical OR / alternation
    // TODO(dsl): Expr optional
    // TODO(dsl): Expr zero-or-more
    // TODO(dsl): Expr one-or-more
    // TODO(dsl): Expr repetition {x,y}
    // TODO(dsl): Expr grouping (...)
    // TODO(dsl): terminal string literals
    // TODO(dsl): comments
    // TODO(dsl): exception? "-" 
    // TODO(dsl): positive/negative lookahead? Python: & followed by a symbol, token or parenthesized group indicates a positive lookahead (i.e., is required to match but not consumed), while ! indicates a negative lookahead (i.e., is required _not_ to match).

    const whitespace_one_or_more = try whitespaceOneOrMore(allocator);

    var assignment = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try Literal(*CompilerContext).init(allocator, "=")).ref(),
        .mapTo = mapLiteralToNone,
    });
    var semicolon = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try Literal(*CompilerContext).init(allocator, ";")).ref(),
        .mapTo = mapLiteralToNone,
    });
    var forward_slash = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try Literal(*CompilerContext).init(allocator, "/")).ref(),
        .mapTo = mapLiteralToNone,
    });

    var nested_pattern = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, &.{
            forward_slash.ref(),
            (try pattern_grammar.init(allocator)).ref(),
            forward_slash.ref(),
        }, .copy)).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;
                        _ = sequence;

                        // TODO(slimsag): actually compose the compilation to parse this regexp!
                        const node = try Node.init(_allocator, String.init("TODO(slimsag): value from parsing regexp!"), null);
                        const success = Result(*Node).init(in.offset, node);
                        var always_success = try combn.combinator.Always(void, *Node).init(_allocator, success);

                        var result_compilation = Compilation.initParser(Compilation.CompiledParser{
                            .ptr = always_success.ref(),
                            .slice = null,
                        });
                        return Result(?Compilation).init(in.offset, result_compilation);
                    },
                }
            }
        }.mapTo,
    });

    var identifier_expr = try MapTo(*CompilerContext, ?Compilation, ?Compilation).init(allocator, .{
        .parser = (try Identifier.init(allocator)).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(?Compilation), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = _allocator;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        // Lookup this identifier, which was previously defined.
                        // TODO(slimsag): make it possible to reference future-definitions?
                        var compilation = compiler_context.identifiers.get(in.result.value.?);
                        if (compilation == null) {
                            // TODO(slimsag): include name of definition that was not found in error.
                            return Result(?Compilation).initError(in.offset, "definition not found");
                        }
                        return Result(?Compilation).init(in.offset, compilation.?).toUnowned();
                    },
                }
            }
        }.mapTo,
    });
    var expr = try OneOf(*CompilerContext, ?Compilation).init(allocator, &.{
        nested_pattern.ref(),
        identifier_expr.ref(),
    }, .copy);

    // ExprList = (ExprList, ",")? , Expr ;
    var expr_list_parsers = try allocator.alloc(*Parser(*CompilerContext, ?Compilation), 2);
    expr_list_parsers[1] = expr.ref(); // position 0 will be for left-recursive `(ExprList, ",")?` set later
    var expr_list = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, expr_list_parsers, .owned)).ref(),
        .mapTo = mapCompilationSequence,
    });
    // (ExprList, ",")
    var comma = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try Literal(*CompilerContext).init(allocator, ",")).ref(),
        .mapTo = mapLiteralToNone,
    });
    var expr_list_inner_left = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, &.{
            expr_list.ref(),
            comma.ref(),
        }, .copy)).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = _allocator;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;
                        var sub = sequence.results.subscribe(key, path, Result(?Compilation).initError(in.offset, "matches only the empty language"));

                        var _expr_list = sub.next().?;
                        _ = sub.next().?; // non-capturing compilation for comma
                        assert(sub.next() == null);
                        return _expr_list.toUnowned();
                    },
                }
            }
        }.mapTo,
    });
    var optional_expr_list_inner_left = try MapTo(*CompilerContext, ??Compilation, ?Compilation).init(allocator, .{
        .parser = (try Optional(*CompilerContext, ?Compilation).init(allocator, expr_list_inner_left.ref())).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(??Compilation), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = _allocator;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        if (in.result.value == null) {
                            return Result(?Compilation).init(in.offset, null);
                        }
                        return Result(?Compilation).init(in.offset, in.result.value.?).toUnowned();
                    },
                }
            }
        }.mapTo,
    });
    expr_list_parsers[0] = optional_expr_list_inner_left.ref();

    var definition = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, &.{
            (try Identifier.init(allocator)).ref(),
            whitespace_one_or_more.ref(),
            assignment.ref(),
            whitespace_one_or_more.ref(),
            expr_list.ref(),
            semicolon.ref(),
        }, .copy)).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = _allocator;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;
                        var sub = sequence.results.subscribe(key, path, Result(?Compilation).initError(in.offset, "matches only the empty language"));

                        var identifier = sub.next().?;
                        _ = sub.next().?; // non-capturing compilation for whitespace
                        _ = sub.next().?; // non-capturing compilation for assignment `=` operator
                        _ = sub.next().?; // non-capturing compilation for whitespace
                        var _expr_list = sub.next().?;
                        var last = sub.next().?; // non-capturing compilation for semicolon
                        assert(sub.next() == null);

                        // Set identifier = _expr_list, so that future identifier expressions can
                        // lookup the resulting expression compilation for the identifier.
                        const v = try compiler_context.identifiers.getOrPut(identifier.result.value.?);
                        if (v.found_existing) {
                            // TODO(slimsag): include name of definition in error message
                            return Result(?Compilation).initError(last.offset, "definition redefined");
                        }
                        v.value_ptr.* = _expr_list.result.value.?;

                        // A definition assignment yields no nodes.
                        return Result(?Compilation).init(in.offset, null);
                    },
                }
            }
        }.mapTo,
    });

    var definition_or_expr_or_whitespace = try OneOf(*CompilerContext, ?Compilation).init(allocator, &.{
        definition.ref(),
        expr.ref(),
        whitespace_one_or_more.ref(),
    }, .copy);

    const non_null_root_compilation = try MapTo(*CompilerContext, RepeatedValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Repeated(*CompilerContext, ?Compilation).init(allocator, .{
            .parser = definition_or_expr_or_whitespace.ref(),
            .min = 1,
            .max = -1,
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = _allocator;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => {
                        var repeated = in.result.value;
                        var sub = repeated.results.subscribe(key, path, Result(?Compilation).initError(in.offset, "matches only the empty language"));

                        var offset = in.offset;
                        var compilation: ?Result(?Compilation) = null;
                        while (sub.next()) |next| {
                            offset = next.offset;
                            switch (next.result) {
                                .value => |v| {
                                    if (v != null) {
                                        if (compilation == null) {
                                            compilation = Result(?Compilation).init(next.offset, v.?);
                                        } else {
                                            // another parse path yielded a compilation, i.e. our grammar was ambiguous -
                                            // and it definitely shouldn't be!
                                            unreachable;
                                        }
                                    }
                                },
                                .err => |e| return Result(?Compilation).initError(offset, e),
                            }
                        }
                        if (compilation == null) {
                            // Grammar does not have a root expression
                            return Result(?Compilation).initError(offset, "root expression missing");
                        }
                        return compilation.?.toUnowned();
                    },
                }
            }
        }.mapTo,
    });

    const end = try MapTo(*CompilerContext, combn.parser.end.Value, ?Compilation).init(allocator, .{
        .parser = (try combn.parser.End(*CompilerContext).init(allocator)).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(combn.parser.end.Value), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
                _ = compiler_context;
                _ = _allocator;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(?Compilation).initError(in.offset, in.result.err),
                    else => return Result(?Compilation).init(in.offset, null),
                }
            }
        }.mapTo,
    });

    const grammar_then_end = try Sequence(*CompilerContext, ?Compilation).init(allocator, &.{
        non_null_root_compilation.ref(),
        end.ref(),
    }, .copy);

    return try MapTo(*CompilerContext, SequenceValue(?Compilation), Compilation).init(allocator, .{
        .parser = grammar_then_end.ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: mem.Allocator, key: PosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                _ = compiler_context;
                _ = _allocator;
                _ = key;
                _ = path;
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        var sequence = in.result.value;

                        var sub = sequence.results.subscribe(key, path, Result(?Compilation).initError(in.offset, "matches only the empty language"));
                        const root_compilation = sub.next();
                        assert(root_compilation != null);
                        const _end = sub.next();
                        assert(_end != null);
                        assert(sub.next() == null);
                        return Result(Compilation).init(in.offset, root_compilation.?.result.value.?).toUnowned();
                    },
                }
            }
        }.mapTo,
    });
}
