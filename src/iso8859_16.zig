pub usingnamespace @import("std").c.builtins;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = c_longdouble;
pub const OnigCodePoint = c_uint;
pub const OnigUChar = u8;
pub const OnigCtype = c_uint;
pub const OnigLen = c_uint;
pub const OnigCaseFoldType = c_uint;
pub extern var OnigDefaultCaseFoldFlag: OnigCaseFoldType;
const struct_unnamed_1 = extern struct {
    byte_len: c_int,
    code_len: c_int,
    code: [3]OnigCodePoint,
};
pub const OnigCaseFoldCodeItem = struct_unnamed_1;
const struct_unnamed_2 = extern struct {
    esc: OnigCodePoint,
    anychar: OnigCodePoint,
    anytime: OnigCodePoint,
    zero_or_one_time: OnigCodePoint,
    one_or_more_time: OnigCodePoint,
    anychar_anytime: OnigCodePoint,
};
pub const OnigMetaCharTableType = struct_unnamed_2;
pub const OnigApplyAllCaseFoldFunc = ?fn (OnigCodePoint, [*c]OnigCodePoint, c_int, ?*c_void) callconv(.C) c_int;
pub const struct_OnigEncodingTypeST = extern struct {
    mbc_enc_len: ?fn ([*c]const OnigUChar) callconv(.C) c_int,
    name: [*c]const u8,
    max_enc_len: c_int,
    min_enc_len: c_int,
    is_mbc_newline: ?fn ([*c]const OnigUChar, [*c]const OnigUChar) callconv(.C) c_int,
    mbc_to_code: ?fn ([*c]const OnigUChar, [*c]const OnigUChar) callconv(.C) OnigCodePoint,
    code_to_mbclen: ?fn (OnigCodePoint) callconv(.C) c_int,
    code_to_mbc: ?fn (OnigCodePoint, [*c]OnigUChar) callconv(.C) c_int,
    mbc_case_fold: ?fn (OnigCaseFoldType, [*c][*c]const OnigUChar, [*c]const OnigUChar, [*c]OnigUChar) callconv(.C) c_int,
    apply_all_case_fold: ?fn (OnigCaseFoldType, OnigApplyAllCaseFoldFunc, ?*c_void) callconv(.C) c_int,
    get_case_fold_codes_by_str: ?fn (OnigCaseFoldType, [*c]const OnigUChar, [*c]const OnigUChar, [*c]OnigCaseFoldCodeItem) callconv(.C) c_int,
    property_name_to_ctype: ?fn ([*c]struct_OnigEncodingTypeST, [*c]OnigUChar, [*c]OnigUChar) callconv(.C) c_int,
    is_code_ctype: ?fn (OnigCodePoint, OnigCtype) callconv(.C) c_int,
    get_ctype_code_range: ?fn (OnigCtype, [*c]OnigCodePoint, [*c][*c]const OnigCodePoint) callconv(.C) c_int,
    left_adjust_char_head: ?fn ([*c]const OnigUChar, [*c]const OnigUChar) callconv(.C) [*c]OnigUChar,
    is_allowed_reverse_match: ?fn ([*c]const OnigUChar, [*c]const OnigUChar) callconv(.C) c_int,
    init: ?fn () callconv(.C) c_int,
    is_initialized: ?fn () callconv(.C) c_int,
    is_valid_mbc_string: ?fn ([*c]const OnigUChar, [*c]const OnigUChar) callconv(.C) c_int,
    flag: c_uint,
    sb_range: OnigCodePoint,
    index: c_int,
};
pub const OnigEncodingType = struct_OnigEncodingTypeST;
pub const OnigEncoding = [*c]OnigEncodingType;
pub extern var OnigEncodingASCII: OnigEncodingType;
pub extern var OnigEncodingISO_8859_1: OnigEncodingType;
pub extern var OnigEncodingISO_8859_2: OnigEncodingType;
pub extern var OnigEncodingISO_8859_3: OnigEncodingType;
pub extern var OnigEncodingISO_8859_4: OnigEncodingType;
pub extern var OnigEncodingISO_8859_5: OnigEncodingType;
pub extern var OnigEncodingISO_8859_6: OnigEncodingType;
pub extern var OnigEncodingISO_8859_7: OnigEncodingType;
pub extern var OnigEncodingISO_8859_8: OnigEncodingType;
pub extern var OnigEncodingISO_8859_9: OnigEncodingType;
pub extern var OnigEncodingISO_8859_10: OnigEncodingType;
pub extern var OnigEncodingISO_8859_11: OnigEncodingType;
pub extern var OnigEncodingISO_8859_13: OnigEncodingType;
pub extern var OnigEncodingISO_8859_14: OnigEncodingType;
pub extern var OnigEncodingISO_8859_15: OnigEncodingType;
pub extern var OnigEncodingISO_8859_16: OnigEncodingType;
pub extern var OnigEncodingUTF8: OnigEncodingType;
pub extern var OnigEncodingUTF16_BE: OnigEncodingType;
pub extern var OnigEncodingUTF16_LE: OnigEncodingType;
pub extern var OnigEncodingUTF32_BE: OnigEncodingType;
pub extern var OnigEncodingUTF32_LE: OnigEncodingType;
pub extern var OnigEncodingEUC_JP: OnigEncodingType;
pub extern var OnigEncodingEUC_TW: OnigEncodingType;
pub extern var OnigEncodingEUC_KR: OnigEncodingType;
pub extern var OnigEncodingEUC_CN: OnigEncodingType;
pub extern var OnigEncodingSJIS: OnigEncodingType;
pub extern var OnigEncodingKOI8: OnigEncodingType;
pub extern var OnigEncodingKOI8_R: OnigEncodingType;
pub extern var OnigEncodingCP1251: OnigEncodingType;
pub extern var OnigEncodingBIG5: OnigEncodingType;
pub extern var OnigEncodingGB18030: OnigEncodingType;
pub const ONIGENC_CTYPE_NEWLINE = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_NEWLINE);
pub const ONIGENC_CTYPE_ALPHA = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_ALPHA);
pub const ONIGENC_CTYPE_BLANK = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_BLANK);
pub const ONIGENC_CTYPE_CNTRL = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_CNTRL);
pub const ONIGENC_CTYPE_DIGIT = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_DIGIT);
pub const ONIGENC_CTYPE_GRAPH = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_GRAPH);
pub const ONIGENC_CTYPE_LOWER = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_LOWER);
pub const ONIGENC_CTYPE_PRINT = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_PRINT);
pub const ONIGENC_CTYPE_PUNCT = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_PUNCT);
pub const ONIGENC_CTYPE_SPACE = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_SPACE);
pub const ONIGENC_CTYPE_UPPER = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_UPPER);
pub const ONIGENC_CTYPE_XDIGIT = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_XDIGIT);
pub const ONIGENC_CTYPE_WORD = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_WORD);
pub const ONIGENC_CTYPE_ALNUM = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_ALNUM);
pub const ONIGENC_CTYPE_ASCII = @enumToInt(enum_unnamed_3.ONIGENC_CTYPE_ASCII);
const enum_unnamed_3 = extern enum(c_int) {
    ONIGENC_CTYPE_NEWLINE = 0,
    ONIGENC_CTYPE_ALPHA = 1,
    ONIGENC_CTYPE_BLANK = 2,
    ONIGENC_CTYPE_CNTRL = 3,
    ONIGENC_CTYPE_DIGIT = 4,
    ONIGENC_CTYPE_GRAPH = 5,
    ONIGENC_CTYPE_LOWER = 6,
    ONIGENC_CTYPE_PRINT = 7,
    ONIGENC_CTYPE_PUNCT = 8,
    ONIGENC_CTYPE_SPACE = 9,
    ONIGENC_CTYPE_UPPER = 10,
    ONIGENC_CTYPE_XDIGIT = 11,
    ONIGENC_CTYPE_WORD = 12,
    ONIGENC_CTYPE_ALNUM = 13,
    ONIGENC_CTYPE_ASCII = 14,
    _,
};
pub const OnigEncCtype = enum_unnamed_3;
pub extern fn onigenc_step_back(enc: OnigEncoding, start: [*c]const OnigUChar, s: [*c]const OnigUChar, n: c_int) [*c]OnigUChar;
pub extern fn onigenc_init() c_int;
pub extern fn onig_initialize_encoding(enc: OnigEncoding) c_int;
pub extern fn onigenc_set_default_encoding(enc: OnigEncoding) c_int;
pub extern fn onigenc_get_default_encoding() OnigEncoding;
pub extern fn onigenc_set_default_caseconv_table(table: [*c]const OnigUChar) void;
pub extern fn onigenc_get_right_adjust_char_head_with_prev(enc: OnigEncoding, start: [*c]const OnigUChar, s: [*c]const OnigUChar, prev: [*c][*c]const OnigUChar) [*c]OnigUChar;
pub extern fn onigenc_get_prev_char_head(enc: OnigEncoding, start: [*c]const OnigUChar, s: [*c]const OnigUChar) [*c]OnigUChar;
pub extern fn onigenc_get_left_adjust_char_head(enc: OnigEncoding, start: [*c]const OnigUChar, s: [*c]const OnigUChar) [*c]OnigUChar;
pub extern fn onigenc_get_right_adjust_char_head(enc: OnigEncoding, start: [*c]const OnigUChar, s: [*c]const OnigUChar) [*c]OnigUChar;
pub extern fn onigenc_strlen(enc: OnigEncoding, p: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_strlen_null(enc: OnigEncoding, p: [*c]const OnigUChar) c_int;
pub extern fn onigenc_str_bytelen_null(enc: OnigEncoding, p: [*c]const OnigUChar) c_int;
pub extern fn onigenc_is_valid_mbc_string(enc: OnigEncoding, s: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_strdup(enc: OnigEncoding, s: [*c]const OnigUChar, end: [*c]const OnigUChar) [*c]OnigUChar;
pub const OnigOptionType = c_uint;
const struct_unnamed_4 = extern struct {
    op: c_uint,
    op2: c_uint,
    behavior: c_uint,
    options: OnigOptionType,
    meta_char_table: OnigMetaCharTableType,
};
pub const OnigSyntaxType = struct_unnamed_4;
pub extern var OnigSyntaxASIS: OnigSyntaxType;
pub extern var OnigSyntaxPosixBasic: OnigSyntaxType;
pub extern var OnigSyntaxPosixExtended: OnigSyntaxType;
pub extern var OnigSyntaxEmacs: OnigSyntaxType;
pub extern var OnigSyntaxGrep: OnigSyntaxType;
pub extern var OnigSyntaxGnuRegex: OnigSyntaxType;
pub extern var OnigSyntaxJava: OnigSyntaxType;
pub extern var OnigSyntaxPerl: OnigSyntaxType;
pub extern var OnigSyntaxPerl_NG: OnigSyntaxType;
pub extern var OnigSyntaxRuby: OnigSyntaxType;
pub extern var OnigSyntaxPython: OnigSyntaxType;
pub extern var OnigSyntaxOniguruma: OnigSyntaxType;
pub extern var OnigDefaultSyntax: [*c]OnigSyntaxType;
pub const struct_OnigCaptureTreeNodeStruct = extern struct {
    group: c_int,
    beg: c_int,
    end: c_int,
    allocated: c_int,
    num_childs: c_int,
    childs: [*c][*c]struct_OnigCaptureTreeNodeStruct,
};
pub const OnigCaptureTreeNode = struct_OnigCaptureTreeNodeStruct;
pub const struct_re_registers = extern struct {
    allocated: c_int,
    num_regs: c_int,
    beg: [*c]c_int,
    end: [*c]c_int,
    history_root: [*c]OnigCaptureTreeNode,
};
pub const OnigRegion = struct_re_registers;
const struct_unnamed_5 = extern struct {
    enc: OnigEncoding,
    par: [*c]OnigUChar,
    par_end: [*c]OnigUChar,
};
pub const OnigErrorInfo = struct_unnamed_5;
const struct_unnamed_6 = extern struct {
    lower: c_int,
    upper: c_int,
};
pub const OnigRepeatRange = struct_unnamed_6;
pub const OnigWarnFunc = ?fn ([*c]const u8) callconv(.C) void;
pub extern fn onig_null_warn(s: [*c]const u8) void;
pub const struct_re_pattern_buffer = opaque {};
pub const OnigRegexType = struct_re_pattern_buffer;
pub const OnigRegex = ?*OnigRegexType;
pub const regex_t = OnigRegexType;
pub const struct_OnigRegSetStruct = opaque {};
pub const OnigRegSet = struct_OnigRegSetStruct;
pub const ONIG_REGSET_POSITION_LEAD = @enumToInt(enum_unnamed_7.ONIG_REGSET_POSITION_LEAD);
pub const ONIG_REGSET_REGEX_LEAD = @enumToInt(enum_unnamed_7.ONIG_REGSET_REGEX_LEAD);
pub const ONIG_REGSET_PRIORITY_TO_REGEX_ORDER = @enumToInt(enum_unnamed_7.ONIG_REGSET_PRIORITY_TO_REGEX_ORDER);
const enum_unnamed_7 = extern enum(c_int) {
    ONIG_REGSET_POSITION_LEAD = 0,
    ONIG_REGSET_REGEX_LEAD = 1,
    ONIG_REGSET_PRIORITY_TO_REGEX_ORDER = 2,
    _,
};
pub const OnigRegSetLead = enum_unnamed_7;
const struct_unnamed_8 = extern struct {
    num_of_elements: c_int,
    pattern_enc: OnigEncoding,
    target_enc: OnigEncoding,
    syntax: [*c]OnigSyntaxType,
    option: OnigOptionType,
    case_fold_flag: OnigCaseFoldType,
};
pub const OnigCompileInfo = struct_unnamed_8;
pub const ONIG_CALLOUT_IN_PROGRESS = @enumToInt(enum_unnamed_9.ONIG_CALLOUT_IN_PROGRESS);
pub const ONIG_CALLOUT_IN_RETRACTION = @enumToInt(enum_unnamed_9.ONIG_CALLOUT_IN_RETRACTION);
const enum_unnamed_9 = extern enum(c_int) {
    ONIG_CALLOUT_IN_PROGRESS = 1,
    ONIG_CALLOUT_IN_RETRACTION = 2,
    _,
};
pub const OnigCalloutIn = enum_unnamed_9;
pub const ONIG_CALLOUT_OF_CONTENTS = @enumToInt(enum_unnamed_10.ONIG_CALLOUT_OF_CONTENTS);
pub const ONIG_CALLOUT_OF_NAME = @enumToInt(enum_unnamed_10.ONIG_CALLOUT_OF_NAME);
const enum_unnamed_10 = extern enum(c_int) {
    ONIG_CALLOUT_OF_CONTENTS = 0,
    ONIG_CALLOUT_OF_NAME = 1,
    _,
};
pub const OnigCalloutOf = enum_unnamed_10;
pub const ONIG_CALLOUT_TYPE_SINGLE = @enumToInt(enum_unnamed_11.ONIG_CALLOUT_TYPE_SINGLE);
pub const ONIG_CALLOUT_TYPE_START_CALL = @enumToInt(enum_unnamed_11.ONIG_CALLOUT_TYPE_START_CALL);
pub const ONIG_CALLOUT_TYPE_BOTH_CALL = @enumToInt(enum_unnamed_11.ONIG_CALLOUT_TYPE_BOTH_CALL);
pub const ONIG_CALLOUT_TYPE_START_MARK_END_CALL = @enumToInt(enum_unnamed_11.ONIG_CALLOUT_TYPE_START_MARK_END_CALL);
const enum_unnamed_11 = extern enum(c_int) {
    ONIG_CALLOUT_TYPE_SINGLE = 0,
    ONIG_CALLOUT_TYPE_START_CALL = 1,
    ONIG_CALLOUT_TYPE_BOTH_CALL = 2,
    ONIG_CALLOUT_TYPE_START_MARK_END_CALL = 3,
    _,
};
pub const OnigCalloutType = enum_unnamed_11;
pub const struct_OnigCalloutArgsStruct = opaque {};
pub const OnigCalloutArgs = struct_OnigCalloutArgsStruct;
pub const OnigCalloutFunc = ?fn (?*OnigCalloutArgs, ?*c_void) callconv(.C) c_int;
pub const ONIG_CALLOUT_FAIL = @enumToInt(enum_unnamed_12.ONIG_CALLOUT_FAIL);
pub const ONIG_CALLOUT_SUCCESS = @enumToInt(enum_unnamed_12.ONIG_CALLOUT_SUCCESS);
const enum_unnamed_12 = extern enum(c_int) {
    ONIG_CALLOUT_FAIL = 1,
    ONIG_CALLOUT_SUCCESS = 0,
    _,
};
pub const OnigCalloutResult = enum_unnamed_12;
pub const ONIG_TYPE_VOID = @enumToInt(enum_unnamed_13.ONIG_TYPE_VOID);
pub const ONIG_TYPE_LONG = @enumToInt(enum_unnamed_13.ONIG_TYPE_LONG);
pub const ONIG_TYPE_CHAR = @enumToInt(enum_unnamed_13.ONIG_TYPE_CHAR);
pub const ONIG_TYPE_STRING = @enumToInt(enum_unnamed_13.ONIG_TYPE_STRING);
pub const ONIG_TYPE_POINTER = @enumToInt(enum_unnamed_13.ONIG_TYPE_POINTER);
pub const ONIG_TYPE_TAG = @enumToInt(enum_unnamed_13.ONIG_TYPE_TAG);
const enum_unnamed_13 = extern enum(c_int) {
    ONIG_TYPE_VOID = 0,
    ONIG_TYPE_LONG = 1,
    ONIG_TYPE_CHAR = 2,
    ONIG_TYPE_STRING = 4,
    ONIG_TYPE_POINTER = 8,
    ONIG_TYPE_TAG = 16,
    _,
};
pub const OnigType = enum_unnamed_13;
const struct_unnamed_15 = extern struct {
    start: [*c]OnigUChar,
    end: [*c]OnigUChar,
};
const union_unnamed_14 = extern union {
    l: c_long,
    c: OnigCodePoint,
    s: struct_unnamed_15,
    p: ?*c_void,
    tag: c_int,
};
pub const OnigValue = union_unnamed_14;
pub const struct_OnigMatchParamStruct = opaque {};
pub const OnigMatchParam = struct_OnigMatchParamStruct;
pub extern fn onig_initialize(encodings: [*c]OnigEncoding, number_of_encodings: c_int) c_int;
pub extern fn onig_init() c_int;
pub extern fn onig_error_code_to_str(s: [*c]OnigUChar, err_code: c_int, ...) c_int;
pub extern fn onig_is_error_code_needs_param(code: c_int) c_int;
pub extern fn onig_set_warn_func(f: OnigWarnFunc) void;
pub extern fn onig_set_verb_warn_func(f: OnigWarnFunc) void;
pub extern fn onig_new([*c]OnigRegex, pattern: [*c]const OnigUChar, pattern_end: [*c]const OnigUChar, option: OnigOptionType, enc: OnigEncoding, syntax: [*c]OnigSyntaxType, einfo: [*c]OnigErrorInfo) c_int;
pub extern fn onig_reg_init(reg: OnigRegex, option: OnigOptionType, case_fold_flag: OnigCaseFoldType, enc: OnigEncoding, syntax: [*c]OnigSyntaxType) c_int;
pub extern fn onig_new_without_alloc(OnigRegex, pattern: [*c]const OnigUChar, pattern_end: [*c]const OnigUChar, option: OnigOptionType, enc: OnigEncoding, syntax: [*c]OnigSyntaxType, einfo: [*c]OnigErrorInfo) c_int;
pub extern fn onig_new_deluxe(reg: [*c]OnigRegex, pattern: [*c]const OnigUChar, pattern_end: [*c]const OnigUChar, ci: [*c]OnigCompileInfo, einfo: [*c]OnigErrorInfo) c_int;
pub extern fn onig_free(OnigRegex) void;
pub extern fn onig_free_body(OnigRegex) void;
pub extern fn onig_scan(reg: OnigRegex, str: [*c]const OnigUChar, end: [*c]const OnigUChar, region: [*c]OnigRegion, option: OnigOptionType, scan_callback: ?fn (c_int, c_int, [*c]OnigRegion, ?*c_void) callconv(.C) c_int, callback_arg: ?*c_void) c_int;
pub extern fn onig_search(OnigRegex, str: [*c]const OnigUChar, end: [*c]const OnigUChar, start: [*c]const OnigUChar, range: [*c]const OnigUChar, region: [*c]OnigRegion, option: OnigOptionType) c_int;
pub extern fn onig_search_with_param(OnigRegex, str: [*c]const OnigUChar, end: [*c]const OnigUChar, start: [*c]const OnigUChar, range: [*c]const OnigUChar, region: [*c]OnigRegion, option: OnigOptionType, mp: ?*OnigMatchParam) c_int;
pub extern fn onig_match(OnigRegex, str: [*c]const OnigUChar, end: [*c]const OnigUChar, at: [*c]const OnigUChar, region: [*c]OnigRegion, option: OnigOptionType) c_int;
pub extern fn onig_match_with_param(OnigRegex, str: [*c]const OnigUChar, end: [*c]const OnigUChar, at: [*c]const OnigUChar, region: [*c]OnigRegion, option: OnigOptionType, mp: ?*OnigMatchParam) c_int;
pub extern fn onig_regset_new(rset: [*c]?*OnigRegSet, n: c_int, regs: [*c]?*regex_t) c_int;
pub extern fn onig_regset_add(set: ?*OnigRegSet, reg: ?*regex_t) c_int;
pub extern fn onig_regset_replace(set: ?*OnigRegSet, at: c_int, reg: ?*regex_t) c_int;
pub extern fn onig_regset_free(set: ?*OnigRegSet) void;
pub extern fn onig_regset_number_of_regex(set: ?*OnigRegSet) c_int;
pub extern fn onig_regset_get_regex(set: ?*OnigRegSet, at: c_int) ?*regex_t;
pub extern fn onig_regset_get_region(set: ?*OnigRegSet, at: c_int) [*c]OnigRegion;
pub extern fn onig_regset_search(set: ?*OnigRegSet, str: [*c]const OnigUChar, end: [*c]const OnigUChar, start: [*c]const OnigUChar, range: [*c]const OnigUChar, lead: OnigRegSetLead, option: OnigOptionType, rmatch_pos: [*c]c_int) c_int;
pub extern fn onig_regset_search_with_param(set: ?*OnigRegSet, str: [*c]const OnigUChar, end: [*c]const OnigUChar, start: [*c]const OnigUChar, range: [*c]const OnigUChar, lead: OnigRegSetLead, option: OnigOptionType, mps: [*c]?*OnigMatchParam, rmatch_pos: [*c]c_int) c_int;
pub extern fn onig_region_new() [*c]OnigRegion;
pub extern fn onig_region_init(region: [*c]OnigRegion) void;
pub extern fn onig_region_free(region: [*c]OnigRegion, free_self: c_int) void;
pub extern fn onig_region_copy(to: [*c]OnigRegion, from: [*c]OnigRegion) void;
pub extern fn onig_region_clear(region: [*c]OnigRegion) void;
pub extern fn onig_region_resize(region: [*c]OnigRegion, n: c_int) c_int;
pub extern fn onig_region_set(region: [*c]OnigRegion, at: c_int, beg: c_int, end: c_int) c_int;
pub extern fn onig_name_to_group_numbers(reg: OnigRegex, name: [*c]const OnigUChar, name_end: [*c]const OnigUChar, nums: [*c][*c]c_int) c_int;
pub extern fn onig_name_to_backref_number(reg: OnigRegex, name: [*c]const OnigUChar, name_end: [*c]const OnigUChar, region: [*c]OnigRegion) c_int;
pub extern fn onig_foreach_name(reg: OnigRegex, func: ?fn ([*c]const OnigUChar, [*c]const OnigUChar, c_int, [*c]c_int, OnigRegex, ?*c_void) callconv(.C) c_int, arg: ?*c_void) c_int;
pub extern fn onig_number_of_names(reg: OnigRegex) c_int;
pub extern fn onig_number_of_captures(reg: OnigRegex) c_int;
pub extern fn onig_number_of_capture_histories(reg: OnigRegex) c_int;
pub extern fn onig_get_capture_tree(region: [*c]OnigRegion) [*c]OnigCaptureTreeNode;
pub extern fn onig_capture_tree_traverse(region: [*c]OnigRegion, at: c_int, callback_func: ?fn (c_int, c_int, c_int, c_int, c_int, ?*c_void) callconv(.C) c_int, arg: ?*c_void) c_int;
pub extern fn onig_noname_group_capture_is_active(reg: OnigRegex) c_int;
pub extern fn onig_get_encoding(reg: OnigRegex) OnigEncoding;
pub extern fn onig_get_options(reg: OnigRegex) OnigOptionType;
pub extern fn onig_get_case_fold_flag(reg: OnigRegex) OnigCaseFoldType;
pub extern fn onig_get_syntax(reg: OnigRegex) [*c]OnigSyntaxType;
pub extern fn onig_set_default_syntax(syntax: [*c]OnigSyntaxType) c_int;
pub extern fn onig_copy_syntax(to: [*c]OnigSyntaxType, from: [*c]OnigSyntaxType) void;
pub extern fn onig_get_syntax_op(syntax: [*c]OnigSyntaxType) c_uint;
pub extern fn onig_get_syntax_op2(syntax: [*c]OnigSyntaxType) c_uint;
pub extern fn onig_get_syntax_behavior(syntax: [*c]OnigSyntaxType) c_uint;
pub extern fn onig_get_syntax_options(syntax: [*c]OnigSyntaxType) OnigOptionType;
pub extern fn onig_set_syntax_op(syntax: [*c]OnigSyntaxType, op: c_uint) void;
pub extern fn onig_set_syntax_op2(syntax: [*c]OnigSyntaxType, op2: c_uint) void;
pub extern fn onig_set_syntax_behavior(syntax: [*c]OnigSyntaxType, behavior: c_uint) void;
pub extern fn onig_set_syntax_options(syntax: [*c]OnigSyntaxType, options: OnigOptionType) void;
pub extern fn onig_set_meta_char(syntax: [*c]OnigSyntaxType, what: c_uint, code: OnigCodePoint) c_int;
pub extern fn onig_copy_encoding(to: OnigEncoding, from: OnigEncoding) void;
pub extern fn onig_get_default_case_fold_flag() OnigCaseFoldType;
pub extern fn onig_set_default_case_fold_flag(case_fold_flag: OnigCaseFoldType) c_int;
pub extern fn onig_get_match_stack_limit_size() c_uint;
pub extern fn onig_set_match_stack_limit_size(size: c_uint) c_int;
pub extern fn onig_get_retry_limit_in_match() c_ulong;
pub extern fn onig_set_retry_limit_in_match(n: c_ulong) c_int;
pub extern fn onig_get_retry_limit_in_search() c_ulong;
pub extern fn onig_set_retry_limit_in_search(n: c_ulong) c_int;
pub extern fn onig_get_parse_depth_limit() c_uint;
pub extern fn onig_set_capture_num_limit(num: c_int) c_int;
pub extern fn onig_set_parse_depth_limit(depth: c_uint) c_int;
pub extern fn onig_get_subexp_call_limit_in_search() c_ulong;
pub extern fn onig_set_subexp_call_limit_in_search(n: c_ulong) c_int;
pub extern fn onig_get_subexp_call_max_nest_level() c_int;
pub extern fn onig_set_subexp_call_max_nest_level(level: c_int) c_int;
pub extern fn onig_unicode_define_user_property(name: [*c]const u8, ranges: [*c]OnigCodePoint) c_int;
pub extern fn onig_end() c_int;
pub extern fn onig_version() [*c]const u8;
pub extern fn onig_copyright() [*c]const u8;
pub extern fn onig_new_match_param() ?*OnigMatchParam;
pub extern fn onig_free_match_param(p: ?*OnigMatchParam) void;
pub extern fn onig_free_match_param_content(p: ?*OnigMatchParam) void;
pub extern fn onig_initialize_match_param(mp: ?*OnigMatchParam) c_int;
pub extern fn onig_set_match_stack_limit_size_of_match_param(param: ?*OnigMatchParam, limit: c_uint) c_int;
pub extern fn onig_set_retry_limit_in_match_of_match_param(param: ?*OnigMatchParam, limit: c_ulong) c_int;
pub extern fn onig_set_retry_limit_in_search_of_match_param(param: ?*OnigMatchParam, limit: c_ulong) c_int;
pub extern fn onig_set_progress_callout_of_match_param(param: ?*OnigMatchParam, f: OnigCalloutFunc) c_int;
pub extern fn onig_set_retraction_callout_of_match_param(param: ?*OnigMatchParam, f: OnigCalloutFunc) c_int;
pub extern fn onig_set_callout_user_data_of_match_param(param: ?*OnigMatchParam, user_data: ?*c_void) c_int;
pub extern fn onig_get_progress_callout() OnigCalloutFunc;
pub extern fn onig_set_progress_callout(f: OnigCalloutFunc) c_int;
pub extern fn onig_get_retraction_callout() OnigCalloutFunc;
pub extern fn onig_set_retraction_callout(f: OnigCalloutFunc) c_int;
pub extern fn onig_set_callout_of_name(enc: OnigEncoding, type: OnigCalloutType, name: [*c]OnigUChar, name_end: [*c]OnigUChar, callout_in: c_int, callout: OnigCalloutFunc, end_callout: OnigCalloutFunc, arg_num: c_int, arg_types: [*c]c_uint, optional_arg_num: c_int, opt_defaults: [*c]OnigValue) c_int;
pub extern fn onig_get_callout_name_by_name_id(id: c_int) [*c]OnigUChar;
pub extern fn onig_get_callout_num_by_tag(reg: OnigRegex, tag: [*c]const OnigUChar, tag_end: [*c]const OnigUChar) c_int;
pub extern fn onig_get_callout_data_by_tag(reg: OnigRegex, mp: ?*OnigMatchParam, tag: [*c]const OnigUChar, tag_end: [*c]const OnigUChar, slot: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_set_callout_data_by_tag(reg: OnigRegex, mp: ?*OnigMatchParam, tag: [*c]const OnigUChar, tag_end: [*c]const OnigUChar, slot: c_int, type: OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_callout_num_by_callout_args(args: ?*OnigCalloutArgs) c_int;
pub extern fn onig_get_callout_in_by_callout_args(args: ?*OnigCalloutArgs) OnigCalloutIn;
pub extern fn onig_get_name_id_by_callout_args(args: ?*OnigCalloutArgs) c_int;
pub extern fn onig_get_contents_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_contents_end_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_args_num_by_callout_args(args: ?*OnigCalloutArgs) c_int;
pub extern fn onig_get_passed_args_num_by_callout_args(args: ?*OnigCalloutArgs) c_int;
pub extern fn onig_get_arg_by_callout_args(args: ?*OnigCalloutArgs, index: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_string_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_string_end_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_start_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_right_range_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_current_by_callout_args(args: ?*OnigCalloutArgs) [*c]const OnigUChar;
pub extern fn onig_get_regex_by_callout_args(args: ?*OnigCalloutArgs) OnigRegex;
pub extern fn onig_get_retry_counter_by_callout_args(args: ?*OnigCalloutArgs) c_ulong;
pub extern fn onig_callout_tag_is_exist_at_callout_num(reg: OnigRegex, callout_num: c_int) c_int;
pub extern fn onig_get_callout_tag_start(reg: OnigRegex, callout_num: c_int) [*c]const OnigUChar;
pub extern fn onig_get_callout_tag_end(reg: OnigRegex, callout_num: c_int) [*c]const OnigUChar;
pub extern fn onig_get_callout_data_dont_clear_old(reg: OnigRegex, mp: ?*OnigMatchParam, callout_num: c_int, slot: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_callout_data_by_callout_args_self_dont_clear_old(args: ?*OnigCalloutArgs, slot: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_callout_data(reg: OnigRegex, mp: ?*OnigMatchParam, callout_num: c_int, slot: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_callout_data_by_callout_args(args: ?*OnigCalloutArgs, callout_num: c_int, slot: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_callout_data_by_callout_args_self(args: ?*OnigCalloutArgs, slot: c_int, type: [*c]OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_set_callout_data(reg: OnigRegex, mp: ?*OnigMatchParam, callout_num: c_int, slot: c_int, type: OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_set_callout_data_by_callout_args(args: ?*OnigCalloutArgs, callout_num: c_int, slot: c_int, type: OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_set_callout_data_by_callout_args_self(args: ?*OnigCalloutArgs, slot: c_int, type: OnigType, val: [*c]OnigValue) c_int;
pub extern fn onig_get_capture_range_in_callout(args: ?*OnigCalloutArgs, mem_num: c_int, begin: [*c]c_int, end: [*c]c_int) c_int;
pub extern fn onig_get_used_stack_size_in_callout(args: ?*OnigCalloutArgs, used_num: [*c]c_int, used_bytes: [*c]c_int) c_int;
pub extern fn onig_builtin_fail(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_builtin_mismatch(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_builtin_error(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_builtin_count(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_builtin_total_count(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_builtin_max(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_builtin_cmp(args: ?*OnigCalloutArgs, user_data: ?*c_void) c_int;
pub extern fn onig_setup_builtin_monitors_by_ascii_encoded_name(fp: ?*c_void) c_int;
const struct_unnamed_16 = extern struct {
    from: OnigCodePoint,
    to: OnigCodePoint,
};
pub const OnigPairCaseFoldCodes = struct_unnamed_16;
const struct_unnamed_17 = extern struct {
    name: [*c]OnigUChar,
    ctype: c_int,
    len: c_short,
};
pub const PosixBracketEntryType = struct_unnamed_17;
pub const struct_PropertyNameCtype = extern struct {
    name: [*c]u8,
    ctype: c_int,
};
pub extern fn onigenc_end() c_int;
pub extern fn onigenc_ascii_apply_all_case_fold(flag: OnigCaseFoldType, f: OnigApplyAllCaseFoldFunc, arg: ?*c_void) c_int;
pub extern fn onigenc_ascii_get_case_fold_codes_by_str(flag: OnigCaseFoldType, p: [*c]const OnigUChar, end: [*c]const OnigUChar, items: [*c]OnigCaseFoldCodeItem) c_int;
pub extern fn onigenc_apply_all_case_fold_with_map(map_size: c_int, map: [*c]const OnigPairCaseFoldCodes, ess_tsett_flag: c_int, flag: OnigCaseFoldType, f: OnigApplyAllCaseFoldFunc, arg: ?*c_void) c_int;
pub extern fn onigenc_get_case_fold_codes_by_str_with_map(map_size: c_int, map: [*c]const OnigPairCaseFoldCodes, ess_tsett_flag: c_int, flag: OnigCaseFoldType, p: [*c]const OnigUChar, end: [*c]const OnigUChar, items: [*c]OnigCaseFoldCodeItem) c_int;
pub extern fn onigenc_not_support_get_ctype_code_range(ctype: OnigCtype, sb_out: [*c]OnigCodePoint, ranges: [*c][*c]const OnigCodePoint) c_int;
pub extern fn onigenc_is_mbc_newline_0x0a(p: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_ascii_mbc_case_fold(flag: OnigCaseFoldType, p: [*c][*c]const OnigUChar, end: [*c]const OnigUChar, lower: [*c]OnigUChar) c_int;
pub extern fn onigenc_single_byte_mbc_enc_len(p: [*c]const OnigUChar) c_int;
pub extern fn onigenc_single_byte_mbc_to_code(p: [*c]const OnigUChar, end: [*c]const OnigUChar) OnigCodePoint;
pub extern fn onigenc_single_byte_code_to_mbclen(code: OnigCodePoint) c_int;
pub extern fn onigenc_single_byte_code_to_mbc(code: OnigCodePoint, buf: [*c]OnigUChar) c_int;
pub extern fn onigenc_single_byte_left_adjust_char_head(start: [*c]const OnigUChar, s: [*c]const OnigUChar) [*c]OnigUChar;
pub extern fn onigenc_always_true_is_allowed_reverse_match(s: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_always_false_is_allowed_reverse_match(s: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_always_true_is_valid_mbc_string(s: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_length_check_is_valid_mbc_string(enc: OnigEncoding, s: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_mbn_mbc_to_code(enc: OnigEncoding, p: [*c]const OnigUChar, end: [*c]const OnigUChar) OnigCodePoint;
pub extern fn onigenc_mbn_mbc_case_fold(enc: OnigEncoding, flag: OnigCaseFoldType, p: [*c][*c]const OnigUChar, end: [*c]const OnigUChar, lower: [*c]OnigUChar) c_int;
pub extern fn onigenc_mb2_code_to_mbc(enc: OnigEncoding, code: OnigCodePoint, buf: [*c]OnigUChar) c_int;
pub extern fn onigenc_minimum_property_name_to_ctype(enc: OnigEncoding, p: [*c]OnigUChar, end: [*c]OnigUChar) c_int;
pub extern fn onigenc_unicode_property_name_to_ctype(enc: OnigEncoding, p: [*c]OnigUChar, end: [*c]OnigUChar) c_int;
pub extern fn onigenc_is_mbc_word_ascii(enc: OnigEncoding, s: [*c]OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_mb2_is_code_ctype(enc: OnigEncoding, code: OnigCodePoint, ctype: c_uint) c_int;
pub extern fn onigenc_mb4_code_to_mbc(enc: OnigEncoding, code: OnigCodePoint, buf: [*c]OnigUChar) c_int;
pub extern fn onigenc_mb4_is_code_ctype(enc: OnigEncoding, code: OnigCodePoint, ctype: c_uint) c_int;
pub extern fn onigenc_euc_jp_lookup_property_name(str: [*c]const u8, len: usize) [*c]struct_PropertyNameCtype;
pub extern fn onigenc_sjis_lookup_property_name(str: [*c]const u8, len: usize) [*c]struct_PropertyNameCtype;
pub extern fn onigenc_unicode_is_code_ctype(code: OnigCodePoint, ctype: c_uint) c_int;
pub extern fn onigenc_utf16_32_get_ctype_code_range(ctype: OnigCtype, sb_out: [*c]OnigCodePoint, ranges: [*c][*c]const OnigCodePoint) c_int;
pub extern fn onigenc_unicode_ctype_code_range(ctype: OnigCtype, ranges: [*c][*c]const OnigCodePoint) c_int;
pub extern fn onigenc_unicode_get_case_fold_codes_by_str(enc: OnigEncoding, flag: OnigCaseFoldType, p: [*c]const OnigUChar, end: [*c]const OnigUChar, items: [*c]OnigCaseFoldCodeItem) c_int;
pub extern fn onigenc_unicode_mbc_case_fold(enc: OnigEncoding, flag: OnigCaseFoldType, pp: [*c][*c]const OnigUChar, end: [*c]const OnigUChar, fold: [*c]OnigUChar) c_int;
pub extern fn onigenc_unicode_apply_all_case_fold(flag: OnigCaseFoldType, f: OnigApplyAllCaseFoldFunc, arg: ?*c_void) c_int;
pub extern fn onigenc_egcb_is_break_position(enc: OnigEncoding, p: [*c]OnigUChar, prev: [*c]OnigUChar, start: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onigenc_wb_is_break_position(enc: OnigEncoding, p: [*c]OnigUChar, prev: [*c]OnigUChar, start: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern var OnigUnicodeFolds1: [*c]OnigCodePoint;
pub extern var OnigUnicodeFolds2: [*c]OnigCodePoint;
pub extern var OnigUnicodeFolds3: [*c]OnigCodePoint;
pub const struct_ByUnfoldKey = extern struct {
    code: OnigCodePoint,
    index: c_short,
    fold_len: c_short,
};
pub extern fn onigenc_unicode_unfold_key(code: OnigCodePoint) [*c]const struct_ByUnfoldKey;
pub extern fn onigenc_unicode_fold1_key(code: [*c]OnigCodePoint) c_int;
pub extern fn onigenc_unicode_fold2_key(code: [*c]OnigCodePoint) c_int;
pub extern fn onigenc_unicode_fold3_key(code: [*c]OnigCodePoint) c_int;
pub extern fn onig_codes_cmp(a: [*c]OnigCodePoint, b: [*c]OnigCodePoint, n: c_int) c_int;
pub extern fn onig_codes_byte_at(code: [*c]OnigCodePoint, at: c_int) c_int;
pub extern const OnigEncISO_8859_1_ToLowerCaseTable: [*c]const OnigUChar;
pub extern const OnigEncISO_8859_1_ToUpperCaseTable: [*c]const OnigUChar;
pub extern fn onigenc_with_ascii_strncmp(enc: OnigEncoding, p: [*c]const OnigUChar, end: [*c]const OnigUChar, sascii: [*c]const OnigUChar, n: c_int) c_int;
pub extern fn onigenc_step(enc: OnigEncoding, p: [*c]const OnigUChar, end: [*c]const OnigUChar, n: c_int) [*c]OnigUChar;
pub extern fn onig_is_in_code_range(p: [*c]const OnigUChar, code: OnigCodePoint) c_int;
pub extern var OnigEncDefaultCharEncoding: OnigEncoding;
pub extern const OnigEncAsciiToLowerCaseTable: [*c]const OnigUChar;
pub extern const OnigEncAsciiToUpperCaseTable: [*c]const OnigUChar;
pub extern const OnigEncAsciiCtypeTable: [*c]const c_ushort;
pub const EncISO_8859_16_ToLowerCaseTable: [256]OnigUChar = [256]OnigUChar{
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x00'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x01'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x02'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x03'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x04'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x05'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x06'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x07'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x08'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\t'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\n'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x0b'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x0c'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\r'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x0e'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x0f'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x10'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x11'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x12'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x13'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x14'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x15'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x16'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x17'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x18'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x19'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x1a'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x1b'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x1c'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x1d'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x1e'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x1f'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, ' '))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '!'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\"'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '#'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '$'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '%'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '&'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\''))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '('))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, ')'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '*'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '+'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, ','))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '-'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '.'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '/'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '0'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '1'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '2'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '3'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '4'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '5'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '6'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '7'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '8'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '9'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, ':'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, ';'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '<'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '='))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '>'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '?'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '@'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'a'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'b'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'c'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'd'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'e'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'f'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'g'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'h'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'i'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'j'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'k'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'l'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'm'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'n'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'o'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'p'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'q'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'r'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 's'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 't'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'u'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'v'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'w'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'x'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'y'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'z'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '['))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\\'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, ']'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '^'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '_'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '`'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'a'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'b'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'c'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'd'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'e'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'f'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'g'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'h'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'i'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'j'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'k'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'l'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'm'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'n'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'o'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'p'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'q'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'r'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 's'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 't'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'u'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'v'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'w'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'x'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'y'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 'z'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '{'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '|'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '}'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '~'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x7f'))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967168))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967169))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967170))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967171))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967172))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967173))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967174))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967175))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967176))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967177))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967178))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967179))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967180))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967181))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967182))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967183))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967184))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967185))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967186))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967187))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967188))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967189))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967190))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967191))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967192))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967193))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967194))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967195))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967196))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967197))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967198))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967199))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967200))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967202))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967202))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967219))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967205))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967205))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967208))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967207))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967208))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967209))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967226))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967211))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967214))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967213))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967214))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967231))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967216))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967217))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967225))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967219))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967224))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967221))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967222))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967223))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967224))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967225))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967226))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967227))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967229))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967229))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967295))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967231))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967264))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967265))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967266))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967267))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967268))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967269))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967270))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967271))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967272))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967273))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967274))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967275))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967276))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967277))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967278))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967279))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967280))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967281))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967282))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967283))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967284))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967285))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967286))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967287))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967288))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967289))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967290))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967291))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967292))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967293))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967294))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967263))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967264))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967265))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967266))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967267))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967268))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967269))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967270))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967271))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967272))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967273))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967274))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967275))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967276))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967277))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967278))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967279))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967280))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967281))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967282))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967283))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967284))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967285))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967286))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967287))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967288))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967289))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967290))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967291))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967292))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967293))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967294))),
    @bitCast(OnigUChar, @truncate(i8, @as(c_int, 4294967295))),
};
pub const EncISO_8859_16_CtypeTable: [256]c_ushort = [256]c_ushort{
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16908))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16905))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16904))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16904))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16904))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 17028))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 31906))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 31906))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 31906))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 31906))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 31906))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 31906))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 29858))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 20896))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30946))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30946))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30946))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30946))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30946))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 30946))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 28898))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16800))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 16392))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 8))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 644))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 160))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 416))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 160))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 160))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 416))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 416))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 160))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 160))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 416))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 160))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 416))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 416))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 13474))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
    @bitCast(c_ushort, @truncate(c_short, @as(c_int, 12514))),
};
pub fn mbc_case_fold(arg_flag: OnigCaseFoldType, arg_pp: [*c][*c]const OnigUChar, arg_end: [*c]const OnigUChar, arg_lower: [*c]OnigUChar) callconv(.C) c_int {
    var flag = arg_flag;
    var pp = arg_pp;
    var end = arg_end;
    var lower = arg_lower;
    var p: [*c]const OnigUChar = pp.?.*;
    if ((@bitCast(c_int, @as(c_uint, p.?.*)) == @as(c_int, 223)) and ((flag & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 30)))) != @bitCast(c_uint, @as(c_int, 0)))) {
        (blk: {
            const ref = &lower;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).?.* = @bitCast(OnigUChar, @truncate(i8, @as(c_int, 's')));
        lower.?.* = @bitCast(OnigUChar, @truncate(i8, @as(c_int, 's')));
        (pp.?.*) += 1;
        return 2;
    }
    if ((((flag) & @bitCast(c_uint, (@as(c_int, 1)))) == @bitCast(c_uint, @as(c_int, 0))) or (@bitCast(c_int, @as(c_uint, (p.?.*))) < @as(c_int, 128))) lower.?.* = EncISO_8859_16_ToLowerCaseTable[p.?.*] else lower.?.* = p.?.*;
    (pp.?.*) += 1;
    return 1;
}
pub fn is_code_ctype(arg_code: OnigCodePoint, arg_ctype: c_uint) callconv(.C) c_int {
    var code = arg_code;
    var ctype = arg_ctype;
    if (code < @bitCast(c_uint, @as(c_int, 256))) return @boolToInt(((@bitCast(c_int, @as(c_uint, EncISO_8859_16_CtypeTable[code])) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (ctype)))) != @as(c_int, 0))) else return 0;
    return 0;
}
pub const CaseFoldMap: [41]OnigPairCaseFoldCodes = [41]OnigPairCaseFoldCodes{
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 161)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 162)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 163)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 179)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 166)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 168)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 170)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 186)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 172)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 174)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 175)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 191)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 178)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 185)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 180)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 184)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 188)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 189)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 190)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 255)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 192)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 224)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 193)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 225)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 194)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 226)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 195)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 227)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 196)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 228)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 197)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 229)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 198)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 230)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 199)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 231)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 200)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 232)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 201)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 233)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 202)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 234)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 203)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 235)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 204)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 236)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 205)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 237)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 206)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 238)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 207)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 239)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 208)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 240)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 209)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 241)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 210)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 242)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 211)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 243)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 212)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 244)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 213)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 245)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 214)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 246)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 215)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 247)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 216)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 248)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 217)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 249)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 218)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 250)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 219)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 251)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 220)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 252)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 221)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 253)),
    },
    OnigPairCaseFoldCodes{
        .from = @bitCast(OnigCodePoint, @as(c_int, 222)),
        .to = @bitCast(OnigCodePoint, @as(c_int, 254)),
    },
};
pub fn apply_all_case_fold(arg_flag: OnigCaseFoldType, arg_f: OnigApplyAllCaseFoldFunc, arg_arg: ?*c_void) callconv(.C) c_int {
    var flag = arg_flag;
    var f = arg_f;
    var arg = arg_arg;
    return onigenc_apply_all_case_fold_with_map(@bitCast(c_int, @truncate(c_uint, (@sizeOf([41]OnigPairCaseFoldCodes) / @sizeOf(OnigPairCaseFoldCodes)))), &CaseFoldMap, @as(c_int, 1), flag, f, arg);
}
pub fn get_case_fold_codes_by_str(arg_flag: OnigCaseFoldType, arg_p: [*c]const OnigUChar, arg_end: [*c]const OnigUChar, arg_items: [*c]OnigCaseFoldCodeItem) callconv(.C) c_int {
    var flag = arg_flag;
    var p = arg_p;
    var end = arg_end;
    var items = arg_items;
    return onigenc_get_case_fold_codes_by_str_with_map(@bitCast(c_int, @truncate(c_uint, (@sizeOf([41]OnigPairCaseFoldCodes) / @sizeOf(OnigPairCaseFoldCodes)))), &CaseFoldMap, @as(c_int, 1), flag, p, end, items);
}
pub const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):64:9
pub const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):68:9
pub const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):75:9
pub const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):79:9
pub const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):83:9
pub const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):98:9
pub const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):160:9
pub const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):188:9
pub const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):226:9
pub const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):230:9
pub const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):266:9
pub const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):270:9
pub const ONIG_EXTERN = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // ../oniguruma/src/oniguruma.h:67:9
pub const ONIGENC_MBC_CASE_FOLD = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // ../oniguruma/src/oniguruma.h:264:9
pub const ONIG_OPTION_ON = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ../oniguruma/src/oniguruma.h:406:9
pub const ONIG_OPTION_OFF = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ../oniguruma/src/oniguruma.h:407:9
pub const ONIG_CHECK_NULL_RETURN = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ../oniguruma/src/regenc.h:76:9
pub const ONIG_CHECK_NULL_RETURN_VAL = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ../oniguruma/src/regenc.h:77:9
pub const FOLDS_FOLD_ADDR_BUK = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regenc.h:216:9
pub const __llvm__ = 1;
pub const __clang__ = 1;
pub const __clang_major__ = 11;
pub const __clang_minor__ = 0;
pub const __clang_patchlevel__ = 0;
pub const __clang_version__ = "11.0.0 (https://github.com/ziglang/zig-bootstrap 1c9ef63a4093b52eed142131e64949d87fced62f)";
pub const __GNUC__ = 4;
pub const __GNUC_MINOR__ = 2;
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __GXX_ABI_VERSION = 1002;
pub const __ATOMIC_RELAXED = 0;
pub const __ATOMIC_CONSUME = 1;
pub const __ATOMIC_ACQUIRE = 2;
pub const __ATOMIC_RELEASE = 3;
pub const __ATOMIC_ACQ_REL = 4;
pub const __ATOMIC_SEQ_CST = 5;
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __VERSION__ = "Clang 11.0.0 (https://github.com/ziglang/zig-bootstrap 1c9ef63a4093b52eed142131e64949d87fced62f)";
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __block = __attribute__(__blocks__(byref));
pub const __BLOCKS__ = 1;
pub const __OPTIMIZE__ = 1;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = 1;
pub const _LP64 = 1;
pub const __LP64__ = 1;
pub const __CHAR_BIT__ = 8;
pub const __SCHAR_MAX__ = 127;
pub const __SHRT_MAX__ = 32767;
pub const __INT_MAX__ = 2147483647;
pub const __LONG_MAX__ = @as(c_long, 9223372036854775807);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = 2147483647;
pub const __WINT_MAX__ = 2147483647;
pub const __INTMAX_MAX__ = @as(c_long, 9223372036854775807);
pub const __SIZE_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __UINTMAX_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __PTRDIFF_MAX__ = @as(c_long, 9223372036854775807);
pub const __INTPTR_MAX__ = @as(c_long, 9223372036854775807);
pub const __UINTPTR_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __SIZEOF_DOUBLE__ = 8;
pub const __SIZEOF_FLOAT__ = 4;
pub const __SIZEOF_INT__ = 4;
pub const __SIZEOF_LONG__ = 8;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __SIZEOF_POINTER__ = 8;
pub const __SIZEOF_SHORT__ = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __SIZEOF_WINT_T__ = 4;
pub const __SIZEOF_INT128__ = 16;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __INTMAX_WIDTH__ = 64;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __INTPTR_WIDTH__ = 64;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __SIZE_WIDTH__ = 64;
pub const __WCHAR_TYPE__ = c_int;
pub const __WCHAR_WIDTH__ = 32;
pub const __WINT_TYPE__ = c_int;
pub const __WINT_WIDTH__ = 32;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = 64;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __UINTPTR_WIDTH__ = 64;
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = 1;
pub const __FLT_DIG__ = 6;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __FLT_MAX_10_EXP__ = 38;
pub const __FLT_MAX_EXP__ = 128;
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -37;
pub const __FLT_MIN_EXP__ = -125;
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = 1;
pub const __DBL_DIG__ = 15;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = 1;
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __DBL_MANT_DIG__ = 53;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __DBL_MAX_EXP__ = 1024;
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __DBL_MIN_EXP__ = -1021;
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = 1;
pub const __LDBL_DIG__ = 18;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __LDBL_MIN_EXP__ = -16381;
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = 64;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = LL;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_MAX__ = 255;
pub const __INT8_MAX__ = 127;
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_MAX__ = 65535;
pub const __INT16_MAX__ = 32767;
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = U;
pub const __UINT32_MAX__ = @as(c_uint, 4294967295);
pub const __INT32_MAX__ = 2147483647;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = ULL;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = 127;
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = 255;
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @as(c_uint, 4294967295);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = 127;
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = 255;
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = 32767;
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = 65535;
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @as(c_uint, 4294967295);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = _;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __PIC__ = 2;
pub const __pic__ = 2;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __FLT_RADIX__ = 2;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = 2;
pub const __nonnull = _Nonnull;
pub const __null_unspecified = _Null_unspecified;
pub const __nullable = _Nullable;
pub const __GCC_ASM_FLAG_OUTPUTS__ = 1;
pub const __code_model_small__ = 1;
pub const __amd64__ = 1;
pub const __amd64 = 1;
pub const __x86_64 = 1;
pub const __x86_64__ = 1;
pub const __SEG_GS = 1;
pub const __SEG_FS = 1;
pub const __seg_gs = __attribute__(address_space(256));
pub const __seg_fs = __attribute__(address_space(257));
pub const __corei7 = 1;
pub const __corei7__ = 1;
pub const __tune_corei7__ = 1;
pub const __NO_MATH_INLINES = 1;
pub const __AES__ = 1;
pub const __PCLMUL__ = 1;
pub const __LZCNT__ = 1;
pub const __RDRND__ = 1;
pub const __FSGSBASE__ = 1;
pub const __BMI__ = 1;
pub const __BMI2__ = 1;
pub const __POPCNT__ = 1;
pub const __PRFCHW__ = 1;
pub const __RDSEED__ = 1;
pub const __ADX__ = 1;
pub const __MOVBE__ = 1;
pub const __FMA__ = 1;
pub const __F16C__ = 1;
pub const __FXSR__ = 1;
pub const __XSAVE__ = 1;
pub const __XSAVEOPT__ = 1;
pub const __XSAVEC__ = 1;
pub const __XSAVES__ = 1;
pub const __CLFLUSHOPT__ = 1;
pub const __SGX__ = 1;
pub const __INVPCID__ = 1;
pub const __AVX2__ = 1;
pub const __AVX__ = 1;
pub const __SSE4_2__ = 1;
pub const __SSE4_1__ = 1;
pub const __SSSE3__ = 1;
pub const __SSE3__ = 1;
pub const __SSE2__ = 1;
pub const __SSE2_MATH__ = 1;
pub const __SSE__ = 1;
pub const __SSE_MATH__ = 1;
pub const __MMX__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const __APPLE_CC__ = 6000;
pub const __APPLE__ = 1;
pub const __STDC_NO_THREADS__ = 1;
pub const __weak = __attribute__(objc_gc(weak));
pub const __DYNAMIC__ = 1;
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = 101507;
pub const __MACH__ = 1;
pub const __STDC__ = 1;
pub const __STDC_HOSTED__ = 1;
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = 1;
pub const __STDC_UTF_32__ = 1;
pub const _DEBUG = 1;
pub const HAVE_ALLOCA = 1;
pub const HAVE_ALLOCA_H = 1;
pub const HAVE_DLFCN_H = 1;
pub const HAVE_INTTYPES_H = 1;
pub const HAVE_MEMORY_H = 1;
pub const HAVE_STDINT_H = 1;
pub const HAVE_STDLIB_H = 1;
pub const HAVE_STRINGS_H = 1;
pub const HAVE_STRING_H = 1;
pub const HAVE_SYS_STAT_H = 1;
pub const HAVE_SYS_TIMES_H = 1;
pub const HAVE_SYS_TIME_H = 1;
pub const HAVE_SYS_TYPES_H = 1;
pub const HAVE_UNISTD_H = 1;
pub const LT_OBJDIR = ".libs/";
pub const PACKAGE = "onig";
pub const PACKAGE_BUGREPORT = "";
pub const PACKAGE_NAME = "onig";
pub const PACKAGE_STRING = "onig 6.9.6";
pub const PACKAGE_TARNAME = "onig";
pub const PACKAGE_URL = "";
pub const PACKAGE_VERSION = "6.9.6";
pub const SIZEOF_INT = 4;
pub const SIZEOF_LONG = 8;
pub const SIZEOF_LONG_LONG = 8;
pub const SIZEOF_VOIDP = 8;
pub const STDC_HEADERS = 1;
pub const VERSION = "6.9.6";
pub const NULL = (@import("std").meta.cast(?*c_void, 0));
pub fn offsetof(t: anytype, d: anytype) callconv(.Inline) @TypeOf(__builtin_offsetof(t, d)) {
    return __builtin_offsetof(t, d);
}
pub const ONIGURUMA_VERSION_MAJOR = 6;
pub const ONIGURUMA_VERSION_MINOR = 9;
pub const ONIGURUMA_VERSION_TEENY = 6;
pub const ONIGURUMA_VERSION_INT = 60906;
pub fn P_(args: anytype) callconv(.Inline) @TypeOf(args) {
    return args;
}
pub fn PV_(args: anytype) callconv(.Inline) @TypeOf(args) {
    return args;
}
pub const UChar = OnigUChar;
pub const ONIG_INFINITE_DISTANCE = ~(@import("std").meta.cast(OnigLen, 0));
pub const ONIGENC_CASE_FOLD_ASCII_ONLY = 1;
pub const ONIGENC_CASE_FOLD_TURKISH_AZERI = 1 << 20;
pub const INTERNAL_ONIGENC_CASE_FOLD_MULTI_CHAR = 1 << 30;
pub const ONIGENC_CASE_FOLD_MIN = INTERNAL_ONIGENC_CASE_FOLD_MULTI_CHAR;
pub const ONIGENC_CASE_FOLD_DEFAULT = OnigDefaultCaseFoldFlag;
pub const ONIGENC_MAX_COMP_CASE_FOLD_CODE_LEN = 3;
pub const ONIGENC_GET_CASE_FOLD_CODES_MAX_NUM = 13;
pub fn ONIGENC_CODE_RANGE_NUM(range: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(c_int, range[0]))) {
    return (@import("std").meta.cast(c_int, range[0]));
}
pub fn ONIGENC_CODE_RANGE_FROM(range: anytype, i: anytype) callconv(.Inline) @TypeOf(range[(i * 2) + 1]) {
    return range[(i * 2) + 1];
}
pub fn ONIGENC_CODE_RANGE_TO(range: anytype, i: anytype) callconv(.Inline) @TypeOf(range[(i * 2) + 2]) {
    return range[(i * 2) + 2];
}
pub const ONIG_ENCODING_ASCII = &OnigEncodingASCII;
pub const ONIG_ENCODING_ISO_8859_1 = &OnigEncodingISO_8859_1;
pub const ONIG_ENCODING_ISO_8859_2 = &OnigEncodingISO_8859_2;
pub const ONIG_ENCODING_ISO_8859_3 = &OnigEncodingISO_8859_3;
pub const ONIG_ENCODING_ISO_8859_4 = &OnigEncodingISO_8859_4;
pub const ONIG_ENCODING_ISO_8859_5 = &OnigEncodingISO_8859_5;
pub const ONIG_ENCODING_ISO_8859_6 = &OnigEncodingISO_8859_6;
pub const ONIG_ENCODING_ISO_8859_7 = &OnigEncodingISO_8859_7;
pub const ONIG_ENCODING_ISO_8859_8 = &OnigEncodingISO_8859_8;
pub const ONIG_ENCODING_ISO_8859_9 = &OnigEncodingISO_8859_9;
pub const ONIG_ENCODING_ISO_8859_10 = &OnigEncodingISO_8859_10;
pub const ONIG_ENCODING_ISO_8859_11 = &OnigEncodingISO_8859_11;
pub const ONIG_ENCODING_ISO_8859_13 = &OnigEncodingISO_8859_13;
pub const ONIG_ENCODING_ISO_8859_14 = &OnigEncodingISO_8859_14;
pub const ONIG_ENCODING_ISO_8859_15 = &OnigEncodingISO_8859_15;
pub const ONIG_ENCODING_ISO_8859_16 = &OnigEncodingISO_8859_16;
pub const ONIG_ENCODING_UTF8 = &OnigEncodingUTF8;
pub const ONIG_ENCODING_UTF16_BE = &OnigEncodingUTF16_BE;
pub const ONIG_ENCODING_UTF16_LE = &OnigEncodingUTF16_LE;
pub const ONIG_ENCODING_UTF32_BE = &OnigEncodingUTF32_BE;
pub const ONIG_ENCODING_UTF32_LE = &OnigEncodingUTF32_LE;
pub const ONIG_ENCODING_EUC_JP = &OnigEncodingEUC_JP;
pub const ONIG_ENCODING_EUC_TW = &OnigEncodingEUC_TW;
pub const ONIG_ENCODING_EUC_KR = &OnigEncodingEUC_KR;
pub const ONIG_ENCODING_EUC_CN = &OnigEncodingEUC_CN;
pub const ONIG_ENCODING_SJIS = &OnigEncodingSJIS;
pub const ONIG_ENCODING_KOI8 = &OnigEncodingKOI8;
pub const ONIG_ENCODING_KOI8_R = &OnigEncodingKOI8_R;
pub const ONIG_ENCODING_CP1251 = &OnigEncodingCP1251;
pub const ONIG_ENCODING_BIG5 = &OnigEncodingBIG5;
pub const ONIG_ENCODING_GB18030 = &OnigEncodingGB18030;
pub const ONIG_ENCODING_UNDEF = (@import("std").meta.cast(OnigEncoding, 0));
pub const ONIGENC_CODE_TO_MBC_MAXLEN = 7;
pub const ONIGENC_MBC_CASE_FOLD_MAXLEN = 18;
pub const ONIGENC_MAX_STD_CTYPE = ONIGENC_CTYPE_ASCII;
pub fn onig_enc_len(enc: anytype, p: anytype, end: anytype) callconv(.Inline) @TypeOf(ONIGENC_MBC_ENC_LEN(enc, p)) {
    return ONIGENC_MBC_ENC_LEN(enc, p);
}
pub fn ONIGENC_IS_UNDEF(enc: anytype) callconv(.Inline) @TypeOf(enc == ONIG_ENCODING_UNDEF) {
    return enc == ONIG_ENCODING_UNDEF;
}
pub fn ONIGENC_IS_SINGLEBYTE(enc: anytype) callconv(.Inline) @TypeOf(ONIGENC_MBC_MAXLEN(enc) == 1) {
    return ONIGENC_MBC_MAXLEN(enc) == 1;
}
pub fn ONIGENC_IS_MBC_HEAD(enc: anytype, p: anytype) callconv(.Inline) @TypeOf(ONIGENC_MBC_ENC_LEN(enc, p) != 1) {
    return ONIGENC_MBC_ENC_LEN(enc, p) != 1;
}
pub fn ONIGENC_IS_MBC_ASCII(p: anytype) callconv(.Inline) @TypeOf(p.* < 128) {
    return p.* < 128;
}
pub fn ONIGENC_IS_CODE_ASCII(code: anytype) callconv(.Inline) @TypeOf(code < 128) {
    return code < 128;
}
pub fn ONIGENC_IS_MBC_WORD(enc: anytype, s: anytype, end: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_WORD(enc, ONIGENC_MBC_TO_CODE(enc, s, end))) {
    return ONIGENC_IS_CODE_WORD(enc, ONIGENC_MBC_TO_CODE(enc, s, end));
}
pub fn ONIGENC_IS_MBC_WORD_ASCII(enc: anytype, s: anytype, end: anytype) callconv(.Inline) @TypeOf(onigenc_is_mbc_word_ascii(enc, s, end)) {
    return onigenc_is_mbc_word_ascii(enc, s, end);
}
pub fn ONIGENC_NAME(enc: anytype) callconv(.Inline) @TypeOf(enc.*.name) {
    return enc.*.name;
}
pub fn ONIGENC_IS_ALLOWED_REVERSE_MATCH(enc: anytype, s: anytype, end: anytype) callconv(.Inline) @TypeOf(enc.*.is_allowed_reverse_match(s, end)) {
    return enc.*.is_allowed_reverse_match(s, end);
}
pub fn ONIGENC_LEFT_ADJUST_CHAR_HEAD(enc: anytype, start: anytype, s: anytype) callconv(.Inline) @TypeOf(enc.*.left_adjust_char_head(start, s)) {
    return enc.*.left_adjust_char_head(start, s);
}
pub fn ONIGENC_IS_VALID_MBC_STRING(enc: anytype, s: anytype, end: anytype) callconv(.Inline) @TypeOf(enc.*.is_valid_mbc_string(s, end)) {
    return enc.*.is_valid_mbc_string(s, end);
}
pub fn ONIGENC_APPLY_ALL_CASE_FOLD(enc: anytype, case_fold_flag: anytype, f: anytype, arg: anytype) callconv(.Inline) @TypeOf(enc.*.apply_all_case_fold(case_fold_flag, f, arg)) {
    return enc.*.apply_all_case_fold(case_fold_flag, f, arg);
}
pub fn ONIGENC_GET_CASE_FOLD_CODES_BY_STR(enc: anytype, case_fold_flag: anytype, p: anytype, end: anytype, acs: anytype) callconv(.Inline) @TypeOf(enc.*.get_case_fold_codes_by_str(case_fold_flag, p, end, acs)) {
    return enc.*.get_case_fold_codes_by_str(case_fold_flag, p, end, acs);
}
pub fn ONIGENC_STEP_BACK(enc: anytype, start: anytype, s: anytype, n: anytype) callconv(.Inline) @TypeOf(onigenc_step_back(enc, start, s, n)) {
    return onigenc_step_back(enc, start, s, n);
}
pub fn ONIGENC_MBC_ENC_LEN(enc: anytype, p: anytype) callconv(.Inline) @TypeOf(enc.*.mbc_enc_len(p)) {
    return enc.*.mbc_enc_len(p);
}
pub fn ONIGENC_MBC_MAXLEN(enc: anytype) callconv(.Inline) @TypeOf(enc.*.max_enc_len) {
    return enc.*.max_enc_len;
}
pub fn ONIGENC_MBC_MAXLEN_DIST(enc: anytype) callconv(.Inline) @TypeOf(ONIGENC_MBC_MAXLEN(enc)) {
    return ONIGENC_MBC_MAXLEN(enc);
}
pub fn ONIGENC_MBC_MINLEN(enc: anytype) callconv(.Inline) @TypeOf(enc.*.min_enc_len) {
    return enc.*.min_enc_len;
}
pub fn ONIGENC_IS_MBC_NEWLINE(enc: anytype, p: anytype, end: anytype) callconv(.Inline) @TypeOf(enc.*.is_mbc_newline(p, end)) {
    return enc.*.is_mbc_newline(p, end);
}
pub fn ONIGENC_MBC_TO_CODE(enc: anytype, p: anytype, end: anytype) callconv(.Inline) @TypeOf(enc.*.mbc_to_code(p, end)) {
    return enc.*.mbc_to_code(p, end);
}
pub fn ONIGENC_CODE_TO_MBCLEN(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(enc.*.code_to_mbclen(code)) {
    return enc.*.code_to_mbclen(code);
}
pub fn ONIGENC_CODE_TO_MBC(enc: anytype, code: anytype, buf: anytype) callconv(.Inline) @TypeOf(enc.*.code_to_mbc(code, buf)) {
    return enc.*.code_to_mbc(code, buf);
}
pub fn ONIGENC_PROPERTY_NAME_TO_CTYPE(enc: anytype, p: anytype, end: anytype) callconv(.Inline) @TypeOf(enc.*.property_name_to_ctype(enc, p, end)) {
    return enc.*.property_name_to_ctype(enc, p, end);
}
pub fn ONIGENC_IS_CODE_CTYPE(enc: anytype, code: anytype, ctype: anytype) callconv(.Inline) @TypeOf(enc.*.is_code_ctype(code, ctype)) {
    return enc.*.is_code_ctype(code, ctype);
}
pub fn ONIGENC_IS_CODE_NEWLINE(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_NEWLINE)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_NEWLINE);
}
pub fn ONIGENC_IS_CODE_GRAPH(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_GRAPH)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_GRAPH);
}
pub fn ONIGENC_IS_CODE_PRINT(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_PRINT)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_PRINT);
}
pub fn ONIGENC_IS_CODE_ALNUM(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_ALNUM)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_ALNUM);
}
pub fn ONIGENC_IS_CODE_ALPHA(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_ALPHA)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_ALPHA);
}
pub fn ONIGENC_IS_CODE_LOWER(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_LOWER)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_LOWER);
}
pub fn ONIGENC_IS_CODE_UPPER(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_UPPER)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_UPPER);
}
pub fn ONIGENC_IS_CODE_CNTRL(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_CNTRL)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_CNTRL);
}
pub fn ONIGENC_IS_CODE_PUNCT(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_PUNCT)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_PUNCT);
}
pub fn ONIGENC_IS_CODE_SPACE(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_SPACE)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_SPACE);
}
pub fn ONIGENC_IS_CODE_BLANK(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_BLANK)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_BLANK);
}
pub fn ONIGENC_IS_CODE_DIGIT(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_DIGIT)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_DIGIT);
}
pub fn ONIGENC_IS_CODE_XDIGIT(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_XDIGIT)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_XDIGIT);
}
pub fn ONIGENC_IS_CODE_WORD(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_WORD)) {
    return ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_WORD);
}
pub fn ONIGENC_GET_CTYPE_CODE_RANGE(enc: anytype, ctype: anytype, sbout: anytype, ranges: anytype) callconv(.Inline) @TypeOf(enc.*.get_ctype_code_range(ctype, sbout, ranges)) {
    return enc.*.get_ctype_code_range(ctype, sbout, ranges);
}
pub const ONIG_NREGION = 10;
pub const ONIG_MAX_CAPTURE_NUM = 2147483647;
pub const ONIG_MAX_BACKREF_NUM = 1000;
pub const ONIG_MAX_REPEAT_NUM = 100000;
pub const ONIG_MAX_MULTI_BYTE_RANGES_NUM = 10000;
pub const ONIG_MAX_ERROR_MESSAGE_LEN = 90;
pub const ONIG_OPTION_DEFAULT = ONIG_OPTION_NONE;
pub const ONIG_OPTION_NONE = @as(c_uint, 0);
pub const ONIG_OPTION_IGNORECASE = @as(c_uint, 1);
pub const ONIG_OPTION_EXTEND = ONIG_OPTION_IGNORECASE << 1;
pub const ONIG_OPTION_MULTILINE = ONIG_OPTION_EXTEND << 1;
pub const ONIG_OPTION_SINGLELINE = ONIG_OPTION_MULTILINE << 1;
pub const ONIG_OPTION_FIND_LONGEST = ONIG_OPTION_SINGLELINE << 1;
pub const ONIG_OPTION_FIND_NOT_EMPTY = ONIG_OPTION_FIND_LONGEST << 1;
pub const ONIG_OPTION_NEGATE_SINGLELINE = ONIG_OPTION_FIND_NOT_EMPTY << 1;
pub const ONIG_OPTION_DONT_CAPTURE_GROUP = ONIG_OPTION_NEGATE_SINGLELINE << 1;
pub const ONIG_OPTION_CAPTURE_GROUP = ONIG_OPTION_DONT_CAPTURE_GROUP << 1;
pub const ONIG_OPTION_NOTBOL = ONIG_OPTION_CAPTURE_GROUP << 1;
pub const ONIG_OPTION_NOTEOL = ONIG_OPTION_NOTBOL << 1;
pub const ONIG_OPTION_POSIX_REGION = ONIG_OPTION_NOTEOL << 1;
pub const ONIG_OPTION_CHECK_VALIDITY_OF_STRING = ONIG_OPTION_POSIX_REGION << 1;
pub const ONIG_OPTION_IGNORECASE_IS_ASCII = ONIG_OPTION_CHECK_VALIDITY_OF_STRING << 3;
pub const ONIG_OPTION_WORD_IS_ASCII = ONIG_OPTION_IGNORECASE_IS_ASCII << 1;
pub const ONIG_OPTION_DIGIT_IS_ASCII = ONIG_OPTION_WORD_IS_ASCII << 1;
pub const ONIG_OPTION_SPACE_IS_ASCII = ONIG_OPTION_DIGIT_IS_ASCII << 1;
pub const ONIG_OPTION_POSIX_IS_ASCII = ONIG_OPTION_SPACE_IS_ASCII << 1;
pub const ONIG_OPTION_TEXT_SEGMENT_EXTENDED_GRAPHEME_CLUSTER = ONIG_OPTION_POSIX_IS_ASCII << 1;
pub const ONIG_OPTION_TEXT_SEGMENT_WORD = ONIG_OPTION_TEXT_SEGMENT_EXTENDED_GRAPHEME_CLUSTER << 1;
pub const ONIG_OPTION_NOT_BEGIN_STRING = ONIG_OPTION_TEXT_SEGMENT_WORD << 1;
pub const ONIG_OPTION_NOT_END_STRING = ONIG_OPTION_NOT_BEGIN_STRING << 1;
pub const ONIG_OPTION_NOT_BEGIN_POSITION = ONIG_OPTION_NOT_END_STRING << 1;
pub const ONIG_OPTION_MAXBIT = ONIG_OPTION_NOT_BEGIN_POSITION;
pub fn ONIG_IS_OPTION_ON(options: anytype, option: anytype) callconv(.Inline) @TypeOf(options & option) {
    return options & option;
}
pub const ONIG_SYNTAX_ASIS = &OnigSyntaxASIS;
pub const ONIG_SYNTAX_POSIX_BASIC = &OnigSyntaxPosixBasic;
pub const ONIG_SYNTAX_POSIX_EXTENDED = &OnigSyntaxPosixExtended;
pub const ONIG_SYNTAX_EMACS = &OnigSyntaxEmacs;
pub const ONIG_SYNTAX_GREP = &OnigSyntaxGrep;
pub const ONIG_SYNTAX_GNU_REGEX = &OnigSyntaxGnuRegex;
pub const ONIG_SYNTAX_JAVA = &OnigSyntaxJava;
pub const ONIG_SYNTAX_PERL = &OnigSyntaxPerl;
pub const ONIG_SYNTAX_PERL_NG = &OnigSyntaxPerl_NG;
pub const ONIG_SYNTAX_RUBY = &OnigSyntaxRuby;
pub const ONIG_SYNTAX_PYTHON = &OnigSyntaxPython;
pub const ONIG_SYNTAX_ONIGURUMA = &OnigSyntaxOniguruma;
pub const ONIG_SYNTAX_DEFAULT = OnigDefaultSyntax;
pub const ONIG_SYN_OP_VARIABLE_META_CHARACTERS = @as(c_uint, 1) << 0;
pub const ONIG_SYN_OP_DOT_ANYCHAR = @as(c_uint, 1) << 1;
pub const ONIG_SYN_OP_ASTERISK_ZERO_INF = @as(c_uint, 1) << 2;
pub const ONIG_SYN_OP_ESC_ASTERISK_ZERO_INF = @as(c_uint, 1) << 3;
pub const ONIG_SYN_OP_PLUS_ONE_INF = @as(c_uint, 1) << 4;
pub const ONIG_SYN_OP_ESC_PLUS_ONE_INF = @as(c_uint, 1) << 5;
pub const ONIG_SYN_OP_QMARK_ZERO_ONE = @as(c_uint, 1) << 6;
pub const ONIG_SYN_OP_ESC_QMARK_ZERO_ONE = @as(c_uint, 1) << 7;
pub const ONIG_SYN_OP_BRACE_INTERVAL = @as(c_uint, 1) << 8;
pub const ONIG_SYN_OP_ESC_BRACE_INTERVAL = @as(c_uint, 1) << 9;
pub const ONIG_SYN_OP_VBAR_ALT = @as(c_uint, 1) << 10;
pub const ONIG_SYN_OP_ESC_VBAR_ALT = @as(c_uint, 1) << 11;
pub const ONIG_SYN_OP_LPAREN_SUBEXP = @as(c_uint, 1) << 12;
pub const ONIG_SYN_OP_ESC_LPAREN_SUBEXP = @as(c_uint, 1) << 13;
pub const ONIG_SYN_OP_ESC_AZ_BUF_ANCHOR = @as(c_uint, 1) << 14;
pub const ONIG_SYN_OP_ESC_CAPITAL_G_BEGIN_ANCHOR = @as(c_uint, 1) << 15;
pub const ONIG_SYN_OP_DECIMAL_BACKREF = @as(c_uint, 1) << 16;
pub const ONIG_SYN_OP_BRACKET_CC = @as(c_uint, 1) << 17;
pub const ONIG_SYN_OP_ESC_W_WORD = @as(c_uint, 1) << 18;
pub const ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END = @as(c_uint, 1) << 19;
pub const ONIG_SYN_OP_ESC_B_WORD_BOUND = @as(c_uint, 1) << 20;
pub const ONIG_SYN_OP_ESC_S_WHITE_SPACE = @as(c_uint, 1) << 21;
pub const ONIG_SYN_OP_ESC_D_DIGIT = @as(c_uint, 1) << 22;
pub const ONIG_SYN_OP_LINE_ANCHOR = @as(c_uint, 1) << 23;
pub const ONIG_SYN_OP_POSIX_BRACKET = @as(c_uint, 1) << 24;
pub const ONIG_SYN_OP_QMARK_NON_GREEDY = @as(c_uint, 1) << 25;
pub const ONIG_SYN_OP_ESC_CONTROL_CHARS = @as(c_uint, 1) << 26;
pub const ONIG_SYN_OP_ESC_C_CONTROL = @as(c_uint, 1) << 27;
pub const ONIG_SYN_OP_ESC_OCTAL3 = @as(c_uint, 1) << 28;
pub const ONIG_SYN_OP_ESC_X_HEX2 = @as(c_uint, 1) << 29;
pub const ONIG_SYN_OP_ESC_X_BRACE_HEX8 = @as(c_uint, 1) << 30;
pub const ONIG_SYN_OP_ESC_O_BRACE_OCTAL = @as(c_uint, 1) << 31;
pub const ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE = @as(c_uint, 1) << 0;
pub const ONIG_SYN_OP2_QMARK_GROUP_EFFECT = @as(c_uint, 1) << 1;
pub const ONIG_SYN_OP2_OPTION_PERL = @as(c_uint, 1) << 2;
pub const ONIG_SYN_OP2_OPTION_RUBY = @as(c_uint, 1) << 3;
pub const ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT = @as(c_uint, 1) << 4;
pub const ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL = @as(c_uint, 1) << 5;
pub const ONIG_SYN_OP2_CCLASS_SET_OP = @as(c_uint, 1) << 6;
pub const ONIG_SYN_OP2_QMARK_LT_NAMED_GROUP = @as(c_uint, 1) << 7;
pub const ONIG_SYN_OP2_ESC_K_NAMED_BACKREF = @as(c_uint, 1) << 8;
pub const ONIG_SYN_OP2_ESC_G_SUBEXP_CALL = @as(c_uint, 1) << 9;
pub const ONIG_SYN_OP2_ATMARK_CAPTURE_HISTORY = @as(c_uint, 1) << 10;
pub const ONIG_SYN_OP2_ESC_CAPITAL_C_BAR_CONTROL = @as(c_uint, 1) << 11;
pub const ONIG_SYN_OP2_ESC_CAPITAL_M_BAR_META = @as(c_uint, 1) << 12;
pub const ONIG_SYN_OP2_ESC_V_VTAB = @as(c_uint, 1) << 13;
pub const ONIG_SYN_OP2_ESC_U_HEX4 = @as(c_uint, 1) << 14;
pub const ONIG_SYN_OP2_ESC_GNU_BUF_ANCHOR = @as(c_uint, 1) << 15;
pub const ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY = @as(c_uint, 1) << 16;
pub const ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT = @as(c_uint, 1) << 17;
pub const ONIG_SYN_OP2_ESC_H_XDIGIT = @as(c_uint, 1) << 19;
pub const ONIG_SYN_OP2_INEFFECTIVE_ESCAPE = @as(c_uint, 1) << 20;
pub const ONIG_SYN_OP2_QMARK_LPAREN_IF_ELSE = @as(c_uint, 1) << 21;
pub const ONIG_SYN_OP2_ESC_CAPITAL_K_KEEP = @as(c_uint, 1) << 22;
pub const ONIG_SYN_OP2_ESC_CAPITAL_R_GENERAL_NEWLINE = @as(c_uint, 1) << 23;
pub const ONIG_SYN_OP2_ESC_CAPITAL_N_O_SUPER_DOT = @as(c_uint, 1) << 24;
pub const ONIG_SYN_OP2_QMARK_TILDE_ABSENT_GROUP = @as(c_uint, 1) << 25;
pub const ONIG_SYN_OP2_ESC_X_Y_GRAPHEME_CLUSTER = @as(c_uint, 1) << 26;
pub const ONIG_SYN_OP2_ESC_X_Y_TEXT_SEGMENT = @as(c_uint, 1) << 26;
pub const ONIG_SYN_OP2_QMARK_PERL_SUBEXP_CALL = @as(c_uint, 1) << 27;
pub const ONIG_SYN_OP2_QMARK_BRACE_CALLOUT_CONTENTS = @as(c_uint, 1) << 28;
pub const ONIG_SYN_OP2_ASTERISK_CALLOUT_NAME = @as(c_uint, 1) << 29;
pub const ONIG_SYN_OP2_OPTION_ONIGURUMA = @as(c_uint, 1) << 30;
pub const ONIG_SYN_OP2_QMARK_CAPITAL_P_NAME = @as(c_uint, 1) << 31;
pub const ONIG_SYN_CONTEXT_INDEP_ANCHORS = @as(c_uint, 1) << 31;
pub const ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS = @as(c_uint, 1) << 0;
pub const ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS = @as(c_uint, 1) << 1;
pub const ONIG_SYN_ALLOW_UNMATCHED_CLOSE_SUBEXP = @as(c_uint, 1) << 2;
pub const ONIG_SYN_ALLOW_INVALID_INTERVAL = @as(c_uint, 1) << 3;
pub const ONIG_SYN_ALLOW_INTERVAL_LOW_ABBREV = @as(c_uint, 1) << 4;
pub const ONIG_SYN_STRICT_CHECK_BACKREF = @as(c_uint, 1) << 5;
pub const ONIG_SYN_DIFFERENT_LEN_ALT_LOOK_BEHIND = @as(c_uint, 1) << 6;
pub const ONIG_SYN_CAPTURE_ONLY_NAMED_GROUP = @as(c_uint, 1) << 7;
pub const ONIG_SYN_ALLOW_MULTIPLEX_DEFINITION_NAME = @as(c_uint, 1) << 8;
pub const ONIG_SYN_FIXED_INTERVAL_IS_GREEDY_ONLY = @as(c_uint, 1) << 9;
pub const ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH = @as(c_uint, 1) << 10;
pub const ONIG_SYN_VARIABLE_LEN_LOOK_BEHIND = @as(c_uint, 1) << 11;
pub const ONIG_SYN_PYTHON = @as(c_uint, 1) << 12;
pub const ONIG_SYN_NOT_NEWLINE_IN_NEGATIVE_CC = @as(c_uint, 1) << 20;
pub const ONIG_SYN_BACKSLASH_ESCAPE_IN_CC = @as(c_uint, 1) << 21;
pub const ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC = @as(c_uint, 1) << 22;
pub const ONIG_SYN_ALLOW_DOUBLE_RANGE_OP_IN_CC = @as(c_uint, 1) << 23;
pub const ONIG_SYN_ALLOW_INVALID_CODE_END_OF_RANGE_IN_CC = @as(c_uint, 1) << 26;
pub const ONIG_SYN_WARN_CC_OP_NOT_ESCAPED = @as(c_uint, 1) << 24;
pub const ONIG_SYN_WARN_REDUNDANT_NESTED_REPEAT = @as(c_uint, 1) << 25;
pub const ONIG_META_CHAR_ESCAPE = 0;
pub const ONIG_META_CHAR_ANYCHAR = 1;
pub const ONIG_META_CHAR_ANYTIME = 2;
pub const ONIG_META_CHAR_ZERO_OR_ONE_TIME = 3;
pub const ONIG_META_CHAR_ONE_OR_MORE_TIME = 4;
pub const ONIG_META_CHAR_ANYCHAR_ANYTIME = 5;
pub const ONIG_INEFFECTIVE_META_CHAR = 0;
pub fn ONIG_IS_PATTERN_ERROR(ecode: anytype) callconv(.Inline) @TypeOf((ecode <= -100) and (ecode > -1000)) {
    return (ecode <= -100) and (ecode > -1000);
}
pub const ONIG_NORMAL = 0;
pub const ONIG_MISMATCH = -1;
pub const ONIG_NO_SUPPORT_CONFIG = -2;
pub const ONIG_ABORT = -3;
pub const ONIGERR_MEMORY = -5;
pub const ONIGERR_TYPE_BUG = -6;
pub const ONIGERR_PARSER_BUG = -11;
pub const ONIGERR_STACK_BUG = -12;
pub const ONIGERR_UNDEFINED_BYTECODE = -13;
pub const ONIGERR_UNEXPECTED_BYTECODE = -14;
pub const ONIGERR_MATCH_STACK_LIMIT_OVER = -15;
pub const ONIGERR_PARSE_DEPTH_LIMIT_OVER = -16;
pub const ONIGERR_RETRY_LIMIT_IN_MATCH_OVER = -17;
pub const ONIGERR_RETRY_LIMIT_IN_SEARCH_OVER = -18;
pub const ONIGERR_SUBEXP_CALL_LIMIT_IN_SEARCH_OVER = -19;
pub const ONIGERR_DEFAULT_ENCODING_IS_NOT_SETTED = -21;
pub const ONIGERR_SPECIFIED_ENCODING_CANT_CONVERT_TO_WIDE_CHAR = -22;
pub const ONIGERR_FAIL_TO_INITIALIZE = -23;
pub const ONIGERR_INVALID_ARGUMENT = -30;
pub const ONIGERR_END_PATTERN_AT_LEFT_BRACE = -100;
pub const ONIGERR_END_PATTERN_AT_LEFT_BRACKET = -101;
pub const ONIGERR_EMPTY_CHAR_CLASS = -102;
pub const ONIGERR_PREMATURE_END_OF_CHAR_CLASS = -103;
pub const ONIGERR_END_PATTERN_AT_ESCAPE = -104;
pub const ONIGERR_END_PATTERN_AT_META = -105;
pub const ONIGERR_END_PATTERN_AT_CONTROL = -106;
pub const ONIGERR_META_CODE_SYNTAX = -108;
pub const ONIGERR_CONTROL_CODE_SYNTAX = -109;
pub const ONIGERR_CHAR_CLASS_VALUE_AT_END_OF_RANGE = -110;
pub const ONIGERR_CHAR_CLASS_VALUE_AT_START_OF_RANGE = -111;
pub const ONIGERR_UNMATCHED_RANGE_SPECIFIER_IN_CHAR_CLASS = -112;
pub const ONIGERR_TARGET_OF_REPEAT_OPERATOR_NOT_SPECIFIED = -113;
pub const ONIGERR_TARGET_OF_REPEAT_OPERATOR_INVALID = -114;
pub const ONIGERR_NESTED_REPEAT_OPERATOR = -115;
pub const ONIGERR_UNMATCHED_CLOSE_PARENTHESIS = -116;
pub const ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS = -117;
pub const ONIGERR_END_PATTERN_IN_GROUP = -118;
pub const ONIGERR_UNDEFINED_GROUP_OPTION = -119;
pub const ONIGERR_INVALID_POSIX_BRACKET_TYPE = -121;
pub const ONIGERR_INVALID_LOOK_BEHIND_PATTERN = -122;
pub const ONIGERR_INVALID_REPEAT_RANGE_PATTERN = -123;
pub const ONIGERR_TOO_BIG_NUMBER = -200;
pub const ONIGERR_TOO_BIG_NUMBER_FOR_REPEAT_RANGE = -201;
pub const ONIGERR_UPPER_SMALLER_THAN_LOWER_IN_REPEAT_RANGE = -202;
pub const ONIGERR_EMPTY_RANGE_IN_CHAR_CLASS = -203;
pub const ONIGERR_MISMATCH_CODE_LENGTH_IN_CLASS_RANGE = -204;
pub const ONIGERR_TOO_MANY_MULTI_BYTE_RANGES = -205;
pub const ONIGERR_TOO_SHORT_MULTI_BYTE_STRING = -206;
pub const ONIGERR_TOO_BIG_BACKREF_NUMBER = -207;
pub const ONIGERR_INVALID_BACKREF = -208;
pub const ONIGERR_NUMBERED_BACKREF_OR_CALL_NOT_ALLOWED = -209;
pub const ONIGERR_TOO_MANY_CAPTURES = -210;
pub const ONIGERR_TOO_LONG_WIDE_CHAR_VALUE = -212;
pub const ONIGERR_UNDEFINED_OPERATOR = -213;
pub const ONIGERR_EMPTY_GROUP_NAME = -214;
pub const ONIGERR_INVALID_GROUP_NAME = -215;
pub const ONIGERR_INVALID_CHAR_IN_GROUP_NAME = -216;
pub const ONIGERR_UNDEFINED_NAME_REFERENCE = -217;
pub const ONIGERR_UNDEFINED_GROUP_REFERENCE = -218;
pub const ONIGERR_MULTIPLEX_DEFINED_NAME = -219;
pub const ONIGERR_MULTIPLEX_DEFINITION_NAME_CALL = -220;
pub const ONIGERR_NEVER_ENDING_RECURSION = -221;
pub const ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY = -222;
pub const ONIGERR_INVALID_CHAR_PROPERTY_NAME = -223;
pub const ONIGERR_INVALID_IF_ELSE_SYNTAX = -224;
pub const ONIGERR_INVALID_ABSENT_GROUP_PATTERN = -225;
pub const ONIGERR_INVALID_ABSENT_GROUP_GENERATOR_PATTERN = -226;
pub const ONIGERR_INVALID_CALLOUT_PATTERN = -227;
pub const ONIGERR_INVALID_CALLOUT_NAME = -228;
pub const ONIGERR_UNDEFINED_CALLOUT_NAME = -229;
pub const ONIGERR_INVALID_CALLOUT_BODY = -230;
pub const ONIGERR_INVALID_CALLOUT_TAG_NAME = -231;
pub const ONIGERR_INVALID_CALLOUT_ARG = -232;
pub const ONIGERR_INVALID_CODE_POINT_VALUE = -400;
pub const ONIGERR_INVALID_WIDE_CHAR_VALUE = -400;
pub const ONIGERR_TOO_BIG_WIDE_CHAR_VALUE = -401;
pub const ONIGERR_NOT_SUPPORTED_ENCODING_COMBINATION = -402;
pub const ONIGERR_INVALID_COMBINATION_OF_OPTIONS = -403;
pub const ONIGERR_TOO_MANY_USER_DEFINED_OBJECTS = -404;
pub const ONIGERR_TOO_LONG_PROPERTY_NAME = -405;
pub const ONIGERR_VERY_INEFFICIENT_PATTERN = -406;
pub const ONIGERR_LIBRARY_IS_NOT_INITIALIZED = -500;
pub const ONIG_MAX_CAPTURE_HISTORY_GROUP = 31;
pub fn ONIG_IS_CAPTURE_HISTORY_GROUP(r: anytype, i: anytype) callconv(.Inline) @TypeOf(((i <= ONIG_MAX_CAPTURE_HISTORY_GROUP) and (r.*.list != 0)) and (r.*.list[i] != 0)) {
    return ((i <= ONIG_MAX_CAPTURE_HISTORY_GROUP) and (r.*.list != 0)) and (r.*.list[i] != 0);
}
pub const ONIG_TRAVERSE_CALLBACK_AT_FIRST = 1;
pub const ONIG_TRAVERSE_CALLBACK_AT_LAST = 2;
pub const ONIG_TRAVERSE_CALLBACK_AT_BOTH = ONIG_TRAVERSE_CALLBACK_AT_FIRST | ONIG_TRAVERSE_CALLBACK_AT_LAST;
pub const ONIG_REGION_NOTPOS = -1;
pub const ONIG_NULL_WARN = onig_null_warn;
pub const ONIG_CHAR_TABLE_SIZE = 256;
pub const ONIG_CALLOUT_IN_BOTH = ONIG_CALLOUT_IN_PROGRESS | ONIG_CALLOUT_IN_RETRACTION;
pub const ONIG_NON_NAME_ID = -1;
pub const ONIG_NON_CALLOUT_NUM = 0;
pub const ONIG_CALLOUT_MAX_ARGS_NUM = 4;
pub const ONIG_CALLOUT_DATA_SLOT_NUM = 5;
pub const TRUE = 1;
pub const FALSE = 0;
pub const ARG_UNUSED = __attribute__(unused);
pub fn ONIG_IS_NULL(p: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(?*c_void, p)) == (@import("std").meta.cast(?*c_void, 0))) {
    return (@import("std").meta.cast(?*c_void, p)) == (@import("std").meta.cast(?*c_void, 0));
}
pub fn ONIG_IS_NOT_NULL(p: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(?*c_void, p)) != (@import("std").meta.cast(?*c_void, 0))) {
    return (@import("std").meta.cast(?*c_void, p)) != (@import("std").meta.cast(?*c_void, 0));
}
pub const MAX_CODE_POINT = ~(@import("std").meta.cast(OnigCodePoint, 0));
pub const ASCII_LIMIT = 127;
pub const NEWLINE_CODE = 0x0a;
pub fn enclen(enc: anytype, p: anytype) callconv(.Inline) @TypeOf(ONIGENC_MBC_ENC_LEN(enc, p)) {
    return ONIGENC_MBC_ENC_LEN(enc, p);
}
pub const BIT_CTYPE_NEWLINE = 1 << ONIGENC_CTYPE_NEWLINE;
pub const BIT_CTYPE_ALPHA = 1 << ONIGENC_CTYPE_ALPHA;
pub const BIT_CTYPE_BLANK = 1 << ONIGENC_CTYPE_BLANK;
pub const BIT_CTYPE_CNTRL = 1 << ONIGENC_CTYPE_CNTRL;
pub const BIT_CTYPE_DIGIT = 1 << ONIGENC_CTYPE_DIGIT;
pub const BIT_CTYPE_GRAPH = 1 << ONIGENC_CTYPE_GRAPH;
pub const BIT_CTYPE_LOWER = 1 << ONIGENC_CTYPE_LOWER;
pub const BIT_CTYPE_PRINT = 1 << ONIGENC_CTYPE_PRINT;
pub const BIT_CTYPE_PUNCT = 1 << ONIGENC_CTYPE_PUNCT;
pub const BIT_CTYPE_SPACE = 1 << ONIGENC_CTYPE_SPACE;
pub const BIT_CTYPE_UPPER = 1 << ONIGENC_CTYPE_UPPER;
pub const BIT_CTYPE_XDIGIT = 1 << ONIGENC_CTYPE_XDIGIT;
pub const BIT_CTYPE_WORD = 1 << ONIGENC_CTYPE_WORD;
pub const BIT_CTYPE_ALNUM = 1 << ONIGENC_CTYPE_ALNUM;
pub const BIT_CTYPE_ASCII = 1 << ONIGENC_CTYPE_ASCII;
pub fn CTYPE_TO_BIT(ctype: anytype) callconv(.Inline) @TypeOf(1 << ctype) {
    return 1 << ctype;
}
pub fn CTYPE_IS_WORD_GRAPH_PRINT(ctype: anytype) callconv(.Inline) @TypeOf(((ctype == ONIGENC_CTYPE_WORD) or (ctype == ONIGENC_CTYPE_GRAPH)) or (ctype == ONIGENC_CTYPE_PRINT)) {
    return ((ctype == ONIGENC_CTYPE_WORD) or (ctype == ONIGENC_CTYPE_GRAPH)) or (ctype == ONIGENC_CTYPE_PRINT);
}
pub const ONIG_ENCODING_INIT_DEFAULT = ONIG_ENCODING_ASCII;
pub const ENC_SKIP_OFFSET_1_OR_0 = 7;
pub const ENC_FLAG_ASCII_COMPATIBLE = 1 << 0;
pub const ENC_FLAG_UNICODE = 1 << 1;
pub const ENC_FLAG_SKIP_OFFSET_MASK = 7 << 2;
pub const ENC_FLAG_SKIP_OFFSET_0 = 0;
pub const ENC_FLAG_SKIP_OFFSET_1 = 1 << 2;
pub const ENC_FLAG_SKIP_OFFSET_2 = 2 << 2;
pub const ENC_FLAG_SKIP_OFFSET_3 = 3 << 2;
pub const ENC_FLAG_SKIP_OFFSET_4 = 4 << 2;
pub const ENC_FLAG_SKIP_OFFSET_1_OR_0 = ENC_SKIP_OFFSET_1_OR_0 << 2;
pub fn ENC_GET_SKIP_OFFSET(enc: anytype) callconv(.Inline) @TypeOf(((enc.*.flag) & ENC_FLAG_SKIP_OFFSET_MASK) >> 2) {
    return ((enc.*.flag) & ENC_FLAG_SKIP_OFFSET_MASK) >> 2;
}
pub fn CASE_FOLD_IS_ASCII_ONLY(flag: anytype) callconv(.Inline) @TypeOf((flag & ONIGENC_CASE_FOLD_ASCII_ONLY) != 0) {
    return (flag & ONIGENC_CASE_FOLD_ASCII_ONLY) != 0;
}
pub fn CASE_FOLD_IS_NOT_ASCII_ONLY(flag: anytype) callconv(.Inline) @TypeOf((flag & ONIGENC_CASE_FOLD_ASCII_ONLY) == 0) {
    return (flag & ONIGENC_CASE_FOLD_ASCII_ONLY) == 0;
}
pub fn UTF16_IS_SURROGATE_FIRST(c: anytype) callconv(.Inline) @TypeOf((c & 0xfc) == 0xd8) {
    return (c & 0xfc) == 0xd8;
}
pub fn UTF16_IS_SURROGATE_SECOND(c: anytype) callconv(.Inline) @TypeOf((c & 0xfc) == 0xdc) {
    return (c & 0xfc) == 0xdc;
}
pub fn FOLDS1_FOLD(i: anytype) callconv(.Inline) @TypeOf(OnigUnicodeFolds1 + i) {
    return OnigUnicodeFolds1 + i;
}
pub fn FOLDS2_FOLD(i: anytype) callconv(.Inline) @TypeOf(OnigUnicodeFolds2 + i) {
    return OnigUnicodeFolds2 + i;
}
pub fn FOLDS3_FOLD(i: anytype) callconv(.Inline) @TypeOf(OnigUnicodeFolds3 + i) {
    return OnigUnicodeFolds3 + i;
}
pub fn FOLDS1_UNFOLDS_NUM(i: anytype) callconv(.Inline) @TypeOf(OnigUnicodeFolds1[i + 1]) {
    return OnigUnicodeFolds1[i + 1];
}
pub fn FOLDS2_UNFOLDS_NUM(i: anytype) callconv(.Inline) @TypeOf(OnigUnicodeFolds2[i + 2]) {
    return OnigUnicodeFolds2[i + 2];
}
pub fn FOLDS3_UNFOLDS_NUM(i: anytype) callconv(.Inline) @TypeOf(OnigUnicodeFolds3[i + 3]) {
    return OnigUnicodeFolds3[i + 3];
}
pub fn FOLDS1_UNFOLDS(i: anytype) callconv(.Inline) @TypeOf(FOLDS1_FOLD(i) + 2) {
    return FOLDS1_FOLD(i) + 2;
}
pub fn FOLDS2_UNFOLDS(i: anytype) callconv(.Inline) @TypeOf(FOLDS2_FOLD(i) + 3) {
    return FOLDS2_FOLD(i) + 3;
}
pub fn FOLDS3_UNFOLDS(i: anytype) callconv(.Inline) @TypeOf(FOLDS3_FOLD(i) + 4) {
    return FOLDS3_FOLD(i) + 4;
}
pub fn FOLDS1_NEXT_INDEX(i: anytype) callconv(.Inline) @TypeOf((i + 2) + FOLDS1_UNFOLDS_NUM(i)) {
    return (i + 2) + FOLDS1_UNFOLDS_NUM(i);
}
pub fn FOLDS2_NEXT_INDEX(i: anytype) callconv(.Inline) @TypeOf((i + 3) + FOLDS2_UNFOLDS_NUM(i)) {
    return (i + 3) + FOLDS2_UNFOLDS_NUM(i);
}
pub fn FOLDS3_NEXT_INDEX(i: anytype) callconv(.Inline) @TypeOf((i + 4) + FOLDS3_UNFOLDS_NUM(i)) {
    return (i + 4) + FOLDS3_UNFOLDS_NUM(i);
}
pub fn ONIGENC_ISO_8859_1_TO_LOWER_CASE(c: anytype) callconv(.Inline) @TypeOf(OnigEncISO_8859_1_ToLowerCaseTable[c]) {
    return OnigEncISO_8859_1_ToLowerCaseTable[c];
}
pub fn ONIGENC_ISO_8859_1_TO_UPPER_CASE(c: anytype) callconv(.Inline) @TypeOf(OnigEncISO_8859_1_ToUpperCaseTable[c]) {
    return OnigEncISO_8859_1_ToUpperCaseTable[c];
}
pub fn ONIGENC_IS_ASCII_CODE(code: anytype) callconv(.Inline) @TypeOf(code < 0x80) {
    return code < 0x80;
}
pub fn ONIGENC_ASCII_CODE_TO_LOWER_CASE(c: anytype) callconv(.Inline) @TypeOf(OnigEncAsciiToLowerCaseTable[c]) {
    return OnigEncAsciiToLowerCaseTable[c];
}
pub fn ONIGENC_ASCII_CODE_TO_UPPER_CASE(c: anytype) callconv(.Inline) @TypeOf(OnigEncAsciiToUpperCaseTable[c]) {
    return OnigEncAsciiToUpperCaseTable[c];
}
pub fn ONIGENC_IS_ASCII_CODE_CTYPE(code: anytype, ctype: anytype) callconv(.Inline) @TypeOf((OnigEncAsciiCtypeTable[code] & CTYPE_TO_BIT(ctype)) != 0) {
    return (OnigEncAsciiCtypeTable[code] & CTYPE_TO_BIT(ctype)) != 0;
}
pub fn ONIGENC_IS_ASCII_CODE_WORD(code: anytype) callconv(.Inline) @TypeOf((OnigEncAsciiCtypeTable[code] & CTYPE_TO_BIT(ONIGENC_CTYPE_WORD)) != 0) {
    return (OnigEncAsciiCtypeTable[code] & CTYPE_TO_BIT(ONIGENC_CTYPE_WORD)) != 0;
}
pub fn ONIGENC_IS_ASCII_CODE_CASE_AMBIG(code: anytype) callconv(.Inline) @TypeOf((ONIGENC_IS_ASCII_CODE_CTYPE(code, ONIGENC_CTYPE_UPPER) != 0) or (ONIGENC_IS_ASCII_CODE_CTYPE(code, ONIGENC_CTYPE_LOWER) != 0)) {
    return (ONIGENC_IS_ASCII_CODE_CTYPE(code, ONIGENC_CTYPE_UPPER) != 0) or (ONIGENC_IS_ASCII_CODE_CTYPE(code, ONIGENC_CTYPE_LOWER) != 0);
}
pub fn ONIGENC_IS_UNICODE_ENCODING(enc: anytype) callconv(.Inline) @TypeOf(((enc.*.flag) & ENC_FLAG_UNICODE) != 0) {
    return ((enc.*.flag) & ENC_FLAG_UNICODE) != 0;
}
pub fn ONIGENC_IS_ASCII_COMPATIBLE_ENCODING(enc: anytype) callconv(.Inline) @TypeOf(((enc.*.flag) & ENC_FLAG_ASCII_COMPATIBLE) != 0) {
    return ((enc.*.flag) & ENC_FLAG_ASCII_COMPATIBLE) != 0;
}
pub fn ENC_ISO_8859_16_TO_LOWER_CASE(c: anytype) callconv(.Inline) @TypeOf(EncISO_8859_16_ToLowerCaseTable[c]) {
    return EncISO_8859_16_ToLowerCaseTable[c];
}
pub fn ENC_IS_ISO_8859_16_CTYPE(code: anytype, ctype: anytype) callconv(.Inline) @TypeOf((EncISO_8859_16_CtypeTable[code] & CTYPE_TO_BIT(ctype)) != 0) {
    return (EncISO_8859_16_CtypeTable[code] & CTYPE_TO_BIT(ctype)) != 0;
}
pub const OnigEncodingTypeST = struct_OnigEncodingTypeST;
pub const OnigCaptureTreeNodeStruct = struct_OnigCaptureTreeNodeStruct;
pub const re_registers = struct_re_registers;
pub const re_pattern_buffer = struct_re_pattern_buffer;
pub const OnigRegSetStruct = struct_OnigRegSetStruct;
pub const OnigCalloutArgsStruct = struct_OnigCalloutArgsStruct;
pub const OnigMatchParamStruct = struct_OnigMatchParamStruct;
pub const PropertyNameCtype = struct_PropertyNameCtype;
pub const ByUnfoldKey = struct_ByUnfoldKey;
