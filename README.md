# Zorex: the omnipotent regex engine <a href="https://hexops.com"><img align="right" alt="Hexops logo" src="https://raw.githubusercontent.com/hexops/media/main/readme.svg"></img></a>

[![CI](https://github.com/hexops/ztemplate/workflows/CI/badge.svg)](https://github.com/hexops/ztemplate/actions)

Zorex blurs the line between regex engine and advanced parsing algorithms used to parse programming languages.

With the most powerful of regex engines today, you [can't parse HTML](https://stackoverflow.com/questions/6751105/why-its-not-possible-to-use-regex-to-parse-html-xml-a-formal-explanation-in-la) (a context-free language) [or XML](https://stackoverflow.com/a/8578999) ([a context-sensitive language](https://softwareengineering.stackexchange.com/a/205725)), but _you can_ with Zorex.

## ⚠️ Project status: in-development ⚠️

Under heavy development, not ready for use currently. [Follow me on Twitter](https://twitter.com/slimsag) for updates.

## How does it work?

Behind the scenes, Zorex parses a small DSL (the "zorex syntax", a regex-like syntax that enables opt-in [EBNF-like syntax](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form)) and then [at runtime builds a parser specifically for your input grammar](https://devlog.hexops.com/2021/zig-parser-combinators-and-why-theyre-awesome).

It's a bit like a traditional parser generator, but done at runtime (instead of through code generation) and with a deep level of syntactic compatibility with traditional regex engines.

It uses [an optimized GLL parser combinator framework called Combn](./src/combn/README.md) to support parsing some of the most complex languages, including left-and-right recursive context-free and some context-sensitive languages, in a fast way.

## A quick note about academic terminology

Technically, Zorex is "an advanced pattern matching engine", and it is arguably incorrect to call it a _regular expression engine_ because regular expressions by nature cannot parse non-regular languages (such as HTML, which is a context-free grammar.)

Any regex engine that supports backtracking, however, is _also_ "not a regular expression engine", as the author of Perl's regex engine Larry Wall [puts it](https://raku.org/archive/doc/design/apo/A05.html):

> “Regular expressions” […] are only marginally related to real regular expressions. Nevertheless, the term has grown with the capabilities of our pattern matching engines, so I’m not going to try to fight linguistic necessity here. I will, however, generally call them “regexes” (or “regexen”, when I’m in an Anglo-Saxon mood).

Since the aim of Zorex is to maintain a deep level of syntactical compatibility with other regex engines people are familiar with, and _further extend that_ to support parsing more complex non-regular languages, we call Zorex a regex engine.
