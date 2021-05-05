# combn: runtime GLL parser combinators for Zig <a href="https://hexops.com"><img align="right" alt="Hexops logo" src="https://raw.githubusercontent.com/hexops/media/main/readme.svg"></img></a>

Combn is the core parsing technique behind Zorex.

## Runtime composition

It is a runtime-composed [parser combinator](https://en.wikipedia.org/wiki/Parser_combinator) framework, which enables one to build parsers _at runtime_ (compared to traditional parser combinators done through code generation) as described in ["Zig, Parser Combinators - and Why They're Awesome"](https://devlog.hexops.com/2021/zig-parser-combinators-and-why-theyre-awesome).

Being runtime-composed means that you can e.g. define a DSL using parser combinators (such as regex-like syntax), and then produce a new parser at runtime to actually parse inputs for that regex-like syntax.

## Generalized LL parser (GLL)

Behind the scenes, combn uses a generalized LL (GLL) parsing algorithm described in:

> "Generalized Parser Combinators", Daniel Spiewak, University of Wisconsin, 2010. Implemented as the [gll-combinators Scala library](https://github.com/djspiewak/gll-combinators), using continuation-passing style and trampolined dispatch.

This enables combn to parse some of the most complex language grammars out there, including left and right recursive context-free grammars, as well as some context-sensitive grammars.

You can read more about GLL parsing in this great article: ["General Parser Combinators in Racket" by Vegard Øye](https://epsil.github.io/gll/)

## Zig ≈ performance

Most (almost all?) GLL parser implementations are in higher-level languages (Haskell, Scala, OCaml, etc.) as their type systems (and especially Haskell's lazy evaluation) lend themselves very well to functional parsing approaches in general.

Combn implementing an optimized GLL parser in a low-level language like Zig is, as far as we know, very rare or the first such instance.

One reason we attribute to being able to implement this in Zig in a relatively straightforward way is due to its async support: we are able to leverage async Zig functions to effectively provide "lazy evaluation" and "sleep" dependent parse paths as is done in e.g. the Haskell implementations.

## Advantages over other GLL parsers

Combn has a few advantages over other GLL parsers:

### Optimized parse-node-localized memoization

The original GLL parsing algorithm is O(n^3) worst-case, better than GLR which is O(n^4) worst-case.

Combn uses an even more optimized GLL parsing algorithm than the original, with parse-node-localized memoization, approximately the same as described in:

> "Faster, Practical GLL Parsing", Ali Afroozeh and Anastasia Izmaylova, Centrum Wiskunde & Informatica,1098 XG Amsterdam, The Netherlands, 

### Support for same-position reentrant parsers

Some left-recursive parsers require same-position reentrancy, e.g.:

```ebnf
Expr = Expr?, "abc" ;
Grammar = Expr ;
```

Where an input string "abcabcabc" would require `Expr` be parsed at offset=0 in the input string multiple times (in order to "greedily consume" the entire input.)

Many GLL parser implementations have differing behavior depending on whether or not the above grammar is defined as `Grammar = Expr ;` or `Grammar = Expr, EOF ;` - matching only a single "abc" without EOF and greedily otherwise. Some implementations also implement this using a globalized rollback system if the entire parse fails, requiring re-parsing starting at the root of the parse tree.

Combn uses parse-node-localized retries in the case of same-position reentrant grammars, which provides both better theoretical performance as well as consistent results regardless of what comes next in the grammar.

### Enumeration of all possible parse paths for ambiguous grammars

Many parser combinator frameworks opt to only enable navigating down one possible "committed" path of ambiguous grammars, this makes dealing with the resulting data types easier but means it is not possible to enumerate all possible ways an ambiguous grammar would have been parsed.

Combn uses fully generic type parameters, which does make it slightly more complex than other parser libraries but also enables enumerating all possible parse paths.

## How do I use it?

You can look at [`test_complex.zig`](test_complex.zig) for some ideas, but note a few things:

1. **The usage is quite complex**
  - Due to being type-agnostic (you can define your own "AST node" result value, or compute and return results directly from within parsers) AND due to supporting full enumeration of ambiguous grammars, there is a lot of type munging required.
2. **You probably don't want to use this API directly**
  - I am working on an EBNF-like DSL grammar on top of this API which will enable you to quickly define a language in EBNF form and get a parser for parsing it (at runtime), which will be a far more reasonable interface.
3. Some parts of the API are still in motion / can be simplified.
