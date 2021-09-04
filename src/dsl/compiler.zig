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

fn mapLiteralToNone(in: Result(LiteralValue), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(?Compilation) {
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
fn mapNodeSequence(in: Result(SequenceValue(*Node)), program_context: void, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(*Node) {
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
fn mapCompilationSequence(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) Error!?Result(?Compilation) {
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
                .parser = (try Sequence(void, *Node).init(_allocator, slice)).ref(),
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

pub const CompilerResult = struct {
    compilation: Result(Compilation),
    ctx: Context(*CompilerContext, Compilation),
    compilerContext: *CompilerContext,

    pub fn deinit(self: *const @This(), allocator: *mem.Allocator) void {
        self.ctx.deinit();
        self.compilerContext.deinit(allocator);
    }
};

pub fn compile(allocator: *mem.Allocator, syntax: []const u8) !CompilerResult {
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

    var newline = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try OneOf(*CompilerContext, LiteralValue).init(allocator, &.{
            (&Literal(*CompilerContext).init("\r\n").parser).ref(),
            (&Literal(*CompilerContext).init("\r").parser).ref(),
            (&Literal(*CompilerContext).init("\n").parser).ref(),
        })).ref(),
        .mapTo = mapLiteralToNone,
    });
    var space = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (try OneOf(*CompilerContext, LiteralValue).init(allocator, &.{
            (&Literal(*CompilerContext).init(" ").parser).ref(),
            (&Literal(*CompilerContext).init("\t").parser).ref(),
        })).ref(),
        .mapTo = mapLiteralToNone,
    });

    var whitespace = try OneOf(*CompilerContext, ?Compilation).init(allocator, &.{
        newline.ref(),
        space.ref(),
    });
    var whitespace_one_or_more = try MapTo(*CompilerContext, RepeatedValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Repeated(*CompilerContext, ?Compilation).init(allocator, .{
            .parser = whitespace.ref(),
            .min = 1,
            .max = -1,
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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

    var assignment = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (&Literal(*CompilerContext).init("=").parser).ref(),
        .mapTo = mapLiteralToNone,
    });
    var semicolon = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (&Literal(*CompilerContext).init(";").parser).ref(),
        .mapTo = mapLiteralToNone,
    });
    var forward_slash = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (&Literal(*CompilerContext).init("/").parser).ref(),
        .mapTo = mapLiteralToNone,
    });

    var nested_pattern = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, &.{
            forward_slash.ref(),
            //(&pattern.parser).ref(),
            forward_slash.ref(),
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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
                        var always_success = try Always(void, *Node).init(_allocator, success);

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
        .parser = (&Identifier.init().parser).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(?Compilation), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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
    });

    // ExprList = (ExprList, ",")? , Expr ;
    var expr_list_parsers = [_]*Parser(*CompilerContext, ?Compilation){
        undefined, // placeholder for left-recursive `(ExprList, ",")?`
        expr.ref(),
    };
    var expr_list = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, &expr_list_parsers)).ref(),
        .mapTo = mapCompilationSequence,
    });
    // (ExprList, ",")
    var comma = try MapTo(*CompilerContext, LiteralValue, ?Compilation).init(allocator, .{
        .parser = (&Literal(*CompilerContext).init(",").parser).ref(),
        .mapTo = mapLiteralToNone,
    });
    var expr_list_inner_left = try MapTo(*CompilerContext, SequenceValue(?Compilation), ?Compilation).init(allocator, .{
        .parser = (try Sequence(*CompilerContext, ?Compilation).init(allocator, &.{
            expr_list.ref(),
            comma.ref(),
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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
            fn mapTo(in: Result(??Compilation), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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
            (&Identifier.init().parser).ref(),
            whitespace_one_or_more.ref(),
            assignment.ref(),
            whitespace_one_or_more.ref(),
            expr_list.ref(),
            semicolon.ref(),
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(SequenceValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(?Compilation) {
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
    });

    // TODO(slimsag): match EOF
    var grammar = try MapTo(*CompilerContext, RepeatedValue(?Compilation), Compilation).init(allocator, .{
        .parser = (try Repeated(*CompilerContext, ?Compilation).init(allocator, .{
            .parser = definition_or_expr_or_whitespace.ref(),
            .min = 1,
            .max = -1,
        })).ref(),
        .mapTo = struct {
            fn mapTo(in: Result(RepeatedValue(?Compilation)), compiler_context: *CompilerContext, _allocator: *mem.Allocator, key: ParserPosKey, path: ParserPath) callconv(.Async) Error!?Result(Compilation) {
                _ = compiler_context;
                _ = _allocator;
                switch (in.result) {
                    .err => return Result(Compilation).initError(in.offset, in.result.err),
                    else => {
                        var repeated = in.result.value;
                        var sub = repeated.results.subscribe(key, path, Result(?Compilation).initError(in.offset, "matches only the empty language"));

                        var offset = in.offset;
                        var compilation: ?Result(Compilation) = null;
                        while (sub.next()) |next| {
                            offset = next.offset;
                            switch (next.result) {
                                .value => |v| {
                                    if (v != null) {
                                        if (compilation == null) {
                                            compilation = Result(Compilation).init(next.offset, v.?);
                                        } else {
                                            // another parse path yielded a compilation, i.e. our grammar was ambiguous -
                                            // and it definitely shouldn't be!
                                            unreachable;
                                        }
                                    }
                                },
                                .err => |e| return Result(Compilation).initError(offset, e),
                            }
                        }
                        if (compilation == null) {
                            // Grammar does not have a root expression
                            return Result(Compilation).initError(offset, "root expression missing");
                        }
                        return compilation.?.toUnowned();
                    },
                }
            }
        }.mapTo,
    });
    defer grammar.deinit(allocator, null);

    var compilerContext = try CompilerContext.init(allocator);
    var ctx = try Context(*CompilerContext, Compilation).init(allocator, syntax, compilerContext);
    try grammar.parse(&ctx);

    var sub = ctx.subscribe();
    var compilation = sub.next();
    assert(sub.next() == null); // our grammar is never ambiguous
    if (compilation == null) {
        return CompilerResult{
            .compilation = Result(Compilation).initError(ctx.offset, "failed to compile"),
            .compilerContext = compilerContext,
            .ctx = ctx,
        };
    }
    return CompilerResult{
        .compilation = compilation.?,
        .compilerContext = compilerContext,
        .ctx = ctx,
    };
}

test "DSL" {
    nosuspend {
        const allocator = testing.allocator;

        // Compile the regexp.
        var compilerResult = try compile(allocator, "//");
        defer compilerResult.deinit(allocator);
        switch (compilerResult.compilation.result) {
            .err => |e| @panic(e),
            .value => {},
        }
        var program = compilerResult.compilation.result.value;

        // Run the regexp.
        var input = "//";
        var ctx = try Context(void, *Node).init(allocator, input, {});
        defer ctx.deinit();

        try program.value.parser.ptr.parse(&ctx);

        var sub = ctx.subscribe();
        var first = sub.next().?;
        try testing.expectEqualStrings("TODO(slimsag): value from parsing regexp!", first.result.value.name.value);
        try testing.expectEqual(@as(usize, 0), first.offset);
        try testing.expect(sub.next() == null);
    }
}
