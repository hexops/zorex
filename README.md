# Zorex: the omnipotent regex engine <a href="https://hexops.com"><img align="right" alt="Hexops logo" src="https://raw.githubusercontent.com/hexops/media/main/readme.svg"></img></a>

[![CI](https://github.com/hexops/ztemplate/workflows/CI/badge.svg)](https://github.com/hexops/ztemplate/actions)

Zorex blurs the line between regex engines and traditional parsing algorithms, PEGs, etc. used to parse programming languages

For example, [you can't parse HTML](https://stackoverflow.com/questions/6751105/why-its-not-possible-to-use-regex-to-parse-html-xml-a-formal-explanation-in-la) (or other non-regular languages) with a regex engine, but _you can_ with Zorex.

## Project status

In development. Not ready for use.

## A quick note about academic terminology

Technically, Zorex is "an advanced pattern matching engine", and it is arguably incorrect to call it a _regular expression engine_ because regular expressions by nature cannot parse non-regular languages (such as HTML, which is a context-free grammar.)

Any regex engine that supports backtracking is _also_ "not a regular expression engine", as the author of Perl's regex engine Larry Wall [puts it](https://raku.org/archive/doc/design/apo/A05.html):

> “Regular expressions” […] are only marginally related to real regular expressions. Nevertheless, the term has grown with the capabilities of our pattern matching engines, so I’m not going to try to fight linguistic necessity here. I will, however, generally call them “regexes” (or “regexen”, when I’m in an Anglo-Saxon mood).

Since the aim of Zorex is to maintain a deep level of syntactical compatibility with other regex engines people are familiar with, and _extend_ that to support parsing more complex non-regular languages, we call Zorex a regex engine.
