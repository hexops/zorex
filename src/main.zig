const std = @import("std");
pub const New = @import("regcomp.zig").New;
pub const ReRegisters = @import("oniguruma.zig").ReRegisters;
pub const Option = @import("oniguruma.zig").Option;
pub const Syntax = @import("regsyntax.zig").Syntax;
pub const Region = @import("regexec.zig").Region;
pub const search = @import("regexec.zig").search;

