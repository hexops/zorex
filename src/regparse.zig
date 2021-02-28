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
pub fn onig_null_warn(arg_s: [*c]const u8) callconv(.C) void {
    var s = arg_s;
}
pub const OP_FINISH = @enumToInt(enum_OpCode.OP_FINISH);
pub const OP_END = @enumToInt(enum_OpCode.OP_END);
pub const OP_STR_1 = @enumToInt(enum_OpCode.OP_STR_1);
pub const OP_STR_2 = @enumToInt(enum_OpCode.OP_STR_2);
pub const OP_STR_3 = @enumToInt(enum_OpCode.OP_STR_3);
pub const OP_STR_4 = @enumToInt(enum_OpCode.OP_STR_4);
pub const OP_STR_5 = @enumToInt(enum_OpCode.OP_STR_5);
pub const OP_STR_N = @enumToInt(enum_OpCode.OP_STR_N);
pub const OP_STR_MB2N1 = @enumToInt(enum_OpCode.OP_STR_MB2N1);
pub const OP_STR_MB2N2 = @enumToInt(enum_OpCode.OP_STR_MB2N2);
pub const OP_STR_MB2N3 = @enumToInt(enum_OpCode.OP_STR_MB2N3);
pub const OP_STR_MB2N = @enumToInt(enum_OpCode.OP_STR_MB2N);
pub const OP_STR_MB3N = @enumToInt(enum_OpCode.OP_STR_MB3N);
pub const OP_STR_MBN = @enumToInt(enum_OpCode.OP_STR_MBN);
pub const OP_CCLASS = @enumToInt(enum_OpCode.OP_CCLASS);
pub const OP_CCLASS_MB = @enumToInt(enum_OpCode.OP_CCLASS_MB);
pub const OP_CCLASS_MIX = @enumToInt(enum_OpCode.OP_CCLASS_MIX);
pub const OP_CCLASS_NOT = @enumToInt(enum_OpCode.OP_CCLASS_NOT);
pub const OP_CCLASS_MB_NOT = @enumToInt(enum_OpCode.OP_CCLASS_MB_NOT);
pub const OP_CCLASS_MIX_NOT = @enumToInt(enum_OpCode.OP_CCLASS_MIX_NOT);
pub const OP_ANYCHAR = @enumToInt(enum_OpCode.OP_ANYCHAR);
pub const OP_ANYCHAR_ML = @enumToInt(enum_OpCode.OP_ANYCHAR_ML);
pub const OP_ANYCHAR_STAR = @enumToInt(enum_OpCode.OP_ANYCHAR_STAR);
pub const OP_ANYCHAR_ML_STAR = @enumToInt(enum_OpCode.OP_ANYCHAR_ML_STAR);
pub const OP_ANYCHAR_STAR_PEEK_NEXT = @enumToInt(enum_OpCode.OP_ANYCHAR_STAR_PEEK_NEXT);
pub const OP_ANYCHAR_ML_STAR_PEEK_NEXT = @enumToInt(enum_OpCode.OP_ANYCHAR_ML_STAR_PEEK_NEXT);
pub const OP_WORD = @enumToInt(enum_OpCode.OP_WORD);
pub const OP_WORD_ASCII = @enumToInt(enum_OpCode.OP_WORD_ASCII);
pub const OP_NO_WORD = @enumToInt(enum_OpCode.OP_NO_WORD);
pub const OP_NO_WORD_ASCII = @enumToInt(enum_OpCode.OP_NO_WORD_ASCII);
pub const OP_WORD_BOUNDARY = @enumToInt(enum_OpCode.OP_WORD_BOUNDARY);
pub const OP_NO_WORD_BOUNDARY = @enumToInt(enum_OpCode.OP_NO_WORD_BOUNDARY);
pub const OP_WORD_BEGIN = @enumToInt(enum_OpCode.OP_WORD_BEGIN);
pub const OP_WORD_END = @enumToInt(enum_OpCode.OP_WORD_END);
pub const OP_TEXT_SEGMENT_BOUNDARY = @enumToInt(enum_OpCode.OP_TEXT_SEGMENT_BOUNDARY);
pub const OP_BEGIN_BUF = @enumToInt(enum_OpCode.OP_BEGIN_BUF);
pub const OP_END_BUF = @enumToInt(enum_OpCode.OP_END_BUF);
pub const OP_BEGIN_LINE = @enumToInt(enum_OpCode.OP_BEGIN_LINE);
pub const OP_END_LINE = @enumToInt(enum_OpCode.OP_END_LINE);
pub const OP_SEMI_END_BUF = @enumToInt(enum_OpCode.OP_SEMI_END_BUF);
pub const OP_CHECK_POSITION = @enumToInt(enum_OpCode.OP_CHECK_POSITION);
pub const OP_BACKREF1 = @enumToInt(enum_OpCode.OP_BACKREF1);
pub const OP_BACKREF2 = @enumToInt(enum_OpCode.OP_BACKREF2);
pub const OP_BACKREF_N = @enumToInt(enum_OpCode.OP_BACKREF_N);
pub const OP_BACKREF_N_IC = @enumToInt(enum_OpCode.OP_BACKREF_N_IC);
pub const OP_BACKREF_MULTI = @enumToInt(enum_OpCode.OP_BACKREF_MULTI);
pub const OP_BACKREF_MULTI_IC = @enumToInt(enum_OpCode.OP_BACKREF_MULTI_IC);
pub const OP_BACKREF_WITH_LEVEL = @enumToInt(enum_OpCode.OP_BACKREF_WITH_LEVEL);
pub const OP_BACKREF_WITH_LEVEL_IC = @enumToInt(enum_OpCode.OP_BACKREF_WITH_LEVEL_IC);
pub const OP_BACKREF_CHECK = @enumToInt(enum_OpCode.OP_BACKREF_CHECK);
pub const OP_BACKREF_CHECK_WITH_LEVEL = @enumToInt(enum_OpCode.OP_BACKREF_CHECK_WITH_LEVEL);
pub const OP_MEM_START = @enumToInt(enum_OpCode.OP_MEM_START);
pub const OP_MEM_START_PUSH = @enumToInt(enum_OpCode.OP_MEM_START_PUSH);
pub const OP_MEM_END_PUSH = @enumToInt(enum_OpCode.OP_MEM_END_PUSH);
pub const OP_MEM_END_PUSH_REC = @enumToInt(enum_OpCode.OP_MEM_END_PUSH_REC);
pub const OP_MEM_END = @enumToInt(enum_OpCode.OP_MEM_END);
pub const OP_MEM_END_REC = @enumToInt(enum_OpCode.OP_MEM_END_REC);
pub const OP_FAIL = @enumToInt(enum_OpCode.OP_FAIL);
pub const OP_JUMP = @enumToInt(enum_OpCode.OP_JUMP);
pub const OP_PUSH = @enumToInt(enum_OpCode.OP_PUSH);
pub const OP_PUSH_SUPER = @enumToInt(enum_OpCode.OP_PUSH_SUPER);
pub const OP_POP = @enumToInt(enum_OpCode.OP_POP);
pub const OP_POP_TO_MARK = @enumToInt(enum_OpCode.OP_POP_TO_MARK);
pub const OP_PUSH_OR_JUMP_EXACT1 = @enumToInt(enum_OpCode.OP_PUSH_OR_JUMP_EXACT1);
pub const OP_PUSH_IF_PEEK_NEXT = @enumToInt(enum_OpCode.OP_PUSH_IF_PEEK_NEXT);
pub const OP_REPEAT = @enumToInt(enum_OpCode.OP_REPEAT);
pub const OP_REPEAT_NG = @enumToInt(enum_OpCode.OP_REPEAT_NG);
pub const OP_REPEAT_INC = @enumToInt(enum_OpCode.OP_REPEAT_INC);
pub const OP_REPEAT_INC_NG = @enumToInt(enum_OpCode.OP_REPEAT_INC_NG);
pub const OP_EMPTY_CHECK_START = @enumToInt(enum_OpCode.OP_EMPTY_CHECK_START);
pub const OP_EMPTY_CHECK_END = @enumToInt(enum_OpCode.OP_EMPTY_CHECK_END);
pub const OP_EMPTY_CHECK_END_MEMST = @enumToInt(enum_OpCode.OP_EMPTY_CHECK_END_MEMST);
pub const OP_EMPTY_CHECK_END_MEMST_PUSH = @enumToInt(enum_OpCode.OP_EMPTY_CHECK_END_MEMST_PUSH);
pub const OP_MOVE = @enumToInt(enum_OpCode.OP_MOVE);
pub const OP_STEP_BACK_START = @enumToInt(enum_OpCode.OP_STEP_BACK_START);
pub const OP_STEP_BACK_NEXT = @enumToInt(enum_OpCode.OP_STEP_BACK_NEXT);
pub const OP_CUT_TO_MARK = @enumToInt(enum_OpCode.OP_CUT_TO_MARK);
pub const OP_MARK = @enumToInt(enum_OpCode.OP_MARK);
pub const OP_SAVE_VAL = @enumToInt(enum_OpCode.OP_SAVE_VAL);
pub const OP_UPDATE_VAR = @enumToInt(enum_OpCode.OP_UPDATE_VAR);
pub const OP_CALL = @enumToInt(enum_OpCode.OP_CALL);
pub const OP_RETURN = @enumToInt(enum_OpCode.OP_RETURN);
pub const OP_CALLOUT_CONTENTS = @enumToInt(enum_OpCode.OP_CALLOUT_CONTENTS);
pub const OP_CALLOUT_NAME = @enumToInt(enum_OpCode.OP_CALLOUT_NAME);
pub const enum_OpCode = extern enum(c_int) {
    OP_FINISH = 0,
    OP_END = 1,
    OP_STR_1 = 2,
    OP_STR_2 = 3,
    OP_STR_3 = 4,
    OP_STR_4 = 5,
    OP_STR_5 = 6,
    OP_STR_N = 7,
    OP_STR_MB2N1 = 8,
    OP_STR_MB2N2 = 9,
    OP_STR_MB2N3 = 10,
    OP_STR_MB2N = 11,
    OP_STR_MB3N = 12,
    OP_STR_MBN = 13,
    OP_CCLASS = 14,
    OP_CCLASS_MB = 15,
    OP_CCLASS_MIX = 16,
    OP_CCLASS_NOT = 17,
    OP_CCLASS_MB_NOT = 18,
    OP_CCLASS_MIX_NOT = 19,
    OP_ANYCHAR = 20,
    OP_ANYCHAR_ML = 21,
    OP_ANYCHAR_STAR = 22,
    OP_ANYCHAR_ML_STAR = 23,
    OP_ANYCHAR_STAR_PEEK_NEXT = 24,
    OP_ANYCHAR_ML_STAR_PEEK_NEXT = 25,
    OP_WORD = 26,
    OP_WORD_ASCII = 27,
    OP_NO_WORD = 28,
    OP_NO_WORD_ASCII = 29,
    OP_WORD_BOUNDARY = 30,
    OP_NO_WORD_BOUNDARY = 31,
    OP_WORD_BEGIN = 32,
    OP_WORD_END = 33,
    OP_TEXT_SEGMENT_BOUNDARY = 34,
    OP_BEGIN_BUF = 35,
    OP_END_BUF = 36,
    OP_BEGIN_LINE = 37,
    OP_END_LINE = 38,
    OP_SEMI_END_BUF = 39,
    OP_CHECK_POSITION = 40,
    OP_BACKREF1 = 41,
    OP_BACKREF2 = 42,
    OP_BACKREF_N = 43,
    OP_BACKREF_N_IC = 44,
    OP_BACKREF_MULTI = 45,
    OP_BACKREF_MULTI_IC = 46,
    OP_BACKREF_WITH_LEVEL = 47,
    OP_BACKREF_WITH_LEVEL_IC = 48,
    OP_BACKREF_CHECK = 49,
    OP_BACKREF_CHECK_WITH_LEVEL = 50,
    OP_MEM_START = 51,
    OP_MEM_START_PUSH = 52,
    OP_MEM_END_PUSH = 53,
    OP_MEM_END_PUSH_REC = 54,
    OP_MEM_END = 55,
    OP_MEM_END_REC = 56,
    OP_FAIL = 57,
    OP_JUMP = 58,
    OP_PUSH = 59,
    OP_PUSH_SUPER = 60,
    OP_POP = 61,
    OP_POP_TO_MARK = 62,
    OP_PUSH_OR_JUMP_EXACT1 = 63,
    OP_PUSH_IF_PEEK_NEXT = 64,
    OP_REPEAT = 65,
    OP_REPEAT_NG = 66,
    OP_REPEAT_INC = 67,
    OP_REPEAT_INC_NG = 68,
    OP_EMPTY_CHECK_START = 69,
    OP_EMPTY_CHECK_END = 70,
    OP_EMPTY_CHECK_END_MEMST = 71,
    OP_EMPTY_CHECK_END_MEMST_PUSH = 72,
    OP_MOVE = 73,
    OP_STEP_BACK_START = 74,
    OP_STEP_BACK_NEXT = 75,
    OP_CUT_TO_MARK = 76,
    OP_MARK = 77,
    OP_SAVE_VAL = 78,
    OP_UPDATE_VAR = 79,
    OP_CALL = 80,
    OP_RETURN = 81,
    OP_CALLOUT_CONTENTS = 82,
    OP_CALLOUT_NAME = 83,
    _,
};
pub const struct_re_pattern_buffer = extern struct {
    ops: [*c]Operation,
    ocs: [*c]enum_OpCode,
    ops_curr: [*c]Operation,
    ops_used: c_uint,
    ops_alloc: c_uint,
    string_pool: [*c]u8,
    string_pool_end: [*c]u8,
    num_mem: c_int,
    num_repeat: c_int,
    num_empty_check: c_int,
    num_call: c_int,
    capture_history: MemStatusType,
    push_mem_start: MemStatusType,
    push_mem_end: MemStatusType,
    stack_pop_level: c_int,
    repeat_range_alloc: c_int,
    repeat_range: [*c]RepeatRange,
    enc: OnigEncoding,
    options: OnigOptionType,
    syntax: [*c]OnigSyntaxType,
    case_fold_flag: OnigCaseFoldType,
    name_table: ?*c_void,
    optimize: c_int,
    threshold_len: c_int,
    anchor: c_int,
    anc_dist_min: OnigLen,
    anc_dist_max: OnigLen,
    sub_anchor: c_int,
    exact: [*c]u8,
    exact_end: [*c]u8,
    map: [256]u8,
    map_offset: c_int,
    dist_min: OnigLen,
    dist_max: OnigLen,
    extp: [*c]RegexExt,
};
pub const OnigRegexType = struct_re_pattern_buffer;
pub const OnigRegex = [*c]OnigRegexType;
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
pub fn onig_set_warn_func(arg_f: OnigWarnFunc) callconv(.C) void {
    var f = arg_f;
    onig_warn = f;
}
pub fn onig_set_verb_warn_func(arg_f: OnigWarnFunc) callconv(.C) void {
    var f = arg_f;
    onig_verb_warn = f;
}
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
pub extern fn onig_regset_new(rset: [*c]?*OnigRegSet, n: c_int, regs: [*c][*c]regex_t) c_int;
pub extern fn onig_regset_add(set: ?*OnigRegSet, reg: [*c]regex_t) c_int;
pub extern fn onig_regset_replace(set: ?*OnigRegSet, at: c_int, reg: [*c]regex_t) c_int;
pub extern fn onig_regset_free(set: ?*OnigRegSet) void;
pub extern fn onig_regset_number_of_regex(set: ?*OnigRegSet) c_int;
pub extern fn onig_regset_get_regex(set: ?*OnigRegSet, at: c_int) [*c]regex_t;
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
pub fn onig_name_to_group_numbers(arg_reg: OnigRegex, arg_name: [*c]const OnigUChar, arg_name_end: [*c]const OnigUChar, arg_nums: [*c][*c]c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var name = arg_name;
    var name_end = arg_name_end;
    var nums = arg_nums;
    var e: [*c]NameEntry = name_find(reg, name, name_end);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 217);
    switch_3: {
        default: {
            case_1: {
                case: {
                    switch (e.*.back_num) {
                        @as(c_int, 0) => break :case,
                        @as(c_int, 1) => break :case_1,
                        else => break :default,
                    }
                }
                break :@"switch";
            }
            nums.?.* = &(e.*.back_ref1);
            break :switch_2;
        }
        nums.?.* = e.*.back_refs;
        break :switch_3;
    }
    return e.*.back_num;
}
pub fn onig_name_to_backref_number(arg_reg: OnigRegex, arg_name: [*c]const OnigUChar, arg_name_end: [*c]const OnigUChar, arg_region: [*c]OnigRegion) callconv(.C) c_int {
    var reg = arg_reg;
    var name = arg_name;
    var name_end = arg_name_end;
    var region = arg_region;
    var i: c_int = undefined;
    var n: c_int = undefined;
    var nums: [*c]c_int = undefined;
    n = onig_name_to_group_numbers(reg, name, name_end, &nums);
    if (n < @as(c_int, 0)) return n else if (n == @as(c_int, 0)) return -@as(c_int, 11) else if (n == @as(c_int, 1)) return nums[@intCast(c_uint, @as(c_int, 0))] else {
        if ((@ptrCast(?*c_void, (region))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            {
                i = (n - @as(c_int, 1));
                while (i >= @as(c_int, 0)) : (i -= 1) {
                    if (region.*.beg[@intCast(c_uint, nums[@intCast(c_uint, i)])] != -@as(c_int, 1)) return nums[@intCast(c_uint, i)];
                }
            }
        }
        return nums[@intCast(c_uint, (n - @as(c_int, 1)))];
    }
    return 0;
}
pub fn onig_foreach_name(arg_reg: OnigRegex, arg_func: ?fn ([*c]const OnigUChar, [*c]const OnigUChar, c_int, [*c]c_int, OnigRegex, ?*c_void) callconv(.C) c_int, arg_arg: ?*c_void) callconv(.C) c_int {
    var reg = arg_reg;
    var func = arg_func;
    var arg = arg_arg;
    var narg: INamesArg = undefined;
    var t: [*c]NameTable = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    narg.ret = 0;
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        narg.func = func;
        narg.reg = reg;
        narg.arg = arg;
        narg.enc = reg.*.enc;
        _ = onig_st_foreach(t, @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), i_names)), @intCast(HashDataType, @ptrToInt(&narg)));
    }
    return narg.ret;
}
pub fn onig_number_of_names(arg_reg: OnigRegex) callconv(.C) c_int {
    var reg = arg_reg;
    var t: [*c]NameTable = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) return t.*.num_entries else return 0;
    return 0;
}
pub extern fn onig_number_of_captures(reg: OnigRegex) c_int;
pub extern fn onig_number_of_capture_histories(reg: OnigRegex) c_int;
pub extern fn onig_get_capture_tree(region: [*c]OnigRegion) [*c]OnigCaptureTreeNode;
pub extern fn onig_capture_tree_traverse(region: [*c]OnigRegion, at: c_int, callback_func: ?fn (c_int, c_int, c_int, c_int, c_int, ?*c_void) callconv(.C) c_int, arg: ?*c_void) c_int;
pub fn onig_noname_group_capture_is_active(arg_reg: OnigRegex) callconv(.C) c_int {
    var reg = arg_reg;
    if (((reg.*.options) & (((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1))) != 0) return 0;
    if (((onig_number_of_names(reg) > @as(c_int, 0)) and (((reg.*.syntax).*.behavior & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 7))) != @bitCast(c_uint, @as(c_int, 0)))) and !(((reg.*.options) & ((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1))) != 0)) {
        return 0;
    }
    return 1;
}
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
pub fn onig_get_parse_depth_limit() callconv(.C) c_uint {
    return ParseDepthLimit;
}
pub fn onig_set_capture_num_limit(arg_num: c_int) callconv(.C) c_int {
    var num = arg_num;
    if (num < @as(c_int, 0)) return -@as(c_int, 1);
    MaxCaptureNum = num;
    return 0;
}
pub fn onig_set_parse_depth_limit(arg_depth: c_uint) callconv(.C) c_int {
    var depth = arg_depth;
    if (depth == @bitCast(c_uint, @as(c_int, 0))) ParseDepthLimit = @bitCast(c_uint, @as(c_int, 4096)) else ParseDepthLimit = depth;
    return 0;
}
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
pub fn onig_set_callout_of_name(arg_enc: OnigEncoding, arg_callout_type: OnigCalloutType, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar, arg_in: c_int, arg_start_func: OnigCalloutFunc, arg_end_func: OnigCalloutFunc, arg_arg_num: c_int, arg_arg_types: [*c]c_uint, arg_opt_arg_num: c_int, arg_opt_defaults: [*c]OnigValue) callconv(.C) c_int {
    var enc = arg_enc;
    var callout_type = arg_callout_type;
    var name = arg_name;
    var name_end = arg_name_end;
    var in = arg_in;
    var start_func = arg_start_func;
    var end_func = arg_end_func;
    var arg_num = arg_arg_num;
    var arg_types = arg_arg_types;
    var opt_arg_num = arg_opt_arg_num;
    var opt_defaults = arg_opt_defaults;
    var r: c_int = undefined;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var id: c_int = undefined;
    var is_not_single: c_int = undefined;
    var e: [*c]CalloutNameEntry = undefined;
    var fe: [*c]CalloutNameListEntry = undefined;
    if (@bitCast(c_uint, @enumToInt(callout_type)) != @bitCast(c_uint, ONIG_CALLOUT_TYPE_SINGLE)) return -@as(c_int, 30);
    if ((arg_num < @as(c_int, 0)) or (arg_num > @as(c_int, 4))) return -@as(c_int, 232);
    if ((opt_arg_num < @as(c_int, 0)) or (opt_arg_num > arg_num)) return -@as(c_int, 232);
    if ((start_func == null) and (end_func == null)) return -@as(c_int, 232);
    if (((in & ONIG_CALLOUT_IN_PROGRESS) == @as(c_int, 0)) and ((in & ONIG_CALLOUT_IN_RETRACTION) == @as(c_int, 0))) return -@as(c_int, 232);
    {
        i = 0;
        while (i < arg_num) : (i += 1) {
            var t: c_uint = arg_types[@intCast(c_uint, i)];
            if (t == @bitCast(c_uint, ONIG_TYPE_VOID)) return -@as(c_int, 232) else {
                if (i >= (arg_num - opt_arg_num)) {
                    if ((((t != @bitCast(c_uint, ONIG_TYPE_LONG)) and (t != @bitCast(c_uint, ONIG_TYPE_CHAR))) and (t != @bitCast(c_uint, ONIG_TYPE_STRING))) and (t != @bitCast(c_uint, ONIG_TYPE_TAG))) return -@as(c_int, 232);
                } else {
                    if (t != @bitCast(c_uint, ONIG_TYPE_LONG)) {
                        t = (t & @bitCast(c_uint, ~ONIG_TYPE_LONG));
                        if (((t != @bitCast(c_uint, ONIG_TYPE_CHAR)) and (t != @bitCast(c_uint, ONIG_TYPE_STRING))) and (t != @bitCast(c_uint, ONIG_TYPE_TAG))) return -@as(c_int, 232);
                    }
                }
            }
        }
    }
    if (!(is_allowed_callout_name(enc, name, name_end) != 0)) {
        return -@as(c_int, 228);
    }
    is_not_single = @boolToInt((@bitCast(c_uint, @enumToInt(callout_type)) != @bitCast(c_uint, ONIG_CALLOUT_TYPE_SINGLE)));
    id = callout_name_entry(&e, enc, is_not_single, name, name_end);
    if (id < @as(c_int, 0)) return id;
    r = 0;
    if ((@ptrCast(?*c_void, (GlobalCalloutNameList))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        r = make_callout_func_list(&GlobalCalloutNameList, @as(c_int, 10));
        if (r != @as(c_int, 0)) return r;
    }
    while (id >= GlobalCalloutNameList.*.n) {
        var rid: c_int = undefined;
        r = callout_func_list_add(GlobalCalloutNameList, &rid);
        if (r != @as(c_int, 0)) return r;
    }
    fe = (GlobalCalloutNameList.*.v + id);
    fe.*.type = callout_type;
    fe.*.in = in;
    fe.*.start_func = start_func;
    fe.*.end_func = end_func;
    fe.*.arg_num = arg_num;
    fe.*.opt_arg_num = opt_arg_num;
    fe.*.name = e.*.name;
    {
        i = 0;
        while (i < arg_num) : (i += 1) {
            fe.*.arg_types[@intCast(c_uint, i)] = arg_types[@intCast(c_uint, i)];
        }
    }
    {
        _ = (blk: {
            i = (arg_num - opt_arg_num);
            break :blk blk_1: {
                const tmp = @as(c_int, 0);
                j = tmp;
                break :blk_1 tmp;
            };
        });
        while (i < arg_num) : (_ = (blk: {
            i += 1;
            break :blk (blk_1: {
                const ref = &j;
                const tmp = ref.*;
                ref.* += 1;
                break :blk_1 tmp;
            });
        })) {
            if ((@ptrCast(?*c_void, (opt_defaults))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 30);
            if (fe.*.arg_types[@intCast(c_uint, i)] == @bitCast(c_uint, ONIG_TYPE_STRING)) {
                var val: [*c]OnigValue = undefined;
                var ds: [*c]OnigUChar = undefined;
                val = (opt_defaults + j);
                ds = onigenc_strdup(enc, val.*.s.start, val.*.s.end);
                if ((@ptrCast(?*c_void, (ds))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
                fe.*.opt_defaults[@intCast(c_uint, i)].s.start = ds;
                fe.*.opt_defaults[@intCast(c_uint, i)].s.end = (ds + (val.*.s.end - val.*.s.start));
            } else {
                fe.*.opt_defaults[@intCast(c_uint, i)] = opt_defaults[@intCast(c_uint, j)];
            }
        }
    }
    r = id;
    return r;
}
pub fn onig_get_callout_name_by_name_id(arg_name_id: c_int) callconv(.C) [*c]OnigUChar {
    var name_id = arg_name_id;
    if ((name_id < @as(c_int, 0)) or (name_id >= GlobalCalloutNameList.*.n)) return null;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].name;
}
pub fn onig_get_callout_num_by_tag(arg_reg: OnigRegex, arg_tag: [*c]const OnigUChar, arg_tag_end: [*c]const OnigUChar) callconv(.C) c_int {
    var reg = arg_reg;
    var tag = arg_tag;
    var tag_end = arg_tag_end;
    var r: c_int = undefined;
    var ext: [*c]RegexExt = undefined;
    var e: CalloutTagVal = undefined;
    ext = reg.*.extp;
    if (((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) or ((ext.*.tag_table) == @intToPtr(?*c_void, @as(c_int, 0)))) return -@as(c_int, 231);
    r = onig_st_lookup_strend(ext.*.tag_table, tag, tag_end, @ptrCast([*c]HashDataType, @alignCast(@alignOf(HashDataType), (@ptrCast(?*c_void, (&e))))));
    if (r == @as(c_int, 0)) return -@as(c_int, 231);
    return @bitCast(c_int, @truncate(c_int, e));
}
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
pub fn onig_callout_tag_is_exist_at_callout_num(arg_reg: OnigRegex, arg_callout_num: c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var callout_num = arg_callout_num;
    var ext: [*c]RegexExt = reg.*.extp;
    if (((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) or ((@ptrCast(?*c_void, (ext.*.callout_list))) == @intToPtr(?*c_void, @as(c_int, 0)))) return 0;
    if (callout_num > ext.*.callout_num) return 0;
    return @boolToInt(((ext.*.callout_list[@intCast(c_uint, callout_num)].flag & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))) != @as(c_int, 0)));
}
pub fn onig_get_callout_tag_start(arg_reg: OnigRegex, arg_callout_num: c_int) callconv(.C) [*c]const OnigUChar {
    var reg = arg_reg;
    var callout_num = arg_callout_num;
    var e: [*c]CalloutListEntry = onig_reg_callout_list_at(reg, callout_num);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    return e.*.tag_start;
}
pub fn onig_get_callout_tag_end(arg_reg: OnigRegex, arg_callout_num: c_int) callconv(.C) [*c]const OnigUChar {
    var reg = arg_reg;
    var callout_num = arg_callout_num;
    var e: [*c]CalloutListEntry = onig_reg_callout_list_at(reg, callout_num);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    return e.*.tag_end;
}
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
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __darwin_intptr_t = c_long;
pub const __darwin_natural_t = c_uint;
pub const __darwin_ct_rune_t = c_int;
const union_unnamed_18 = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __mbstate_t = union_unnamed_18;
pub const __darwin_mbstate_t = __mbstate_t;
pub const __darwin_ptrdiff_t = c_long;
pub const __darwin_size_t = c_ulong;
pub const __darwin_va_list = __builtin_va_list;
pub const __darwin_wchar_t = c_int;
pub const __darwin_rune_t = __darwin_wchar_t;
pub const __darwin_wint_t = c_int;
pub const __darwin_clock_t = c_ulong;
pub const __darwin_socklen_t = __uint32_t;
pub const __darwin_ssize_t = c_long;
pub const __darwin_time_t = c_long;
pub const __darwin_blkcnt_t = __int64_t;
pub const __darwin_blksize_t = __int32_t;
pub const __darwin_dev_t = __int32_t;
pub const __darwin_fsblkcnt_t = c_uint;
pub const __darwin_fsfilcnt_t = c_uint;
pub const __darwin_gid_t = __uint32_t;
pub const __darwin_id_t = __uint32_t;
pub const __darwin_ino64_t = __uint64_t;
pub const __darwin_ino_t = __darwin_ino64_t;
pub const __darwin_mach_port_name_t = __darwin_natural_t;
pub const __darwin_mach_port_t = __darwin_mach_port_name_t;
pub const __darwin_mode_t = __uint16_t;
pub const __darwin_off_t = __int64_t;
pub const __darwin_pid_t = __int32_t;
pub const __darwin_sigset_t = __uint32_t;
pub const __darwin_suseconds_t = __int32_t;
pub const __darwin_uid_t = __uint32_t;
pub const __darwin_useconds_t = __uint32_t;
pub const __darwin_uuid_t = [16]u8;
pub const __darwin_uuid_string_t = [37]u8;
pub const struct___darwin_pthread_handler_rec = extern struct {
    __routine: ?fn (?*c_void) callconv(.C) void,
    __arg: ?*c_void,
    __next: [*c]struct___darwin_pthread_handler_rec,
};
pub const struct__opaque_pthread_attr_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_cond_t = extern struct {
    __sig: c_long,
    __opaque: [40]u8,
};
pub const struct__opaque_pthread_condattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_mutex_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_mutexattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_once_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_rwlock_t = extern struct {
    __sig: c_long,
    __opaque: [192]u8,
};
pub const struct__opaque_pthread_rwlockattr_t = extern struct {
    __sig: c_long,
    __opaque: [16]u8,
};
pub const struct__opaque_pthread_t = extern struct {
    __sig: c_long,
    __cleanup_stack: [*c]struct___darwin_pthread_handler_rec,
    __opaque: [8176]u8,
};
pub const __darwin_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const __darwin_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const __darwin_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const __darwin_pthread_key_t = c_ulong;
pub const __darwin_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const __darwin_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const __darwin_pthread_once_t = struct__opaque_pthread_once_t;
pub const __darwin_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const __darwin_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const __darwin_pthread_t = [*c]struct__opaque_pthread_t;
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub const P_ALL = @enumToInt(enum_unnamed_19.P_ALL);
pub const P_PID = @enumToInt(enum_unnamed_19.P_PID);
pub const P_PGID = @enumToInt(enum_unnamed_19.P_PGID);
const enum_unnamed_19 = extern enum(c_int) {
    P_ALL,
    P_PID,
    P_PGID,
    _,
};
pub const idtype_t = enum_unnamed_19;
pub const pid_t = __darwin_pid_t;
pub const id_t = __darwin_id_t;
pub const sig_atomic_t = c_int;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulonglong;
pub const register_t = i64;
pub const user_addr_t = u_int64_t;
pub const user_size_t = u_int64_t;
pub const user_ssize_t = i64;
pub const user_long_t = i64;
pub const user_ulong_t = u_int64_t;
pub const user_time_t = i64;
pub const user_off_t = i64;
pub const syscall_arg_t = u_int64_t;
pub const struct___darwin_i386_thread_state = extern struct {
    __eax: c_uint,
    __ebx: c_uint,
    __ecx: c_uint,
    __edx: c_uint,
    __edi: c_uint,
    __esi: c_uint,
    __ebp: c_uint,
    __esp: c_uint,
    __ss: c_uint,
    __eflags: c_uint,
    __eip: c_uint,
    __cs: c_uint,
    __ds: c_uint,
    __es: c_uint,
    __fs: c_uint,
    __gs: c_uint,
};
pub const struct___darwin_fp_control = opaque {}; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/mach/i386/_structs.h:94:21: warning: struct demoted to opaque type - has bitfield
pub const __darwin_fp_control_t = struct___darwin_fp_control;
pub const struct___darwin_fp_status = opaque {}; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/mach/i386/_structs.h:152:21: warning: struct demoted to opaque type - has bitfield
pub const __darwin_fp_status_t = struct___darwin_fp_status;
pub const struct___darwin_mmst_reg = extern struct {
    __mmst_reg: [10]u8,
    __mmst_rsrv: [6]u8,
};
pub const struct___darwin_xmm_reg = extern struct {
    __xmm_reg: [16]u8,
};
pub const struct___darwin_ymm_reg = extern struct {
    __ymm_reg: [32]u8,
};
pub const struct___darwin_zmm_reg = extern struct {
    __zmm_reg: [64]u8,
};
pub const struct___darwin_opmask_reg = extern struct {
    __opmask_reg: [8]u8,
};
pub const struct___darwin_i386_float_state = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_rsrv4: [224]u8,
    __fpu_reserved1: c_int,
};
pub const struct___darwin_i386_avx_state = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_rsrv4: [224]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
};
pub const struct___darwin_i386_avx512_state = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_rsrv4: [224]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
    __fpu_k0: struct___darwin_opmask_reg,
    __fpu_k1: struct___darwin_opmask_reg,
    __fpu_k2: struct___darwin_opmask_reg,
    __fpu_k3: struct___darwin_opmask_reg,
    __fpu_k4: struct___darwin_opmask_reg,
    __fpu_k5: struct___darwin_opmask_reg,
    __fpu_k6: struct___darwin_opmask_reg,
    __fpu_k7: struct___darwin_opmask_reg,
    __fpu_zmmh0: struct___darwin_ymm_reg,
    __fpu_zmmh1: struct___darwin_ymm_reg,
    __fpu_zmmh2: struct___darwin_ymm_reg,
    __fpu_zmmh3: struct___darwin_ymm_reg,
    __fpu_zmmh4: struct___darwin_ymm_reg,
    __fpu_zmmh5: struct___darwin_ymm_reg,
    __fpu_zmmh6: struct___darwin_ymm_reg,
    __fpu_zmmh7: struct___darwin_ymm_reg,
};
pub const struct___darwin_i386_exception_state = extern struct {
    __trapno: __uint16_t,
    __cpu: __uint16_t,
    __err: __uint32_t,
    __faultvaddr: __uint32_t,
};
pub const struct___darwin_x86_debug_state32 = extern struct {
    __dr0: c_uint,
    __dr1: c_uint,
    __dr2: c_uint,
    __dr3: c_uint,
    __dr4: c_uint,
    __dr5: c_uint,
    __dr6: c_uint,
    __dr7: c_uint,
};
pub const struct___x86_pagein_state = extern struct {
    __pagein_error: c_int,
};
pub const struct___darwin_x86_thread_state64 = extern struct {
    __rax: __uint64_t,
    __rbx: __uint64_t,
    __rcx: __uint64_t,
    __rdx: __uint64_t,
    __rdi: __uint64_t,
    __rsi: __uint64_t,
    __rbp: __uint64_t,
    __rsp: __uint64_t,
    __r8: __uint64_t,
    __r9: __uint64_t,
    __r10: __uint64_t,
    __r11: __uint64_t,
    __r12: __uint64_t,
    __r13: __uint64_t,
    __r14: __uint64_t,
    __r15: __uint64_t,
    __rip: __uint64_t,
    __rflags: __uint64_t,
    __cs: __uint64_t,
    __fs: __uint64_t,
    __gs: __uint64_t,
};
pub const struct___darwin_x86_thread_full_state64 = extern struct {
    __ss64: struct___darwin_x86_thread_state64,
    __ds: __uint64_t,
    __es: __uint64_t,
    __ss: __uint64_t,
    __gsbase: __uint64_t,
};
pub const struct___darwin_x86_float_state64 = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_xmm8: struct___darwin_xmm_reg,
    __fpu_xmm9: struct___darwin_xmm_reg,
    __fpu_xmm10: struct___darwin_xmm_reg,
    __fpu_xmm11: struct___darwin_xmm_reg,
    __fpu_xmm12: struct___darwin_xmm_reg,
    __fpu_xmm13: struct___darwin_xmm_reg,
    __fpu_xmm14: struct___darwin_xmm_reg,
    __fpu_xmm15: struct___darwin_xmm_reg,
    __fpu_rsrv4: [96]u8,
    __fpu_reserved1: c_int,
};
pub const struct___darwin_x86_avx_state64 = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_xmm8: struct___darwin_xmm_reg,
    __fpu_xmm9: struct___darwin_xmm_reg,
    __fpu_xmm10: struct___darwin_xmm_reg,
    __fpu_xmm11: struct___darwin_xmm_reg,
    __fpu_xmm12: struct___darwin_xmm_reg,
    __fpu_xmm13: struct___darwin_xmm_reg,
    __fpu_xmm14: struct___darwin_xmm_reg,
    __fpu_xmm15: struct___darwin_xmm_reg,
    __fpu_rsrv4: [96]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
    __fpu_ymmh8: struct___darwin_xmm_reg,
    __fpu_ymmh9: struct___darwin_xmm_reg,
    __fpu_ymmh10: struct___darwin_xmm_reg,
    __fpu_ymmh11: struct___darwin_xmm_reg,
    __fpu_ymmh12: struct___darwin_xmm_reg,
    __fpu_ymmh13: struct___darwin_xmm_reg,
    __fpu_ymmh14: struct___darwin_xmm_reg,
    __fpu_ymmh15: struct___darwin_xmm_reg,
};
pub const struct___darwin_x86_avx512_state64 = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_xmm8: struct___darwin_xmm_reg,
    __fpu_xmm9: struct___darwin_xmm_reg,
    __fpu_xmm10: struct___darwin_xmm_reg,
    __fpu_xmm11: struct___darwin_xmm_reg,
    __fpu_xmm12: struct___darwin_xmm_reg,
    __fpu_xmm13: struct___darwin_xmm_reg,
    __fpu_xmm14: struct___darwin_xmm_reg,
    __fpu_xmm15: struct___darwin_xmm_reg,
    __fpu_rsrv4: [96]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
    __fpu_ymmh8: struct___darwin_xmm_reg,
    __fpu_ymmh9: struct___darwin_xmm_reg,
    __fpu_ymmh10: struct___darwin_xmm_reg,
    __fpu_ymmh11: struct___darwin_xmm_reg,
    __fpu_ymmh12: struct___darwin_xmm_reg,
    __fpu_ymmh13: struct___darwin_xmm_reg,
    __fpu_ymmh14: struct___darwin_xmm_reg,
    __fpu_ymmh15: struct___darwin_xmm_reg,
    __fpu_k0: struct___darwin_opmask_reg,
    __fpu_k1: struct___darwin_opmask_reg,
    __fpu_k2: struct___darwin_opmask_reg,
    __fpu_k3: struct___darwin_opmask_reg,
    __fpu_k4: struct___darwin_opmask_reg,
    __fpu_k5: struct___darwin_opmask_reg,
    __fpu_k6: struct___darwin_opmask_reg,
    __fpu_k7: struct___darwin_opmask_reg,
    __fpu_zmmh0: struct___darwin_ymm_reg,
    __fpu_zmmh1: struct___darwin_ymm_reg,
    __fpu_zmmh2: struct___darwin_ymm_reg,
    __fpu_zmmh3: struct___darwin_ymm_reg,
    __fpu_zmmh4: struct___darwin_ymm_reg,
    __fpu_zmmh5: struct___darwin_ymm_reg,
    __fpu_zmmh6: struct___darwin_ymm_reg,
    __fpu_zmmh7: struct___darwin_ymm_reg,
    __fpu_zmmh8: struct___darwin_ymm_reg,
    __fpu_zmmh9: struct___darwin_ymm_reg,
    __fpu_zmmh10: struct___darwin_ymm_reg,
    __fpu_zmmh11: struct___darwin_ymm_reg,
    __fpu_zmmh12: struct___darwin_ymm_reg,
    __fpu_zmmh13: struct___darwin_ymm_reg,
    __fpu_zmmh14: struct___darwin_ymm_reg,
    __fpu_zmmh15: struct___darwin_ymm_reg,
    __fpu_zmm16: struct___darwin_zmm_reg,
    __fpu_zmm17: struct___darwin_zmm_reg,
    __fpu_zmm18: struct___darwin_zmm_reg,
    __fpu_zmm19: struct___darwin_zmm_reg,
    __fpu_zmm20: struct___darwin_zmm_reg,
    __fpu_zmm21: struct___darwin_zmm_reg,
    __fpu_zmm22: struct___darwin_zmm_reg,
    __fpu_zmm23: struct___darwin_zmm_reg,
    __fpu_zmm24: struct___darwin_zmm_reg,
    __fpu_zmm25: struct___darwin_zmm_reg,
    __fpu_zmm26: struct___darwin_zmm_reg,
    __fpu_zmm27: struct___darwin_zmm_reg,
    __fpu_zmm28: struct___darwin_zmm_reg,
    __fpu_zmm29: struct___darwin_zmm_reg,
    __fpu_zmm30: struct___darwin_zmm_reg,
    __fpu_zmm31: struct___darwin_zmm_reg,
};
pub const struct___darwin_x86_exception_state64 = extern struct {
    __trapno: __uint16_t,
    __cpu: __uint16_t,
    __err: __uint32_t,
    __faultvaddr: __uint64_t,
};
pub const struct___darwin_x86_debug_state64 = extern struct {
    __dr0: __uint64_t,
    __dr1: __uint64_t,
    __dr2: __uint64_t,
    __dr3: __uint64_t,
    __dr4: __uint64_t,
    __dr5: __uint64_t,
    __dr6: __uint64_t,
    __dr7: __uint64_t,
};
pub const struct___darwin_x86_cpmu_state64 = extern struct {
    __ctrs: [16]__uint64_t,
};
pub const struct___darwin_mcontext32 = extern struct {
    __es: struct___darwin_i386_exception_state,
    __ss: struct___darwin_i386_thread_state,
    __fs: struct___darwin_i386_float_state,
};
pub const struct___darwin_mcontext_avx32 = extern struct {
    __es: struct___darwin_i386_exception_state,
    __ss: struct___darwin_i386_thread_state,
    __fs: struct___darwin_i386_avx_state,
};
pub const struct___darwin_mcontext_avx512_32 = extern struct {
    __es: struct___darwin_i386_exception_state,
    __ss: struct___darwin_i386_thread_state,
    __fs: struct___darwin_i386_avx512_state,
};
pub const struct___darwin_mcontext64 = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_state64,
    __fs: struct___darwin_x86_float_state64,
};
pub const struct___darwin_mcontext64_full = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_full_state64,
    __fs: struct___darwin_x86_float_state64,
};
pub const struct___darwin_mcontext_avx64 = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_state64,
    __fs: struct___darwin_x86_avx_state64,
};
pub const struct___darwin_mcontext_avx64_full = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_full_state64,
    __fs: struct___darwin_x86_avx_state64,
};
pub const struct___darwin_mcontext_avx512_64 = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_state64,
    __fs: struct___darwin_x86_avx512_state64,
};
pub const struct___darwin_mcontext_avx512_64_full = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_full_state64,
    __fs: struct___darwin_x86_avx512_state64,
};
pub const mcontext_t = [*c]struct___darwin_mcontext64;
pub const pthread_attr_t = __darwin_pthread_attr_t;
pub const struct___darwin_sigaltstack = extern struct {
    ss_sp: ?*c_void,
    ss_size: __darwin_size_t,
    ss_flags: c_int,
};
pub const stack_t = struct___darwin_sigaltstack;
pub const struct___darwin_ucontext = extern struct {
    uc_onstack: c_int,
    uc_sigmask: __darwin_sigset_t,
    uc_stack: struct___darwin_sigaltstack,
    uc_link: [*c]struct___darwin_ucontext,
    uc_mcsize: __darwin_size_t,
    uc_mcontext: [*c]struct___darwin_mcontext64,
};
pub const ucontext_t = struct___darwin_ucontext;
pub const sigset_t = __darwin_sigset_t;
pub const uid_t = __darwin_uid_t;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*c_void,
};
pub const struct_sigevent = extern struct {
    sigev_notify: c_int,
    sigev_signo: c_int,
    sigev_value: union_sigval,
    sigev_notify_function: ?fn (union_sigval) callconv(.C) void,
    sigev_notify_attributes: [*c]pthread_attr_t,
};
pub const struct___siginfo = extern struct {
    si_signo: c_int,
    si_errno: c_int,
    si_code: c_int,
    si_pid: pid_t,
    si_uid: uid_t,
    si_status: c_int,
    si_addr: ?*c_void,
    si_value: union_sigval,
    si_band: c_long,
    __pad: [7]c_ulong,
};
pub const siginfo_t = struct___siginfo;
pub const union___sigaction_u = extern union {
    __sa_handler: ?fn (c_int) callconv(.C) void,
    __sa_sigaction: ?fn (c_int, [*c]struct___siginfo, ?*c_void) callconv(.C) void,
};
pub const struct___sigaction = extern struct {
    __sigaction_u: union___sigaction_u,
    sa_tramp: ?fn (?*c_void, c_int, c_int, [*c]siginfo_t, ?*c_void) callconv(.C) void,
    sa_mask: sigset_t,
    sa_flags: c_int,
};
pub const struct_sigaction = extern struct {
    __sigaction_u: union___sigaction_u,
    sa_mask: sigset_t,
    sa_flags: c_int,
};
pub const sig_t = ?fn (c_int) callconv(.C) void;
pub const struct_sigvec = extern struct {
    sv_handler: ?fn (c_int) callconv(.C) void,
    sv_mask: c_int,
    sv_flags: c_int,
};
pub const struct_sigstack = extern struct {
    ss_sp: [*c]u8,
    ss_onstack: c_int,
};
pub extern fn signal(c_int, ?fn (c_int) callconv(.C) void) ?fn (c_int) callconv(.C) void;
pub const int_least8_t = i8;
pub const int_least16_t = i16;
pub const int_least32_t = i32;
pub const int_least64_t = i64;
pub const uint_least8_t = u8;
pub const uint_least16_t = u16;
pub const uint_least32_t = u32;
pub const uint_least64_t = u64;
pub const int_fast8_t = i8;
pub const int_fast16_t = i16;
pub const int_fast32_t = i32;
pub const int_fast64_t = i64;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = u16;
pub const uint_fast32_t = u32;
pub const uint_fast64_t = u64;
pub const intmax_t = c_long;
pub const uintmax_t = c_ulong;
pub const struct_timeval = extern struct {
    tv_sec: __darwin_time_t,
    tv_usec: __darwin_suseconds_t,
};
pub const rlim_t = __uint64_t;
pub const struct_rusage = extern struct {
    ru_utime: struct_timeval,
    ru_stime: struct_timeval,
    ru_maxrss: c_long,
    ru_ixrss: c_long,
    ru_idrss: c_long,
    ru_isrss: c_long,
    ru_minflt: c_long,
    ru_majflt: c_long,
    ru_nswap: c_long,
    ru_inblock: c_long,
    ru_oublock: c_long,
    ru_msgsnd: c_long,
    ru_msgrcv: c_long,
    ru_nsignals: c_long,
    ru_nvcsw: c_long,
    ru_nivcsw: c_long,
};
pub const rusage_info_t = ?*c_void;
pub const struct_rusage_info_v0 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
};
pub const struct_rusage_info_v1 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
};
pub const struct_rusage_info_v2 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
};
pub const struct_rusage_info_v3 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
};
pub const struct_rusage_info_v4 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
    ri_logical_writes: u64,
    ri_lifetime_max_phys_footprint: u64,
    ri_instructions: u64,
    ri_cycles: u64,
    ri_billed_energy: u64,
    ri_serviced_energy: u64,
    ri_interval_max_phys_footprint: u64,
    ri_runnable_time: u64,
};
pub const rusage_info_current = struct_rusage_info_v4;
pub const struct_rlimit = extern struct {
    rlim_cur: rlim_t,
    rlim_max: rlim_t,
};
pub const struct_proc_rlimit_control_wakeupmon = extern struct {
    wm_flags: u32,
    wm_rate: i32,
};
pub extern fn getpriority(c_int, id_t) c_int;
pub extern fn getiopolicy_np(c_int, c_int) c_int;
pub extern fn getrlimit(c_int, [*c]struct_rlimit) c_int;
pub extern fn getrusage(c_int, [*c]struct_rusage) c_int;
pub extern fn setpriority(c_int, id_t, c_int) c_int;
pub extern fn setiopolicy_np(c_int, c_int, c_int) c_int;
pub extern fn setrlimit(c_int, [*c]const struct_rlimit) c_int;
pub fn _OSSwapInt16(arg__data: __uint16_t) callconv(.C) __uint16_t {
    var _data = arg__data;
    return @bitCast(__uint16_t, @truncate(c_short, ((@bitCast(c_int, @as(c_uint, _data)) << @intCast(@import("std").math.Log2Int(c_int), 8)) | (@bitCast(c_int, @as(c_uint, _data)) >> @intCast(@import("std").math.Log2Int(c_int), 8)))));
}
pub fn _OSSwapInt32(arg__data: __uint32_t) callconv(.C) __uint32_t {
    var _data = arg__data;
    return __builtin_bswap32(_data);
}
pub fn _OSSwapInt64(arg__data: __uint64_t) callconv(.C) __uint64_t {
    var _data = arg__data;
    return __builtin_bswap64(_data);
}
const struct_unnamed_20 = opaque {}; // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/wait.h:201:19: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_21 = opaque {}; // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/wait.h:220:19: warning: struct demoted to opaque type - has bitfield
pub const union_wait = extern union {
    w_status: c_int,
    w_T: struct_unnamed_20,
    w_S: struct_unnamed_21,
};
pub extern fn wait([*c]c_int) pid_t;
pub extern fn waitpid(pid_t, [*c]c_int, c_int) pid_t;
pub extern fn waitid(idtype_t, id_t, [*c]siginfo_t, c_int) c_int;
pub extern fn wait3([*c]c_int, c_int, [*c]struct_rusage) pid_t;
pub extern fn wait4(pid_t, [*c]c_int, c_int, [*c]struct_rusage) pid_t;
pub extern fn alloca(c_ulong) ?*c_void;
pub const ct_rune_t = __darwin_ct_rune_t;
pub const rune_t = __darwin_rune_t;
const struct_unnamed_22 = extern struct {
    quot: c_int,
    rem: c_int,
};
pub const div_t = struct_unnamed_22;
const struct_unnamed_23 = extern struct {
    quot: c_long,
    rem: c_long,
};
pub const ldiv_t = struct_unnamed_23;
const struct_unnamed_24 = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub const lldiv_t = struct_unnamed_24;
pub extern var __mb_cur_max: c_int;
pub extern fn malloc(__size: c_ulong) ?*c_void;
pub extern fn calloc(__count: c_ulong, __size: c_ulong) ?*c_void;
pub extern fn free(?*c_void) void;
pub extern fn realloc(__ptr: ?*c_void, __size: c_ulong) ?*c_void;
pub extern fn valloc(usize) ?*c_void;
pub extern fn aligned_alloc(__alignment: usize, __size: usize) ?*c_void;
pub extern fn posix_memalign(__memptr: [*c]?*c_void, __alignment: usize, __size: usize) c_int;
pub extern fn abort() noreturn;
pub extern fn abs(c_int) c_int;
pub extern fn atexit(?fn () callconv(.C) void) c_int;
pub extern fn atof([*c]const u8) f64;
pub extern fn atoi([*c]const u8) c_int;
pub extern fn atol([*c]const u8) c_long;
pub extern fn atoll([*c]const u8) c_longlong;
pub extern fn bsearch(__key: ?*const c_void, __base: ?*const c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) ?*c_void;
pub extern fn div(c_int, c_int) div_t;
pub extern fn exit(c_int) noreturn;
pub extern fn getenv([*c]const u8) [*c]u8;
pub extern fn labs(c_long) c_long;
pub extern fn ldiv(c_long, c_long) ldiv_t;
pub extern fn llabs(c_longlong) c_longlong;
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbstowcs(noalias [*c]wchar_t, noalias [*c]const u8, usize) usize;
pub extern fn mbtowc(noalias [*c]wchar_t, noalias [*c]const u8, usize) c_int;
pub extern fn qsort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) void;
pub extern fn rand() c_int;
pub extern fn srand(c_uint) void;
pub extern fn strtod([*c]const u8, [*c][*c]u8) f64;
pub extern fn strtof([*c]const u8, [*c][*c]u8) f32;
pub extern fn strtol(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtold([*c]const u8, [*c][*c]u8) c_longdouble;
pub extern fn strtoll(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoul(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoull(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn system([*c]const u8) c_int;
pub extern fn wcstombs(noalias [*c]u8, noalias [*c]const wchar_t, usize) usize;
pub extern fn wctomb([*c]u8, wchar_t) c_int;
pub extern fn _Exit(c_int) noreturn;
pub extern fn a64l([*c]const u8) c_long;
pub extern fn drand48() f64;
pub extern fn ecvt(f64, c_int, noalias [*c]c_int, noalias [*c]c_int) [*c]u8;
pub extern fn erand48([*c]c_ushort) f64;
pub extern fn fcvt(f64, c_int, noalias [*c]c_int, noalias [*c]c_int) [*c]u8;
pub extern fn gcvt(f64, c_int, [*c]u8) [*c]u8;
pub extern fn getsubopt([*c][*c]u8, [*c]const [*c]u8, [*c][*c]u8) c_int;
pub extern fn grantpt(c_int) c_int;
pub extern fn initstate(c_uint, [*c]u8, usize) [*c]u8;
pub extern fn jrand48([*c]c_ushort) c_long;
pub extern fn l64a(c_long) [*c]u8;
pub extern fn lcong48([*c]c_ushort) void;
pub extern fn lrand48() c_long;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn mkstemp([*c]u8) c_int;
pub extern fn mrand48() c_long;
pub extern fn nrand48([*c]c_ushort) c_long;
pub extern fn posix_openpt(c_int) c_int;
pub extern fn ptsname(c_int) [*c]u8;
pub extern fn ptsname_r(fildes: c_int, buffer: [*c]u8, buflen: usize) c_int;
pub extern fn putenv([*c]u8) c_int;
pub extern fn random() c_long;
pub extern fn rand_r([*c]c_uint) c_int;
pub extern fn realpath(noalias [*c]const u8, noalias [*c]u8) [*c]u8;
pub extern fn seed48([*c]c_ushort) [*c]c_ushort;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __overwrite: c_int) c_int;
pub extern fn setkey([*c]const u8) void;
pub extern fn setstate([*c]const u8) [*c]u8;
pub extern fn srand48(c_long) void;
pub extern fn srandom(c_uint) void;
pub extern fn unlockpt(c_int) c_int;
pub extern fn unsetenv([*c]const u8) c_int;
pub const dev_t = __darwin_dev_t;
pub const mode_t = __darwin_mode_t;
pub extern fn arc4random() u32;
pub extern fn arc4random_addrandom([*c]u8, c_int) void;
pub extern fn arc4random_buf(__buf: ?*c_void, __nbytes: usize) void;
pub extern fn arc4random_stir() void;
pub extern fn arc4random_uniform(__upper_bound: u32) u32; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:275:6: warning: unsupported type: 'BlockPointer'
pub const atexit_b = @compileError("unable to resolve prototype of function"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:275:6
// /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:276:7: warning: unsupported type: 'BlockPointer'
pub const bsearch_b = @compileError("unable to resolve prototype of function"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:276:7
pub extern fn cgetcap([*c]u8, [*c]const u8, c_int) [*c]u8;
pub extern fn cgetclose() c_int;
pub extern fn cgetent([*c][*c]u8, [*c][*c]u8, [*c]const u8) c_int;
pub extern fn cgetfirst([*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn cgetmatch([*c]const u8, [*c]const u8) c_int;
pub extern fn cgetnext([*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn cgetnum([*c]u8, [*c]const u8, [*c]c_long) c_int;
pub extern fn cgetset([*c]const u8) c_int;
pub extern fn cgetstr([*c]u8, [*c]const u8, [*c][*c]u8) c_int;
pub extern fn cgetustr([*c]u8, [*c]const u8, [*c][*c]u8) c_int;
pub extern fn daemon(c_int, c_int) c_int;
pub extern fn devname(dev_t, mode_t) [*c]u8;
pub extern fn devname_r(dev_t, mode_t, buf: [*c]u8, len: c_int) [*c]u8;
pub extern fn getbsize([*c]c_int, [*c]c_long) [*c]u8;
pub extern fn getloadavg([*c]f64, c_int) c_int;
pub extern fn getprogname() [*c]const u8;
pub extern fn setprogname([*c]const u8) void;
pub extern fn heapsort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) c_int; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:312:6: warning: unsupported type: 'BlockPointer'
pub const heapsort_b = @compileError("unable to resolve prototype of function"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:312:6
pub extern fn mergesort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) c_int; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:319:6: warning: unsupported type: 'BlockPointer'
pub const mergesort_b = @compileError("unable to resolve prototype of function"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:319:6
pub extern fn psort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) void; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:327:7: warning: unsupported type: 'BlockPointer'
pub const psort_b = @compileError("unable to resolve prototype of function"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:327:7
pub extern fn psort_r(__base: ?*c_void, __nel: usize, __width: usize, ?*c_void, __compar: ?fn (?*c_void, ?*const c_void, ?*const c_void) callconv(.C) c_int) void; // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:335:7: warning: unsupported type: 'BlockPointer'
pub const qsort_b = @compileError("unable to resolve prototype of function"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:335:7
pub extern fn qsort_r(__base: ?*c_void, __nel: usize, __width: usize, ?*c_void, __compar: ?fn (?*c_void, ?*const c_void, ?*const c_void) callconv(.C) c_int) void;
pub extern fn radixsort(__base: [*c][*c]const u8, __nel: c_int, __table: [*c]const u8, __endbyte: c_uint) c_int;
pub extern fn rpmatch([*c]const u8) c_int;
pub extern fn sradixsort(__base: [*c][*c]const u8, __nel: c_int, __table: [*c]const u8, __endbyte: c_uint) c_int;
pub extern fn sranddev() void;
pub extern fn srandomdev() void;
pub extern fn reallocf(__ptr: ?*c_void, __size: usize) ?*c_void;
pub extern fn strtoq(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern var suboptarg: [*c]u8;
pub extern fn memchr(__s: ?*const c_void, __c: c_int, __n: c_ulong) ?*c_void;
pub extern fn memcmp(__s1: ?*const c_void, __s2: ?*const c_void, __n: c_ulong) c_int;
pub extern fn memcpy(__dst: ?*c_void, __src: ?*const c_void, __n: c_ulong) ?*c_void;
pub extern fn memmove(__dst: ?*c_void, __src: ?*const c_void, __len: c_ulong) ?*c_void;
pub extern fn memset(__b: ?*c_void, __c: c_int, __len: c_ulong) ?*c_void;
pub extern fn strcat(__s1: [*c]u8, __s2: [*c]const u8) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __charset: [*c]const u8) c_ulong;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) c_ulong;
pub extern fn strncat(__s1: [*c]u8, __s2: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strncpy(__dst: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strpbrk(__s: [*c]const u8, __charset: [*c]const u8) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strspn(__s: [*c]const u8, __charset: [*c]const u8) c_ulong;
pub extern fn strstr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strtok(__str: [*c]u8, __sep: [*c]const u8) [*c]u8;
pub extern fn strxfrm(__s1: [*c]u8, __s2: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strtok_r(__str: [*c]u8, __sep: [*c]const u8, __lasts: [*c][*c]u8) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __strerrbuf: [*c]u8, __buflen: usize) c_int;
pub extern fn strdup(__s1: [*c]const u8) [*c]u8;
pub extern fn memccpy(__dst: ?*c_void, __src: ?*const c_void, __c: c_int, __n: c_ulong) ?*c_void;
pub extern fn stpcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn stpncpy(__dst: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strndup(__s1: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strnlen(__s1: [*c]const u8, __n: usize) usize;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub const rsize_t = __darwin_size_t;
pub const errno_t = c_int;
pub extern fn memset_s(__s: ?*c_void, __smax: rsize_t, __c: c_int, __n: rsize_t) errno_t;
pub extern fn memmem(__big: ?*const c_void, __big_len: usize, __little: ?*const c_void, __little_len: usize) ?*c_void;
pub extern fn memset_pattern4(__b: ?*c_void, __pattern4: ?*const c_void, __len: usize) void;
pub extern fn memset_pattern8(__b: ?*c_void, __pattern8: ?*const c_void, __len: usize) void;
pub extern fn memset_pattern16(__b: ?*c_void, __pattern16: ?*const c_void, __len: usize) void;
pub extern fn strcasestr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strnstr(__big: [*c]const u8, __little: [*c]const u8, __len: usize) [*c]u8;
pub extern fn strlcat(__dst: [*c]u8, __source: [*c]const u8, __size: c_ulong) c_ulong;
pub extern fn strlcpy(__dst: [*c]u8, __source: [*c]const u8, __size: c_ulong) c_ulong;
pub extern fn strmode(__mode: c_int, __bp: [*c]u8) void;
pub extern fn strsep(__stringp: [*c][*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn swab(noalias ?*const c_void, noalias ?*c_void, isize) void;
pub extern fn timingsafe_bcmp(__b1: ?*const c_void, __b2: ?*const c_void, __len: usize) c_int;
pub extern fn bcmp(?*const c_void, ?*const c_void, c_ulong) c_int;
pub extern fn bcopy(?*const c_void, ?*c_void, usize) void;
pub extern fn bzero(?*c_void, c_ulong) void;
pub extern fn index([*c]const u8, c_int) [*c]u8;
pub extern fn rindex([*c]const u8, c_int) [*c]u8;
pub extern fn ffs(c_int) c_int;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, c_ulong) c_int;
pub extern fn ffsl(c_long) c_int;
pub extern fn ffsll(c_longlong) c_int;
pub extern fn fls(c_int) c_int;
pub extern fn flsl(c_long) c_int;
pub extern fn flsll(c_longlong) c_int;
pub const wint_t = __darwin_wint_t;
const struct_unnamed_25 = extern struct {
    __min: __darwin_rune_t,
    __max: __darwin_rune_t,
    __map: __darwin_rune_t,
    __types: [*c]__uint32_t,
};
pub const _RuneEntry = struct_unnamed_25;
const struct_unnamed_26 = extern struct {
    __nranges: c_int,
    __ranges: [*c]_RuneEntry,
};
pub const _RuneRange = struct_unnamed_26;
const struct_unnamed_27 = extern struct {
    __name: [14]u8,
    __mask: __uint32_t,
};
pub const _RuneCharClass = struct_unnamed_27;
const struct_unnamed_28 = extern struct {
    __magic: [8]u8,
    __encoding: [32]u8,
    __sgetrune: ?fn ([*c]const u8, __darwin_size_t, [*c][*c]const u8) callconv(.C) __darwin_rune_t,
    __sputrune: ?fn (__darwin_rune_t, [*c]u8, __darwin_size_t, [*c][*c]u8) callconv(.C) c_int,
    __invalid_rune: __darwin_rune_t,
    __runetype: [256]__uint32_t,
    __maplower: [256]__darwin_rune_t,
    __mapupper: [256]__darwin_rune_t,
    __runetype_ext: _RuneRange,
    __maplower_ext: _RuneRange,
    __mapupper_ext: _RuneRange,
    __variable: ?*c_void,
    __variable_len: c_int,
    __ncharclasses: c_int,
    __charclasses: [*c]_RuneCharClass,
};
pub const _RuneLocale = struct_unnamed_28;
pub extern var _DefaultRuneLocale: _RuneLocale;
pub extern var _CurrentRuneLocale: [*c]_RuneLocale;
pub extern fn ___runetype(__darwin_ct_rune_t) c_ulong;
pub extern fn ___tolower(__darwin_ct_rune_t) __darwin_ct_rune_t;
pub extern fn ___toupper(__darwin_ct_rune_t) __darwin_ct_rune_t;
pub fn isascii(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return @boolToInt(((_c & ~@as(c_int, 127)) == @as(c_int, 0)));
}
pub extern fn __maskrune(__darwin_ct_rune_t, c_ulong) c_int;
pub fn __istype(arg__c: __darwin_ct_rune_t, arg__f: c_ulong) callconv(.C) c_int {
    var _c = arg__c;
    var _f = arg__f;
    return (if (isascii(_c) != 0) !!((@bitCast(c_ulong, @as(c_ulong, _DefaultRuneLocale.__runetype[@intCast(c_uint, _c)])) & _f) != 0) else !!(__maskrune(_c, _f) != 0));
}
pub fn __isctype(arg__c: __darwin_ct_rune_t, arg__f: c_ulong) callconv(.C) __darwin_ct_rune_t {
    var _c = arg__c;
    var _f = arg__f;
    return if ((_c < @as(c_int, 0)) or (_c >= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)))) @as(c_int, 0) else !!((@bitCast(c_ulong, @as(c_ulong, _DefaultRuneLocale.__runetype[@intCast(c_uint, _c)])) & _f) != 0);
}
pub extern fn __toupper(__darwin_ct_rune_t) __darwin_ct_rune_t;
pub extern fn __tolower(__darwin_ct_rune_t) __darwin_ct_rune_t;
pub fn __wcwidth(arg__c: __darwin_ct_rune_t) callconv(.C) c_int {
    var _c = arg__c;
    var _x: c_uint = undefined;
    if (_c == @as(c_int, 0)) return (@as(c_int, 0));
    _x = @bitCast(c_uint, __maskrune(_c, @bitCast(c_ulong, (@as(c_long, 3758096384) | @as(c_long, 262144)))));
    if ((@bitCast(c_long, @as(c_ulong, _x)) & @as(c_long, 3758096384)) != @bitCast(c_long, @as(c_long, @as(c_int, 0)))) return @bitCast(c_int, @truncate(c_int, ((@bitCast(c_long, @as(c_ulong, _x)) & @as(c_long, 3758096384)) >> @intCast(@import("std").math.Log2Int(c_long), 30))));
    return (if ((@bitCast(c_long, @as(c_ulong, _x)) & @as(c_long, 262144)) != @bitCast(c_long, @as(c_long, @as(c_int, 0)))) @as(c_int, 1) else -@as(c_int, 1));
}
pub fn isalnum(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, (@as(c_long, 256) | @as(c_long, 1024)))));
}
pub fn isalpha(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 256))));
}
pub fn isblank(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 131072))));
}
pub fn iscntrl(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 512))));
}
pub fn isdigit(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__isctype(_c, @bitCast(c_ulong, @as(c_long, 1024))));
}
pub fn isgraph(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 2048))));
}
pub fn islower(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 4096))));
}
pub fn isprint(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 262144))));
}
pub fn ispunct(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 8192))));
}
pub fn isspace(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 16384))));
}
pub fn isupper(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 32768))));
}
pub fn isxdigit(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__isctype(_c, @bitCast(c_ulong, @as(c_long, 65536))));
}
pub fn toascii(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (_c & @as(c_int, 127));
}
pub fn tolower(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__tolower(_c));
}
pub fn toupper(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__toupper(_c));
}
pub fn digittoint(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__maskrune(_c, @bitCast(c_ulong, @as(c_long, @as(c_int, 15)))));
}
pub fn ishexnumber(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 65536))));
}
pub fn isideogram(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 524288))));
}
pub fn isnumber(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 1024))));
}
pub fn isphonogram(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 2097152))));
}
pub fn isrune(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 4294967280))));
}
pub fn isspecial(arg__c: c_int) callconv(.C) c_int {
    var _c = arg__c;
    return (__istype(_c, @bitCast(c_ulong, @as(c_long, 1048576))));
}
pub const u_char = u8;
pub const u_short = c_ushort;
pub const u_int = c_uint;
pub const u_long = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_quad_t = u_int64_t;
pub const quad_t = i64;
pub const qaddr_t = [*c]quad_t;
pub const caddr_t = [*c]u8;
pub const daddr_t = i32;
pub const fixpt_t = u_int32_t;
pub const blkcnt_t = __darwin_blkcnt_t;
pub const blksize_t = __darwin_blksize_t;
pub const gid_t = __darwin_gid_t;
pub const in_addr_t = __uint32_t;
pub const in_port_t = __uint16_t;
pub const ino_t = __darwin_ino_t;
pub const ino64_t = __darwin_ino64_t;
pub const key_t = __int32_t;
pub const nlink_t = __uint16_t;
pub const off_t = __darwin_off_t;
pub const segsz_t = i32;
pub const swblk_t = i32;
pub const clock_t = __darwin_clock_t;
pub const time_t = __darwin_time_t;
pub const useconds_t = __darwin_useconds_t;
pub const suseconds_t = __darwin_suseconds_t;
pub const struct_fd_set = extern struct {
    fds_bits: [32]__int32_t,
};
pub const fd_set = struct_fd_set;
pub extern fn __darwin_check_fd_set_overflow(c_int, ?*const c_void, c_int) c_int;
pub fn __darwin_check_fd_set(arg__a: c_int, arg__b: ?*const c_void) callconv(.C) c_int {
    var _a = arg__a;
    var _b = arg__b;
    if (@intCast(usize, @ptrToInt(__darwin_check_fd_set_overflow)) != @bitCast(usize, @as(c_long, @as(c_int, 0)))) {
        return __darwin_check_fd_set_overflow(_a, _b, @as(c_int, 0));
    } else {
        return 1;
    }
    return 0;
}
pub fn __darwin_fd_isset(arg__fd: c_int, arg__p: [*c]const struct_fd_set) callconv(.C) c_int {
    var _fd = arg__fd;
    var _p = arg__p;
    if (__darwin_check_fd_set(_fd, @ptrCast(?*const c_void, _p)) != 0) {
        return (_p.*.fds_bits[(@bitCast(c_ulong, @as(c_long, _fd)) / (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))] & (@bitCast(__int32_t, @truncate(c_uint, ((@bitCast(c_ulong, @as(c_long, @as(c_int, 1)))) << @intCast(@import("std").math.Log2Int(c_ulong), (@bitCast(c_ulong, @as(c_long, _fd)) % (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))))));
    }
    return 0;
}
pub fn __darwin_fd_set(arg__fd: c_int, _p: [*c]struct_fd_set) callconv(.C) void {
    var _fd = arg__fd;
    if (__darwin_check_fd_set(_fd, @ptrCast(?*const c_void, _p)) != 0) {
        _ = (blk: {
            const ref = &_p.*.fds_bits[(@bitCast(c_ulong, @as(c_long, _fd)) / (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))];
            ref.* = ref.* | (@bitCast(__int32_t, @truncate(c_uint, ((@bitCast(c_ulong, @as(c_long, @as(c_int, 1)))) << @intCast(@import("std").math.Log2Int(c_ulong), (@bitCast(c_ulong, @as(c_long, _fd)) % (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))))));
            break :blk ref.*;
        });
    }
}
pub fn __darwin_fd_clr(arg__fd: c_int, _p: [*c]struct_fd_set) callconv(.C) void {
    var _fd = arg__fd;
    if (__darwin_check_fd_set(_fd, @ptrCast(?*const c_void, _p)) != 0) {
        _ = (blk: {
            const ref = &_p.*.fds_bits[(@bitCast(c_ulong, @as(c_long, _fd)) / (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))];
            ref.* = ref.* & ~(@bitCast(__int32_t, @truncate(c_uint, ((@bitCast(c_ulong, @as(c_long, @as(c_int, 1)))) << @intCast(@import("std").math.Log2Int(c_ulong), (@bitCast(c_ulong, @as(c_long, _fd)) % (@sizeOf(__int32_t) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))))));
            break :blk ref.*;
        });
    }
}
pub const fd_mask = __int32_t;
pub const pthread_cond_t = __darwin_pthread_cond_t;
pub const pthread_condattr_t = __darwin_pthread_condattr_t;
pub const pthread_mutex_t = __darwin_pthread_mutex_t;
pub const pthread_mutexattr_t = __darwin_pthread_mutexattr_t;
pub const pthread_once_t = __darwin_pthread_once_t;
pub const pthread_rwlock_t = __darwin_pthread_rwlock_t;
pub const pthread_rwlockattr_t = __darwin_pthread_rwlockattr_t;
pub const pthread_t = __darwin_pthread_t;
pub const pthread_key_t = __darwin_pthread_key_t;
pub const fsblkcnt_t = __darwin_fsblkcnt_t;
pub const fsfilcnt_t = __darwin_fsfilcnt_t;
pub extern fn imaxabs(j: intmax_t) intmax_t;
const struct_unnamed_29 = extern struct {
    quot: intmax_t,
    rem: intmax_t,
};
pub const imaxdiv_t = struct_unnamed_29;
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) uintmax_t;
pub const hash_data_type = c_ulong;
pub const hash_table_type = ?*c_void;
const struct_unnamed_32 = extern struct {
    start: [*c]const OnigUChar,
    end: [*c]const OnigUChar,
};
const struct_unnamed_33 = extern struct {
    num: c_int,
    passed_num: c_int,
    types: [4]OnigType,
    vals: [4]OnigValue,
};
const union_unnamed_31 = extern union {
    content: struct_unnamed_32,
    arg: struct_unnamed_33,
};
const struct_unnamed_30 = extern struct {
    flag: c_int,
    of: OnigCalloutOf,
    in: c_int,
    name_id: c_int,
    tag_start: [*c]const OnigUChar,
    tag_end: [*c]const OnigUChar,
    type: OnigCalloutType,
    start_func: OnigCalloutFunc,
    end_func: OnigCalloutFunc,
    u: union_unnamed_31,
};
pub const CalloutListEntry = struct_unnamed_30;
pub const STACK_POP_LEVEL_FREE = @enumToInt(enum_StackPopLevel.STACK_POP_LEVEL_FREE);
pub const STACK_POP_LEVEL_MEM_START = @enumToInt(enum_StackPopLevel.STACK_POP_LEVEL_MEM_START);
pub const STACK_POP_LEVEL_ALL = @enumToInt(enum_StackPopLevel.STACK_POP_LEVEL_ALL);
pub const enum_StackPopLevel = extern enum(c_int) {
    STACK_POP_LEVEL_FREE = 0,
    STACK_POP_LEVEL_MEM_START = 1,
    STACK_POP_LEVEL_ALL = 2,
    _,
};
pub const OPTIMIZE_NONE = @enumToInt(enum_OptimizeType.OPTIMIZE_NONE);
pub const OPTIMIZE_STR = @enumToInt(enum_OptimizeType.OPTIMIZE_STR);
pub const OPTIMIZE_STR_FAST = @enumToInt(enum_OptimizeType.OPTIMIZE_STR_FAST);
pub const OPTIMIZE_STR_FAST_STEP_FORWARD = @enumToInt(enum_OptimizeType.OPTIMIZE_STR_FAST_STEP_FORWARD);
pub const OPTIMIZE_MAP = @enumToInt(enum_OptimizeType.OPTIMIZE_MAP);
pub const enum_OptimizeType = extern enum(c_int) {
    OPTIMIZE_NONE = 0,
    OPTIMIZE_STR = 1,
    OPTIMIZE_STR_FAST = 2,
    OPTIMIZE_STR_FAST_STEP_FORWARD = 3,
    OPTIMIZE_MAP = 4,
    _,
};
pub const MemStatusType = c_uint;
pub const Bits = u32;
pub const BitSet = [8]Bits;
pub const BitSetRef = [*c]Bits;
pub const struct__BBuf = extern struct {
    p: [*c]OnigUChar,
    used: c_uint,
    alloc: c_uint,
};
pub const BBuf = struct__BBuf;
pub const SAVE_KEEP = @enumToInt(enum_SaveType.SAVE_KEEP);
pub const SAVE_S = @enumToInt(enum_SaveType.SAVE_S);
pub const SAVE_RIGHT_RANGE = @enumToInt(enum_SaveType.SAVE_RIGHT_RANGE);
pub const enum_SaveType = extern enum(c_int) {
    SAVE_KEEP = 0,
    SAVE_S = 1,
    SAVE_RIGHT_RANGE = 2,
    _,
};
pub const UPDATE_VAR_KEEP_FROM_STACK_LAST = @enumToInt(enum_UpdateVarType.UPDATE_VAR_KEEP_FROM_STACK_LAST);
pub const UPDATE_VAR_S_FROM_STACK = @enumToInt(enum_UpdateVarType.UPDATE_VAR_S_FROM_STACK);
pub const UPDATE_VAR_RIGHT_RANGE_FROM_STACK = @enumToInt(enum_UpdateVarType.UPDATE_VAR_RIGHT_RANGE_FROM_STACK);
pub const UPDATE_VAR_RIGHT_RANGE_FROM_S_STACK = @enumToInt(enum_UpdateVarType.UPDATE_VAR_RIGHT_RANGE_FROM_S_STACK);
pub const UPDATE_VAR_RIGHT_RANGE_TO_S = @enumToInt(enum_UpdateVarType.UPDATE_VAR_RIGHT_RANGE_TO_S);
pub const UPDATE_VAR_RIGHT_RANGE_INIT = @enumToInt(enum_UpdateVarType.UPDATE_VAR_RIGHT_RANGE_INIT);
pub const enum_UpdateVarType = extern enum(c_int) {
    UPDATE_VAR_KEEP_FROM_STACK_LAST = 0,
    UPDATE_VAR_S_FROM_STACK = 1,
    UPDATE_VAR_RIGHT_RANGE_FROM_STACK = 2,
    UPDATE_VAR_RIGHT_RANGE_FROM_S_STACK = 3,
    UPDATE_VAR_RIGHT_RANGE_TO_S = 4,
    UPDATE_VAR_RIGHT_RANGE_INIT = 5,
    _,
};
pub const CHECK_POSITION_SEARCH_START = @enumToInt(enum_CheckPositionType.CHECK_POSITION_SEARCH_START);
pub const CHECK_POSITION_CURRENT_RIGHT_RANGE = @enumToInt(enum_CheckPositionType.CHECK_POSITION_CURRENT_RIGHT_RANGE);
pub const enum_CheckPositionType = extern enum(c_int) {
    CHECK_POSITION_SEARCH_START = 0,
    CHECK_POSITION_CURRENT_RIGHT_RANGE = 1,
    _,
};
pub const EXTENDED_GRAPHEME_CLUSTER_BOUNDARY = @enumToInt(enum_TextSegmentBoundaryType.EXTENDED_GRAPHEME_CLUSTER_BOUNDARY);
pub const WORD_BOUNDARY = @enumToInt(enum_TextSegmentBoundaryType.WORD_BOUNDARY);
pub const enum_TextSegmentBoundaryType = extern enum(c_int) {
    EXTENDED_GRAPHEME_CLUSTER_BOUNDARY = 0,
    WORD_BOUNDARY = 1,
    _,
};
pub const RelAddrType = c_int;
pub const AbsAddrType = c_int;
pub const LengthType = c_int;
pub const RelPositionType = c_int;
pub const RepeatNumType = c_int;
pub const MemNumType = c_int;
pub const PointerType = ?*c_void;
pub const SaveType = c_int;
pub const UpdateVarType = c_int;
pub const ModeType = c_int;
const struct_unnamed_36 = extern struct {
    s: [16]OnigUChar,
};
const struct_unnamed_37 = extern struct {
    s: [*c]OnigUChar,
    n: LengthType,
};
const struct_unnamed_38 = extern struct {
    s: [*c]OnigUChar,
    n: LengthType,
    len: LengthType,
};
const struct_unnamed_39 = extern struct {
    bsp: BitSetRef,
};
const struct_unnamed_40 = extern struct {
    mb: ?*c_void,
};
const struct_unnamed_41 = extern struct {
    mb: ?*c_void,
    bsp: BitSetRef,
};
const struct_unnamed_42 = extern struct {
    c: OnigUChar,
};
const struct_unnamed_43 = extern struct {
    mode: ModeType,
};
const struct_unnamed_44 = extern struct {
    type: enum_TextSegmentBoundaryType,
    not: c_int,
};
const struct_unnamed_45 = extern struct {
    type: enum_CheckPositionType,
};
const union_unnamed_47 = extern union {
    n1: MemNumType,
    ns: [*c]MemNumType,
};
const struct_unnamed_46 = extern struct {
    unnamed_0: union_unnamed_47,
    num: c_int,
    nest_level: c_int,
};
const struct_unnamed_48 = extern struct {
    n1: MemNumType,
};
const struct_unnamed_49 = extern struct {
    num: MemNumType,
};
const struct_unnamed_50 = extern struct {
    num: MemNumType,
};
const struct_unnamed_51 = extern struct {
    addr: RelAddrType,
};
const struct_unnamed_52 = extern struct {
    addr: RelAddrType,
};
const struct_unnamed_53 = extern struct {
    addr: RelAddrType,
    c: OnigUChar,
};
const struct_unnamed_54 = extern struct {
    addr: RelAddrType,
    c: OnigUChar,
};
const struct_unnamed_55 = extern struct {
    id: MemNumType,
};
const struct_unnamed_56 = extern struct {
    id: MemNumType,
    addr: RelAddrType,
};
const struct_unnamed_57 = extern struct {
    id: MemNumType,
};
const struct_unnamed_58 = extern struct {
    mem: MemNumType,
};
const struct_unnamed_59 = extern struct {
    mem: MemNumType,
    empty_status_mem: MemStatusType,
};
const struct_unnamed_60 = extern struct {
    addr: RelAddrType,
};
const struct_unnamed_61 = extern struct {
    len: LengthType,
};
const struct_unnamed_62 = extern struct {
    len: LengthType,
    addr: RelAddrType,
};
const struct_unnamed_63 = extern struct {
    n: RelPositionType,
};
const struct_unnamed_64 = extern struct {
    initial: LengthType,
    remaining: LengthType,
    addr: RelAddrType,
};
const struct_unnamed_65 = extern struct {
    id: MemNumType,
    restore_pos: c_int,
};
const struct_unnamed_66 = extern struct {
    id: MemNumType,
    save_pos: c_int,
};
const struct_unnamed_67 = extern struct {
    type: SaveType,
    id: MemNumType,
};
const struct_unnamed_68 = extern struct {
    type: UpdateVarType,
    id: MemNumType,
    clear: c_int,
};
const struct_unnamed_69 = extern struct {
    addr: AbsAddrType,
};
const struct_unnamed_70 = extern struct {
    num: MemNumType,
};
const struct_unnamed_71 = extern struct {
    num: MemNumType,
    id: MemNumType,
};
const union_unnamed_35 = extern union {
    exact: struct_unnamed_36,
    exact_n: struct_unnamed_37,
    exact_len_n: struct_unnamed_38,
    cclass: struct_unnamed_39,
    cclass_mb: struct_unnamed_40,
    cclass_mix: struct_unnamed_41,
    anychar_star_peek_next: struct_unnamed_42,
    word_boundary: struct_unnamed_43,
    text_segment_boundary: struct_unnamed_44,
    check_position: struct_unnamed_45,
    backref_general: struct_unnamed_46,
    backref_n: struct_unnamed_48,
    memory_start: struct_unnamed_49,
    memory_end: struct_unnamed_50,
    jump: struct_unnamed_51,
    push: struct_unnamed_52,
    push_or_jump_exact1: struct_unnamed_53,
    push_if_peek_next: struct_unnamed_54,
    pop_to_mark: struct_unnamed_55,
    repeat: struct_unnamed_56,
    repeat_inc: struct_unnamed_57,
    empty_check_start: struct_unnamed_58,
    empty_check_end: struct_unnamed_59,
    prec_read_not_start: struct_unnamed_60,
    look_behind: struct_unnamed_61,
    look_behind_not_start: struct_unnamed_62,
    move: struct_unnamed_63,
    step_back_start: struct_unnamed_64,
    cut_to_mark: struct_unnamed_65,
    mark: struct_unnamed_66,
    save_val: struct_unnamed_67,
    update_var: struct_unnamed_68,
    call: struct_unnamed_69,
    callout_contents: struct_unnamed_70,
    callout_name: struct_unnamed_71,
};
const struct_unnamed_34 = extern struct {
    opaddr: ?*const c_void,
    unnamed_0: union_unnamed_35,
};
pub const Operation = struct_unnamed_34;
const struct_unnamed_72 = extern struct {
    pattern: [*c]const OnigUChar,
    pattern_end: [*c]const OnigUChar,
    tag_table: ?*c_void,
    callout_num: c_int,
    callout_list_alloc: c_int,
    callout_list: [*c]CalloutListEntry,
};
pub const RegexExt = struct_unnamed_72;
const union_unnamed_74 = extern union {
    pcode: [*c]Operation,
    offset: c_int,
};
const struct_unnamed_73 = extern struct {
    lower: c_int,
    upper: c_int,
    u: union_unnamed_74,
};
pub const RepeatRange = struct_unnamed_73;
pub extern fn onig_add_end_call(func: ?fn () callconv(.C) void) void;
pub fn onig_warning(arg_s: [*c]const u8) callconv(.C) void {
    var s = arg_s;
    if (onig_warn == onig_null_warn) return;
    (onig_warn).?(s);
}
pub extern fn onig_error_code_to_format(code: c_int) [*c]OnigUChar;
pub extern fn onig_snprintf_with_pattern(buf: [*c]OnigUChar, bufsize: c_int, enc: OnigEncoding, pat: [*c]OnigUChar, pat_end: [*c]OnigUChar, fmt: [*c]const OnigUChar, ...) void;
pub extern fn onig_compile(reg: [*c]regex_t, pattern: [*c]const OnigUChar, pattern_end: [*c]const OnigUChar, einfo: [*c]OnigErrorInfo) c_int;
pub extern fn onig_is_code_in_cc_len(enclen: c_int, code: OnigCodePoint, cc: ?*c_void) c_int;
pub extern fn onig_get_regex_ext(reg: [*c]regex_t) [*c]RegexExt;
pub extern fn onig_ext_set_pattern(reg: [*c]regex_t, pattern: [*c]const OnigUChar, pattern_end: [*c]const OnigUChar) c_int;
pub extern fn onig_positive_int_multiply(x: c_int, y: c_int) c_int;
pub const struct_st_hash_type = extern struct {
    compare: ?fn (...) callconv(.C) c_int,
    hash: ?fn (...) callconv(.C) c_int,
};
var hashType: struct_st_hash_type = struct_st_hash_type{
    .compare = @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), str_end_cmp)),
    .hash = @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), str_end_hash)),
};
pub fn onig_st_init_strend_table_with_size(arg_size: c_int) callconv(.C) hash_table_type {
    var size = arg_size;
    _ = hashType;
    return @ptrCast(hash_table_type, onig_st_init_table_with_size(&hashType, size));
}
pub fn onig_st_lookup_strend(arg_table: hash_table_type, arg_str_key: [*c]const OnigUChar, arg_end_key: [*c]const OnigUChar, arg_value: [*c]hash_data_type) callconv(.C) c_int {
    var table = arg_table;
    var str_key = arg_str_key;
    var end_key = arg_end_key;
    var value = arg_value;
    var key: st_str_end_key = undefined;
    key.s = @intToPtr([*c]OnigUChar, @ptrToInt(str_key));
    key.end = @intToPtr([*c]OnigUChar, @ptrToInt(end_key));
    return onig_st_lookup(@ptrCast([*c]st_table, @alignCast(@alignOf(st_table), table)), @intCast(st_data_t, @ptrToInt((&key))), value);
}
pub fn onig_st_insert_strend(arg_table: hash_table_type, arg_str_key: [*c]const OnigUChar, arg_end_key: [*c]const OnigUChar, arg_value: hash_data_type) callconv(.C) c_int {
    var table = arg_table;
    var str_key = arg_str_key;
    var end_key = arg_end_key;
    var value = arg_value;
    var key: [*c]st_str_end_key = undefined;
    var result: c_int = undefined;
    key = @ptrCast([*c]st_str_end_key, @alignCast(@alignOf(st_str_end_key), malloc(@sizeOf(st_str_end_key))));
    if ((@ptrCast(?*c_void, (key))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    key.*.s = @intToPtr([*c]OnigUChar, @ptrToInt(str_key));
    key.*.end = @intToPtr([*c]OnigUChar, @ptrToInt(end_key));
    result = onig_st_insert(@ptrCast([*c]st_table, @alignCast(@alignOf(st_table), table)), @intCast(st_data_t, @ptrToInt(key)), value);
    if (result != 0) {
        free(@ptrCast(?*c_void, key));
    }
    return result;
}
pub fn onig_get_callout_type_by_name_id(arg_name_id: c_int) callconv(.C) OnigCalloutType {
    var name_id = arg_name_id;
    if ((name_id < @as(c_int, 0)) or (name_id >= GlobalCalloutNameList.*.n)) return @intToEnum(OnigCalloutType, @as(c_int, 0));
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].type;
}
pub fn onig_get_callout_start_func_by_name_id(arg_name_id: c_int) callconv(.C) OnigCalloutFunc {
    var name_id = arg_name_id;
    if ((name_id < @as(c_int, 0)) or (name_id >= GlobalCalloutNameList.*.n)) return null;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].start_func;
}
pub fn onig_get_callout_end_func_by_name_id(arg_name_id: c_int) callconv(.C) OnigCalloutFunc {
    var name_id = arg_name_id;
    if ((name_id < @as(c_int, 0)) or (name_id >= GlobalCalloutNameList.*.n)) return null;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].end_func;
}
pub fn onig_callout_tag_table_free(arg_table: ?*c_void) callconv(.C) c_int {
    var table = arg_table;
    var t: [*c]CalloutTagTable = @ptrCast([*c]CalloutTagTable, @alignCast(@alignOf(CalloutTagTable), table));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        var r: c_int = callout_tag_table_clear(t);
        if (r != @as(c_int, 0)) return r;
        onig_st_free_table(t);
    }
    return 0;
}
pub fn onig_free_reg_callout_list(arg_n: c_int, arg_list: [*c]CalloutListEntry) callconv(.C) void {
    var n = arg_n;
    var list = arg_list;
    var i: c_int = undefined;
    var j: c_int = undefined;
    if ((@ptrCast(?*c_void, (list))) == @intToPtr(?*c_void, @as(c_int, 0))) return;
    {
        i = 0;
        while (i < n) : (i += 1) {
            if (@bitCast(c_uint, @enumToInt(list[@intCast(c_uint, i)].of)) == @bitCast(c_uint, ONIG_CALLOUT_OF_NAME)) {
                {
                    j = 0;
                    while (j < list[@intCast(c_uint, i)].u.arg.passed_num) : (j += 1) {
                        if (@bitCast(c_uint, @enumToInt(list[@intCast(c_uint, i)].u.arg.types[@intCast(c_uint, j)])) == @bitCast(c_uint, ONIG_TYPE_STRING)) {
                            if ((@ptrCast(?*c_void, (list[@intCast(c_uint, i)].u.arg.vals[@intCast(c_uint, j)].s.start))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, list[@intCast(c_uint, i)].u.arg.vals[@intCast(c_uint, j)].s.start));
                        }
                    }
                }
            } else {
                if ((@intToPtr(?*c_void, @ptrToInt((list[@intCast(c_uint, i)].u.content.start)))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                    free(@intToPtr(?*c_void, @ptrToInt(list[@intCast(c_uint, i)].u.content.start)));
                }
            }
        }
    }
    free(@ptrCast(?*c_void, list));
}
pub fn onig_reg_callout_list_at(arg_reg: [*c]regex_t, arg_num: c_int) callconv(.C) [*c]CalloutListEntry {
    var reg = arg_reg;
    var num = arg_num;
    var ext: [*c]RegexExt = reg.*.extp;
    if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    if ((num <= @as(c_int, 0)) or (num > ext.*.callout_num)) return null;
    num -= 1;
    return (ext.*.callout_list + num);
}
pub fn onig_get_callout_start_func(arg_reg: [*c]regex_t, arg_callout_num: c_int) callconv(.C) OnigCalloutFunc {
    var reg = arg_reg;
    var callout_num = arg_callout_num;
    var e: [*c]CalloutListEntry = undefined;
    e = onig_reg_callout_list_at(reg, callout_num);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    return e.*.start_func;
}
pub const ONIGENC_INIT_PROPERTY_LIST_FUNC_TYPE = ?fn () callconv(.C) c_int;
pub const NODE_STRING = @enumToInt(enum_unnamed_75.NODE_STRING);
pub const NODE_CCLASS = @enumToInt(enum_unnamed_75.NODE_CCLASS);
pub const NODE_CTYPE = @enumToInt(enum_unnamed_75.NODE_CTYPE);
pub const NODE_BACKREF = @enumToInt(enum_unnamed_75.NODE_BACKREF);
pub const NODE_QUANT = @enumToInt(enum_unnamed_75.NODE_QUANT);
pub const NODE_BAG = @enumToInt(enum_unnamed_75.NODE_BAG);
pub const NODE_ANCHOR = @enumToInt(enum_unnamed_75.NODE_ANCHOR);
pub const NODE_LIST = @enumToInt(enum_unnamed_75.NODE_LIST);
pub const NODE_ALT = @enumToInt(enum_unnamed_75.NODE_ALT);
pub const NODE_CALL = @enumToInt(enum_unnamed_75.NODE_CALL);
pub const NODE_GIMMICK = @enumToInt(enum_unnamed_75.NODE_GIMMICK);
const enum_unnamed_75 = extern enum(c_int) {
    NODE_STRING = 0,
    NODE_CCLASS = 1,
    NODE_CTYPE = 2,
    NODE_BACKREF = 3,
    NODE_QUANT = 4,
    NODE_BAG = 5,
    NODE_ANCHOR = 6,
    NODE_LIST = 7,
    NODE_ALT = 8,
    NODE_CALL = 9,
    NODE_GIMMICK = 10,
    _,
};
pub const NodeType = enum_unnamed_75;
pub const BAG_MEMORY = @enumToInt(enum_BagType.BAG_MEMORY);
pub const BAG_OPTION = @enumToInt(enum_BagType.BAG_OPTION);
pub const BAG_STOP_BACKTRACK = @enumToInt(enum_BagType.BAG_STOP_BACKTRACK);
pub const BAG_IF_ELSE = @enumToInt(enum_BagType.BAG_IF_ELSE);
pub const enum_BagType = extern enum(c_int) {
    BAG_MEMORY = 0,
    BAG_OPTION = 1,
    BAG_STOP_BACKTRACK = 2,
    BAG_IF_ELSE = 3,
    _,
};
pub const GIMMICK_FAIL = @enumToInt(enum_GimmickType.GIMMICK_FAIL);
pub const GIMMICK_SAVE = @enumToInt(enum_GimmickType.GIMMICK_SAVE);
pub const GIMMICK_UPDATE_VAR = @enumToInt(enum_GimmickType.GIMMICK_UPDATE_VAR);
pub const GIMMICK_CALLOUT = @enumToInt(enum_GimmickType.GIMMICK_CALLOUT);
pub const enum_GimmickType = extern enum(c_int) {
    GIMMICK_FAIL = 0,
    GIMMICK_SAVE = 1,
    GIMMICK_UPDATE_VAR = 2,
    GIMMICK_CALLOUT = 3,
    _,
};
pub const BODY_IS_NOT_EMPTY = @enumToInt(enum_BodyEmptyType.BODY_IS_NOT_EMPTY);
pub const BODY_MAY_BE_EMPTY = @enumToInt(enum_BodyEmptyType.BODY_MAY_BE_EMPTY);
pub const BODY_MAY_BE_EMPTY_MEM = @enumToInt(enum_BodyEmptyType.BODY_MAY_BE_EMPTY_MEM);
pub const BODY_MAY_BE_EMPTY_REC = @enumToInt(enum_BodyEmptyType.BODY_MAY_BE_EMPTY_REC);
pub const enum_BodyEmptyType = extern enum(c_int) {
    BODY_IS_NOT_EMPTY = 0,
    BODY_MAY_BE_EMPTY = 1,
    BODY_MAY_BE_EMPTY_MEM = 2,
    BODY_MAY_BE_EMPTY_REC = 3,
    _,
};
const struct_unnamed_77 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
};
const union_unnamed_76 = extern union {
    base: struct_unnamed_77,
    str: StrNode,
    cclass: CClassNode,
    quant: QuantNode,
    bag: BagNode,
    backref: BackRefNode,
    anchor: AnchorNode,
    cons: ConsAltNode,
    ctype: CtypeNode,
    call: CallNode,
    gimmick: GimmickNode,
};
pub const struct__Node = extern struct {
    u: union_unnamed_76,
};
const struct_unnamed_78 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    s: [*c]OnigUChar,
    end: [*c]OnigUChar,
    flag: c_uint,
    buf: [24]OnigUChar,
    capacity: c_int,
};
pub const StrNode = struct_unnamed_78;
const struct_unnamed_79 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    flags: c_uint,
    bs: BitSet,
    mbuf: [*c]BBuf,
};
pub const CClassNode = struct_unnamed_79;
const struct_unnamed_80 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
    lower: c_int,
    upper: c_int,
    greedy: c_int,
    emptiness: enum_BodyEmptyType,
    head_exact: [*c]struct__Node,
    next_head_exact: [*c]struct__Node,
    include_referred: c_int,
    empty_status_mem: MemStatusType,
};
pub const QuantNode = struct_unnamed_80;
const struct_unnamed_83 = extern struct {
    regnum: c_int,
    called_addr: AbsAddrType,
    entry_count: c_int,
    called_state: c_int,
};
const struct_unnamed_84 = extern struct {
    options: OnigOptionType,
};
const struct_unnamed_85 = extern struct {
    Then: [*c]struct__Node,
    Else: [*c]struct__Node,
};
const union_unnamed_82 = extern union {
    m: struct_unnamed_83,
    o: struct_unnamed_84,
    te: struct_unnamed_85,
};
const struct_unnamed_81 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
    type: enum_BagType,
    unnamed_0: union_unnamed_82,
    min_len: OnigLen,
    max_len: OnigLen,
    min_char_len: OnigLen,
    max_char_len: OnigLen,
    opt_count: c_int,
};
pub const BagNode = struct_unnamed_81;
const struct_unnamed_86 = extern struct {
    offset: c_int,
    target: [*c]struct__Node,
};
pub const UnsetAddr = struct_unnamed_86;
const struct_unnamed_87 = extern struct {
    num: c_int,
    alloc: c_int,
    us: [*c]UnsetAddr,
};
pub const UnsetAddrList = struct_unnamed_87;
const struct_unnamed_88 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
    by_number: c_int,
    called_gnum: c_int,
    name: [*c]OnigUChar,
    name_end: [*c]OnigUChar,
    entry_count: c_int,
};
pub const CallNode = struct_unnamed_88;
const struct_unnamed_89 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    back_num: c_int,
    back_static: [6]c_int,
    back_dynamic: [*c]c_int,
    nest_level: c_int,
};
pub const BackRefNode = struct_unnamed_89;
const struct_unnamed_90 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
    type: c_int,
    char_min_len: OnigLen,
    char_max_len: OnigLen,
    ascii_mode: c_int,
    lead_node: [*c]struct__Node,
};
pub const AnchorNode = struct_unnamed_90;
const struct_unnamed_91 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    car: [*c]struct__Node,
    cdr: [*c]struct__Node,
};
pub const ConsAltNode = struct_unnamed_91;
const struct_unnamed_92 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    ctype: c_int,
    not: c_int,
    ascii_mode: c_int,
};
pub const CtypeNode = struct_unnamed_92;
const struct_unnamed_93 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    type: enum_GimmickType,
    detail_type: c_int,
    num: c_int,
    id: c_int,
};
pub const GimmickNode = struct_unnamed_93;
pub const Node = struct__Node;
const struct_unnamed_94 = extern struct {
    new_val: c_int,
};
pub const GroupNumMap = struct_unnamed_94;
const struct_unnamed_95 = extern struct {
    mem_node: [*c]Node,
    empty_repeat_node: [*c]Node,
};
pub const MemEnv = struct_unnamed_95;
const struct_unnamed_96 = extern struct {
    type: enum_SaveType,
};
pub const SaveItem = struct_unnamed_96;
const struct_unnamed_97 = extern struct {
    options: OnigOptionType,
    case_fold_flag: OnigCaseFoldType,
    enc: OnigEncoding,
    syntax: [*c]OnigSyntaxType,
    cap_history: MemStatusType,
    backtrack_mem: MemStatusType,
    backrefed_mem: MemStatusType,
    pattern: [*c]OnigUChar,
    pattern_end: [*c]OnigUChar,
    @"error": [*c]OnigUChar,
    error_end: [*c]OnigUChar,
    reg: [*c]regex_t,
    num_call: c_int,
    num_mem: c_int,
    num_named: c_int,
    mem_alloc: c_int,
    mem_env_static: [8]MemEnv,
    mem_env_dynamic: [*c]MemEnv,
    backref_num: c_int,
    keep_num: c_int,
    id_num: c_int,
    save_alloc_num: c_int,
    saves: [*c]SaveItem,
    unset_addr_list: [*c]UnsetAddrList,
    has_call_zero: c_int,
    parse_depth: c_uint,
};
pub const ParseEnv = struct_unnamed_97;
pub fn onig_renumber_name_table(arg_reg: [*c]regex_t, arg_map: [*c]GroupNumMap) callconv(.C) c_int {
    var reg = arg_reg;
    var map = arg_map;
    var t: [*c]NameTable = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_foreach(t, @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), i_renumber_name)), @intCast(HashDataType, @ptrToInt(map)));
    }
    return 0;
}
pub fn onig_strncmp(arg_s1: [*c]const OnigUChar, arg_s2: [*c]const OnigUChar, arg_n: c_int) callconv(.C) c_int {
    var s1 = arg_s1;
    var s2 = arg_s2;
    var n = arg_n;
    var x: c_int = undefined;
    while ((blk: {
        const ref = &n;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        x = (@bitCast(c_int, @as(c_uint, (blk: {
            const ref = &s2;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).?.*)) - @bitCast(c_int, @as(c_uint, (blk: {
            const ref = &s1;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).?.*)));
        if (x != 0) return x;
    }
    return 0;
}
pub fn onig_strcpy(arg_dest: [*c]OnigUChar, arg_src: [*c]const OnigUChar, arg_end: [*c]const OnigUChar) callconv(.C) void {
    var dest = arg_dest;
    var src = arg_src;
    var end = arg_end;
    var len: c_int = @bitCast(c_int, @truncate(c_int, (end - src)));
    if (len > @as(c_int, 0)) {
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, dest), @ptrCast(?*const c_void, src), @bitCast(c_ulong, @as(c_long, len)), __builtin_object_size(@ptrCast(?*const c_void, dest), @as(c_int, 0)));
        dest[@intCast(c_uint, len)] = @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0)));
    }
}
pub fn onig_scan_env_set_error_string(arg_env: [*c]ParseEnv, arg_ecode: c_int, arg_arg: [*c]OnigUChar, arg_arg_end: [*c]OnigUChar) callconv(.C) void {
    var env = arg_env;
    var ecode = arg_ecode;
    var arg = arg_arg;
    var arg_end = arg_arg_end;
    env.*.@"error" = arg;
    env.*.error_end = arg_end;
} // ../oniguruma/src/regparse.c:4297:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const onig_reduce_nested_quantifier = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:4278:1
// ../oniguruma/src/regparse.c:2197:3: warning: TODO complex switch cases
pub const onig_node_copy = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:2182:1
pub fn onig_node_str_cat(arg_node: [*c]Node, arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar) callconv(.C) c_int {
    var node = arg_node;
    var s = arg_s;
    var end = arg_end;
    var addlen: c_int = @bitCast(c_int, @truncate(c_int, (end - s)));
    if (addlen > @as(c_int, 0)) {
        var len: c_int = @bitCast(c_int, @truncate(c_int, ((&((node).*.u.str)).*.end - (&((node).*.u.str)).*.s)));
        if (((&((node).*.u.str)).*.capacity > @as(c_int, 0)) or ((len + addlen) > (@as(c_int, 24) - @as(c_int, 1)))) {
            var p: [*c]OnigUChar = undefined;
            var capa: c_int = ((len + addlen) + @as(c_int, 16));
            if (capa <= (&((node).*.u.str)).*.capacity) {
                onig_strcpy(((&((node).*.u.str)).*.s + len), s, end);
            } else {
                if ((&((node).*.u.str)).*.s == &(&((node).*.u.str)).*.buf) p = strcat_capa_from_static((&((node).*.u.str)).*.s, (&((node).*.u.str)).*.end, s, end, capa) else p = strcat_capa((&((node).*.u.str)).*.s, (&((node).*.u.str)).*.end, s, end, capa);
                if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
                (&((node).*.u.str)).*.s = p;
                (&((node).*.u.str)).*.capacity = capa;
            }
        } else {
            onig_strcpy(((&((node).*.u.str)).*.s + len), s, end);
        }
        (&((node).*.u.str)).*.end = (((&((node).*.u.str)).*.s + len) + addlen);
    }
    return 0;
}
pub fn onig_node_str_set(arg_node: [*c]Node, arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar, arg_need_free: c_int) callconv(.C) c_int {
    var node = arg_node;
    var s = arg_s;
    var end = arg_end;
    var need_free = arg_need_free;
    onig_node_str_clear(node, need_free);
    return onig_node_str_cat(node, s, end);
}
pub fn onig_node_str_clear(arg_node: [*c]Node, arg_need_free: c_int) callconv(.C) void {
    var node = arg_node;
    var need_free = arg_need_free;
    if ((((need_free != @as(c_int, 0)) and ((&((node).*.u.str)).*.capacity != @as(c_int, 0))) and ((@ptrCast(?*c_void, ((&((node).*.u.str)).*.s))) != @intToPtr(?*c_void, @as(c_int, 0)))) and ((&((node).*.u.str)).*.s != &(&((node).*.u.str)).*.buf)) {
        free(@ptrCast(?*c_void, (&((node).*.u.str)).*.s));
    }
    (&((node).*.u.str)).*.flag = @bitCast(c_uint, @as(c_int, 0));
    (&((node).*.u.str)).*.s = &(&((node).*.u.str)).*.buf;
    (&((node).*.u.str)).*.end = &(&((node).*.u.str)).*.buf;
    (&((node).*.u.str)).*.capacity = 0;
}
pub fn onig_node_free(arg_node: [*c]Node) callconv(.C) void {
    var node = arg_node;
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return;
    node_free_body(node);
    free(@ptrCast(?*c_void, node));
}
pub fn onig_node_reset_empty(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    return node_reset_str(node, null, null);
}
pub fn onig_node_reset_fail(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    node_free_body(node);
    return node_set_fail(node);
}
pub fn onig_node_new_bag(arg_type_1: enum_BagType) callconv(.C) [*c]Node {
    var type_1 = arg_type_1;
    return node_new_bag(type_1);
}
pub fn onig_node_new_str(arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar) callconv(.C) [*c]Node {
    var s = arg_s;
    var end = arg_end;
    return node_new_str(s, end);
}
pub fn onig_node_new_list(arg_left: [*c]Node, arg_right: [*c]Node) callconv(.C) [*c]Node {
    var left = arg_left;
    var right = arg_right;
    return node_new_list(left, right);
}
pub fn onig_node_new_alt(arg_left: [*c]Node, arg_right: [*c]Node) callconv(.C) [*c]Node {
    var left = arg_left;
    var right = arg_right;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_ALT));
    ((&((node).*.u.cons)).*.car) = left;
    ((&((node).*.u.cons)).*.cdr) = right;
    return node;
}
pub fn onig_names_free(arg_reg: [*c]regex_t) callconv(.C) c_int {
    var reg = arg_reg;
    var r: c_int = undefined;
    var t: [*c]NameTable = undefined;
    r = names_clear(reg);
    if (r != @as(c_int, 0)) return r;
    t = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) onig_st_free_table(t);
    reg.*.name_table = (@intToPtr(?*c_void, @as(c_int, 0)));
    return 0;
}
pub fn onig_parse_tree(arg_root: [*c][*c]Node, arg_pattern: [*c]const OnigUChar, arg_end: [*c]const OnigUChar, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var root = arg_root;
    var pattern = arg_pattern;
    var end = arg_end;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var ext: [*c]RegexExt = undefined;
    reg.*.string_pool = null;
    reg.*.string_pool_end = null;
    reg.*.num_mem = 0;
    reg.*.num_repeat = 0;
    reg.*.num_empty_check = 0;
    reg.*.repeat_range_alloc = 0;
    reg.*.repeat_range = @ptrCast([*c]RepeatRange, @alignCast(@alignOf(RepeatRange), (@intToPtr(?*c_void, @as(c_int, 0)))));
    _ = names_clear(reg);
    scan_env_clear(env);
    env.*.options = reg.*.options;
    env.*.case_fold_flag = reg.*.case_fold_flag;
    env.*.enc = reg.*.enc;
    env.*.syntax = reg.*.syntax;
    env.*.pattern = @intToPtr([*c]OnigUChar, @ptrToInt(pattern));
    env.*.pattern_end = @intToPtr([*c]OnigUChar, @ptrToInt(end));
    env.*.reg = reg;
    root.?.* = null;
    if (!((env.*.enc).*.is_valid_mbc_string.?(pattern, end) != 0)) return -@as(c_int, 400);
    p = @intToPtr([*c]OnigUChar, @ptrToInt(pattern));
    r = prs_regexp(root, &p, @intToPtr([*c]OnigUChar, @ptrToInt(end)), env);
    if (r != @as(c_int, 0)) return r;
    if (env.*.has_call_zero != @as(c_int, 0)) {
        var zero_node: [*c]Node = undefined;
        r = make_call_zero_body(root.?.*, env, &zero_node);
        if (r != @as(c_int, 0)) return r;
        root.?.* = zero_node;
    }
    reg.*.num_mem = env.*.num_mem;
    ext = reg.*.extp;
    if (((@ptrCast(?*c_void, (ext))) != @intToPtr(?*c_void, @as(c_int, 0))) and (ext.*.callout_num > @as(c_int, 0))) {
        r = setup_ext_callout_list_values(reg);
    }
    return r;
}
pub extern fn onig_free_shared_cclass_table() c_int;
pub extern fn onig_is_code_in_cc(enc: OnigEncoding, code: OnigCodePoint, cc: [*c]CClassNode) c_int;
pub fn onig_new_cclass_with_code_list(arg_rnode: [*c][*c]Node, arg_enc: OnigEncoding, arg_n: c_int, arg_codes: [*c]OnigCodePoint) callconv(.C) c_int {
    var rnode = arg_rnode;
    var enc = arg_enc;
    var n = arg_n;
    var codes = arg_codes;
    var i: c_int = undefined;
    var node: [*c]Node = undefined;
    var cc: [*c]CClassNode = undefined;
    rnode.?.* = (@intToPtr([*c]Node, @as(c_int, 0)));
    node = node_new_cclass();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    cc = (&((node).*.u.cclass));
    {
        i = 0;
        while (i < n) : (i += 1) {
            while (true) {
                if ((((enc).*.min_enc_len) > @as(c_int, 1)) or ((enc).*.code_to_mbclen.?(codes[@intCast(c_uint, i)]) != @as(c_int, 1))) {
                    _ = add_code_range_to_buf(&((cc).*.mbuf), codes[@intCast(c_uint, i)], codes[@intCast(c_uint, i)]);
                } else {
                    ((cc).*.bs)[@bitCast(c_uint, (codes[@intCast(c_uint, i)])) >> @intCast(@import("std").math.Log2Int(c_uint), 5)] |= (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), (@bitCast(c_uint, (codes[@intCast(c_uint, i)])) & @bitCast(c_uint, @as(c_int, 31)))));
                }
                if (!false) break;
            }
        }
    }
    rnode.?.* = node;
    return 0;
}
pub extern fn onig_get_tiny_min_len(node: [*c]Node, inhibit_node_types: c_uint, invalid_node: [*c]c_int) OnigLen;
pub fn onig_global_callout_names_free() callconv(.C) c_int {
    free_callout_func_list(GlobalCalloutNameList);
    GlobalCalloutNameList = null;
    _ = global_callout_name_table_free();
    return 0;
}
pub const st_data_t = c_ulong;
pub const struct_st_table_entry = opaque {};
pub const struct_st_table = extern struct {
    type: [*c]struct_st_hash_type,
    num_bins: c_int,
    num_entries: c_int,
    bins: [*c]?*struct_st_table_entry,
};
pub const st_table = struct_st_table;
pub const ST_CONTINUE = @enumToInt(enum_st_retval.ST_CONTINUE);
pub const ST_STOP = @enumToInt(enum_st_retval.ST_STOP);
pub const ST_DELETE = @enumToInt(enum_st_retval.ST_DELETE);
pub const ST_CHECK = @enumToInt(enum_st_retval.ST_CHECK);
pub const enum_st_retval = extern enum(c_int) {
    ST_CONTINUE,
    ST_STOP,
    ST_DELETE,
    ST_CHECK,
    _,
};
pub extern fn onig_st_init_table([*c]struct_st_hash_type) [*c]st_table;
pub extern fn onig_st_init_table_with_size([*c]struct_st_hash_type, c_int) [*c]st_table;
pub extern fn onig_st_init_numtable() [*c]st_table;
pub extern fn onig_st_init_numtable_with_size(c_int) [*c]st_table;
pub extern fn onig_st_init_strtable() [*c]st_table;
pub extern fn onig_st_init_strtable_with_size(c_int) [*c]st_table;
pub extern fn onig_st_delete([*c]st_table, [*c]st_data_t, [*c]st_data_t) c_int;
pub extern fn onig_st_delete_safe([*c]st_table, [*c]st_data_t, [*c]st_data_t, st_data_t) c_int;
pub extern fn onig_st_insert([*c]st_table, st_data_t, st_data_t) c_int;
pub extern fn onig_st_lookup([*c]st_table, st_data_t, [*c]st_data_t) c_int;
pub extern fn onig_st_foreach([*c]st_table, ?fn (...) callconv(.C) c_int, st_data_t) c_int;
pub extern fn onig_st_add_direct([*c]st_table, st_data_t, st_data_t) void;
pub extern fn onig_st_free_table([*c]st_table) void;
pub extern fn onig_st_cleanup_safe([*c]st_table, st_data_t) void;
pub extern fn onig_st_copy([*c]st_table) [*c]st_table;
pub const CS_VALUE = @enumToInt(enum_unnamed_98.CS_VALUE);
pub const CS_RANGE = @enumToInt(enum_unnamed_98.CS_RANGE);
pub const CS_COMPLETE = @enumToInt(enum_unnamed_98.CS_COMPLETE);
pub const CS_START = @enumToInt(enum_unnamed_98.CS_START);
const enum_unnamed_98 = extern enum(c_int) {
    CS_VALUE,
    CS_RANGE,
    CS_COMPLETE,
    CS_START,
    _,
};
pub const CSTATE = enum_unnamed_98;
pub const CV_UNDEF = @enumToInt(enum_unnamed_99.CV_UNDEF);
pub const CV_SB = @enumToInt(enum_unnamed_99.CV_SB);
pub const CV_MB = @enumToInt(enum_unnamed_99.CV_MB);
pub const CV_CPROP = @enumToInt(enum_unnamed_99.CV_CPROP);
const enum_unnamed_99 = extern enum(c_int) {
    CV_UNDEF,
    CV_SB,
    CV_MB,
    CV_CPROP,
    _,
};
pub const CVAL = enum_unnamed_99;
pub var onig_warn: OnigWarnFunc = onig_null_warn;
pub var onig_verb_warn: OnigWarnFunc = onig_null_warn;
pub var MaxCaptureNum: c_int = 32767;
pub var ParseDepthLimit: c_uint = @bitCast(c_uint, @as(c_int, 4096));
pub fn bbuf_init(arg_buf: [*c]BBuf, arg_size: c_int) callconv(.C) c_int {
    var buf = arg_buf;
    var size = arg_size;
    if (size <= @as(c_int, 0)) {
        size = 0;
        buf.*.p = null;
    } else {
        buf.*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), malloc(@bitCast(c_ulong, @as(c_long, size)))));
        if ((@ptrCast(?*c_void, (buf.*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
    }
    buf.*.alloc = @bitCast(c_uint, size);
    buf.*.used = @bitCast(c_uint, @as(c_int, 0));
    return 0;
}
pub fn bbuf_free(arg_bbuf: [*c]BBuf) callconv(.C) void {
    var bbuf = arg_bbuf;
    if ((@ptrCast(?*c_void, (bbuf))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        if ((@ptrCast(?*c_void, (bbuf.*.p))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, bbuf.*.p));
        free(@ptrCast(?*c_void, bbuf));
    }
}
pub fn bbuf_clone(arg_rto: [*c][*c]BBuf, arg_from: [*c]BBuf) callconv(.C) c_int {
    var rto = arg_rto;
    var from = arg_from;
    var r: c_int = undefined;
    var to: [*c]BBuf = undefined;
    rto.?.* = blk: {
        const tmp = @ptrCast([*c]BBuf, @alignCast(@alignOf(BBuf), malloc(@sizeOf(BBuf))));
        to = tmp;
        break :blk tmp;
    };
    if ((@ptrCast(?*c_void, (to))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    r = bbuf_init((to), @bitCast(c_int, (from.*.alloc)));
    if (r != @as(c_int, 0)) {
        bbuf_free(to);
        rto.?.* = null;
        return r;
    }
    to.*.used = from.*.used;
    _ = __builtin___memcpy_chk(@ptrCast(?*c_void, to.*.p), @ptrCast(?*const c_void, from.*.p), @bitCast(c_ulong, @as(c_ulong, from.*.used)), __builtin_object_size(@ptrCast(?*const c_void, to.*.p), @as(c_int, 0)));
    return 0;
}
pub fn backref_rel_to_abs(arg_rel_no: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var rel_no = arg_rel_no;
    var env = arg_env;
    if (rel_no > @as(c_int, 0)) {
        if (rel_no > (@as(c_int, 2147483647) - env.*.num_mem)) return -@as(c_int, 208);
        return (env.*.num_mem + rel_no);
    } else {
        return ((env.*.num_mem + @as(c_int, 1)) + rel_no);
    }
    return 0;
}
pub fn bitset_set_range(arg_bs: BitSetRef, arg_from: c_int, arg_to: c_int) callconv(.C) void {
    var bs = arg_bs;
    var from = arg_from;
    var to = arg_to;
    var i: c_int = undefined;
    {
        i = from;
        while ((i <= to) and (i < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)))) : (i += 1) {
            (bs)[@bitCast(c_uint, (i)) >> @intCast(@import("std").math.Log2Int(c_uint), 5)] |= (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), (@bitCast(c_uint, (i)) & @bitCast(c_uint, @as(c_int, 31)))));
        }
    }
}
pub fn bitset_invert(arg_bs: BitSetRef) callconv(.C) void {
    var bs = arg_bs;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
            bs[@intCast(c_uint, i)] = ~(bs[@intCast(c_uint, i)]);
        }
    }
}
pub fn bitset_invert_to(arg_from: BitSetRef, arg_to: BitSetRef) callconv(.C) void {
    var from = arg_from;
    var to = arg_to;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
            to[@intCast(c_uint, i)] = ~(from[@intCast(c_uint, i)]);
        }
    }
}
pub fn bitset_and(arg_dest: BitSetRef, arg_bs: BitSetRef) callconv(.C) void {
    var dest = arg_dest;
    var bs = arg_bs;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
            dest[@intCast(c_uint, i)] &= bs[@intCast(c_uint, i)];
        }
    }
}
pub fn bitset_or(arg_dest: BitSetRef, arg_bs: BitSetRef) callconv(.C) void {
    var dest = arg_dest;
    var bs = arg_bs;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
            dest[@intCast(c_uint, i)] |= bs[@intCast(c_uint, i)];
        }
    }
}
pub fn bitset_copy(arg_dest: BitSetRef, arg_bs: BitSetRef) callconv(.C) void {
    var dest = arg_dest;
    var bs = arg_bs;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
            dest[@intCast(c_uint, i)] = bs[@intCast(c_uint, i)];
        }
    }
}
pub fn strcat_capa(arg_dest: [*c]OnigUChar, arg_dest_end: [*c]OnigUChar, arg_src: [*c]const OnigUChar, arg_src_end: [*c]const OnigUChar, arg_capa: c_int) callconv(.C) [*c]OnigUChar {
    var dest = arg_dest;
    var dest_end = arg_dest_end;
    var src = arg_src;
    var src_end = arg_src_end;
    var capa = arg_capa;
    var r: [*c]OnigUChar = undefined;
    var dest_delta: ptrdiff_t = (dest_end - dest);
    if (dest != null) r = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, dest), @bitCast(c_ulong, @as(c_long, (capa + @as(c_int, 1))))))) else r = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), malloc(@bitCast(c_ulong, @as(c_long, (capa + @as(c_int, 1)))))));
    if ((@ptrCast(?*c_void, (r))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    onig_strcpy((r + dest_delta), src, src_end);
    return r;
}
pub fn strcat_capa_from_static(arg_dest: [*c]OnigUChar, arg_dest_end: [*c]OnigUChar, arg_src: [*c]const OnigUChar, arg_src_end: [*c]const OnigUChar, arg_capa: c_int) callconv(.C) [*c]OnigUChar {
    var dest = arg_dest;
    var dest_end = arg_dest_end;
    var src = arg_src;
    var src_end = arg_src_end;
    var capa = arg_capa;
    var r: [*c]OnigUChar = undefined;
    r = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), malloc(@bitCast(c_ulong, @as(c_long, (capa + @as(c_int, 1)))))));
    if ((@ptrCast(?*c_void, (r))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    onig_strcpy(r, dest, dest_end);
    onig_strcpy((r + (dest_end - dest)), src, src_end);
    return r;
}
const struct_unnamed_100 = extern struct {
    s: [*c]OnigUChar,
    end: [*c]OnigUChar,
};
pub const st_str_end_key = struct_unnamed_100;
pub fn str_end_cmp(arg_x: [*c]st_str_end_key, arg_y: [*c]st_str_end_key) callconv(.C) c_int {
    var x = arg_x;
    var y = arg_y;
    var p: [*c]OnigUChar = undefined;
    var q: [*c]OnigUChar = undefined;
    var c: c_int = undefined;
    if ((x.*.end - x.*.s) != (y.*.end - y.*.s)) return 1;
    p = x.*.s;
    q = y.*.s;
    while (p < x.*.end) {
        c = (@bitCast(c_int, @as(c_uint, p.?.*)) - @bitCast(c_int, @as(c_uint, q.?.*)));
        if (c != @as(c_int, 0)) return c;
        p += 1;
        q += 1;
    }
    return 0;
}
pub fn str_end_hash(arg_x: [*c]st_str_end_key) callconv(.C) c_int {
    var x = arg_x;
    var p: [*c]OnigUChar = undefined;
    var val: c_uint = @bitCast(c_uint, @as(c_int, 0));
    p = x.*.s;
    while (p < x.*.end) {
        val = ((val *% @bitCast(c_uint, @as(c_int, 997))) +% @bitCast(c_uint, @as(c_uint, (blk: {
            const ref = &p;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).?.*)));
    }
    return @bitCast(c_int, (val +% (val >> @intCast(@import("std").math.Log2Int(c_uint), 5))));
}
const struct_unnamed_101 = extern struct {
    enc: OnigEncoding,
    type: c_int,
    s: [*c]OnigUChar,
    end: [*c]OnigUChar,
};
pub const st_callout_name_key = struct_unnamed_101;
pub fn callout_name_table_cmp(arg_x: [*c]st_callout_name_key, arg_y: [*c]st_callout_name_key) callconv(.C) c_int {
    var x = arg_x;
    var y = arg_y;
    var p: [*c]OnigUChar = undefined;
    var q: [*c]OnigUChar = undefined;
    var c: c_int = undefined;
    if (x.*.enc != y.*.enc) return 1;
    if (x.*.type != y.*.type) return 1;
    if ((x.*.end - x.*.s) != (y.*.end - y.*.s)) return 1;
    p = x.*.s;
    q = y.*.s;
    while (p < x.*.end) {
        c = (@bitCast(c_int, @as(c_uint, p.?.*)) - @bitCast(c_int, @as(c_uint, q.?.*)));
        if (c != @as(c_int, 0)) return c;
        p += 1;
        q += 1;
    }
    return 0;
}
pub fn callout_name_table_hash(arg_x: [*c]st_callout_name_key) callconv(.C) c_int {
    var x = arg_x;
    var p: [*c]OnigUChar = undefined;
    var val: c_uint = @bitCast(c_uint, @as(c_int, 0));
    p = x.*.s;
    while (p < x.*.end) {
        val = ((val *% @bitCast(c_uint, @as(c_int, 997))) +% @bitCast(c_uint, @as(c_uint, (blk: {
            const ref = &p;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).?.*)));
    }
    return @bitCast(c_int, @truncate(c_int, ((@bitCast(c_long, @as(c_ulong, (val +% (val >> @intCast(@import("std").math.Log2Int(c_uint), 5))))) + (@intCast(isize, @ptrToInt(x.*.enc)) & @bitCast(c_long, @as(c_long, @as(c_int, 65535))))) + @bitCast(c_long, @as(c_long, x.*.type)))));
}
var hashType_1: struct_st_hash_type = struct_st_hash_type{
    .compare = @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), callout_name_table_cmp)),
    .hash = @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), callout_name_table_hash)),
};
pub fn onig_st_init_callout_name_table_with_size(arg_size: c_int) callconv(.C) hash_table_type {
    var size = arg_size;
    _ = hashType_1;
    return @ptrCast(hash_table_type, onig_st_init_table_with_size(&hashType_1, size));
}
pub fn onig_st_lookup_callout_name_table(arg_table: hash_table_type, arg_enc: OnigEncoding, arg_type_1: c_int, arg_str_key: [*c]const OnigUChar, arg_end_key: [*c]const OnigUChar, arg_value: [*c]hash_data_type) callconv(.C) c_int {
    var table = arg_table;
    var enc = arg_enc;
    var type_1 = arg_type_1;
    var str_key = arg_str_key;
    var end_key = arg_end_key;
    var value = arg_value;
    var key: st_callout_name_key = undefined;
    key.enc = enc;
    key.type = type_1;
    key.s = @intToPtr([*c]OnigUChar, @ptrToInt(str_key));
    key.end = @intToPtr([*c]OnigUChar, @ptrToInt(end_key));
    return onig_st_lookup(@ptrCast([*c]st_table, @alignCast(@alignOf(st_table), table)), @intCast(st_data_t, @ptrToInt((&key))), value);
}
pub fn st_insert_callout_name_table(arg_table: hash_table_type, arg_enc: OnigEncoding, arg_type_1: c_int, arg_str_key: [*c]OnigUChar, arg_end_key: [*c]OnigUChar, arg_value: hash_data_type) callconv(.C) c_int {
    var table = arg_table;
    var enc = arg_enc;
    var type_1 = arg_type_1;
    var str_key = arg_str_key;
    var end_key = arg_end_key;
    var value = arg_value;
    var key: [*c]st_callout_name_key = undefined;
    var result: c_int = undefined;
    key = @ptrCast([*c]st_callout_name_key, @alignCast(@alignOf(st_callout_name_key), malloc(@sizeOf(st_callout_name_key))));
    if ((@ptrCast(?*c_void, (key))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    key.*.enc = enc;
    key.*.type = type_1;
    key.*.s = str_key;
    key.*.end = end_key;
    result = onig_st_insert(@ptrCast([*c]st_table, @alignCast(@alignOf(st_table), table)), @intCast(st_data_t, @ptrToInt(key)), value);
    if (result != 0) {
        free(@ptrCast(?*c_void, key));
    }
    return result;
}
const struct_unnamed_102 = extern struct {
    name: [*c]OnigUChar,
    name_len: c_int,
    back_num: c_int,
    back_alloc: c_int,
    back_ref1: c_int,
    back_refs: [*c]c_int,
};
pub const NameEntry = struct_unnamed_102;
pub const NameTable = st_table;
pub const HashDataType = st_data_t;
pub fn i_free_name_entry(arg_key: [*c]OnigUChar, arg_e: [*c]NameEntry, arg_arg: ?*c_void) callconv(.C) c_int {
    var key = arg_key;
    var e = arg_e;
    var arg = arg_arg;
    free(@ptrCast(?*c_void, e.*.name));
    if ((@ptrCast(?*c_void, (e.*.back_refs))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, e.*.back_refs));
    free(@ptrCast(?*c_void, key));
    free(@ptrCast(?*c_void, e));
    return ST_DELETE;
}
pub fn names_clear(arg_reg: [*c]regex_t) callconv(.C) c_int {
    var reg = arg_reg;
    var t: [*c]NameTable = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_foreach(t, @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), i_free_name_entry)), @bitCast(st_data_t, @as(c_long, @as(c_int, 0))));
    }
    return 0;
}
pub fn name_find(arg_reg: [*c]regex_t, arg_name: [*c]const OnigUChar, arg_name_end: [*c]const OnigUChar) callconv(.C) [*c]NameEntry {
    var reg = arg_reg;
    var name = arg_name;
    var name_end = arg_name_end;
    var e: [*c]NameEntry = undefined;
    var t: [*c]NameTable = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    e = @ptrCast([*c]NameEntry, @alignCast(@alignOf(NameEntry), (@intToPtr(?*c_void, @as(c_int, 0)))));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_lookup_strend(@ptrCast(hash_table_type, t), name, name_end, @ptrCast([*c]HashDataType, @alignCast(@alignOf(HashDataType), (@ptrCast(?*c_void, (&e))))));
    }
    return e;
}
const struct_unnamed_103 = extern struct {
    func: ?fn ([*c]const OnigUChar, [*c]const OnigUChar, c_int, [*c]c_int, [*c]regex_t, ?*c_void) callconv(.C) c_int,
    reg: [*c]regex_t,
    arg: ?*c_void,
    ret: c_int,
    enc: OnigEncoding,
};
pub const INamesArg = struct_unnamed_103;
pub fn i_names(arg_key: [*c]OnigUChar, arg_e: [*c]NameEntry, arg_arg: [*c]INamesArg) callconv(.C) c_int {
    var key = arg_key;
    var e = arg_e;
    var arg = arg_arg;
    var r: c_int = (arg.*.func).?(e.*.name, (e.*.name + e.*.name_len), e.*.back_num, (if (e.*.back_num > @as(c_int, 1)) e.*.back_refs else &(e.*.back_ref1)), arg.*.reg, arg.*.arg);
    if (r != @as(c_int, 0)) {
        arg.*.ret = r;
        return ST_STOP;
    }
    return ST_CONTINUE;
}
pub fn i_renumber_name(arg_key: [*c]OnigUChar, arg_e: [*c]NameEntry, arg_map: [*c]GroupNumMap) callconv(.C) c_int {
    var key = arg_key;
    var e = arg_e;
    var map = arg_map;
    var i: c_int = undefined;
    if (e.*.back_num > @as(c_int, 1)) {
        {
            i = 0;
            while (i < e.*.back_num) : (i += 1) {
                e.*.back_refs[@intCast(c_uint, i)] = map[@intCast(c_uint, e.*.back_refs[@intCast(c_uint, i)])].new_val;
            }
        }
    } else if (e.*.back_num == @as(c_int, 1)) {
        e.*.back_ref1 = map[@intCast(c_uint, e.*.back_ref1)].new_val;
    }
    return ST_CONTINUE;
}
pub fn name_add(arg_reg: [*c]regex_t, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar, arg_backref: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var reg = arg_reg;
    var name = arg_name;
    var name_end = arg_name_end;
    var backref = arg_backref;
    var env = arg_env;
    var r: c_int = undefined;
    var alloc: c_int = undefined;
    var e: [*c]NameEntry = undefined;
    var t: [*c]NameTable = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), reg.*.name_table));
    if ((name_end - name) <= @bitCast(c_long, @as(c_long, @as(c_int, 0)))) return -@as(c_int, 214);
    e = name_find(reg, name, name_end);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        if ((@ptrCast(?*c_void, (t))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            t = @ptrCast([*c]NameTable, @alignCast(@alignOf(NameTable), onig_st_init_strend_table_with_size(@as(c_int, 5))));
            if ((@ptrCast(?*c_void, (t))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            reg.*.name_table = @ptrCast(?*c_void, t);
        }
        e = @ptrCast([*c]NameEntry, @alignCast(@alignOf(NameEntry), malloc(@sizeOf(NameEntry))));
        if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        e.*.name = onigenc_strdup(reg.*.enc, name, name_end);
        if ((@ptrCast(?*c_void, (e.*.name))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            free(@ptrCast(?*c_void, e));
            return -@as(c_int, 5);
        }
        r = onig_st_insert_strend(@ptrCast(hash_table_type, t), e.*.name, (e.*.name + (name_end - name)), @intCast(HashDataType, @ptrToInt(e)));
        if (r < @as(c_int, 0)) return r;
        e.*.name_len = @bitCast(c_int, @truncate(c_int, (name_end - name)));
        e.*.back_num = 0;
        e.*.back_alloc = 0;
        e.*.back_refs = @ptrCast([*c]c_int, @alignCast(@alignOf(c_int), (@intToPtr(?*c_void, @as(c_int, 0)))));
    }
    if ((e.*.back_num >= @as(c_int, 1)) and !(((env.*.syntax).*.behavior & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 8))) != @bitCast(c_uint, @as(c_int, 0)))) {
        onig_scan_env_set_error_string(env, -@as(c_int, 219), name, name_end);
        return -@as(c_int, 219);
    }
    e.*.back_num += 1;
    if (e.*.back_num == @as(c_int, 1)) {
        e.*.back_ref1 = backref;
    } else {
        if (e.*.back_num == @as(c_int, 2)) {
            alloc = 8;
            e.*.back_refs = @ptrCast([*c]c_int, @alignCast(@alignOf(c_int), malloc((@sizeOf(c_int) *% @bitCast(c_ulong, @as(c_long, alloc))))));
            if ((@ptrCast(?*c_void, (e.*.back_refs))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            e.*.back_alloc = alloc;
            e.*.back_refs[@intCast(c_uint, @as(c_int, 0))] = e.*.back_ref1;
            e.*.back_refs[@intCast(c_uint, @as(c_int, 1))] = backref;
        } else {
            if (e.*.back_num > e.*.back_alloc) {
                alloc = (e.*.back_alloc * @as(c_int, 2));
                e.*.back_refs = @ptrCast([*c]c_int, @alignCast(@alignOf(c_int), realloc(@ptrCast(?*c_void, e.*.back_refs), (@sizeOf(c_int) *% @bitCast(c_ulong, @as(c_long, alloc))))));
                if ((@ptrCast(?*c_void, (e.*.back_refs))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
                e.*.back_alloc = alloc;
            }
            e.*.back_refs[@intCast(c_uint, (e.*.back_num - @as(c_int, 1)))] = backref;
        }
    }
    return 0;
}
pub fn name_to_group_numbers(arg_env: [*c]ParseEnv, arg_name: [*c]const OnigUChar, arg_name_end: [*c]const OnigUChar, arg_nums: [*c][*c]c_int) callconv(.C) c_int {
    var env = arg_env;
    var name = arg_name;
    var name_end = arg_name_end;
    var nums = arg_nums;
    var reg: [*c]regex_t = undefined;
    var e: [*c]NameEntry = undefined;
    reg = env.*.reg;
    e = name_find(reg, name, name_end);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        onig_scan_env_set_error_string(env, -@as(c_int, 217), @intToPtr([*c]OnigUChar, @ptrToInt(name)), @intToPtr([*c]OnigUChar, @ptrToInt(name_end)));
        return -@as(c_int, 217);
    }
    switch_3: {
        default: {
            case_1: {
                case: {
                    switch (e.*.back_num) {
                        @as(c_int, 0) => break :case,
                        @as(c_int, 1) => break :case_1,
                        else => break :default,
                    }
                }
                break :@"switch";
            }
            nums.?.* = &(e.*.back_ref1);
            break :switch_2;
        }
        nums.?.* = e.*.back_refs;
        break :switch_3;
    }
    return e.*.back_num;
}
const struct_unnamed_104 = extern struct {
    type: OnigCalloutType,
    in: c_int,
    start_func: OnigCalloutFunc,
    end_func: OnigCalloutFunc,
    arg_num: c_int,
    opt_arg_num: c_int,
    arg_types: [4]c_uint,
    opt_defaults: [4]OnigValue,
    name: [*c]OnigUChar,
};
pub const CalloutNameListEntry = struct_unnamed_104;
const struct_unnamed_105 = extern struct {
    n: c_int,
    alloc: c_int,
    v: [*c]CalloutNameListEntry,
};
pub const CalloutNameListType = struct_unnamed_105;
pub var GlobalCalloutNameList: [*c]CalloutNameListType = @import("std").mem.zeroes([*c]CalloutNameListType);
pub fn make_callout_func_list(arg_rs: [*c][*c]CalloutNameListType, arg_init_size: c_int) callconv(.C) c_int {
    var rs = arg_rs;
    var init_size = arg_init_size;
    var s: [*c]CalloutNameListType = undefined;
    var v: [*c]CalloutNameListEntry = undefined;
    rs.?.* = null;
    s = @ptrCast([*c]CalloutNameListType, @alignCast(@alignOf(CalloutNameListType), malloc(@sizeOf(CalloutNameListType))));
    if ((@ptrCast(?*c_void, (s))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    v = @ptrCast([*c]CalloutNameListEntry, @alignCast(@alignOf(CalloutNameListEntry), malloc((@sizeOf(CalloutNameListEntry) *% @bitCast(c_ulong, @as(c_long, init_size))))));
    if ((@ptrCast(?*c_void, (v))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        free(@ptrCast(?*c_void, s));
        return -@as(c_int, 5);
    }
    s.*.n = 0;
    s.*.alloc = init_size;
    s.*.v = v;
    rs.?.* = s;
    return 0;
}
pub fn free_callout_func_list(arg_s: [*c]CalloutNameListType) callconv(.C) void {
    var s = arg_s;
    if ((@ptrCast(?*c_void, (s))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        if ((@ptrCast(?*c_void, (s.*.v))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            var i: c_int = undefined;
            var j: c_int = undefined;
            {
                i = 0;
                while (i < s.*.n) : (i += 1) {
                    var e: [*c]CalloutNameListEntry = (s.*.v + i);
                    {
                        j = (e.*.arg_num - e.*.opt_arg_num);
                        while (j < e.*.arg_num) : (j += 1) {
                            if (e.*.arg_types[@intCast(c_uint, j)] == @bitCast(c_uint, ONIG_TYPE_STRING)) {
                                var p: [*c]OnigUChar = e.*.opt_defaults[@intCast(c_uint, j)].s.start;
                                if ((@ptrCast(?*c_void, (p))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, p));
                            }
                        }
                    }
                }
            }
            free(@ptrCast(?*c_void, s.*.v));
        }
        free(@ptrCast(?*c_void, s));
    }
}
pub fn callout_func_list_add(arg_s: [*c]CalloutNameListType, arg_rid: [*c]c_int) callconv(.C) c_int {
    var s = arg_s;
    var rid = arg_rid;
    if (s.*.n >= s.*.alloc) {
        var new_size: c_int = (s.*.alloc * @as(c_int, 2));
        var nv: [*c]CalloutNameListEntry = @ptrCast([*c]CalloutNameListEntry, @alignCast(@alignOf(CalloutNameListEntry), realloc(@ptrCast(?*c_void, s.*.v), (@sizeOf(CalloutNameListEntry) *% @bitCast(c_ulong, @as(c_long, new_size))))));
        if ((@ptrCast(?*c_void, (nv))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        s.*.alloc = new_size;
        s.*.v = nv;
    }
    rid.?.* = s.*.n;
    _ = __builtin___memset_chk(@ptrCast(?*c_void, &(s.*.v[@intCast(c_uint, s.*.n)])), @as(c_int, 0), @sizeOf(CalloutNameListEntry), __builtin_object_size(@ptrCast(?*const c_void, &(s.*.v[@intCast(c_uint, s.*.n)])), @as(c_int, 0)));
    s.*.n += 1;
    return 0;
}
const struct_unnamed_106 = extern struct {
    name: [*c]OnigUChar,
    name_len: c_int,
    id: c_int,
};
pub const CalloutNameEntry = struct_unnamed_106;
pub const CalloutNameTable = st_table;
pub var GlobalCalloutNameTable: [*c]CalloutNameTable = @import("std").mem.zeroes([*c]CalloutNameTable);
pub var CalloutNameIDCounter: c_int = @import("std").mem.zeroes(c_int);
pub fn i_free_callout_name_entry(arg_key: [*c]st_callout_name_key, arg_e: [*c]CalloutNameEntry, arg_arg: ?*c_void) callconv(.C) c_int {
    var key = arg_key;
    var e = arg_e;
    var arg = arg_arg;
    if ((@ptrCast(?*c_void, (e))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        free(@ptrCast(?*c_void, e.*.name));
    }
    free(@ptrCast(?*c_void, key));
    free(@ptrCast(?*c_void, e));
    return ST_DELETE;
}
pub fn callout_name_table_clear(arg_t: [*c]CalloutNameTable) callconv(.C) c_int {
    var t = arg_t;
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_foreach(t, @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), i_free_callout_name_entry)), @bitCast(st_data_t, @as(c_long, @as(c_int, 0))));
    }
    return 0;
}
pub fn global_callout_name_table_free() callconv(.C) c_int {
    if ((@ptrCast(?*c_void, (GlobalCalloutNameTable))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        var r: c_int = callout_name_table_clear(GlobalCalloutNameTable);
        if (r != @as(c_int, 0)) return r;
        onig_st_free_table(GlobalCalloutNameTable);
        GlobalCalloutNameTable = null;
        CalloutNameIDCounter = 0;
    }
    return 0;
}
pub fn callout_name_find(arg_enc: OnigEncoding, arg_is_not_single: c_int, arg_name: [*c]const OnigUChar, arg_name_end: [*c]const OnigUChar) callconv(.C) [*c]CalloutNameEntry {
    var enc = arg_enc;
    var is_not_single = arg_is_not_single;
    var name = arg_name;
    var name_end = arg_name_end;
    var r: c_int = undefined;
    var e: [*c]CalloutNameEntry = undefined;
    var t: [*c]CalloutNameTable = GlobalCalloutNameTable;
    e = @ptrCast([*c]CalloutNameEntry, @alignCast(@alignOf(CalloutNameEntry), (@intToPtr(?*c_void, @as(c_int, 0)))));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        r = onig_st_lookup_callout_name_table(@ptrCast(hash_table_type, t), enc, is_not_single, name, name_end, @ptrCast([*c]HashDataType, @alignCast(@alignOf(HashDataType), (@ptrCast(?*c_void, (&e))))));
        if (r == @as(c_int, 0)) {
            if ((enc != (&OnigEncodingASCII)) and (((enc).*.flag & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0)))) {
                enc = (&OnigEncodingASCII);
                _ = onig_st_lookup_callout_name_table(@ptrCast(hash_table_type, t), enc, is_not_single, name, name_end, @ptrCast([*c]HashDataType, @alignCast(@alignOf(HashDataType), (@ptrCast(?*c_void, (&e))))));
            }
        }
    }
    return e;
}
pub fn callout_name_entry(arg_rentry: [*c][*c]CalloutNameEntry, arg_enc: OnigEncoding, arg_is_not_single: c_int, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar) callconv(.C) c_int {
    var rentry = arg_rentry;
    var enc = arg_enc;
    var is_not_single = arg_is_not_single;
    var name = arg_name;
    var name_end = arg_name_end;
    var r: c_int = undefined;
    var e: [*c]CalloutNameEntry = undefined;
    var t: [*c]CalloutNameTable = GlobalCalloutNameTable;
    rentry.?.* = null;
    if ((name_end - name) <= @bitCast(c_long, @as(c_long, @as(c_int, 0)))) return -@as(c_int, 228);
    e = callout_name_find(enc, is_not_single, name, name_end);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        if ((@ptrCast(?*c_void, (t))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            t = @ptrCast([*c]CalloutNameTable, @alignCast(@alignOf(CalloutNameTable), onig_st_init_callout_name_table_with_size(@as(c_int, 5))));
            if ((@ptrCast(?*c_void, (t))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            GlobalCalloutNameTable = t;
        }
        e = @ptrCast([*c]CalloutNameEntry, @alignCast(@alignOf(CalloutNameEntry), malloc(@sizeOf(CalloutNameEntry))));
        if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        e.*.name = onigenc_strdup(enc, name, name_end);
        if ((@ptrCast(?*c_void, (e.*.name))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            free(@ptrCast(?*c_void, e));
            return -@as(c_int, 5);
        }
        r = st_insert_callout_name_table(@ptrCast(hash_table_type, t), enc, is_not_single, e.*.name, (e.*.name + (name_end - name)), @intCast(HashDataType, @ptrToInt(e)));
        if (r < @as(c_int, 0)) return r;
        CalloutNameIDCounter += 1;
        e.*.id = CalloutNameIDCounter;
        e.*.name_len = @bitCast(c_int, @truncate(c_int, (name_end - name)));
    }
    rentry.?.* = e;
    return e.*.id;
}
pub fn is_allowed_callout_name(arg_enc: OnigEncoding, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar) callconv(.C) c_int {
    var enc = arg_enc;
    var name = arg_name;
    var name_end = arg_name_end;
    var p: [*c]OnigUChar = undefined;
    var c: OnigCodePoint = undefined;
    if (name >= name_end) return 0;
    p = name;
    while (p < name_end) {
        c = (enc).*.mbc_to_code.?((p), (name_end));
        if (!(((((c >= @bitCast(c_uint, @as(c_int, 'A'))) and (c <= @bitCast(c_uint, @as(c_int, 'Z')))) or ((c >= @bitCast(c_uint, @as(c_int, 'a'))) and (c <= @bitCast(c_uint, @as(c_int, 'z'))))) or ((c >= @bitCast(c_uint, @as(c_int, '0'))) and (c <= @bitCast(c_uint, @as(c_int, '9'))))) or (c == @bitCast(c_uint, @as(c_int, '_'))))) return 0;
        if (p == name) {
            if ((c >= @bitCast(c_uint, @as(c_int, '0'))) and (c <= @bitCast(c_uint, @as(c_int, '9')))) return 0;
        }
        p += (enc).*.mbc_enc_len.?(p);
    }
    return 1;
}
pub fn is_allowed_callout_tag_name(arg_enc: OnigEncoding, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar) callconv(.C) c_int {
    var enc = arg_enc;
    var name = arg_name;
    var name_end = arg_name_end;
    var p: [*c]OnigUChar = undefined;
    var c: OnigCodePoint = undefined;
    if (name >= name_end) return 0;
    p = name;
    while (p < name_end) {
        c = (enc).*.mbc_to_code.?((p), (name_end));
        if (!(((((c >= @bitCast(c_uint, @as(c_int, 'A'))) and (c <= @bitCast(c_uint, @as(c_int, 'Z')))) or ((c >= @bitCast(c_uint, @as(c_int, 'a'))) and (c <= @bitCast(c_uint, @as(c_int, 'z'))))) or ((c >= @bitCast(c_uint, @as(c_int, '0'))) and (c <= @bitCast(c_uint, @as(c_int, '9'))))) or (c == @bitCast(c_uint, @as(c_int, '_'))))) return 0;
        if (p == name) {
            if ((c >= @bitCast(c_uint, @as(c_int, '0'))) and (c <= @bitCast(c_uint, @as(c_int, '9')))) return 0;
        }
        p += (enc).*.mbc_enc_len.?(p);
    }
    return 1;
}
pub fn get_callout_name_id_by_name(arg_enc: OnigEncoding, arg_is_not_single: c_int, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar, arg_rid: [*c]c_int) callconv(.C) c_int {
    var enc = arg_enc;
    var is_not_single = arg_is_not_single;
    var name = arg_name;
    var name_end = arg_name_end;
    var rid = arg_rid;
    var r: c_int = undefined;
    var e: [*c]CalloutNameEntry = undefined;
    if (!(is_allowed_callout_name(enc, name, name_end) != 0)) {
        return -@as(c_int, 228);
    }
    e = callout_name_find(enc, is_not_single, name, name_end);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        return -@as(c_int, 229);
    }
    r = 0;
    rid.?.* = e.*.id;
    return r;
}
pub fn onig_get_callout_in_by_name_id(arg_name_id: c_int) callconv(.C) c_int {
    var name_id = arg_name_id;
    if ((name_id < @as(c_int, 0)) or (name_id >= GlobalCalloutNameList.*.n)) return 0;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].in;
}
pub fn get_callout_arg_num_by_name_id(arg_name_id: c_int) callconv(.C) c_int {
    var name_id = arg_name_id;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].arg_num;
}
pub fn get_callout_opt_arg_num_by_name_id(arg_name_id: c_int) callconv(.C) c_int {
    var name_id = arg_name_id;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].opt_arg_num;
}
pub fn get_callout_arg_type_by_name_id(arg_name_id: c_int, arg_index_1: c_int) callconv(.C) c_uint {
    var name_id = arg_name_id;
    var index_1 = arg_index_1;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].arg_types[@intCast(c_uint, index_1)];
}
pub fn get_callout_opt_default_by_name_id(arg_name_id: c_int, arg_index_1: c_int) callconv(.C) OnigValue {
    var name_id = arg_name_id;
    var index_1 = arg_index_1;
    return GlobalCalloutNameList.*.v[@intCast(c_uint, name_id)].opt_defaults[@intCast(c_uint, index_1)];
}
pub const CalloutTagTable = st_table;
pub const CalloutTagVal = isize;
pub fn i_callout_callout_list_set(arg_key: [*c]OnigUChar, arg_e: CalloutTagVal, arg_arg: ?*c_void) callconv(.C) c_int {
    var key = arg_key;
    var e = arg_e;
    var arg = arg_arg;
    var num: c_int = undefined;
    var ext: [*c]RegexExt = @ptrCast([*c]RegexExt, @alignCast(@alignOf(RegexExt), arg));
    num = (@bitCast(c_int, @truncate(c_int, e)) - @as(c_int, 1));
    ext.*.callout_list[@intCast(c_uint, num)].flag |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0));
    return ST_CONTINUE;
}
pub fn setup_ext_callout_list_values(arg_reg: [*c]regex_t) callconv(.C) c_int {
    var reg = arg_reg;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var ext: [*c]RegexExt = undefined;
    ext = reg.*.extp;
    if ((ext.*.tag_table) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_foreach(@ptrCast([*c]CalloutTagTable, @alignCast(@alignOf(CalloutTagTable), ext.*.tag_table)), @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), i_callout_callout_list_set)), @intCast(st_data_t, @ptrToInt(ext)));
    }
    {
        i = 0;
        while (i < ext.*.callout_num) : (i += 1) {
            var e: [*c]CalloutListEntry = (ext.*.callout_list + i);
            if (@bitCast(c_uint, @enumToInt(e.*.of)) == @bitCast(c_uint, ONIG_CALLOUT_OF_NAME)) {
                {
                    j = 0;
                    while (j < e.*.u.arg.num) : (j += 1) {
                        if (@bitCast(c_uint, @enumToInt(e.*.u.arg.types[@intCast(c_uint, j)])) == @bitCast(c_uint, ONIG_TYPE_TAG)) {
                            var start: [*c]OnigUChar = undefined;
                            var end: [*c]OnigUChar = undefined;
                            var num: c_int = undefined;
                            start = e.*.u.arg.vals[@intCast(c_uint, j)].s.start;
                            end = e.*.u.arg.vals[@intCast(c_uint, j)].s.end;
                            num = onig_get_callout_num_by_tag(reg, start, end);
                            if (num < @as(c_int, 0)) return num;
                            e.*.u.arg.vals[@intCast(c_uint, j)].tag = num;
                        }
                    }
                }
            }
        }
    }
    return 0;
}
pub fn i_free_callout_tag_entry(arg_key: [*c]OnigUChar, arg_e: CalloutTagVal, arg_arg: ?*c_void) callconv(.C) c_int {
    var key = arg_key;
    var e = arg_e;
    var arg = arg_arg;
    free(@ptrCast(?*c_void, key));
    return ST_DELETE;
}
pub fn callout_tag_table_clear(arg_t: [*c]CalloutTagTable) callconv(.C) c_int {
    var t = arg_t;
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_foreach(t, @ptrCast(?fn (...) callconv(.C) c_int, @alignCast(@alignOf(fn (...) callconv(.C) c_int), i_free_callout_tag_entry)), @bitCast(st_data_t, @as(c_long, @as(c_int, 0))));
    }
    return 0;
}
pub fn callout_tag_find(arg_t: [*c]CalloutTagTable, arg_name: [*c]const OnigUChar, arg_name_end: [*c]const OnigUChar) callconv(.C) CalloutTagVal {
    var t = arg_t;
    var name = arg_name;
    var name_end = arg_name_end;
    var e: CalloutTagVal = undefined;
    e = @bitCast(CalloutTagVal, @as(c_long, -@as(c_int, 1)));
    if ((@ptrCast(?*c_void, (t))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        _ = onig_st_lookup_strend(@ptrCast(hash_table_type, t), name, name_end, @ptrCast([*c]HashDataType, @alignCast(@alignOf(HashDataType), (@ptrCast(?*c_void, (&e))))));
    }
    return e;
}
pub fn callout_tag_table_new(arg_rt: [*c][*c]CalloutTagTable) callconv(.C) c_int {
    var rt = arg_rt;
    var t: [*c]CalloutTagTable = undefined;
    rt.?.* = null;
    t = @ptrCast([*c]CalloutTagTable, @alignCast(@alignOf(CalloutTagTable), onig_st_init_strend_table_with_size(@as(c_int, 5))));
    if ((@ptrCast(?*c_void, (t))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    rt.?.* = t;
    return 0;
}
pub fn callout_tag_entry_raw(arg_env: [*c]ParseEnv, arg_t: [*c]CalloutTagTable, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar, arg_entry_val: CalloutTagVal) callconv(.C) c_int {
    var env = arg_env;
    var t = arg_t;
    var name = arg_name;
    var name_end = arg_name_end;
    var entry_val = arg_entry_val;
    var r: c_int = undefined;
    var val: CalloutTagVal = undefined;
    if ((name_end - name) <= @bitCast(c_long, @as(c_long, @as(c_int, 0)))) return -@as(c_int, 231);
    val = callout_tag_find(t, name, name_end);
    if (val >= @bitCast(c_long, @as(c_long, @as(c_int, 0)))) {
        onig_scan_env_set_error_string(env, -@as(c_int, 219), name, name_end);
        return -@as(c_int, 219);
    }
    r = onig_st_insert_strend(@ptrCast(hash_table_type, t), name, name_end, @bitCast(HashDataType, entry_val));
    if (r < @as(c_int, 0)) return r;
    return 0;
}
pub fn ext_ensure_tag_table(arg_reg: [*c]regex_t) callconv(.C) c_int {
    var reg = arg_reg;
    var r: c_int = undefined;
    var ext: [*c]RegexExt = undefined;
    var t: [*c]CalloutTagTable = undefined;
    ext = onig_get_regex_ext(reg);
    if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    if ((ext.*.tag_table) == @intToPtr(?*c_void, @as(c_int, 0))) {
        r = callout_tag_table_new(&t);
        if (r != @as(c_int, 0)) return r;
        ext.*.tag_table = @ptrCast(?*c_void, t);
    }
    return 0;
}
pub fn callout_tag_entry(arg_env: [*c]ParseEnv, arg_reg: [*c]regex_t, arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar, arg_entry_val: CalloutTagVal) callconv(.C) c_int {
    var env = arg_env;
    var reg = arg_reg;
    var name = arg_name;
    var name_end = arg_name_end;
    var entry_val = arg_entry_val;
    var r: c_int = undefined;
    var ext: [*c]RegexExt = undefined;
    var e: [*c]CalloutListEntry = undefined;
    r = ext_ensure_tag_table(reg);
    if (r != @as(c_int, 0)) return r;
    ext = onig_get_regex_ext(reg);
    if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    r = callout_tag_entry_raw(env, @ptrCast([*c]CalloutTagTable, @alignCast(@alignOf(CalloutTagTable), ext.*.tag_table)), name, name_end, entry_val);
    e = onig_reg_callout_list_at(reg, @bitCast(c_int, @truncate(c_int, entry_val)));
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    e.*.tag_start = name;
    e.*.tag_end = name_end;
    return r;
}
pub fn scan_env_clear(arg_env: [*c]ParseEnv) callconv(.C) void {
    var env = arg_env;
    (env.*.cap_history) = @bitCast(MemStatusType, @as(c_int, 0));
    (env.*.backtrack_mem) = @bitCast(MemStatusType, @as(c_int, 0));
    (env.*.backrefed_mem) = @bitCast(MemStatusType, @as(c_int, 0));
    env.*.@"error" = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (@intToPtr(?*c_void, @as(c_int, 0)))));
    env.*.error_end = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (@intToPtr(?*c_void, @as(c_int, 0)))));
    env.*.num_call = 0;
    env.*.unset_addr_list = null;
    env.*.has_call_zero = 0;
    env.*.num_mem = 0;
    env.*.num_named = 0;
    env.*.mem_alloc = 0;
    env.*.mem_env_dynamic = @ptrCast([*c]MemEnv, @alignCast(@alignOf(MemEnv), (@intToPtr(?*c_void, @as(c_int, 0)))));
    _ = __builtin___memset_chk(@ptrCast(?*c_void, &env.*.mem_env_static), @as(c_int, 0), @sizeOf([8]MemEnv), __builtin_object_size(@ptrCast(?*const c_void, &env.*.mem_env_static), @as(c_int, 0)));
    env.*.parse_depth = @bitCast(c_uint, @as(c_int, 0));
    env.*.backref_num = 0;
    env.*.keep_num = 0;
    env.*.id_num = 0;
    env.*.save_alloc_num = 0;
    env.*.saves = null;
}
pub fn scan_env_add_mem_entry(arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var env = arg_env;
    var i: c_int = undefined;
    var need: c_int = undefined;
    var alloc: c_int = undefined;
    var p: [*c]MemEnv = undefined;
    need = (env.*.num_mem + @as(c_int, 1));
    if ((need > MaxCaptureNum) and (MaxCaptureNum != @as(c_int, 0))) return -@as(c_int, 210);
    if (need >= @as(c_int, 8)) {
        if (env.*.mem_alloc <= need) {
            if ((@ptrCast(?*c_void, (env.*.mem_env_dynamic))) == @intToPtr(?*c_void, @as(c_int, 0))) {
                alloc = 16;
                p = @ptrCast([*c]MemEnv, @alignCast(@alignOf(MemEnv), malloc((@sizeOf(MemEnv) *% @bitCast(c_ulong, @as(c_long, alloc))))));
                if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
                _ = __builtin___memcpy_chk(@ptrCast(?*c_void, p), @ptrCast(?*const c_void, &env.*.mem_env_static), @sizeOf([8]MemEnv), __builtin_object_size(@ptrCast(?*const c_void, p), @as(c_int, 0)));
            } else {
                alloc = (env.*.mem_alloc * @as(c_int, 2));
                p = @ptrCast([*c]MemEnv, @alignCast(@alignOf(MemEnv), realloc(@ptrCast(?*c_void, env.*.mem_env_dynamic), (@sizeOf(MemEnv) *% @bitCast(c_ulong, @as(c_long, alloc))))));
                if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            }
            {
                i = (env.*.num_mem + @as(c_int, 1));
                while (i < alloc) : (i += 1) {
                    p[@intCast(c_uint, i)].mem_node = (@intToPtr([*c]Node, @as(c_int, 0)));
                    p[@intCast(c_uint, i)].empty_repeat_node = (@intToPtr([*c]Node, @as(c_int, 0)));
                }
            }
            env.*.mem_env_dynamic = p;
            env.*.mem_alloc = alloc;
        }
    }
    env.*.num_mem += 1;
    return env.*.num_mem;
}
pub fn scan_env_set_mem_node(arg_env: [*c]ParseEnv, arg_num: c_int, arg_node: [*c]Node) callconv(.C) c_int {
    var env = arg_env;
    var num = arg_num;
    var node = arg_node;
    if (env.*.num_mem >= num) (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static)[@intCast(c_uint, num)].mem_node = node else return -@as(c_int, 11);
    return 0;
}
pub fn node_free_body(arg_node: [*c]Node) callconv(.C) void {
    var node = arg_node;
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return;
    @"switch": {
        case_16: {
            case_15: {
                case_14: {
                    case_12: {
                        case_10: {
                            case_8: {
                                case_6: {
                                    case_4: {
                                        case_2: {
                                            case_1: {
                                                case: {
                                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                        @bitCast(c_uint, @as(c_int, 0)) => break :case,
                                                        @bitCast(c_uint, @as(c_int, 7)) => break :case_1,
                                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_2,
                                                        @bitCast(c_uint, @as(c_int, 1)) => break :case_4,
                                                        @bitCast(c_uint, @as(c_int, 3)) => break :case_6,
                                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_8,
                                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_10,
                                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_12,
                                                        @bitCast(c_uint, @as(c_int, 2)) => break :case_14,
                                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_15,
                                                        @bitCast(c_uint, @as(c_int, 10)) => break :case_16,
                                                        else => break :@"switch",
                                                    }
                                                }
                                                if ((((&((node).*.u.str)).*.capacity != @as(c_int, 0)) and ((@ptrCast(?*c_void, ((&((node).*.u.str)).*.s))) != @intToPtr(?*c_void, @as(c_int, 0)))) and ((&((node).*.u.str)).*.s != &(&((node).*.u.str)).*.buf)) {
                                                    free(@ptrCast(?*c_void, (&((node).*.u.str)).*.s));
                                                }
                                                break :@"switch";
                                            }
                                        }
                                        onig_node_free(((&((node).*.u.cons)).*.car));
                                        node = ((&((node).*.u.cons)).*.cdr);
                                        while ((@ptrCast(?*c_void, (node))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                            var next: [*c]Node = ((&((node).*.u.cons)).*.cdr);
                                            onig_node_free(((&((node).*.u.cons)).*.car));
                                            free(@ptrCast(?*c_void, node));
                                            node = next;
                                        }
                                        break :switch_3;
                                    }
                                    {
                                        var cc: [*c]CClassNode = (&((node).*.u.cclass));
                                        if (cc.*.mbuf != null) bbuf_free(cc.*.mbuf);
                                    }
                                    break :switch_5;
                                }
                                if ((@ptrCast(?*c_void, ((&((node).*.u.backref)).*.back_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, (&((node).*.u.backref)).*.back_dynamic));
                                break :switch_7;
                            }
                            if (((node).*.u.base.body) != null) onig_node_free(((node).*.u.base.body));
                            {
                                var en: [*c]BagNode = (&((node).*.u.bag));
                                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                                    onig_node_free(en.*.unnamed_0.te.Then);
                                    onig_node_free(en.*.unnamed_0.te.Else);
                                }
                            }
                            break :switch_9;
                        }
                        if (((node).*.u.base.body) != null) onig_node_free(((node).*.u.base.body));
                        break :switch_11;
                    }
                    if (((node).*.u.base.body) != null) onig_node_free(((node).*.u.base.body));
                    if ((@ptrCast(?*c_void, ((&((node).*.u.anchor)).*.lead_node))) != @intToPtr(?*c_void, @as(c_int, 0))) onig_node_free((&((node).*.u.anchor)).*.lead_node);
                    break :switch_13;
                }
            }
        }
        break :switch_17;
    }
}
pub fn cons_node_free_alone(arg_node: [*c]Node) callconv(.C) void {
    var node = arg_node;
    ((&((node).*.u.cons)).*.car) = null;
    ((&((node).*.u.cons)).*.cdr) = null;
    onig_node_free(node);
}
pub fn node_new() callconv(.C) [*c]Node {
    var node: [*c]Node = undefined;
    node = @ptrCast([*c]Node, @alignCast(@alignOf(Node), malloc(@sizeOf(Node))));
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    _ = __builtin___memset_chk(@ptrCast(?*c_void, node), @as(c_int, 0), @sizeOf(Node), __builtin_object_size(@ptrCast(?*const c_void, node), @as(c_int, 0)));
    return node;
}
pub fn initialize_cclass(arg_cc: [*c]CClassNode) callconv(.C) void {
    var cc = arg_cc;
    while (true) {
        var i: c_int = undefined;
        {
            i = 0;
            while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
                (cc.*.bs)[@intCast(c_uint, i)] = @bitCast(Bits, @as(c_int, 0));
            }
        }
        if (!false) break;
    }
    cc.*.flags = @bitCast(c_uint, @as(c_int, 0));
    cc.*.mbuf = null;
}
pub fn node_new_cclass() callconv(.C) [*c]Node {
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_CCLASS));
    initialize_cclass((&((node).*.u.cclass)));
    return node;
}
pub fn node_new_ctype(arg_type_1: c_int, arg_not: c_int, arg_options: OnigOptionType) callconv(.C) [*c]Node {
    var type_1 = arg_type_1;
    var not = arg_not;
    var options = arg_options;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_CTYPE));
    (&((node).*.u.ctype)).*.ctype = type_1;
    (&((node).*.u.ctype)).*.not = not;
    (&((node).*.u.ctype)).*.ascii_mode = @boolToInt((((type_1) >= @as(c_int, 0)) and ((((((type_1) < ONIGENC_CTYPE_ASCII) and (((options) & (((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1))) != 0)) or (((type_1) == ONIGENC_CTYPE_WORD) and (((options) & (((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) | (((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)))) != 0))) or (((type_1) == ONIGENC_CTYPE_DIGIT) and (((options) & ((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) | (((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)))) != 0))) or (((type_1) == ONIGENC_CTYPE_SPACE) and (((options) & (((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) | (((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)))) != 0)))));
    return node;
}
pub fn node_new_anychar(arg_options: OnigOptionType) callconv(.C) [*c]Node {
    var options = arg_options;
    var node: [*c]Node = undefined;
    node = node_new_ctype(-@as(c_int, 1), @as(c_int, 0), options);
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    if (((options) & ((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1))) != 0) _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 22));
        break :blk ref.*;
    });
    return node;
}
pub fn node_new_no_newline(arg_node: [*c][*c]Node, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var n: [*c]Node = undefined;
    n = node_new_anychar(@as(c_uint, 0));
    if ((@ptrCast(?*c_void, (n))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    node.?.* = n;
    return 0;
}
pub fn node_new_true_anychar(arg_node: [*c][*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var n: [*c]Node = undefined;
    n = node_new_anychar(((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)));
    if ((@ptrCast(?*c_void, (n))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    node.?.* = n;
    return 0;
}
pub fn node_new_list(arg_left: [*c]Node, arg_right: [*c]Node) callconv(.C) [*c]Node {
    var left = arg_left;
    var right = arg_right;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_LIST));
    ((&((node).*.u.cons)).*.car) = left;
    ((&((node).*.u.cons)).*.cdr) = right;
    return node;
}
pub fn make_list_or_alt(arg_type_1: NodeType, arg_n: c_int, arg_ns: [*c][*c]Node) callconv(.C) [*c]Node {
    var type_1 = arg_type_1;
    var n = arg_n;
    var ns = arg_ns;
    var r: [*c]Node = undefined;
    if (n <= @as(c_int, 0)) return (@intToPtr([*c]Node, @as(c_int, 0)));
    if (n == @as(c_int, 1)) {
        r = node_new();
        if ((@ptrCast(?*c_void, (r))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
        (r).*.u.base.node_type = (type_1);
        ((&((r).*.u.cons)).*.car) = ns[@intCast(c_uint, @as(c_int, 0))];
        ((&((r).*.u.cons)).*.cdr) = (@intToPtr([*c]Node, @as(c_int, 0)));
    } else {
        var right: [*c]Node = undefined;
        r = node_new();
        if ((@ptrCast(?*c_void, (r))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
        right = make_list_or_alt(type_1, (n - @as(c_int, 1)), (ns + @as(c_int, 1)));
        if ((@ptrCast(?*c_void, (right))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            onig_node_free(r);
            return (@intToPtr([*c]Node, @as(c_int, 0)));
        }
        (r).*.u.base.node_type = (type_1);
        ((&((r).*.u.cons)).*.car) = ns[@intCast(c_uint, @as(c_int, 0))];
        ((&((r).*.u.cons)).*.cdr) = right;
    }
    return r;
}
pub fn make_list(arg_n: c_int, arg_ns: [*c][*c]Node) callconv(.C) [*c]Node {
    var n = arg_n;
    var ns = arg_ns;
    return make_list_or_alt(@intToEnum(NodeType, NODE_LIST), n, ns);
}
pub fn make_alt(arg_n: c_int, arg_ns: [*c][*c]Node) callconv(.C) [*c]Node {
    var n = arg_n;
    var ns = arg_ns;
    return make_list_or_alt(@intToEnum(NodeType, NODE_ALT), n, ns);
}
pub fn node_new_anchor(arg_type_1: c_int) callconv(.C) [*c]Node {
    var type_1 = arg_type_1;
    var node: [*c]Node = undefined;
    node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_ANCHOR));
    (&((node).*.u.anchor)).*.type = type_1;
    (&((node).*.u.anchor)).*.char_min_len = @bitCast(OnigLen, @as(c_int, 0));
    (&((node).*.u.anchor)).*.char_max_len = ~(@bitCast(OnigLen, @as(c_int, 0)));
    (&((node).*.u.anchor)).*.ascii_mode = 0;
    (&((node).*.u.anchor)).*.lead_node = (@intToPtr([*c]Node, @as(c_int, 0)));
    return node;
}
pub fn node_new_anchor_with_options(arg_type_1: c_int, arg_options: OnigOptionType) callconv(.C) [*c]Node {
    var type_1 = arg_type_1;
    var options = arg_options;
    var ascii_mode: c_int = undefined;
    var node: [*c]Node = undefined;
    node = node_new_anchor(type_1);
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    ascii_mode = if ((((options) & (((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) | (((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)))) != 0) and (((((type_1) == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10))) or ((type_1) == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11)))) or ((type_1) == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 12)))) or ((type_1) == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 13))))) @as(c_int, 1) else @as(c_int, 0);
    (&((node).*.u.anchor)).*.ascii_mode = ascii_mode;
    if ((type_1 == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 16))) or (type_1 == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 17)))) {
        if (((options) & (((((((((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1))) != 0) _ = (blk: {
            const ref = &((node).*.u.base.status);
            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 23));
            break :blk ref.*;
        });
    }
    return node;
}
pub fn node_new_backref(arg_back_num: c_int, arg_backrefs: [*c]c_int, arg_by_name: c_int, arg_exist_level: c_int, arg_nest_level: c_int, arg_env: [*c]ParseEnv) callconv(.C) [*c]Node {
    var back_num = arg_back_num;
    var backrefs = arg_backrefs;
    var by_name = arg_by_name;
    var exist_level = arg_exist_level;
    var nest_level = arg_nest_level;
    var env = arg_env;
    var i: c_int = undefined;
    var node: [*c]Node = undefined;
    node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_BACKREF));
    (&((node).*.u.backref)).*.back_num = back_num;
    (&((node).*.u.backref)).*.back_dynamic = @ptrCast([*c]c_int, @alignCast(@alignOf(c_int), (@intToPtr(?*c_void, @as(c_int, 0)))));
    if (by_name != @as(c_int, 0)) _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 15));
        break :blk ref.*;
    });
    if (((env.*.options) & @as(c_uint, 1)) != 0) _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 21));
        break :blk ref.*;
    });
    if (exist_level != @as(c_int, 0)) {
        _ = (blk: {
            const ref = &((node).*.u.base.status);
            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 13));
            break :blk ref.*;
        });
        (&((node).*.u.backref)).*.nest_level = nest_level;
    }
    {
        i = 0;
        while (i < back_num) : (i += 1) {
            if ((backrefs[@intCast(c_uint, i)] <= env.*.num_mem) and ((@ptrCast(?*c_void, ((if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static)[@intCast(c_uint, backrefs[@intCast(c_uint, i)])].mem_node))) == @intToPtr(?*c_void, @as(c_int, 0)))) {
                _ = (blk: {
                    const ref = &((node).*.u.base.status);
                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6));
                    break :blk ref.*;
                });
                break;
            }
        }
    }
    if (back_num <= @as(c_int, 6)) {
        {
            i = 0;
            while (i < back_num) : (i += 1) (&((node).*.u.backref)).*.back_static[@intCast(c_uint, i)] = backrefs[@intCast(c_uint, i)];
        }
    } else {
        var p: [*c]c_int = @ptrCast([*c]c_int, @alignCast(@alignOf(c_int), malloc((@sizeOf(c_int) *% @bitCast(c_ulong, @as(c_long, back_num))))));
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            onig_node_free(node);
            return null;
        }
        (&((node).*.u.backref)).*.back_dynamic = p;
        {
            i = 0;
            while (i < back_num) : (i += 1) p[@intCast(c_uint, i)] = backrefs[@intCast(c_uint, i)];
        }
    }
    env.*.backref_num += 1;
    return node;
}
pub fn node_new_backref_checker(arg_back_num: c_int, arg_backrefs: [*c]c_int, arg_by_name: c_int, arg_exist_level: c_int, arg_nest_level: c_int, arg_env: [*c]ParseEnv) callconv(.C) [*c]Node {
    var back_num = arg_back_num;
    var backrefs = arg_backrefs;
    var by_name = arg_by_name;
    var exist_level = arg_exist_level;
    var nest_level = arg_nest_level;
    var env = arg_env;
    var node: [*c]Node = undefined;
    node = node_new_backref(back_num, backrefs, by_name, exist_level, nest_level, env);
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 17));
        break :blk ref.*;
    });
    return node;
}
pub fn node_new_call(arg_name: [*c]OnigUChar, arg_name_end: [*c]OnigUChar, arg_gnum: c_int, arg_by_number: c_int) callconv(.C) [*c]Node {
    var name = arg_name;
    var name_end = arg_name_end;
    var gnum = arg_gnum;
    var by_number = arg_by_number;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_CALL));
    (&((node).*.u.call)).*.by_number = by_number;
    (&((node).*.u.call)).*.name = name;
    (&((node).*.u.call)).*.name_end = name_end;
    (&((node).*.u.call)).*.called_gnum = gnum;
    (&((node).*.u.call)).*.entry_count = 1;
    return node;
}
pub fn node_new_quantifier(arg_lower: c_int, arg_upper: c_int, arg_by_number: c_int) callconv(.C) [*c]Node {
    var lower = arg_lower;
    var upper = arg_upper;
    var by_number = arg_by_number;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_QUANT));
    (&((node).*.u.quant)).*.lower = lower;
    (&((node).*.u.quant)).*.upper = upper;
    (&((node).*.u.quant)).*.greedy = 1;
    (&((node).*.u.quant)).*.emptiness = @intToEnum(enum_BodyEmptyType, BODY_IS_NOT_EMPTY);
    (&((node).*.u.quant)).*.head_exact = (@intToPtr([*c]Node, @as(c_int, 0)));
    (&((node).*.u.quant)).*.next_head_exact = (@intToPtr([*c]Node, @as(c_int, 0)));
    (&((node).*.u.quant)).*.include_referred = 0;
    (&((node).*.u.quant)).*.empty_status_mem = @bitCast(MemStatusType, @as(c_int, 0));
    if (by_number != @as(c_int, 0)) _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 14));
        break :blk ref.*;
    });
    return node;
}
pub fn node_new_bag(arg_type_1: enum_BagType) callconv(.C) [*c]Node {
    var type_1 = arg_type_1;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_BAG));
    (&((node).*.u.bag)).*.type = type_1;
    @"switch": {
        case_5: {
            case_3: {
                case_1: {
                    case: {
                        switch (@bitCast(c_uint, @enumToInt(type_1))) {
                            @bitCast(c_uint, @as(c_int, 0)) => break :case,
                            @bitCast(c_uint, @as(c_int, 1)) => break :case_1,
                            @bitCast(c_uint, @as(c_int, 2)) => break :case_3,
                            @bitCast(c_uint, @as(c_int, 3)) => break :case_5,
                            else => break :@"switch",
                        }
                    }
                    (&((node).*.u.bag)).*.unnamed_0.m.regnum = 0;
                    (&((node).*.u.bag)).*.unnamed_0.m.called_addr = -@as(c_int, 1);
                    (&((node).*.u.bag)).*.unnamed_0.m.entry_count = 1;
                    (&((node).*.u.bag)).*.unnamed_0.m.called_state = 0;
                    break :@"switch";
                }
                (&((node).*.u.bag)).*.unnamed_0.o.options = @bitCast(OnigOptionType, @as(c_int, 0));
                break :switch_2;
            }
            break :switch_4;
        }
        (&((node).*.u.bag)).*.unnamed_0.te.Then = null;
        (&((node).*.u.bag)).*.unnamed_0.te.Else = null;
        break :switch_6;
    }
    (&((node).*.u.bag)).*.opt_count = 0;
    return node;
}
pub fn node_new_bag_if_else(arg_cond: [*c]Node, arg_Then: [*c]Node, arg_Else: [*c]Node) callconv(.C) [*c]Node {
    var cond = arg_cond;
    var Then = arg_Then;
    var Else = arg_Else;
    var n: [*c]Node = undefined;
    n = node_new_bag(@intToEnum(enum_BagType, BAG_IF_ELSE));
    if ((@ptrCast(?*c_void, (n))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    ((n).*.u.base.body) = cond;
    (&((n).*.u.bag)).*.unnamed_0.te.Then = Then;
    (&((n).*.u.bag)).*.unnamed_0.te.Else = Else;
    return n;
}
pub fn node_new_memory(arg_is_named: c_int) callconv(.C) [*c]Node {
    var is_named = arg_is_named;
    var node: [*c]Node = node_new_bag(@intToEnum(enum_BagType, BAG_MEMORY));
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    if (is_named != @as(c_int, 0)) _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 9));
        break :blk ref.*;
    });
    return node;
}
pub fn node_new_option(arg_option: OnigOptionType) callconv(.C) [*c]Node {
    var option = arg_option;
    var node: [*c]Node = node_new_bag(@intToEnum(enum_BagType, BAG_OPTION));
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (&((node).*.u.bag)).*.unnamed_0.o.options = option;
    return node;
}
pub fn node_new_group(arg_content: [*c]Node) callconv(.C) [*c]Node {
    var content = arg_content;
    var node: [*c]Node = undefined;
    node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_LIST));
    ((&((node).*.u.cons)).*.car) = content;
    ((&((node).*.u.cons)).*.cdr) = (@intToPtr([*c]Node, @as(c_int, 0)));
    return node;
}
pub fn node_drop_group(arg_group: [*c]Node) callconv(.C) [*c]Node {
    var group = arg_group;
    var content: [*c]Node = undefined;
    content = ((&((group).*.u.cons)).*.car);
    ((&((group).*.u.cons)).*.car) = (@intToPtr([*c]Node, @as(c_int, 0)));
    onig_node_free(group);
    return content;
}
pub fn node_set_fail(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_GIMMICK));
    (&((node).*.u.gimmick)).*.type = @intToEnum(enum_GimmickType, GIMMICK_FAIL);
    return 0;
}
pub fn node_new_fail(arg_node: [*c][*c]Node, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    node.?.* = node_new();
    if ((@ptrCast(?*c_void, (node.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    return node_set_fail(node.?.*);
}
pub fn node_new_save_gimmick(arg_node: [*c][*c]Node, arg_save_type: enum_SaveType, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var save_type = arg_save_type;
    var env = arg_env;
    var id: c_int = undefined;
    while (true) {
        id = (blk: {
            const ref = &(env).*.id_num;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        });
        if (!false) break;
    }
    node.?.* = node_new();
    if ((@ptrCast(?*c_void, (node.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    (node.?.*).*.u.base.node_type = @intToEnum(NodeType, (NODE_GIMMICK));
    (&((node.?.*).*.u.gimmick)).*.id = id;
    (&((node.?.*).*.u.gimmick)).*.type = @intToEnum(enum_GimmickType, GIMMICK_SAVE);
    (&((node.?.*).*.u.gimmick)).*.detail_type = @bitCast(c_int, @enumToInt(save_type));
    return 0;
}
pub fn node_new_update_var_gimmick(arg_node: [*c][*c]Node, arg_update_var_type: enum_UpdateVarType, arg_id: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var update_var_type = arg_update_var_type;
    var id = arg_id;
    var env = arg_env;
    node.?.* = node_new();
    if ((@ptrCast(?*c_void, (node.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    (node.?.*).*.u.base.node_type = @intToEnum(NodeType, (NODE_GIMMICK));
    (&((node.?.*).*.u.gimmick)).*.id = id;
    (&((node.?.*).*.u.gimmick)).*.type = @intToEnum(enum_GimmickType, GIMMICK_UPDATE_VAR);
    (&((node.?.*).*.u.gimmick)).*.detail_type = @bitCast(c_int, @enumToInt(update_var_type));
    return 0;
}
pub fn node_new_keep(arg_node: [*c][*c]Node, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var r: c_int = undefined;
    r = node_new_save_gimmick(node, @intToEnum(enum_SaveType, SAVE_KEEP), env);
    if (r != @as(c_int, 0)) return r;
    env.*.keep_num += 1;
    return 0;
}
pub fn reg_callout_list_entry(arg_env: [*c]ParseEnv, arg_rnum: [*c]c_int) callconv(.C) c_int {
    var env = arg_env;
    var rnum = arg_rnum;
    var num: c_int = undefined;
    var list: [*c]CalloutListEntry = undefined;
    var e: [*c]CalloutListEntry = undefined;
    var ext: [*c]RegexExt = undefined;
    ext = onig_get_regex_ext(env.*.reg);
    if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    if ((@ptrCast(?*c_void, (ext.*.callout_list))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        list = @ptrCast([*c]CalloutListEntry, @alignCast(@alignOf(CalloutListEntry), malloc((@sizeOf(CalloutListEntry) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 3)))))));
        if ((@ptrCast(?*c_void, (list))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        ext.*.callout_list = list;
        ext.*.callout_list_alloc = 3;
        ext.*.callout_num = 0;
    }
    num = (ext.*.callout_num + @as(c_int, 1));
    if (num > ext.*.callout_list_alloc) {
        var alloc: c_int = (ext.*.callout_list_alloc * @as(c_int, 2));
        list = @ptrCast([*c]CalloutListEntry, @alignCast(@alignOf(CalloutListEntry), realloc(@ptrCast(?*c_void, ext.*.callout_list), (@sizeOf(CalloutListEntry) *% @bitCast(c_ulong, @as(c_long, alloc))))));
        if ((@ptrCast(?*c_void, (list))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        ext.*.callout_list = list;
        ext.*.callout_list_alloc = alloc;
    }
    e = (ext.*.callout_list + (num - @as(c_int, 1)));
    e.*.flag = 0;
    e.*.of = @intToEnum(OnigCalloutOf, @as(c_int, 0));
    e.*.in = ONIG_CALLOUT_OF_CONTENTS;
    e.*.type = @intToEnum(OnigCalloutType, @as(c_int, 0));
    e.*.tag_start = null;
    e.*.tag_end = null;
    e.*.start_func = null;
    e.*.end_func = null;
    e.*.u.arg.num = 0;
    e.*.u.arg.passed_num = 0;
    ext.*.callout_num = num;
    rnum.?.* = num;
    return 0;
}
pub fn node_new_callout(arg_node: [*c][*c]Node, arg_callout_of: OnigCalloutOf, arg_num: c_int, arg_id: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var callout_of = arg_callout_of;
    var num = arg_num;
    var id = arg_id;
    var env = arg_env;
    node.?.* = node_new();
    if ((@ptrCast(?*c_void, (node.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    (node.?.*).*.u.base.node_type = @intToEnum(NodeType, (NODE_GIMMICK));
    (&((node.?.*).*.u.gimmick)).*.id = id;
    (&((node.?.*).*.u.gimmick)).*.num = num;
    (&((node.?.*).*.u.gimmick)).*.type = @intToEnum(enum_GimmickType, GIMMICK_CALLOUT);
    (&((node.?.*).*.u.gimmick)).*.detail_type = @bitCast(c_int, @enumToInt(callout_of));
    return 0;
} // ../oniguruma/src/regparse.c:2828:23: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_text_segment = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:2815:1
// ../oniguruma/src/regparse.c:2885:15: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_absent_engine = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:2870:1
// ../oniguruma/src/regparse.c:2966:15: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_absent_tail = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:2953:1
// ../oniguruma/src/regparse.c:3014:15: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_range_clear = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:3002:1
pub fn is_simple_one_char_repeat(arg_node: [*c]Node, arg_rquant: [*c][*c]Node, arg_rbody: [*c][*c]Node, arg_is_possessive: [*c]c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var rquant = arg_rquant;
    var rbody = arg_rbody;
    var is_possessive = arg_is_possessive;
    var env = arg_env;
    var quant: [*c]Node = undefined;
    var body: [*c]Node = undefined;
    rquant.?.* = blk: {
        const tmp = null;
        rbody.?.* = tmp;
        break :blk tmp;
    };
    is_possessive.?.* = 0;
    if (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type))) == @bitCast(c_uint, NODE_QUANT)) {
        quant = node;
    } else {
        if (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type))) == @bitCast(c_uint, NODE_BAG)) {
            var en: [*c]BagNode = (&((node).*.u.bag));
            if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_STOP_BACKTRACK)) {
                is_possessive.?.* = 1;
                quant = ((en).*.body);
                if (@bitCast(c_uint, @enumToInt(((quant).*.u.base.node_type))) != @bitCast(c_uint, NODE_QUANT)) return 0;
            } else return 0;
        } else return 0;
    }
    if ((&((quant).*.u.quant)).*.greedy == @as(c_int, 0)) return 0;
    body = ((quant).*.u.base.body);
    switch_2: {
        default: {
            case_1: {
                case: {
                    switch (@bitCast(c_uint, @enumToInt(((body).*.u.base.node_type)))) {
                        @bitCast(c_uint, @as(c_int, 0)) => break :case,
                        @bitCast(c_uint, @as(c_int, 1)) => break :case_1,
                        else => break :default,
                    }
                }
                {
                    var len: c_int = undefined;
                    var sn: [*c]StrNode = (&((body).*.u.str));
                    var s: [*c]OnigUChar = sn.*.s;
                    len = 0;
                    while (s < sn.*.end) {
                        s += (env.*.enc).*.mbc_enc_len.?(s);
                        len += 1;
                    }
                    if (len != @as(c_int, 1)) return 0;
                }
            }
            break :@"switch";
        }
        return 0;
        break :switch_2;
    }
    if (node != quant) {
        ((node).*.u.base.body) = null;
        onig_node_free(node);
    }
    ((quant).*.u.base.body) = (@intToPtr([*c]Node, @as(c_int, 0)));
    rquant.?.* = quant;
    rbody.?.* = body;
    return 1;
} // ../oniguruma/src/regparse.c:3146:15: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_absent_tree_for_simple_one_char_repeat = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:3127:1
// ../oniguruma/src/regparse.c:3195:27: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_absent_tree = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:3174:1
pub fn node_str_cat_char(arg_node: [*c]Node, arg_c: OnigUChar) callconv(.C) c_int {
    var node = arg_node;
    var c = arg_c;
    var s: [1]OnigUChar = undefined;
    s[@intCast(c_uint, @as(c_int, 0))] = c;
    return onig_node_str_cat(node, &s, (&s + @as(c_int, 1)));
}
pub fn node_set_str(arg_node: [*c]Node, arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar) callconv(.C) c_int {
    var node = arg_node;
    var s = arg_s;
    var end = arg_end;
    var r: c_int = undefined;
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_STRING));
    (&((node).*.u.str)).*.flag = @bitCast(c_uint, @as(c_int, 0));
    (&((node).*.u.str)).*.s = &(&((node).*.u.str)).*.buf;
    (&((node).*.u.str)).*.end = &(&((node).*.u.str)).*.buf;
    (&((node).*.u.str)).*.capacity = 0;
    r = onig_node_str_cat(node, s, end);
    return r;
}
pub fn node_new_str(arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar) callconv(.C) [*c]Node {
    var s = arg_s;
    var end = arg_end;
    var r: c_int = undefined;
    var node: [*c]Node = node_new();
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    r = node_set_str(node, s, end);
    if (r != @as(c_int, 0)) {
        onig_node_free(node);
        return null;
    }
    return node;
}
pub fn node_reset_str(arg_node: [*c]Node, arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar) callconv(.C) c_int {
    var node = arg_node;
    var s = arg_s;
    var end = arg_end;
    node_free_body(node);
    return node_set_str(node, s, end);
}
pub fn node_new_str_with_options(arg_s: [*c]const OnigUChar, arg_end: [*c]const OnigUChar, arg_options: OnigOptionType) callconv(.C) [*c]Node {
    var s = arg_s;
    var end = arg_end;
    var options = arg_options;
    var node: [*c]Node = undefined;
    node = node_new_str(s, end);
    if (((options) & @as(c_uint, 1)) != 0) _ = (blk: {
        const ref = &((node).*.u.base.status);
        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 21));
        break :blk ref.*;
    });
    return node;
}
pub fn node_new_str_crude(arg_s: [*c]OnigUChar, arg_end: [*c]OnigUChar, arg_options: OnigOptionType) callconv(.C) [*c]Node {
    var s = arg_s;
    var end = arg_end;
    var options = arg_options;
    var node: [*c]Node = node_new_str_with_options(s, end, options);
    if ((@ptrCast(?*c_void, (node))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
    (node).*.u.str.flag |= @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)));
    return node;
}
pub fn node_new_empty() callconv(.C) [*c]Node {
    return node_new_str(null, null);
}
pub fn node_new_str_crude_char(arg_c: OnigUChar, arg_options: OnigOptionType) callconv(.C) [*c]Node {
    var c = arg_c;
    var options = arg_options;
    var i: c_int = undefined;
    var p: [1]OnigUChar = undefined;
    var node: [*c]Node = undefined;
    p[@intCast(c_uint, @as(c_int, 0))] = c;
    node = node_new_str_crude(&p, (&p + @as(c_int, 1)), options);
    {
        i = 1;
        while (i < @as(c_int, 24)) : (i += 1) (&((node).*.u.str)).*.buf[@intCast(c_uint, i)] = @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x00')));
    }
    return node;
}
pub fn str_node_split_last_char(arg_node: [*c]Node, arg_enc: OnigEncoding) callconv(.C) [*c]Node {
    var node = arg_node;
    var enc = arg_enc;
    var p: [*c]const OnigUChar = undefined;
    var rn: [*c]Node = undefined;
    var sn: [*c]StrNode = undefined;
    sn = (&((node).*.u.str));
    rn = (@intToPtr([*c]Node, @as(c_int, 0)));
    if (sn.*.end > sn.*.s) {
        p = onigenc_get_prev_char_head(enc, sn.*.s, sn.*.end);
        if ((p != null) and (p > @ptrCast([*c]const OnigUChar, @alignCast(@alignOf(OnigUChar), sn.*.s)))) {
            rn = node_new_str(p, sn.*.end);
            if ((@ptrCast(?*c_void, (rn))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
            sn.*.end = @intToPtr([*c]OnigUChar, @ptrToInt(p));
            (&((rn).*.u.str)).*.flag = sn.*.flag;
            ((rn).*.u.base.status) = ((node).*.u.base.status);
        }
    }
    return rn;
}
pub fn str_node_can_be_split(arg_node: [*c]Node, arg_enc: OnigEncoding) callconv(.C) c_int {
    var node = arg_node;
    var enc = arg_enc;
    var sn: [*c]StrNode = (&((node).*.u.str));
    if (sn.*.end > sn.*.s) {
        return (if (@bitCast(c_long, @as(c_long, (enc).*.mbc_enc_len.?(sn.*.s))) < (sn.*.end - sn.*.s)) @as(c_int, 1) else @as(c_int, 0));
    }
    return 0;
}
pub fn scan_number(arg_src: [*c][*c]OnigUChar, arg_end: [*c]const OnigUChar, arg_enc: OnigEncoding) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var enc = arg_enc;
    var num: c_int = undefined;
    var val: c_int = undefined;
    var c: OnigCodePoint = undefined;
    var p: [*c]OnigUChar = src.?.*;
    var pfetch_prev: [*c]OnigUChar = undefined;
    num = 0;
    while (!((if (p < @intToPtr([*c]OnigUChar, @ptrToInt(end))) @as(c_int, 0) else @as(c_int, 1)) != 0)) {
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            pfetch_prev = p;
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if (((c) < @bitCast(c_uint, @as(c_int, 128))) and ((enc).*.is_code_ctype.?(c, @bitCast(OnigCtype, ONIGENC_CTYPE_DIGIT)) != 0)) {
            val = @bitCast(c_int, ((c) -% @bitCast(c_uint, @as(c_int, '0'))));
            if (@divTrunc((@as(c_int, 2147483647) - val), @as(c_int, 10)) < num) return -@as(c_int, 1);
            num = ((num * @as(c_int, 10)) + val);
        } else {
            p = pfetch_prev;
            break;
        }
    }
    src.?.* = p;
    return num;
}
pub fn scan_hexadecimal_number(arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_minlen: c_int, arg_maxlen: c_int, arg_enc: OnigEncoding, arg_rcode: [*c]OnigCodePoint) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var minlen = arg_minlen;
    var maxlen = arg_maxlen;
    var enc = arg_enc;
    var rcode = arg_rcode;
    var code: OnigCodePoint = undefined;
    var c: OnigCodePoint = undefined;
    var val: c_uint = undefined;
    var n: c_int = undefined;
    var p: [*c]OnigUChar = src.?.*;
    var pfetch_prev: [*c]OnigUChar = undefined;
    code = @bitCast(OnigCodePoint, @as(c_int, 0));
    n = 0;
    while (!((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) and (n < maxlen)) {
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            pfetch_prev = p;
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if (((c) < @bitCast(c_uint, @as(c_int, 128))) and ((enc).*.is_code_ctype.?(c, @bitCast(OnigCtype, ONIGENC_CTYPE_XDIGIT)) != 0)) {
            n += 1;
            val = (if (((c) < @bitCast(c_uint, @as(c_int, 128))) and ((enc).*.is_code_ctype.?(c, @bitCast(OnigCtype, ONIGENC_CTYPE_DIGIT)) != 0)) ((c) -% @bitCast(c_uint, @as(c_int, '0'))) else (if ((enc).*.is_code_ctype.?(c, @bitCast(OnigCtype, ONIGENC_CTYPE_UPPER)) != 0) (((c) -% @bitCast(c_uint, @as(c_int, 'A'))) +% @bitCast(c_uint, @as(c_int, 10))) else (((c) -% @bitCast(c_uint, @as(c_int, 'a'))) +% @bitCast(c_uint, @as(c_int, 10)))));
            if ((@bitCast(c_ulong, @as(c_ulong, (((@bitCast(c_uint, @as(c_int, 2147483647)) *% @as(c_uint, 2)) +% @as(c_uint, 1)) -% val))) / @as(c_ulong, 16)) < @bitCast(c_ulong, @as(c_ulong, code))) return -@as(c_int, 200);
            code = ((code << @intCast(@import("std").math.Log2Int(OnigCodePoint), 4)) +% val);
        } else {
            p = pfetch_prev;
            break;
        }
    }
    if (n < minlen) return -@as(c_int, 400);
    rcode.?.* = code;
    src.?.* = p;
    return 0;
}
pub fn scan_octal_number(arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_minlen: c_int, arg_maxlen: c_int, arg_enc: OnigEncoding, arg_rcode: [*c]OnigCodePoint) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var minlen = arg_minlen;
    var maxlen = arg_maxlen;
    var enc = arg_enc;
    var rcode = arg_rcode;
    var code: OnigCodePoint = undefined;
    var c: OnigCodePoint = undefined;
    var val: c_uint = undefined;
    var n: c_int = undefined;
    var p: [*c]OnigUChar = src.?.*;
    var pfetch_prev: [*c]OnigUChar = undefined;
    code = @bitCast(OnigCodePoint, @as(c_int, 0));
    n = 0;
    while (!((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) and (n < maxlen)) {
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            pfetch_prev = p;
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if ((((c) < @bitCast(c_uint, @as(c_int, 128))) and ((enc).*.is_code_ctype.?(c, @bitCast(OnigCtype, ONIGENC_CTYPE_DIGIT)) != 0)) and (c < @bitCast(c_uint, @as(c_int, '8')))) {
            n += 1;
            val = ((c) -% @bitCast(c_uint, @as(c_int, '0')));
            if ((@bitCast(c_ulong, @as(c_ulong, (((@bitCast(c_uint, @as(c_int, 2147483647)) *% @as(c_uint, 2)) +% @as(c_uint, 1)) -% val))) / @as(c_ulong, 8)) < @bitCast(c_ulong, @as(c_ulong, code))) return -@as(c_int, 200);
            code = ((code << @intCast(@import("std").math.Log2Int(OnigCodePoint), 3)) +% val);
        } else {
            p = pfetch_prev;
            break;
        }
    }
    if (n < minlen) return -@as(c_int, 400);
    rcode.?.* = code;
    src.?.* = p;
    return 0;
}
pub fn scan_number_of_base(arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_minlen: c_int, arg_enc: OnigEncoding, arg_rcode: [*c]OnigCodePoint, arg_base: c_int) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var minlen = arg_minlen;
    var enc = arg_enc;
    var rcode = arg_rcode;
    var base = arg_base;
    var r: c_int = undefined;
    if (base == @as(c_int, 16)) r = scan_hexadecimal_number(src, end, minlen, @as(c_int, 8), enc, rcode) else if (base == @as(c_int, 8)) r = scan_octal_number(src, end, minlen, @as(c_int, 11), enc, rcode) else r = -@as(c_int, 400);
    return r;
}
pub const CPS_EMPTY = @enumToInt(enum_CPS_STATE.CPS_EMPTY);
pub const CPS_START = @enumToInt(enum_CPS_STATE.CPS_START);
pub const CPS_RANGE = @enumToInt(enum_CPS_STATE.CPS_RANGE);
pub const enum_CPS_STATE = extern enum(c_int) {
    CPS_EMPTY = 0,
    CPS_START = 1,
    CPS_RANGE = 2,
    _,
};
pub const check_code_point_sequence_cc = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:3590:1
// ../oniguruma/src/regparse.c:3669:5: warning: TODO implement translation of stmt class LabelStmtClass
pub const check_code_point_sequence = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:3655:1
pub fn get_next_code_point(arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_base: c_int, arg_enc: OnigEncoding, arg_in_cc: c_int, arg_rcode: [*c]OnigCodePoint) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var base = arg_base;
    var enc = arg_enc;
    var in_cc = arg_in_cc;
    var rcode = arg_rcode;
    var r: c_int = undefined;
    var c: OnigCodePoint = undefined;
    var p: [*c]OnigUChar = src.?.*;
    var pfetch_prev: [*c]OnigUChar = undefined;
    while (!((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0)) {
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            pfetch_prev = p;
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if (!(((c) == @bitCast(c_uint, @as(c_int, ' '))) or ((c) == @bitCast(c_uint, @as(c_int, '\n'))))) {
            if (c == @bitCast(c_uint, @as(c_int, '}'))) {
                src.?.* = p;
                return 1;
            } else if ((c == @bitCast(c_uint, @as(c_int, '-'))) and (in_cc == @as(c_int, 1))) {
                src.?.* = p;
                return 2;
            }
            p = pfetch_prev;
            break;
        } else {
            if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 400);
        }
    }
    r = scan_number_of_base(&p, end, @as(c_int, 1), enc, rcode, base);
    if (r != @as(c_int, 0)) return r;
    src.?.* = p;
    return 0;
}
pub fn new_code_range(arg_pbuf: [*c][*c]BBuf) callconv(.C) c_int {
    var pbuf = arg_pbuf;
    var r: c_int = undefined;
    var n: OnigCodePoint = undefined;
    var bbuf: [*c]BBuf = undefined;
    bbuf = blk: {
        const tmp = @ptrCast([*c]BBuf, @alignCast(@alignOf(BBuf), malloc(@sizeOf(BBuf))));
        pbuf.?.* = tmp;
        break :blk tmp;
    };
    if ((@ptrCast(?*c_void, (bbuf))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    r = bbuf_init((bbuf), @bitCast(c_int, @truncate(c_uint, (@sizeOf(OnigCodePoint) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 5)))))));
    if (r != @as(c_int, 0)) {
        free(@ptrCast(?*c_void, bbuf));
        pbuf.?.* = null;
        return r;
    }
    n = @bitCast(OnigCodePoint, @as(c_int, 0));
    while (true) {
        var used: c_int = @bitCast(c_int, @truncate(c_uint, (@bitCast(c_ulong, @as(c_long, (@as(c_int, 0)))) +% (@sizeOf(OnigCodePoint)))));
        if ((bbuf).*.alloc < @bitCast(c_uint, used)) while (true) {
            while (true) {
                (bbuf).*.alloc *%= @bitCast(c_uint, @as(c_int, 2));
                if (!((bbuf).*.alloc < @bitCast(c_uint, used))) break;
            }
            (bbuf).*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, (bbuf).*.p), @bitCast(c_ulong, @as(c_ulong, (bbuf).*.alloc)))));
            if ((@ptrCast(?*c_void, ((bbuf).*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
            if (!false) break;
        };
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, ((bbuf).*.p + (@as(c_int, 0)))), @ptrCast(?*const c_void, (&(n))), (@sizeOf(OnigCodePoint)), __builtin_object_size(@ptrCast(?*const c_void, ((bbuf).*.p + (@as(c_int, 0)))), @as(c_int, 0)));
        if ((bbuf).*.used < @bitCast(c_uint, used)) (bbuf).*.used = @bitCast(c_uint, used);
        if (!false) break;
    }
    return 0;
}
pub fn add_code_range_to_buf(arg_pbuf: [*c][*c]BBuf, arg_from: OnigCodePoint, arg_to: OnigCodePoint) callconv(.C) c_int {
    var pbuf = arg_pbuf;
    var from = arg_from;
    var to = arg_to;
    var r: c_int = undefined;
    var inc_n: c_int = undefined;
    var pos: c_int = undefined;
    var low: c_int = undefined;
    var high: c_int = undefined;
    var bound: c_int = undefined;
    var x: c_int = undefined;
    var n: OnigCodePoint = undefined;
    var data: [*c]OnigCodePoint = undefined;
    var bbuf: [*c]BBuf = undefined;
    if (from > to) {
        n = from;
        from = to;
        to = n;
    }
    if ((@ptrCast(?*c_void, (pbuf.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        r = new_code_range(pbuf);
        if (r != @as(c_int, 0)) return r;
        bbuf = pbuf.?.*;
        n = @bitCast(OnigCodePoint, @as(c_int, 0));
    } else {
        bbuf = pbuf.?.*;
        n = (@ptrCast([*c]OnigCodePoint, @alignCast(@alignOf(OnigCodePoint), (bbuf.*.p)))).?.*;
    }
    data = @ptrCast([*c]OnigCodePoint, @alignCast(@alignOf(OnigCodePoint), (bbuf.*.p)));
    data += 1;
    {
        _ = (blk: {
            low = 0;
            break :blk blk_1: {
                const tmp = @bitCast(c_int, n);
                bound = tmp;
                break :blk_1 tmp;
            };
        });
        while (low < bound) {
            x = (low + bound) >> @intCast(@import("std").math.Log2Int(c_int), 1);
            if (from > data[@intCast(c_uint, ((x * @as(c_int, 2)) + @as(c_int, 1)))]) low = (x + @as(c_int, 1)) else bound = x;
        }
    }
    high = @bitCast(c_int, if (to == ~(@bitCast(OnigCodePoint, @as(c_int, 0)))) n else @bitCast(c_uint, low));
    {
        bound = @bitCast(c_int, n);
        while (high < bound) {
            x = (high + bound) >> @intCast(@import("std").math.Log2Int(c_int), 1);
            if ((to +% @bitCast(c_uint, @as(c_int, 1))) >= data[@intCast(c_uint, (x * @as(c_int, 2)))]) high = (x + @as(c_int, 1)) else bound = x;
        }
    }
    inc_n = ((low + @as(c_int, 1)) - high);
    if ((n +% @bitCast(c_uint, inc_n)) > @bitCast(c_uint, @as(c_int, 10000))) return -@as(c_int, 205);
    if (inc_n != @as(c_int, 1)) {
        if (from > data[@intCast(c_uint, (low * @as(c_int, 2)))]) from = data[@intCast(c_uint, (low * @as(c_int, 2)))];
        if (to < data[@intCast(c_uint, (((high - @as(c_int, 1)) * @as(c_int, 2)) + @as(c_int, 1)))]) to = data[@intCast(c_uint, (((high - @as(c_int, 1)) * @as(c_int, 2)) + @as(c_int, 1)))];
    }
    if ((inc_n != @as(c_int, 0)) and (@bitCast(OnigCodePoint, high) < n)) {
        var from_pos: c_int = @bitCast(c_int, @truncate(c_uint, (@sizeOf(OnigCodePoint) *% @bitCast(c_ulong, @as(c_long, (@as(c_int, 1) + (high * @as(c_int, 2))))))));
        var to_pos: c_int = @bitCast(c_int, @truncate(c_uint, (@sizeOf(OnigCodePoint) *% @bitCast(c_ulong, @as(c_long, (@as(c_int, 1) + ((low + @as(c_int, 1)) * @as(c_int, 2))))))));
        var size: c_int = @bitCast(c_int, @truncate(c_uint, (@bitCast(c_ulong, @as(c_ulong, ((n -% @bitCast(c_uint, high)) *% @bitCast(c_uint, @as(c_int, 2))))) *% @sizeOf(OnigCodePoint))));
        if (inc_n > @as(c_int, 0)) {
            while (true) {
                if (@bitCast(c_uint, ((to_pos) + (size))) > (bbuf).*.alloc) while (true) {
                    while (true) {
                        (bbuf).*.alloc *%= @bitCast(c_uint, @as(c_int, 2));
                        if (!((bbuf).*.alloc < (@bitCast(c_uint, (to_pos)) +% @bitCast(c_uint, (size))))) break;
                    }
                    (bbuf).*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, (bbuf).*.p), @bitCast(c_ulong, @as(c_ulong, (bbuf).*.alloc)))));
                    if ((@ptrCast(?*c_void, ((bbuf).*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
                    if (!false) break;
                };
                _ = __builtin___memmove_chk(@ptrCast(?*c_void, ((bbuf).*.p + (to_pos))), @ptrCast(?*const c_void, ((bbuf).*.p + (from_pos))), @bitCast(c_ulong, @as(c_long, (size))), __builtin_object_size(@ptrCast(?*const c_void, ((bbuf).*.p + (to_pos))), @as(c_int, 0)));
                if (@bitCast(c_uint, ((to_pos) + (size))) > (bbuf).*.used) (bbuf).*.used = @bitCast(c_uint, ((to_pos) + (size)));
                if (!false) break;
            }
        } else {
            while (true) {
                _ = __builtin___memmove_chk(@ptrCast(?*c_void, ((bbuf).*.p + (to_pos))), @ptrCast(?*const c_void, ((bbuf).*.p + (from_pos))), @bitCast(c_ulong, @as(c_ulong, ((bbuf).*.used -% @bitCast(c_uint, (from_pos))))), __builtin_object_size(@ptrCast(?*const c_void, ((bbuf).*.p + (to_pos))), @as(c_int, 0)));
                (bbuf).*.used -%= @bitCast(c_uint, (from_pos - to_pos));
                if (!false) break;
            }
        }
    }
    pos = @bitCast(c_int, @truncate(c_uint, (@sizeOf(OnigCodePoint) *% @bitCast(c_ulong, @as(c_long, (@as(c_int, 1) + (low * @as(c_int, 2))))))));
    while (true) {
        var new_alloc: c_uint = (bbuf).*.alloc;
        while (new_alloc < @bitCast(c_uint, @truncate(c_uint, (@bitCast(c_ulong, @as(c_long, pos)) +% (@sizeOf(OnigCodePoint) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 2)))))))) {
            new_alloc *%= @bitCast(c_uint, @as(c_int, 2));
        }
        if ((bbuf).*.alloc != new_alloc) {
            (bbuf).*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, (bbuf).*.p), @bitCast(c_ulong, @as(c_ulong, new_alloc)))));
            if ((@ptrCast(?*c_void, ((bbuf).*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
            (bbuf).*.alloc = new_alloc;
        }
        if (!false) break;
    }
    while (true) {
        var used: c_int = @bitCast(c_int, @truncate(c_uint, (@bitCast(c_ulong, @as(c_long, (pos))) +% (@sizeOf(OnigCodePoint)))));
        if ((bbuf).*.alloc < @bitCast(c_uint, used)) while (true) {
            while (true) {
                (bbuf).*.alloc *%= @bitCast(c_uint, @as(c_int, 2));
                if (!((bbuf).*.alloc < @bitCast(c_uint, used))) break;
            }
            (bbuf).*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, (bbuf).*.p), @bitCast(c_ulong, @as(c_ulong, (bbuf).*.alloc)))));
            if ((@ptrCast(?*c_void, ((bbuf).*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
            if (!false) break;
        };
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, ((bbuf).*.p + (pos))), @ptrCast(?*const c_void, (&(from))), (@sizeOf(OnigCodePoint)), __builtin_object_size(@ptrCast(?*const c_void, ((bbuf).*.p + (pos))), @as(c_int, 0)));
        if ((bbuf).*.used < @bitCast(c_uint, used)) (bbuf).*.used = @bitCast(c_uint, used);
        if (!false) break;
    }
    while (true) {
        var used: c_int = @bitCast(c_int, @truncate(c_uint, ((@bitCast(c_ulong, @as(c_long, pos)) +% @sizeOf(OnigCodePoint)) +% (@sizeOf(OnigCodePoint)))));
        if ((bbuf).*.alloc < @bitCast(c_uint, used)) while (true) {
            while (true) {
                (bbuf).*.alloc *%= @bitCast(c_uint, @as(c_int, 2));
                if (!((bbuf).*.alloc < @bitCast(c_uint, used))) break;
            }
            (bbuf).*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, (bbuf).*.p), @bitCast(c_ulong, @as(c_ulong, (bbuf).*.alloc)))));
            if ((@ptrCast(?*c_void, ((bbuf).*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
            if (!false) break;
        };
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, ((bbuf).*.p + (@bitCast(c_ulong, @as(c_long, pos)) +% @sizeOf(OnigCodePoint)))), @ptrCast(?*const c_void, (&(to))), (@sizeOf(OnigCodePoint)), __builtin_object_size(@ptrCast(?*const c_void, ((bbuf).*.p + (@bitCast(c_ulong, @as(c_long, pos)) +% @sizeOf(OnigCodePoint)))), @as(c_int, 0)));
        if ((bbuf).*.used < @bitCast(c_uint, used)) (bbuf).*.used = @bitCast(c_uint, used);
        if (!false) break;
    }
    n +%= @bitCast(c_uint, inc_n);
    while (true) {
        var used: c_int = @bitCast(c_int, @truncate(c_uint, (@bitCast(c_ulong, @as(c_long, (@as(c_int, 0)))) +% (@sizeOf(OnigCodePoint)))));
        if ((bbuf).*.alloc < @bitCast(c_uint, used)) while (true) {
            while (true) {
                (bbuf).*.alloc *%= @bitCast(c_uint, @as(c_int, 2));
                if (!((bbuf).*.alloc < @bitCast(c_uint, used))) break;
            }
            (bbuf).*.p = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), realloc(@ptrCast(?*c_void, (bbuf).*.p), @bitCast(c_ulong, @as(c_ulong, (bbuf).*.alloc)))));
            if ((@ptrCast(?*c_void, ((bbuf).*.p))) == @intToPtr(?*c_void, @as(c_int, 0))) return (-@as(c_int, 5));
            if (!false) break;
        };
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, ((bbuf).*.p + (@as(c_int, 0)))), @ptrCast(?*const c_void, (&(n))), (@sizeOf(OnigCodePoint)), __builtin_object_size(@ptrCast(?*const c_void, ((bbuf).*.p + (@as(c_int, 0)))), @as(c_int, 0)));
        if ((bbuf).*.used < @bitCast(c_uint, used)) (bbuf).*.used = @bitCast(c_uint, used);
        if (!false) break;
    }
    return 0;
}
pub fn add_code_range(arg_pbuf: [*c][*c]BBuf, arg_env: [*c]ParseEnv, arg_from: OnigCodePoint, arg_to: OnigCodePoint) callconv(.C) c_int {
    var pbuf = arg_pbuf;
    var env = arg_env;
    var from = arg_from;
    var to = arg_to;
    if (from > to) {
        if (((env.*.syntax).*.behavior & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 22))) != @bitCast(c_uint, @as(c_int, 0))) return 0 else return -@as(c_int, 203);
    }
    return add_code_range_to_buf(pbuf, from, to);
} // ../oniguruma/src/regparse.c:3868:3: warning: TODO implement translation of stmt class LabelStmtClass
pub const not_code_range_buf = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:3861:1
pub fn or_code_range_buf(arg_enc: OnigEncoding, arg_bbuf1: [*c]BBuf, arg_not1: c_int, arg_bbuf2: [*c]BBuf, arg_not2: c_int, arg_pbuf: [*c][*c]BBuf) callconv(.C) c_int {
    var enc = arg_enc;
    var bbuf1 = arg_bbuf1;
    var not1 = arg_not1;
    var bbuf2 = arg_bbuf2;
    var not2 = arg_not2;
    var pbuf = arg_pbuf;
    var r: c_int = undefined;
    var i: OnigCodePoint = undefined;
    var n1: OnigCodePoint = undefined;
    var data1: [*c]OnigCodePoint = undefined;
    var from: OnigCodePoint = undefined;
    var to: OnigCodePoint = undefined;
    pbuf.?.* = @ptrCast([*c]BBuf, @alignCast(@alignOf(BBuf), (@intToPtr(?*c_void, @as(c_int, 0)))));
    if (((@ptrCast(?*c_void, (bbuf1))) == @intToPtr(?*c_void, @as(c_int, 0))) and ((@ptrCast(?*c_void, (bbuf2))) == @intToPtr(?*c_void, @as(c_int, 0)))) {
        if ((not1 != @as(c_int, 0)) or (not2 != @as(c_int, 0))) return add_code_range_to_buf(pbuf, @bitCast(OnigCodePoint, (if (((enc).*.min_enc_len) > @as(c_int, 1)) @as(c_int, 0) else @as(c_int, 128))), ~(@bitCast(OnigCodePoint, @as(c_int, 0))));
        return 0;
    }
    r = 0;
    if ((@ptrCast(?*c_void, (bbuf2))) == @intToPtr(?*c_void, @as(c_int, 0))) while (true) {
        var tbuf: [*c]BBuf = undefined;
        var tnot: c_int = undefined;
        tnot = not1;
        not1 = not2;
        not2 = tnot;
        tbuf = bbuf1;
        bbuf1 = bbuf2;
        bbuf2 = tbuf;
        if (!false) break;
    };
    if ((@ptrCast(?*c_void, (bbuf1))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        if (not1 != @as(c_int, 0)) {
            return add_code_range_to_buf(pbuf, @bitCast(OnigCodePoint, (if (((enc).*.min_enc_len) > @as(c_int, 1)) @as(c_int, 0) else @as(c_int, 128))), ~(@bitCast(OnigCodePoint, @as(c_int, 0))));
        } else {
            if (not2 == @as(c_int, 0)) {
                return bbuf_clone(pbuf, bbuf2);
            } else {
                return not_code_range_buf(enc, bbuf2, pbuf);
            }
        }
    }
    if (not1 != @as(c_int, 0)) while (true) {
        var tbuf: [*c]BBuf = undefined;
        var tnot: c_int = undefined;
        tnot = not1;
        not1 = not2;
        not2 = tnot;
        tbuf = bbuf1;
        bbuf1 = bbuf2;
        bbuf2 = tbuf;
        if (!false) break;
    };
    data1 = @ptrCast([*c]OnigCodePoint, @alignCast(@alignOf(OnigCodePoint), (bbuf1.*.p)));
    n1 = (data1).?.*;
    data1 += 1;
    if ((not2 == @as(c_int, 0)) and (not1 == @as(c_int, 0))) {
        r = bbuf_clone(pbuf, bbuf2);
    } else if (not1 == @as(c_int, 0)) {
        r = not_code_range_buf(enc, bbuf2, pbuf);
    }
    if (r != @as(c_int, 0)) return r;
    {
        i = @bitCast(OnigCodePoint, @as(c_int, 0));
        while (i < n1) : (i +%= 1) {
            from = data1[(i *% @bitCast(c_uint, @as(c_int, 2)))];
            to = data1[((i *% @bitCast(c_uint, @as(c_int, 2))) +% @bitCast(c_uint, @as(c_int, 1)))];
            r = add_code_range_to_buf(pbuf, from, to);
            if (r != @as(c_int, 0)) return r;
        }
    }
    return 0;
}
pub fn and_code_range1(arg_pbuf: [*c][*c]BBuf, arg_from1: OnigCodePoint, arg_to1: OnigCodePoint, arg_data: [*c]OnigCodePoint, arg_n: c_int) callconv(.C) c_int {
    var pbuf = arg_pbuf;
    var from1 = arg_from1;
    var to1 = arg_to1;
    var data = arg_data;
    var n = arg_n;
    var i: c_int = undefined;
    var r: c_int = undefined;
    var from2: OnigCodePoint = undefined;
    var to2: OnigCodePoint = undefined;
    {
        i = 0;
        while (i < n) : (i += 1) {
            from2 = data[@intCast(c_uint, (i * @as(c_int, 2)))];
            to2 = data[@intCast(c_uint, ((i * @as(c_int, 2)) + @as(c_int, 1)))];
            if (from2 < from1) {
                if (to2 < from1) continue else {
                    from1 = (to2 +% @bitCast(c_uint, @as(c_int, 1)));
                }
            } else if (from2 <= to1) {
                if (to2 < to1) {
                    if (from1 <= (from2 -% @bitCast(c_uint, @as(c_int, 1)))) {
                        r = add_code_range_to_buf(pbuf, from1, (from2 -% @bitCast(c_uint, @as(c_int, 1))));
                        if (r != @as(c_int, 0)) return r;
                    }
                    from1 = (to2 +% @bitCast(c_uint, @as(c_int, 1)));
                } else {
                    to1 = (from2 -% @bitCast(c_uint, @as(c_int, 1)));
                }
            } else {
                from1 = from2;
            }
            if (from1 > to1) break;
        }
    }
    if (from1 <= to1) {
        r = add_code_range_to_buf(pbuf, from1, to1);
        if (r != @as(c_int, 0)) return r;
    }
    return 0;
}
pub fn and_code_range_buf(arg_bbuf1: [*c]BBuf, arg_not1: c_int, arg_bbuf2: [*c]BBuf, arg_not2: c_int, arg_pbuf: [*c][*c]BBuf) callconv(.C) c_int {
    var bbuf1 = arg_bbuf1;
    var not1 = arg_not1;
    var bbuf2 = arg_bbuf2;
    var not2 = arg_not2;
    var pbuf = arg_pbuf;
    var r: c_int = undefined;
    var i: OnigCodePoint = undefined;
    var j: OnigCodePoint = undefined;
    var n1: OnigCodePoint = undefined;
    var n2: OnigCodePoint = undefined;
    var data1: [*c]OnigCodePoint = undefined;
    var data2: [*c]OnigCodePoint = undefined;
    var from: OnigCodePoint = undefined;
    var to: OnigCodePoint = undefined;
    var from1: OnigCodePoint = undefined;
    var to1: OnigCodePoint = undefined;
    var from2: OnigCodePoint = undefined;
    var to2: OnigCodePoint = undefined;
    pbuf.?.* = @ptrCast([*c]BBuf, @alignCast(@alignOf(BBuf), (@intToPtr(?*c_void, @as(c_int, 0)))));
    if ((@ptrCast(?*c_void, (bbuf1))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        if ((not1 != @as(c_int, 0)) and ((@ptrCast(?*c_void, (bbuf2))) != @intToPtr(?*c_void, @as(c_int, 0)))) return bbuf_clone(pbuf, bbuf2);
        return 0;
    } else if ((@ptrCast(?*c_void, (bbuf2))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        if (not2 != @as(c_int, 0)) return bbuf_clone(pbuf, bbuf1);
        return 0;
    }
    if (not1 != @as(c_int, 0)) while (true) {
        var tbuf: [*c]BBuf = undefined;
        var tnot: c_int = undefined;
        tnot = not1;
        not1 = not2;
        not2 = tnot;
        tbuf = bbuf1;
        bbuf1 = bbuf2;
        bbuf2 = tbuf;
        if (!false) break;
    };
    data1 = @ptrCast([*c]OnigCodePoint, @alignCast(@alignOf(OnigCodePoint), (bbuf1.*.p)));
    data2 = @ptrCast([*c]OnigCodePoint, @alignCast(@alignOf(OnigCodePoint), (bbuf2.*.p)));
    n1 = (data1).?.*;
    n2 = (data2).?.*;
    data1 += 1;
    data2 += 1;
    if ((not2 == @as(c_int, 0)) and (not1 == @as(c_int, 0))) {
        {
            i = @bitCast(OnigCodePoint, @as(c_int, 0));
            while (i < n1) : (i +%= 1) {
                from1 = data1[(i *% @bitCast(c_uint, @as(c_int, 2)))];
                to1 = data1[((i *% @bitCast(c_uint, @as(c_int, 2))) +% @bitCast(c_uint, @as(c_int, 1)))];
                {
                    j = @bitCast(OnigCodePoint, @as(c_int, 0));
                    while (j < n2) : (j +%= 1) {
                        from2 = data2[(j *% @bitCast(c_uint, @as(c_int, 2)))];
                        to2 = data2[((j *% @bitCast(c_uint, @as(c_int, 2))) +% @bitCast(c_uint, @as(c_int, 1)))];
                        if (from2 > to1) break;
                        if (to2 < from1) continue;
                        from = (if ((from1) < (from2)) (from2) else (from1));
                        to = (if ((to1) > (to2)) (to2) else (to1));
                        r = add_code_range_to_buf(pbuf, from, to);
                        if (r != @as(c_int, 0)) return r;
                    }
                }
            }
        }
    } else if (not1 == @as(c_int, 0)) {
        {
            i = @bitCast(OnigCodePoint, @as(c_int, 0));
            while (i < n1) : (i +%= 1) {
                from1 = data1[(i *% @bitCast(c_uint, @as(c_int, 2)))];
                to1 = data1[((i *% @bitCast(c_uint, @as(c_int, 2))) +% @bitCast(c_uint, @as(c_int, 1)))];
                r = and_code_range1(pbuf, from1, to1, data2, @bitCast(c_int, n2));
                if (r != @as(c_int, 0)) return r;
            }
        }
    }
    return 0;
}
pub fn and_cclass(arg_dest: [*c]CClassNode, arg_cc: [*c]CClassNode, arg_enc: OnigEncoding) callconv(.C) c_int {
    var dest = arg_dest;
    var cc = arg_cc;
    var enc = arg_enc;
    var r: c_int = undefined;
    var not1: c_int = undefined;
    var not2: c_int = undefined;
    var buf1: [*c]BBuf = undefined;
    var buf2: [*c]BBuf = undefined;
    var pbuf: [*c]BBuf = undefined;
    var bsr1: BitSetRef = undefined;
    var bsr2: BitSetRef = undefined;
    var bs1: BitSet = undefined;
    var bs2: BitSet = undefined;
    not1 = @boolToInt(((((dest).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))));
    bsr1 = &dest.*.bs;
    buf1 = dest.*.mbuf;
    not2 = @boolToInt(((((cc).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))));
    bsr2 = &cc.*.bs;
    buf2 = cc.*.mbuf;
    if (not1 != @as(c_int, 0)) {
        bitset_invert_to(bsr1, &bs1);
        bsr1 = &bs1;
    }
    if (not2 != @as(c_int, 0)) {
        bitset_invert_to(bsr2, &bs2);
        bsr2 = &bs2;
    }
    bitset_and(bsr1, bsr2);
    if (bsr1 != &dest.*.bs) {
        bitset_copy(&dest.*.bs, bsr1);
    }
    if (not1 != @as(c_int, 0)) {
        bitset_invert(&dest.*.bs);
    }
    if (!(((enc).*.max_enc_len) == @as(c_int, 1))) {
        if ((not1 != @as(c_int, 0)) and (not2 != @as(c_int, 0))) {
            r = or_code_range_buf(enc, buf1, @as(c_int, 0), buf2, @as(c_int, 0), &pbuf);
        } else {
            r = and_code_range_buf(buf1, not1, buf2, not2, &pbuf);
            if ((r == @as(c_int, 0)) and (not1 != @as(c_int, 0))) {
                var tbuf: [*c]BBuf = undefined;
                r = not_code_range_buf(enc, pbuf, &tbuf);
                if (r != @as(c_int, 0)) {
                    bbuf_free(pbuf);
                    return r;
                }
                bbuf_free(pbuf);
                pbuf = tbuf;
            }
        }
        if (r != @as(c_int, 0)) return r;
        dest.*.mbuf = pbuf;
        bbuf_free(buf1);
        return r;
    }
    return 0;
}
pub fn or_cclass(arg_dest: [*c]CClassNode, arg_cc: [*c]CClassNode, arg_enc: OnigEncoding) callconv(.C) c_int {
    var dest = arg_dest;
    var cc = arg_cc;
    var enc = arg_enc;
    var r: c_int = undefined;
    var not1: c_int = undefined;
    var not2: c_int = undefined;
    var buf1: [*c]BBuf = undefined;
    var buf2: [*c]BBuf = undefined;
    var pbuf: [*c]BBuf = undefined;
    var bsr1: BitSetRef = undefined;
    var bsr2: BitSetRef = undefined;
    var bs1: BitSet = undefined;
    var bs2: BitSet = undefined;
    not1 = @boolToInt(((((dest).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))));
    bsr1 = &dest.*.bs;
    buf1 = dest.*.mbuf;
    not2 = @boolToInt(((((cc).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))));
    bsr2 = &cc.*.bs;
    buf2 = cc.*.mbuf;
    if (not1 != @as(c_int, 0)) {
        bitset_invert_to(bsr1, &bs1);
        bsr1 = &bs1;
    }
    if (not2 != @as(c_int, 0)) {
        bitset_invert_to(bsr2, &bs2);
        bsr2 = &bs2;
    }
    bitset_or(bsr1, bsr2);
    if (bsr1 != &dest.*.bs) {
        bitset_copy(&dest.*.bs, bsr1);
    }
    if (not1 != @as(c_int, 0)) {
        bitset_invert(&dest.*.bs);
    }
    if (!(((enc).*.max_enc_len) == @as(c_int, 1))) {
        if ((not1 != @as(c_int, 0)) and (not2 != @as(c_int, 0))) {
            r = and_code_range_buf(buf1, @as(c_int, 0), buf2, @as(c_int, 0), &pbuf);
        } else {
            r = or_code_range_buf(enc, buf1, not1, buf2, not2, &pbuf);
            if ((r == @as(c_int, 0)) and (not1 != @as(c_int, 0))) {
                var tbuf: [*c]BBuf = undefined;
                r = not_code_range_buf(enc, pbuf, &tbuf);
                if (r != @as(c_int, 0)) {
                    bbuf_free(pbuf);
                    return r;
                }
                bbuf_free(pbuf);
                pbuf = tbuf;
            }
        }
        if (r != @as(c_int, 0)) return r;
        dest.*.mbuf = pbuf;
        bbuf_free(buf1);
        return r;
    } else return 0;
    return 0;
}
pub fn conv_backslash_value(arg_c: OnigCodePoint, arg_env: [*c]ParseEnv) callconv(.C) OnigCodePoint {
    var c = arg_c;
    var env = arg_env;
    if (((env.*.syntax).*.op & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 26))) != @bitCast(c_uint, @as(c_int, 0))) {
        switch_8: {
            default: {
                case_7: {
                    case_6: {
                        case_5: {
                            case_4: {
                                case_3: {
                                    case_2: {
                                        case_1: {
                                            case: {
                                                switch (c) {
                                                    @bitCast(OnigCodePoint, @as(c_int, 110)) => break :case,
                                                    @bitCast(OnigCodePoint, @as(c_int, 116)) => break :case_1,
                                                    @bitCast(OnigCodePoint, @as(c_int, 114)) => break :case_2,
                                                    @bitCast(OnigCodePoint, @as(c_int, 102)) => break :case_3,
                                                    @bitCast(OnigCodePoint, @as(c_int, 97)) => break :case_4,
                                                    @bitCast(OnigCodePoint, @as(c_int, 98)) => break :case_5,
                                                    @bitCast(OnigCodePoint, @as(c_int, 101)) => break :case_6,
                                                    @bitCast(OnigCodePoint, @as(c_int, 118)) => break :case_7,
                                                    else => break :default,
                                                }
                                            }
                                            return @bitCast(OnigCodePoint, @as(c_int, '\n'));
                                        }
                                        return @bitCast(OnigCodePoint, @as(c_int, '\t'));
                                    }
                                    return @bitCast(OnigCodePoint, @as(c_int, '\r'));
                                }
                                return @bitCast(OnigCodePoint, @as(c_int, '\x0c'));
                            }
                            return @bitCast(OnigCodePoint, @as(c_int, '\x07'));
                        }
                        return @bitCast(OnigCodePoint, @as(c_int, '\x08'));
                    }
                    return @bitCast(OnigCodePoint, @as(c_int, '\x1b'));
                }
                if (((env.*.syntax).*.op2 & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 13))) != @bitCast(c_uint, @as(c_int, 0))) return @bitCast(OnigCodePoint, @as(c_int, '\x0b'));
                break :@"switch";
            }
            break :switch_8;
        }
    }
    return c;
}
pub fn is_invalid_quantifier_target(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    switch_8: {
        default: {
            case_6: {
                case_4: {
                    case_2: {
                        case_1: {
                            case: {
                                switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                    @bitCast(c_uint, @as(c_int, 6)) => break :case,
                                    @bitCast(c_uint, @as(c_int, 10)) => break :case_1,
                                    @bitCast(c_uint, @as(c_int, 5)) => break :case_2,
                                    @bitCast(c_uint, @as(c_int, 7)) => break :case_4,
                                    @bitCast(c_uint, @as(c_int, 8)) => break :case_6,
                                    else => break :default,
                                }
                            }
                        }
                        return 1;
                        break :@"switch";
                    }
                    break :switch_3;
                }
                while (true) {
                    if (!(is_invalid_quantifier_target(((&((node).*.u.cons)).*.car)) != 0)) return 0;
                    if (!((@ptrCast(?*c_void, (blk: {
                        const tmp = ((&((node).*.u.cons)).*.cdr);
                        node = tmp;
                        break :blk tmp;
                    }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                }
                return 0;
                break :switch_5;
            }
            while (true) {
                if (is_invalid_quantifier_target(((&((node).*.u.cons)).*.car)) != 0) return 1;
                if (!((@ptrCast(?*c_void, (blk: {
                    const tmp = ((&((node).*.u.cons)).*.cdr);
                    node = tmp;
                    break :blk tmp;
                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
            }
            break :switch_7;
        }
        break :switch_8;
    }
    return 0;
}
pub fn quantifier_type_num(arg_q: [*c]QuantNode) callconv(.C) c_int {
    var q = arg_q;
    if (q.*.greedy != 0) {
        if (q.*.lower == @as(c_int, 0)) {
            if (q.*.upper == @as(c_int, 1)) return 0 else if ((q.*.upper) == -@as(c_int, 1)) return 1;
        } else if (q.*.lower == @as(c_int, 1)) {
            if ((q.*.upper) == -@as(c_int, 1)) return 2;
        }
    } else {
        if (q.*.lower == @as(c_int, 0)) {
            if (q.*.upper == @as(c_int, 1)) return 3 else if ((q.*.upper) == -@as(c_int, 1)) return 4;
        } else if (q.*.lower == @as(c_int, 1)) {
            if ((q.*.upper) == -@as(c_int, 1)) return 5;
        }
    }
    return -@as(c_int, 1);
}
pub const RQ_ASIS = @enumToInt(enum_ReduceType.RQ_ASIS);
pub const RQ_DEL = @enumToInt(enum_ReduceType.RQ_DEL);
pub const RQ_A = @enumToInt(enum_ReduceType.RQ_A);
pub const RQ_P = @enumToInt(enum_ReduceType.RQ_P);
pub const RQ_AQ = @enumToInt(enum_ReduceType.RQ_AQ);
pub const RQ_QQ = @enumToInt(enum_ReduceType.RQ_QQ);
pub const RQ_P_QQ = @enumToInt(enum_ReduceType.RQ_P_QQ);
pub const enum_ReduceType = extern enum(c_int) {
    RQ_ASIS = 0,
    RQ_DEL = 1,
    RQ_A = 2,
    RQ_P = 3,
    RQ_AQ = 4,
    RQ_QQ = 5,
    RQ_P_QQ = 6,
    _,
};
pub var ReduceTypeTable: [6][6]enum_ReduceType = [6][6]enum_ReduceType{
    [6]enum_ReduceType{
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_A),
        @intToEnum(enum_ReduceType, RQ_A),
        @intToEnum(enum_ReduceType, RQ_QQ),
        @intToEnum(enum_ReduceType, RQ_AQ),
        @intToEnum(enum_ReduceType, RQ_ASIS),
    },
    [6]enum_ReduceType{
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_P_QQ),
        @intToEnum(enum_ReduceType, RQ_P_QQ),
        @intToEnum(enum_ReduceType, RQ_DEL),
    },
    [6]enum_ReduceType{
        @intToEnum(enum_ReduceType, RQ_A),
        @intToEnum(enum_ReduceType, RQ_A),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_ASIS),
        @intToEnum(enum_ReduceType, RQ_P_QQ),
        @intToEnum(enum_ReduceType, RQ_DEL),
    },
    [6]enum_ReduceType{
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_AQ),
        @intToEnum(enum_ReduceType, RQ_AQ),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_AQ),
        @intToEnum(enum_ReduceType, RQ_AQ),
    },
    [6]enum_ReduceType{
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
        @intToEnum(enum_ReduceType, RQ_DEL),
    },
    [6]enum_ReduceType{
        @intToEnum(enum_ReduceType, RQ_ASIS),
        @intToEnum(enum_ReduceType, RQ_A),
        @intToEnum(enum_ReduceType, RQ_P),
        @intToEnum(enum_ReduceType, RQ_AQ),
        @intToEnum(enum_ReduceType, RQ_AQ),
        @intToEnum(enum_ReduceType, RQ_DEL),
    },
}; // ../oniguruma/src/regparse.c:4364:21: warning: TODO implement translation of stmt class GotoStmtClass
pub const node_new_general_newline = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:4345:1
pub const TK_EOT = @enumToInt(enum_TokenSyms.TK_EOT);
pub const TK_CRUDE_BYTE = @enumToInt(enum_TokenSyms.TK_CRUDE_BYTE);
pub const TK_CHAR = @enumToInt(enum_TokenSyms.TK_CHAR);
pub const TK_STRING = @enumToInt(enum_TokenSyms.TK_STRING);
pub const TK_CODE_POINT = @enumToInt(enum_TokenSyms.TK_CODE_POINT);
pub const TK_ANYCHAR = @enumToInt(enum_TokenSyms.TK_ANYCHAR);
pub const TK_CHAR_TYPE = @enumToInt(enum_TokenSyms.TK_CHAR_TYPE);
pub const TK_BACKREF = @enumToInt(enum_TokenSyms.TK_BACKREF);
pub const TK_CALL = @enumToInt(enum_TokenSyms.TK_CALL);
pub const TK_ANCHOR = @enumToInt(enum_TokenSyms.TK_ANCHOR);
pub const TK_REPEAT = @enumToInt(enum_TokenSyms.TK_REPEAT);
pub const TK_INTERVAL = @enumToInt(enum_TokenSyms.TK_INTERVAL);
pub const TK_ANYCHAR_ANYTIME = @enumToInt(enum_TokenSyms.TK_ANYCHAR_ANYTIME);
pub const TK_ALT = @enumToInt(enum_TokenSyms.TK_ALT);
pub const TK_SUBEXP_OPEN = @enumToInt(enum_TokenSyms.TK_SUBEXP_OPEN);
pub const TK_SUBEXP_CLOSE = @enumToInt(enum_TokenSyms.TK_SUBEXP_CLOSE);
pub const TK_OPEN_CC = @enumToInt(enum_TokenSyms.TK_OPEN_CC);
pub const TK_QUOTE_OPEN = @enumToInt(enum_TokenSyms.TK_QUOTE_OPEN);
pub const TK_CHAR_PROPERTY = @enumToInt(enum_TokenSyms.TK_CHAR_PROPERTY);
pub const TK_KEEP = @enumToInt(enum_TokenSyms.TK_KEEP);
pub const TK_GENERAL_NEWLINE = @enumToInt(enum_TokenSyms.TK_GENERAL_NEWLINE);
pub const TK_NO_NEWLINE = @enumToInt(enum_TokenSyms.TK_NO_NEWLINE);
pub const TK_TRUE_ANYCHAR = @enumToInt(enum_TokenSyms.TK_TRUE_ANYCHAR);
pub const TK_TEXT_SEGMENT = @enumToInt(enum_TokenSyms.TK_TEXT_SEGMENT);
pub const TK_CC_CLOSE = @enumToInt(enum_TokenSyms.TK_CC_CLOSE);
pub const TK_CC_RANGE = @enumToInt(enum_TokenSyms.TK_CC_RANGE);
pub const TK_CC_POSIX_BRACKET_OPEN = @enumToInt(enum_TokenSyms.TK_CC_POSIX_BRACKET_OPEN);
pub const TK_CC_AND = @enumToInt(enum_TokenSyms.TK_CC_AND);
pub const TK_CC_OPEN_CC = @enumToInt(enum_TokenSyms.TK_CC_OPEN_CC);
pub const enum_TokenSyms = extern enum(c_int) {
    TK_EOT = 0,
    TK_CRUDE_BYTE = 1,
    TK_CHAR = 2,
    TK_STRING = 3,
    TK_CODE_POINT = 4,
    TK_ANYCHAR = 5,
    TK_CHAR_TYPE = 6,
    TK_BACKREF = 7,
    TK_CALL = 8,
    TK_ANCHOR = 9,
    TK_REPEAT = 10,
    TK_INTERVAL = 11,
    TK_ANYCHAR_ANYTIME = 12,
    TK_ALT = 13,
    TK_SUBEXP_OPEN = 14,
    TK_SUBEXP_CLOSE = 15,
    TK_OPEN_CC = 16,
    TK_QUOTE_OPEN = 17,
    TK_CHAR_PROPERTY = 18,
    TK_KEEP = 19,
    TK_GENERAL_NEWLINE = 20,
    TK_NO_NEWLINE = 21,
    TK_TRUE_ANYCHAR = 22,
    TK_TEXT_SEGMENT = 23,
    TK_CC_CLOSE = 24,
    TK_CC_RANGE = 25,
    TK_CC_POSIX_BRACKET_OPEN = 26,
    TK_CC_AND = 27,
    TK_CC_OPEN_CC = 28,
    _,
};
const struct_unnamed_109 = extern struct {
    lower: c_int,
    upper: c_int,
    greedy: c_int,
    possessive: c_int,
};
const struct_unnamed_110 = extern struct {
    num: c_int,
    ref1: c_int,
    refs: [*c]c_int,
    by_name: c_int,
    exist_level: c_int,
    level: c_int,
};
const struct_unnamed_111 = extern struct {
    name: [*c]OnigUChar,
    name_end: [*c]OnigUChar,
    gnum: c_int,
    by_number: c_int,
};
const struct_unnamed_112 = extern struct {
    ctype: c_int,
    not: c_int,
};
const union_unnamed_108 = extern union {
    s: [*c]OnigUChar,
    byte: OnigUChar,
    code: OnigCodePoint,
    anchor: c_int,
    subtype: c_int,
    repeat: struct_unnamed_109,
    backref: struct_unnamed_110,
    call: struct_unnamed_111,
    prop: struct_unnamed_112,
};
const struct_unnamed_107 = extern struct {
    type: enum_TokenSyms,
    code_point_continue: c_int,
    escaped: c_int,
    base_num: c_int,
    backp: [*c]OnigUChar,
    u: union_unnamed_108,
};
pub const PToken = struct_unnamed_107;
pub fn ptoken_init(arg_tok: [*c]PToken) callconv(.C) void {
    var tok = arg_tok;
    tok.*.code_point_continue = 0;
} // ../oniguruma/src/regparse.c:4514:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const fetch_interval = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:4477:1
// ../oniguruma/src/regparse.c:4606:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const fetch_escaped_value_raw = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:4580:1
pub fn fetch_escaped_value(arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_env: [*c]ParseEnv, arg_val: [*c]OnigCodePoint) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var env = arg_env;
    var val = arg_val;
    var r: c_int = undefined;
    var len: c_int = undefined;
    r = fetch_escaped_value_raw(src, end, env, val);
    if (r != @as(c_int, 0)) return r;
    len = (env.*.enc).*.code_to_mbclen.?(val.?.*);
    if (len < @as(c_int, 0)) return len;
    return 0;
} // ../oniguruma/src/regparse.c:5370:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const fetch_token = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:5344:1
pub fn get_name_end_code_point(arg_start: OnigCodePoint) callconv(.C) OnigCodePoint {
    var start = arg_start;
    switch_5: {
        default: {
            case_3: {
                case_1: {
                    case: {
                        switch (start) {
                            @bitCast(OnigCodePoint, @as(c_int, 60)) => break :case,
                            @bitCast(OnigCodePoint, @as(c_int, 39)) => break :case_1,
                            @bitCast(OnigCodePoint, @as(c_int, 40)) => break :case_3,
                            else => break :default,
                        }
                    }
                    return @bitCast(OnigCodePoint, @as(c_int, '>'));
                    break :@"switch";
                }
                return @bitCast(OnigCodePoint, @as(c_int, '\''));
                break :switch_2;
            }
            return @bitCast(OnigCodePoint, @as(c_int, ')'));
            break :switch_4;
        }
        break :switch_5;
    }
    return @bitCast(OnigCodePoint, @as(c_int, 0));
}
pub const IS_NOT_NUM = @enumToInt(enum_REF_NUM.IS_NOT_NUM);
pub const IS_ABS_NUM = @enumToInt(enum_REF_NUM.IS_ABS_NUM);
pub const IS_REL_NUM = @enumToInt(enum_REF_NUM.IS_REL_NUM);
pub const enum_REF_NUM = extern enum(c_int) {
    IS_NOT_NUM = 0,
    IS_ABS_NUM = 1,
    IS_REL_NUM = 2,
    _,
};
pub const fetch_name_with_level = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:4696:1
// ../oniguruma/src/regparse.c:4926:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const fetch_name = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:4830:1
pub fn CC_ESC_WARN(arg_env: [*c]ParseEnv, arg_c: [*c]OnigUChar) callconv(.C) void {
    var env = arg_env;
    var c = arg_c;
    if (onig_warn == onig_null_warn) return;
    if ((((env.*.syntax).*.behavior & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 24))) != @bitCast(c_uint, @as(c_int, 0))) and (((env.*.syntax).*.behavior & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 21))) != @bitCast(c_uint, @as(c_int, 0)))) {
        var buf: [256]OnigUChar = undefined;
        onig_snprintf_with_pattern(&buf, @as(c_int, 256), env.*.enc, env.*.pattern, env.*.pattern_end, @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), "character class has \'%s\' without escape")), c);
        (onig_warn).?(@ptrCast([*c]u8, @alignCast(@alignOf(u8), &buf)));
    }
}
pub fn CLOSE_BRACKET_WITHOUT_ESC_WARN(arg_env: [*c]ParseEnv, arg_c: [*c]OnigUChar) callconv(.C) void {
    var env = arg_env;
    var c = arg_c;
    if (onig_warn == onig_null_warn) return;
    if ((((env).*.syntax).*.behavior & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 24))) != @bitCast(c_uint, @as(c_int, 0))) {
        var buf: [256]OnigUChar = undefined;
        onig_snprintf_with_pattern(&buf, @as(c_int, 256), (env).*.enc, (env).*.pattern, (env).*.pattern_end, @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), "regular expression has \'%s\' without escape")), c);
        (onig_warn).?(@ptrCast([*c]u8, @alignCast(@alignOf(u8), &buf)));
    }
}
pub fn find_str_position(arg_s: [*c]OnigCodePoint, arg_n: c_int, arg_from: [*c]OnigUChar, arg_to: [*c]OnigUChar, arg_next: [*c][*c]OnigUChar, arg_enc: OnigEncoding) callconv(.C) [*c]OnigUChar {
    var s = arg_s;
    var n = arg_n;
    var from = arg_from;
    var to = arg_to;
    var next = arg_next;
    var enc = arg_enc;
    var i: c_int = undefined;
    var x: OnigCodePoint = undefined;
    var q: [*c]OnigUChar = undefined;
    var p: [*c]OnigUChar = from;
    while (p < to) {
        x = (enc).*.mbc_to_code.?((p), (to));
        q = (p + (enc).*.mbc_enc_len.?(p));
        if (x == s[@intCast(c_uint, @as(c_int, 0))]) {
            {
                i = 1;
                while ((i < n) and (q < to)) : (i += 1) {
                    x = (enc).*.mbc_to_code.?((q), (to));
                    if (x != s[@intCast(c_uint, i)]) break;
                    q += (enc).*.mbc_enc_len.?(q);
                }
            }
            if (i >= n) {
                if ((@ptrCast(?*c_void, (next))) != @intToPtr(?*c_void, @as(c_int, 0))) next.?.* = q;
                return p;
            }
        }
        p = q;
    }
    return (@intToPtr([*c]OnigUChar, @as(c_int, 0)));
}
pub fn str_exist_check_with_esc(arg_s: [*c]OnigCodePoint, arg_n: c_int, arg_from: [*c]OnigUChar, arg_to: [*c]OnigUChar, arg_bad: OnigCodePoint, arg_enc: OnigEncoding, arg_syn: [*c]OnigSyntaxType) callconv(.C) c_int {
    var s = arg_s;
    var n = arg_n;
    var from = arg_from;
    var to = arg_to;
    var bad = arg_bad;
    var enc = arg_enc;
    var syn = arg_syn;
    var i: c_int = undefined;
    var in_esc: c_int = undefined;
    var x: OnigCodePoint = undefined;
    var q: [*c]OnigUChar = undefined;
    var p: [*c]OnigUChar = from;
    in_esc = 0;
    while (p < to) {
        if (in_esc != 0) {
            in_esc = 0;
            p += (enc).*.mbc_enc_len.?(p);
        } else {
            x = (enc).*.mbc_to_code.?((p), (to));
            q = (p + (enc).*.mbc_enc_len.?(p));
            if (x == s[@intCast(c_uint, @as(c_int, 0))]) {
                {
                    i = 1;
                    while ((i < n) and (q < to)) : (i += 1) {
                        x = (enc).*.mbc_to_code.?((q), (to));
                        if (x != s[@intCast(c_uint, i)]) break;
                        q += (enc).*.mbc_enc_len.?(q);
                    }
                }
                if (i >= n) return 1;
                p += (enc).*.mbc_enc_len.?(p);
            } else {
                x = (enc).*.mbc_to_code.?((p), (to));
                if (x == bad) return 0 else if (x == (syn).*.meta_char_table.esc) in_esc = 1;
                p = q;
            }
        }
    }
    return 0;
} // ../oniguruma/src/regparse.c:5079:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const fetch_token_cc = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:5060:1
// ../oniguruma/src/regparse.c:6227:11: warning: TODO implement translation of stmt class GotoStmtClass
pub const add_ctype_to_cc_by_range = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:6206:1
// ../oniguruma/src/regparse.c:6295:24: warning: TODO implement translation of stmt class GotoStmtClass
pub const add_ctype_to_cc_by_range_limit = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:6279:1
// ../oniguruma/src/regparse.c:6409:3: warning: TODO complex switch cases
pub const add_ctype_to_cc = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:6372:1
// ../oniguruma/src/regparse.c:6512:5: warning: TODO implement translation of stmt class GotoStmtClass
= undefined; varc:OnigCodePoint = undefined;varenc: OnigEncoding= undefined; var :[*=undefined ;varstart:[*c prev]OnigUChar= undefined; var p: [* c =src.? .*;enc= ]OnigUChar=undefined ;penv.* enc; r=
    -@as ( ,117*{blk :const
        tmp=p;,
        c_int,
    =tmp;
    break: blk tmp;
    }; ; (p<end )))@as while(!( (if(c_int,
0) else@as (c_int , ))*{prev =p;while(true) 1if(! false) break ;{ c= enc ?(p( ),end( ().*. mbc_to_code.)) p+= enc( ).* . .?*}if (c=='}'@as(c_int mbc_enc_len,)@bitCast (c_uint , )) )) { .property_name_to_ctype.? (enc,start r=enc( ).*,prev ;if (r
    >=@as ( ,0*{src .?
        .*=p;,
        c_int,
    else{onig_scan_env_set_error_string
    (env , r,
    src. ? ;returnr; }elseif( .*,prev) ;}((,
c== '('@as (c_int , @bitCast(*)or (c==')'@as(c_int ),)@bitCast (c_uint , )( )( ) (c_int,) @bitCast(c_uint, or(c== '{'@as)( () or(
    c== '|' (c_int*c_uint, )()))){ @asbreak;}
    ;; } ;return
    r; } [*
        c,
        [*c] pubfnprs_char_property( np:Node,
    ,,
:[ *c ]PToken , :[**c ]OnigUChar,end:[* srcc]OnigUChar ,env : [* c] ParseEnv c_int{varnp =arg_np;arg_np )callconv(. C):var =arg_tok ;arg_tok :var src arg_src;*=arg_end ;arg_end:varenv=arg_env =;arg_env: varr : c_int= undefined; var varcc:[ *c]CClassNode ctype:c_int= undefined;=undefined ctype= fetch_char_property_to_ctype(
    src, end env)*<@as (c_int,0))) ,)returnctype
    ;; np .?
    .*= node_new_cclass .?.*( )@ptrCast(? ();if (np*c_void,
)( )== @as( c_int 0)*c_void, ))))return-@as ,(c_int, 5) ; ;cc =& np .u.cclass ()() .?.*( ).*;r add_ctype_to_cc( cc, ctype, @as c_int,*); if(r!=@as(c_int (,0) )) ) returnr ;; if prop.not!= @as(c_int, (tok.*. u.0) )) {blk
    :const ref &cc*flags( );ref.*;|@as =(c_int,
    1) << @intCast(
    c_int@import ( (),0 )()@bitCast "std").math .Log2Int(c_uint,
); =break :blk } );*0; }pubfncc_cprop_next(cc: ([*c ]CClassNode , pcode: [* c *c]CVAL ,state:[ ]OnigCodePoint,val :[*c CSTATE, env: [* c arg_cc:*;arg_pcode :varval=arg_val;arg_val arg_ccC)c_int*varcc ]ParseEnv)callconv (.=;:varstate =arg_state ; arg_state:varenv= arg_env;arg_env :var r (state.? .*@enumToInt() :c_int=undefined ;if@bitCast( , ==CS_RANGE
pub const prs_posix_bracket = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:6475:1
pub fn fetch_char_property_to_ctype(arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var src = arg_src;
    var end = arg_end;
    var env = arg_env;
    var r: c_int = undefined;
    var c: OnigCodePoint = undefined;
    var enc: OnigEncoding = undefined;
    var prev: [*c]OnigUChar = undefined;
    var start: [*c]OnigUChar = undefined;
    var p: [*c]OnigUChar = undefined;
    p = src.?.*;
    enc = env.*.enc;
    r = -@as(c_int, 117);
    start = blk: {
        const tmp = p;
        prev = tmp;
        break :blk tmp;
    };
    while (!((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0)) {
        prev = p;
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if (c == @bitCast(c_uint, @as(c_int, '}'))) {
            r = (enc).*.property_name_to_ctype.?(enc, start, prev);
            if (r >= @as(c_int, 0)) {
                src.?.* = p;
            } else {
                onig_scan_env_set_error_string(env, r, src.?.*, prev);
            }
            return r;
        } else if ((((c == @bitCast(c_uint, @as(c_int, '('))) or (c == @bitCast(c_uint, @as(c_int, ')')))) or (c == @bitCast(c_uint, @as(c_int, '{')))) or (c == @bitCast(c_uint, @as(c_int, '|')))) {
            break;
        }
    }
    return r;
}
pub fn prs_char_property(arg_np: [*c][*c]Node, arg_tok: [*c]PToken, arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var np = arg_np;
    var tok = arg_tok;
    var src = arg_src;
    var end = arg_end;
    var env = arg_env;
    var r: c_int = undefined;
    var ctype: c_int = undefined;
    var cc: [*c]CClassNode = undefined;
    ctype = fetch_char_property_to_ctype(src, end, env);
    if (ctype < @as(c_int, 0)) return ctype;
    np.?.* = node_new_cclass();
    if ((@ptrCast(?*c_void, (np.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    cc = (&((np.?.*).*.u.cclass));
    r = add_ctype_to_cc(cc, ctype, @as(c_int, 0), env);
    if (r != @as(c_int, 0)) return r;
    if (tok.*.u.prop.not != @as(c_int, 0)) _ = (blk: {
        const ref = &((cc).*.flags);
        ref.* = ref.* | @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)));
        break :blk ref.*;
    });
    return 0;
}
pub fn cc_cprop_next(arg_cc: [*c]CClassNode, arg_pcode: [*c]OnigCodePoint, arg_val: [*c]CVAL, arg_state: [*c]CSTATE, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var cc = arg_cc;
    var pcode = arg_pcode;
    var val = arg_val;
    var state = arg_state;
    var env = arg_env;
    var r: c_int = undefined;
    if (@bitCast(c_uint, @enumToInt(state.?.*)) == @bitCast(c_uint, CS_RANGE)) return -@as(c_int, 110);
    if (@bitCast(c_uint, @enumToInt(state.?.*)) == @bitCast(c_uint, CS_VALUE)) {
        if (@bitCast(c_uint, @enumToInt(val.?.*)) == @bitCast(c_uint, CV_SB)) (cc.*.bs)[@bitCast(c_uint, (@bitCast(c_int, (pcode.?.*)))) >> @intCast(@import("std").math.Log2Int(c_uint), 5)] |= (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), (@bitCast(c_uint, (@bitCast(c_int, (pcode.?.*)))) & @bitCast(c_uint, @as(c_int, 31))))) else if (@bitCast(c_uint, @enumToInt(val.?.*)) == @bitCast(c_uint, CV_MB)) {
            r = add_code_range(&(cc.*.mbuf), env, pcode.?.*, pcode.?.*);
            if (r < @as(c_int, 0)) return r;
        }
    }
    state.?.* = @intToEnum(CSTATE, CS_VALUE);
    val.?.* = @intToEnum(CVAL, CV_CPROP);
    return 0;
} // ../oniguruma/src/regparse.c:6656:13: warning: TODO implement translation of stmt class GotoStmtClass
pub const cc_char_next = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:6628:1
pub fn code_exist_check(arg_c: OnigCodePoint, arg_from: [*c]OnigUChar, arg_end: [*c]OnigUChar, arg_ignore_escaped: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var c = arg_c;
    var from = arg_from;
    var end = arg_end;
    var ignore_escaped = arg_ignore_escaped;
    var env = arg_env;
    var in_esc: c_int = undefined;
    var code: OnigCodePoint = undefined;
    var enc: OnigEncoding = env.*.enc;
    var p: [*c]OnigUChar = from;
    in_esc = 0;
    while (!((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0)) {
        if ((ignore_escaped != 0) and (in_esc != 0)) {
            in_esc = 0;
        } else {
            while (true) {
                code = (enc).*.mbc_to_code.?((p), (end));
                p += (enc).*.mbc_enc_len.?(p);
                if (!false) break;
            }
            if (code == c) return 1;
            if (code == (env.*.syntax).*.meta_char_table.esc) in_esc = 1;
        }
    }
    return 0;
} // ../oniguruma/src/regparse.c:6770:5: warning: TODO implement translation of stmt class LabelStmtClass
pub const prs_cc = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:6721:1
// ../oniguruma/src/regparse.c:9000:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const prs_alts = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:8953:1
pub fn prs_callout_of_contents(arg_np: [*c][*c]Node, arg_cterm: c_int, arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var np = arg_np;
    var cterm = arg_cterm;
    var src = arg_src;
    var end = arg_end;
    var env = arg_env;
    var r: c_int = undefined;
    var i: c_int = undefined;
    var in: c_int = undefined;
    var num: c_int = undefined;
    var c: OnigCodePoint = undefined;
    var code_start: [*c]OnigUChar = undefined;
    var code_end: [*c]OnigUChar = undefined;
    var contents: [*c]OnigUChar = undefined;
    var tag_start: [*c]OnigUChar = undefined;
    var tag_end: [*c]OnigUChar = undefined;
    var brace_nest: c_int = undefined;
    var e: [*c]CalloutListEntry = undefined;
    var ext: [*c]RegexExt = undefined;
    var enc: OnigEncoding = env.*.enc;
    var p: [*c]OnigUChar = src.?.*;
    if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 227);
    brace_nest = 0;
    while ((if (p < end) (enc).*.mbc_to_code.?((p), (end)) else @bitCast(c_uint, @as(c_int, 0))) == @bitCast(OnigCodePoint, @as(c_int, '{'))) {
        brace_nest += 1;
        while (true) {
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 227);
    }
    in = ONIG_CALLOUT_IN_PROGRESS;
    code_start = p;
    while (true) {
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 227);
        code_end = p;
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
        if (c == @bitCast(c_uint, @as(c_int, '}'))) {
            i = brace_nest;
            while (i > @as(c_int, 0)) {
                if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 227);
                while (true) {
                    c = (enc).*.mbc_to_code.?((p), (end));
                    p += (enc).*.mbc_enc_len.?(p);
                    if (!false) break;
                }
                if (c == @bitCast(c_uint, @as(c_int, '}'))) i -= 1 else break;
            }
            if (i == @as(c_int, 0)) break;
        }
    }
    if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
    while (true) {
        c = (enc).*.mbc_to_code.?((p), (end));
        p += (enc).*.mbc_enc_len.?(p);
        if (!false) break;
    }
    if (c == @bitCast(c_uint, @as(c_int, '['))) {
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
        tag_end = blk: {
            const tmp = p;
            tag_start = tmp;
            break :blk tmp;
        };
        while (!((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0)) {
            if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
            tag_end = p;
            while (true) {
                c = (enc).*.mbc_to_code.?((p), (end));
                p += (enc).*.mbc_enc_len.?(p);
                if (!false) break;
            }
            if (c == @bitCast(c_uint, @as(c_int, ']'))) break;
        }
        if (!(is_allowed_callout_tag_name(enc, tag_start, tag_end) != 0)) return -@as(c_int, 231);
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
    } else {
        tag_start = blk: {
            const tmp = null;
            tag_end = tmp;
            break :blk tmp;
        };
    }
    if (c == @bitCast(c_uint, @as(c_int, 'X'))) {
        in |= ONIG_CALLOUT_IN_RETRACTION;
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
    } else if (c == @bitCast(c_uint, @as(c_int, '<'))) {
        in = ONIG_CALLOUT_IN_RETRACTION;
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
    } else if (c == @bitCast(c_uint, @as(c_int, '>'))) {
        if ((if (p < end) @as(c_int, 0) else @as(c_int, 1)) != 0) return -@as(c_int, 118);
        while (true) {
            c = (enc).*.mbc_to_code.?((p), (end));
            p += (enc).*.mbc_enc_len.?(p);
            if (!false) break;
        }
    }
    if (c != @bitCast(c_uint, cterm)) return -@as(c_int, 227);
    r = reg_callout_list_entry(env, &num);
    if (r != @as(c_int, 0)) return r;
    ext = onig_get_regex_ext(env.*.reg);
    if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    if ((@intToPtr(?*c_void, @ptrToInt((ext.*.pattern)))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        r = onig_ext_set_pattern(env.*.reg, env.*.pattern, env.*.pattern_end);
        if (r != @as(c_int, 0)) return r;
    }
    if (tag_start != tag_end) {
        r = callout_tag_entry(env, env.*.reg, tag_start, tag_end, @bitCast(CalloutTagVal, @as(c_long, num)));
        if (r != @as(c_int, 0)) return r;
    }
    contents = onigenc_strdup(enc, code_start, code_end);
    if ((@ptrCast(?*c_void, (contents))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    e = onig_reg_callout_list_at(env.*.reg, num);
    if ((@ptrCast(?*c_void, (e))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        free(@ptrCast(?*c_void, contents));
        return -@as(c_int, 5);
    }
    r = node_new_callout(np, @intToEnum(OnigCalloutOf, ONIG_CALLOUT_OF_CONTENTS), num, -@as(c_int, 1), env);
    if (r != @as(c_int, 0)) {
        free(@ptrCast(?*c_void, contents));
        return r;
    }
    e.*.of = @intToEnum(OnigCalloutOf, ONIG_CALLOUT_OF_CONTENTS);
    e.*.in = in;
    e.*.name_id = -@as(c_int, 1);
    e.*.u.content.start = contents;
    e.*.u.content.end = (contents + (code_end - code_start));
    src.?.* = p;
    return 0;
}
pub fn prs_long(arg_enc: OnigEncoding, arg_s: [*c]OnigUChar, arg_end: [*c]OnigUChar, arg_sign_on: c_int, arg_max: c_long, arg_rl: [*c]c_long) callconv(.C) c_long {
    var enc = arg_enc;
    var s = arg_s;
    var end = arg_end;
    var sign_on = arg_sign_on;
    var max = arg_max;
    var rl = arg_rl;
    var v: c_long = undefined;
    var d: c_long = undefined;
    var flag: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var c: OnigCodePoint = undefined;
    if (s >= end) return @bitCast(c_long, @as(c_long, -@as(c_int, 232)));
    flag = 1;
    v = @bitCast(c_long, @as(c_long, @as(c_int, 0)));
    p = s;
    while (p < end) {
        c = (enc).*.mbc_to_code.?((p), (end));
        p += (enc).*.mbc_enc_len.?(p);
        if ((c >= @bitCast(c_uint, @as(c_int, '0'))) and (c <= @bitCast(c_uint, @as(c_int, '9')))) {
            d = @bitCast(c_long, @as(c_ulong, (c -% @bitCast(c_uint, @as(c_int, '0')))));
            if (v > @divTrunc((max - d), @bitCast(c_long, @as(c_long, @as(c_int, 10))))) return @bitCast(c_long, @as(c_long, -@as(c_int, 232)));
            v = ((v * @bitCast(c_long, @as(c_long, @as(c_int, 10)))) + d);
        } else if ((sign_on != @as(c_int, 0)) and ((c == @bitCast(c_uint, @as(c_int, '-'))) or (c == @bitCast(c_uint, @as(c_int, '+'))))) {
            if (c == @bitCast(c_uint, @as(c_int, '-'))) flag = -@as(c_int, 1);
        } else return @bitCast(c_long, @as(c_long, -@as(c_int, 232)));
        sign_on = 0;
    }
    rl.?.* = (@bitCast(c_long, @as(c_long, flag)) * v);
    return @bitCast(c_long, @as(c_long, @as(c_int, 0)));
}
pub fn clear_callout_args(arg_n: c_int, arg_types: [*c]c_uint, arg_vals: [*c]OnigValue) callconv(.C) void {
    var n = arg_n;
    var types = arg_types;
    var vals = arg_vals;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < n) : (i += 1) {
            switch_1: {
                default: {
                    case: {
                        switch (types[@intCast(c_uint, i)]) {
                            @bitCast(c_uint, @as(c_int, 4)) => break :case,
                            else => break :default,
                        }
                    }
                    if ((@ptrCast(?*c_void, (vals[@intCast(c_uint, i)].s.start))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, vals[@intCast(c_uint, i)].s.start));
                    break :@"switch";
                }
                break :switch_1;
            }
        }
    }
} // ../oniguruma/src/regparse.c:7293:9: warning: TODO implement translation of stmt class GotoStmtClass
pub const prs_callout_args = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:7261:1
// ../oniguruma/src/regparse.c:7511:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const prs_callout_of_name = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:7426:1
// ../oniguruma/src/regparse.c:7618:5: warning: TODO implement translation of stmt class LabelStmtClass
pub const prs_bag = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:7593:1
pub var PopularQStr: [6][*c]const u8 = [6][*c]const u8{
    "?",
    "*",
    "+",
    "??",
    "*?",
    "+?",
};
pub var ReduceQStr: [7][*c]const u8 = [7][*c]const u8{
    "",
    "",
    "*",
    "*?",
    "??",
    "+ and ??",
    "+? and ?",
}; // ../oniguruma/src/regparse.c:8273:11: warning: TODO implement translation of stmt class GotoStmtClass
pub const assign_quantifier_body = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:8229:1
const struct_unnamed_113 = extern struct {
    env: [*c]ParseEnv,
    cc: [*c]CClassNode,
    alt_root: [*c]Node,
    ptail: [*c][*c]Node,
};
pub const IApplyCaseFoldArg = struct_unnamed_113;
pub const i_apply_case_fold = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:8384:1
// ../oniguruma/src/regparse.c:8504:2: warning: TODO implement translation of stmt class LabelStmtClass
pub const prs_exp = @compileError("unable to translate function"); // ../oniguruma/src/regparse.c:8496:1
pub fn prs_branch(arg_top: [*c][*c]Node, arg_tok: [*c]PToken, arg_term: c_int, arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_env: [*c]ParseEnv, arg_group_head: c_int) callconv(.C) c_int {
    var top = arg_top;
    var tok = arg_tok;
    var term = arg_term;
    var src = arg_src;
    var end = arg_end;
    var env = arg_env;
    var group_head = arg_group_head;
    var r: c_int = undefined;
    var node: [*c]Node = undefined;
    var headp: [*c][*c]Node = undefined;
    top.?.* = null;
    while (true) {
        (env.*.parse_depth) +%= 1;
        if ((env.*.parse_depth) > ParseDepthLimit) return -@as(c_int, 16);
        if (!false) break;
    }
    r = prs_exp(&node, tok, term, src, end, env, group_head);
    if (r < @as(c_int, 0)) {
        onig_node_free(node);
        return r;
    }
    if (((r == TK_EOT) or (r == term)) or (r == TK_ALT)) {
        top.?.* = node;
    } else {
        top.?.* = node_new_list(node, null);
        if ((@ptrCast(?*c_void, (top.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            onig_node_free(node);
            return -@as(c_int, 5);
        }
        headp = &((&((top.?.*).*.u.cons)).*.cdr);
        while (((r != TK_EOT) and (r != term)) and (r != TK_ALT)) {
            r = prs_exp(&node, tok, term, src, end, env, @as(c_int, 0));
            if (r < @as(c_int, 0)) {
                onig_node_free(node);
                return r;
            }
            if (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type))) == @bitCast(c_uint, NODE_LIST)) {
                headp.?.* = node;
                while ((@ptrCast(?*c_void, ((&((node).*.u.cons)).*.cdr))) != @intToPtr(?*c_void, @as(c_int, 0))) node = ((&((node).*.u.cons)).*.cdr);
                headp = &((&((node).*.u.cons)).*.cdr);
            } else {
                headp.?.* = node_new_list(node, null);
                headp = &((&((headp.?.*).*.u.cons)).*.cdr);
            }
        }
    }
    (env.*.parse_depth) -%= 1;
    return r;
}
pub fn prs_regexp(arg_top: [*c][*c]Node, arg_src: [*c][*c]OnigUChar, arg_end: [*c]OnigUChar, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var top = arg_top;
    var src = arg_src;
    var end = arg_end;
    var env = arg_env;
    var r: c_int = undefined;
    var tok: PToken = undefined;
    ptoken_init(&tok);
    r = fetch_token(&tok, src, end, env);
    if (r < @as(c_int, 0)) return r;
    r = prs_alts(top, &tok, TK_EOT, src, end, env, @as(c_int, 0));
    if (r < @as(c_int, 0)) return r;
    return 0;
}
pub fn make_call_zero_body(arg_node: [*c]Node, arg_env: [*c]ParseEnv, arg_rnode: [*c][*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var rnode = arg_rnode;
    var r: c_int = undefined;
    var x: [*c]Node = node_new_memory(@as(c_int, 0));
    if ((@ptrCast(?*c_void, (x))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    ((x).*.u.base.body) = node;
    (&((x).*.u.bag)).*.unnamed_0.m.regnum = 0;
    r = scan_env_set_mem_node(env, @as(c_int, 0), x);
    if (r != @as(c_int, 0)) {
        onig_node_free(x);
        return r;
    }
    rnode.?.* = x;
    return 0;
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
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:113:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token .Hash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:114:9
pub const __const = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:116:9
pub const __volatile = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:118:9
pub const __kpi_deprecated = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:202:9
pub const __restrict = @compileError("unable to translate C expr: unexpected token .Keyword_restrict"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:222:9
pub const __swift_unavailable = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:288:9
pub const __header_inline = @compileError("unable to translate C expr: unexpected token .Keyword_inline"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:322:10
pub const __unreachable_ok_push = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:348:10
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:379:9
pub const __FBSDID = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:399:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:403:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:407:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:411:9
pub const __alloc_size = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:429:9
pub const __DARWIN_ALIAS = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:612:9
pub const __DARWIN_ALIAS_C = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:613:9
pub const __DARWIN_ALIAS_I = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:614:9
pub const __DARWIN_NOCANCEL = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:615:9
pub const __DARWIN_INODE64 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:616:9
pub const __DARWIN_1050 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:618:9
pub const __DARWIN_1050ALIAS = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:619:9
pub const __DARWIN_1050ALIAS_C = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:620:9
pub const __DARWIN_1050ALIAS_I = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:621:9
pub const __DARWIN_1050INODE64 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:622:9
pub const __DARWIN_EXTSN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:624:9
pub const __DARWIN_EXTSN_C = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:625:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:35:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:41:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:47:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:53:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:59:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:65:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:71:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:77:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:83:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:89:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:95:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:101:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:107:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:113:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:119:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:125:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:131:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:137:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:143:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:149:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:155:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:161:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:167:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:173:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:179:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:185:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:191:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:197:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:203:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:209:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:215:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:221:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:227:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:233:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:239:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:245:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:251:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:257:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:263:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:269:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:275:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:281:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:287:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:293:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:299:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6 = @compileError("unable to translate C expr: unexpected token .Nl"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:305:9
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:635:9
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:698:9
pub const __compiler_barrier = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:812:9
pub const __enum_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:836:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:838:9
pub const __options_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:840:9
pub const __options_closed_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:842:9
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2919:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2920:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2921:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2923:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2927:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2929:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2934:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2938:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2939:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2941:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2945:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2947:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2951:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2953:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2958:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2965:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2969:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2971:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2975:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2977:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2982:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2987:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2991:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2993:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2997:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2999:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3003:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3005:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3009:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3011:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3015:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3017:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3021:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3023:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3029:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3033:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3035:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3039:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3041:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3042:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3044:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3046:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3050:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3052:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3057:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3061:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3062:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3064:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3068:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3070:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3074:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3076:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3081:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3086:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3088:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3092:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3094:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3098:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3100:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3105:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3109:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3110:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3112:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3116:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3118:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3122:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3124:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3128:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3130:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3134:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3136:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3140:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3142:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3146:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3148:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3152:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3154:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3165:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3169:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3171:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3176:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3180:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3181:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3183:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3187:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3189:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3193:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3195:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3200:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3204:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3207:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3211:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3213:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3217:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3219:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3224:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3228:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3229:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3231:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3235:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3237:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3241:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3243:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3247:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3249:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3253:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3255:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3259:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3261:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3265:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3267:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3271:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3272:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3273:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3274:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3278:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3282:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3284:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3289:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3293:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3294:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3296:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3300:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3302:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3306:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3308:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3313:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3317:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3318:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3320:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3324:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3326:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3332:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3337:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3341:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3342:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3344:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3348:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3350:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3354:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3356:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3360:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3362:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3368:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3372:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3374:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3378:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3379:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3380:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEPRECATED__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3382:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3383:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3386:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3390:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3392:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3397:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3401:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3402:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3404:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3410:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3414:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3416:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3421:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3425:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3426:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3428:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3432:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3434:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3438:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3440:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3445:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3449:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3451:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3455:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3457:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3461:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3463:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3467:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3469:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3473:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3475:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3479:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3480:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3481:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3482:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3483:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3484:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3486:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3490:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3492:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3497:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3501:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3502:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3504:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3508:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3510:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3514:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3516:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3521:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3525:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3526:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3528:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3532:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3534:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3538:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3540:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3545:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3549:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3550:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3552:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3556:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3558:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3562:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3564:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3568:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3570:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3574:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3575:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3576:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3577:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3578:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3579:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3581:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3585:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3587:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3592:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3596:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3597:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3599:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3603:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3605:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3609:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3611:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3616:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3620:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3621:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3623:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3627:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3629:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3633:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3635:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3640:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_13_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3644:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3645:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3647:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3651:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3653:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3657:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3659:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3663:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3664:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3665:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3666:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3667:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3668:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3670:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3674:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3676:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3681:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3685:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3686:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3688:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3692:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3694:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3698:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3700:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3705:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3709:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3710:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3712:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3716:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3718:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3722:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3724:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3729:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3733:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3734:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3736:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3740:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3742:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3746:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3747:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3748:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3749:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3750:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3751:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3753:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3757:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3759:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3764:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3768:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3769:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3771:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3775:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3777:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3781:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3783:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3788:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3792:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3793:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3795:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3799:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3801:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3805:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3807:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3812:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3816:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3817:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3818:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3820:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3824:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3825:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3826:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3827:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3829:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3833:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3834:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3835:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3837:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3841:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3843:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3848:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3852:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3853:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3855:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3859:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3861:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3865:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3867:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3872:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3876:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3877:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3879:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3883:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3885:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3889:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3891:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3896:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3900:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3902:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3906:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3908:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3912:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3914:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3918:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3920:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3924:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3926:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3930:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3932:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3936:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3938:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3942:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3944:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3948:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3950:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3955:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3959:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3960:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3961:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3964:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3966:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3970:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3972:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3976:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3977:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3979:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3983:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3985:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3989:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3991:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3996:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4000:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4001:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4003:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4007:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4009:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4013:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4015:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4020:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4024:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4025:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4026:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4029:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4033:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4034:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4036:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4042:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4046:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4048:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4053:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4057:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4058:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4060:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4064:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4066:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4070:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4072:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4077:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4081:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4082:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4083:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4084:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4087:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4091:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4093:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4098:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4102:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4103:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4105:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4109:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4111:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4115:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4117:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4122:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4126:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4127:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4129:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4133:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4135:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4139:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4141:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4146:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4150:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4152:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4156:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4157:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4163:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4167:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4169:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4173:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4175:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4179:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4180:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4182:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4186:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4188:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4192:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4194:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4199:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4203:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4204:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4206:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4208:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4212:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4214:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4218:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4219:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4221:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4225:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4227:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4231:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4233:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4238:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4242:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4243:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4245:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4247:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4251:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4252:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4254:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4258:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4260:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4264:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4266:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4271:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4277:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4281:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4285:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4287:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4291:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4293:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4298:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4302:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4303:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4305:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4309:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4311:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4315:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4317:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4322:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4326:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4327:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4328:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4329:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4332:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4336:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4338:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4342:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4344:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4348:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4349:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4350:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4353:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4357:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4359:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4363:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4364:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4365:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4368:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4372:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4373:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4374:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4377:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4383:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4387:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4389:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4394:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4398:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4400:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4404:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4405:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4406:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4407:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4409:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4410:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_15 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4412:21
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4442:13
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4443:13
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4444:13
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4445:13
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4446:13
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4448:13
pub const __API_AVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4451:14
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4453:13
pub const __API_A = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4457:17
pub const __API_AVAILABLE2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4466:13
pub const __API_AVAILABLE3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4467:13
pub const __API_AVAILABLE4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4468:13
pub const __API_AVAILABLE5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4469:13
pub const __API_AVAILABLE6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4470:13
pub const __API_AVAILABLE7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4471:13
pub const __API_AVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4472:13
pub const __API_APPLY_TO = @compileError("unable to translate C expr: expected Identifier instead got: Comma"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4474:13
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token .Hash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4476:13
pub const __API_A_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4478:13
pub const __API_AVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4481:13
pub const __API_AVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4482:13
pub const __API_AVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4483:13
pub const __API_AVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4484:13
pub const __API_AVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4485:13
pub const __API_AVAILABLE_BEGIN7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4486:13
pub const __API_AVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4487:13
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4490:13
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4491:13
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4492:13
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4493:13
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4494:13
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4496:13
pub const __API_DEPRECATED_PLATFORM_uikitformac = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4499:14
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4501:13
pub const __API_D = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4505:17
pub const __API_DEPRECATED_MSG3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4514:13
pub const __API_DEPRECATED_MSG4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4515:13
pub const __API_DEPRECATED_MSG5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4516:13
pub const __API_DEPRECATED_MSG6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4517:13
pub const __API_DEPRECATED_MSG7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4518:13
pub const __API_DEPRECATED_MSG8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4519:13
pub const __API_DEPRECATED_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4520:13
pub const __API_D_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4522:13
pub const __API_DEPRECATED_BEGIN_MSG3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4525:13
pub const __API_DEPRECATED_BEGIN_MSG4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4526:13
pub const __API_DEPRECATED_BEGIN_MSG5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4527:13
pub const __API_DEPRECATED_BEGIN_MSG6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4528:13
pub const __API_DEPRECATED_BEGIN_MSG7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4529:13
pub const __API_DEPRECATED_BEGIN_MSG8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4530:13
pub const __API_DEPRECATED_BEGIN_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4531:13
pub const __API_R = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4534:17
pub const __API_DEPRECATED_REP3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4540:13
pub const __API_DEPRECATED_REP4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4541:13
pub const __API_DEPRECATED_REP5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4542:13
pub const __API_DEPRECATED_REP6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4543:13
pub const __API_DEPRECATED_REP7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4544:13
pub const __API_DEPRECATED_REP8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4545:13
pub const __API_DEPRECATED_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4546:13
pub const __API_R_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4549:17
pub const __API_DEPRECATED_BEGIN_REP3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4555:13
pub const __API_DEPRECATED_BEGIN_REP4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4556:13
pub const __API_DEPRECATED_BEGIN_REP5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4557:13
pub const __API_DEPRECATED_BEGIN_REP6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4558:13
pub const __API_DEPRECATED_BEGIN_REP7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4559:13
pub const __API_DEPRECATED_BEGIN_REP8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4560:13
pub const __API_DEPRECATED_BEGIN_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4561:13
pub const __API_U = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4586:17
pub const __API_UNAVAILABLE2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4595:13
pub const __API_UNAVAILABLE3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4596:13
pub const __API_UNAVAILABLE4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4597:13
pub const __API_UNAVAILABLE5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4598:13
pub const __API_UNAVAILABLE6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4599:13
pub const __API_UNAVAILABLE7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4600:13
pub const __API_UNAVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4601:13
pub const __API_U_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4603:13
pub const __API_UNAVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4606:13
pub const __API_UNAVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4607:13
pub const __API_UNAVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4608:13
pub const __API_UNAVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4609:13
pub const __API_UNAVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4610:13
pub const __API_UNAVAILABLE_BEGIN7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4611:13
pub const __API_UNAVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4612:13
pub const __swift_compiler_version_at_least = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4661:13
pub const __SPI_AVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4669:11
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:295:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:296:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:298:17
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:322:13
pub const __OS_EXTENSION_UNAVAILABLE = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:350:9
pub const __OSX_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:358:13
pub const __OSX_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:359:13
pub const __IOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:381:13
pub const __IOS_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:382:13
pub const __TVOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:408:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:409:13
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:435:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:436:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:504:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:506:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:525:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:526:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:528:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:531:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:542:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:544:13
pub const __SPI_DEPRECATED = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:598:11
pub const __SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:602:11
pub const SIG_DFL = @compileError("unable to translate C expr: unexpected token .RParen"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/signal.h:131:9
pub const SIG_IGN = @compileError("unable to translate C expr: unexpected token .RParen"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/signal.h:132:9
pub const SIG_HOLD = @compileError("unable to translate C expr: unexpected token .RParen"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/signal.h:133:9
pub const SIG_ERR = @compileError("unable to translate C expr: unexpected token .RParen"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/signal.h:134:9
pub const INT64_C = @compileError("unable to translate C expr: expected ')' instead got: HashHash"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/stdint.h:65:9
pub const UINT32_C = @compileError("unable to translate C expr: expected ')' instead got: HashHash"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/stdint.h:69:9
pub const UINT64_C = @compileError("unable to translate C expr: expected ')' instead got: HashHash"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/stdint.h:70:9
pub const INTMAX_C = @compileError("unable to translate C expr: expected ')' instead got: HashHash"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/stdint.h:73:9
pub const UINTMAX_C = @compileError("unable to translate C expr: expected ')' instead got: HashHash"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/stdint.h:74:9
pub const __DARWIN_OS_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/libkern/i386/_OSByteOrder.h:34:17
pub const NTOHL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/_endian.h:143:9
pub const NTOHS = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/_endian.h:144:9
pub const NTOHLL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/_endian.h:145:9
pub const HTONL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/_endian.h:146:9
pub const HTONS = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/_endian.h:147:9
pub const HTONLL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/bin/lib/zig/libc/include/any-macos-any/sys/_endian.h:148:9
pub const CHECK_NULL_RETURN = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ../oniguruma/src/regint.h:189:9
pub const CHECK_NULL_RETURN_MEMERR = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ../oniguruma/src/regint.h:190:9
pub const MEM_STATUS_CLEAR = @compileError("unable to translate C expr: unexpected token .Equal"); // ../oniguruma/src/regint.h:348:9
pub const MEM_STATUS_ON_ALL = @compileError("unable to translate C expr: unexpected token .Equal"); // ../oniguruma/src/regint.h:349:9
pub const MEM_STATUS_ON = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:357:9
pub const MEM_STATUS_ON_SIMPLE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:366:9
pub const MEM_STATUS_LIMIT_ON = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:373:9
pub const BITSET_CLEAR = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:427:9
pub const BITSET_SET_BIT = @compileError("unable to translate C expr: unexpected token .PipeEqual"); // ../oniguruma/src/regint.h:436:9
pub const BITSET_CLEAR_BIT = @compileError("unable to translate C expr: unexpected token .AmpersandEqual"); // ../oniguruma/src/regint.h:437:9
pub const BITSET_INVERT_BIT = @compileError("unable to translate C expr: unexpected token .CaretEqual"); // ../oniguruma/src/regint.h:438:9
pub const BB_EXPAND = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:449:9
pub const BB_ENSURE_SIZE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:455:9
pub const BB_WRITE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:465:9
pub const BB_WRITE1 = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:472:9
pub const BB_MOVE_RIGHT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:485:9
pub const BB_MOVE_LEFT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:492:9
pub const BB_MOVE_LEFT_REDUCE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:497:9
pub const BB_INSERT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:502:9
pub const GET_CODE_POINT = @compileError("unable to translate C expr: unexpected token .Equal"); // ../oniguruma/src/regint.h:697:9
pub const NCCLASS_FLAG_SET = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ../oniguruma/src/regint.h:786:9
pub const NCCLASS_FLAG_CLEAR = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ../oniguruma/src/regint.h:787:9
pub const BC0_P = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1050:9
pub const BC0_R = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1059:9
pub const BC0_B = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1068:9
pub const BC_P = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1077:9
pub const BC_P_O = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1086:9
pub const BC_B = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1095:9
pub const BC_B_O = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regint.h:1104:9
pub const NODE_SET_TYPE = @compileError("unable to translate C expr: unexpected token .Equal"); // ../oniguruma/src/regparse.h:277:9
pub const NODE_STRING_SET_CRUDE = @compileError("unable to translate C expr: unexpected token .PipeEqual"); // ../oniguruma/src/regparse.h:305:9
pub const NODE_STRING_CLEAR_CRUDE = @compileError("unable to translate C expr: unexpected token .AmpersandEqual"); // ../oniguruma/src/regparse.h:306:9
pub const NODE_STRING_SET_CASE_EXPANDED = @compileError("unable to translate C expr: unexpected token .PipeEqual"); // ../oniguruma/src/regparse.h:307:9
pub const NODE_STATUS_ADD = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ../oniguruma/src/regparse.h:348:9
pub const NODE_STATUS_REMOVE = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ../oniguruma/src/regparse.h:349:9
pub const ID_ENTRY = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.h:399:9
pub const ST_NUMCMP = @compileError("unable to translate C expr: unexpected token .RParen"); // ../oniguruma/src/st.h:61:9
pub const ST_NUMHASH = @compileError("unable to translate C expr: unexpected token .RParen"); // ../oniguruma/src/st.h:62:9
pub const INC_PARSE_DEPTH = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:247:9
pub const DEC_PARSE_DEPTH = @compileError("TODO postfix inc/dec expr"); // ../oniguruma/src/regparse.c:254:9
pub const OPTION_ON = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ../oniguruma/src/regparse.c:315:9
pub const OPTION_OFF = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ../oniguruma/src/regparse.c:316:9
pub const OPTION_NEGATE = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ../oniguruma/src/regparse.c:318:9
pub const ADD_ALL_MULTI_BYTE_RANGE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:326:9
pub const BITSET_IS_EMPTY = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:334:9
pub const PUNFETCH = @compileError("unable to translate C expr: unexpected token .Equal"); // ../oniguruma/src/regparse.c:415:9
pub const PINC = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:416:9
pub const PFETCH = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:420:9
pub const PINC_S = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:426:9
pub const PFETCH_S = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:429:9
pub const SWAP_BB_NOT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:3899:9
pub const ADD_CODE_INTO_CC = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ../oniguruma/src/regparse.c:8344:9
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
pub const DEFAULT_PARSE_DEPTH_LIMIT = 4096;
pub const INIT_MATCH_STACK_SIZE = 160;
pub const DEFAULT_MATCH_STACK_LIMIT_SIZE = 0;
pub const DEFAULT_RETRY_LIMIT_IN_MATCH = 10000000;
pub const DEFAULT_RETRY_LIMIT_IN_SEARCH = 0;
pub const DEFAULT_SUBEXP_CALL_LIMIT_IN_SEARCH = 0;
pub const DEFAULT_SUBEXP_CALL_MAX_NEST_LEVEL = 20;
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
pub fn va_start(ap: anytype, param: anytype) callconv(.Inline) @TypeOf(__builtin_va_start(ap, param)) {
    return __builtin_va_start(ap, param);
}
pub fn va_end(ap: anytype) callconv(.Inline) @TypeOf(__builtin_va_end(ap)) {
    return __builtin_va_end(ap);
}
pub fn va_arg(ap: anytype, type_1: anytype) callconv(.Inline) @TypeOf(__builtin_va_arg(ap, type_1)) {
    return __builtin_va_arg(ap, type_1);
}
pub fn __va_copy(d: anytype, s: anytype) callconv(.Inline) @TypeOf(__builtin_va_copy(d, s)) {
    return __builtin_va_copy(d, s);
}
pub fn va_copy(dest: anytype, src: anytype) callconv(.Inline) @TypeOf(__builtin_va_copy(dest, src)) {
    return __builtin_va_copy(dest, src);
}
pub const __GNUC_VA_LIST = 1;
pub fn __P(protos: anytype) callconv(.Inline) @TypeOf(protos) {
    return protos;
}
pub const __signed = c_int;
pub const __dead2 = __attribute__(__noreturn__);
pub const __pure2 = __attribute__(__const__);
pub const __unused = __attribute__(__unused__);
pub const __used = __attribute__(__used__);
pub const __cold = __attribute__(__cold__);
pub const __deprecated = __attribute__(__deprecated__);
pub fn __deprecated_msg(_msg: anytype) callconv(.Inline) @TypeOf(__attribute__(__deprecated__(_msg))) {
    return __attribute__(__deprecated__(_msg));
}
pub fn __deprecated_enum_msg(_msg: anytype) callconv(.Inline) @TypeOf(__deprecated_msg(_msg)) {
    return __deprecated_msg(_msg);
}
pub const __unavailable = __attribute__(__unavailable__);
pub const __disable_tail_calls = __attribute__(__disable_tail_calls__);
pub const __not_tail_called = __attribute__(__not_tail_called__);
pub const __result_use_check = __attribute__(__warn_unused_result__);
pub const __abortlike = __dead2 ++ __cold ++ __not_tail_called;
pub const __header_always_inline = __header_inline ++ __attribute__(__always_inline__);
pub const __unreachable_ok_pop = _Pragma("clang diagnostic pop");
pub fn __printflike(fmtarg: anytype, firstvararg: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(__printf__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__printf__, fmtarg, firstvararg));
}
pub fn __printf0like(fmtarg: anytype, firstvararg: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(__printf0__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__printf0__, fmtarg, firstvararg));
}
pub fn __scanflike(fmtarg: anytype, firstvararg: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(__scanf__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__scanf__, fmtarg, firstvararg));
}
pub fn __COPYRIGHT(s: anytype) callconv(.Inline) @TypeOf(__IDSTRING(copyright, s)) {
    return __IDSTRING(copyright, s);
}
pub fn __RCSID(s: anytype) callconv(.Inline) @TypeOf(__IDSTRING(rcsid, s)) {
    return __IDSTRING(rcsid, s);
}
pub fn __SCCSID(s: anytype) callconv(.Inline) @TypeOf(__IDSTRING(sccsid, s)) {
    return __IDSTRING(sccsid, s);
}
pub fn __PROJECT_VERSION(s: anytype) callconv(.Inline) @TypeOf(__IDSTRING(project_version, s)) {
    return __IDSTRING(project_version, s);
}
pub const __DARWIN_ONLY_64_BIT_INO_T = 0;
pub const __DARWIN_ONLY_VERS_1050 = 0;
pub const __DARWIN_ONLY_UNIX_CONFORMANCE = 1;
pub const __DARWIN_UNIX03 = 1;
pub const __DARWIN_64_BIT_INO_T = 1;
pub const __DARWIN_VERS_1050 = 1;
pub const __DARWIN_NON_CANCELABLE = 0;
pub const __DARWIN_SUF_64_BIT_INO_T = "$INODE64";
pub const __DARWIN_SUF_1050 = "$1050";
pub const __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1(x: anytype) callconv(.Inline) @TypeOf(x) {
    return x;
}
pub const __DARWIN_C_ANSI = @as(c_long, 0o010000);
pub const __DARWIN_C_FULL = @as(c_long, 900000);
pub const __DARWIN_C_LEVEL = __DARWIN_C_FULL;
pub const __STDC_WANT_LIB_EXT1__ = 1;
pub const __DARWIN_NO_LONG_LONG = 0;
pub const _DARWIN_FEATURE_64_BIT_INODE = 1;
pub const _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = 1;
pub const _DARWIN_FEATURE_UNIX_CONFORMANCE = 3;
pub fn __CAST_AWAY_QUALIFIER(variable: anytype, qualifier: anytype, type_1: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(type_1, c_long))(variable)) {
    return (@import("std").meta.cast(type_1, c_long))(variable);
}
pub const __XNU_PRIVATE_EXTERN = __attribute__(visibility("hidden"));
pub const __enum_open = __attribute__(__enum_extensibility__(open));
pub const __enum_closed = __attribute__(__enum_extensibility__(closed));
pub const __enum_options = __attribute__(__flag_enum__);
pub const __DARWIN_CLK_TCK = 100;
pub const CHAR_BIT = 8;
pub const MB_LEN_MAX = 6;
pub const CLK_TCK = __DARWIN_CLK_TCK;
pub const SCHAR_MAX = 127;
pub const SCHAR_MIN = -128;
pub const UCHAR_MAX = 255;
pub const CHAR_MAX = 127;
pub const CHAR_MIN = -128;
pub const USHRT_MAX = 65535;
pub const SHRT_MAX = 32767;
pub const SHRT_MIN = -32768;
pub const UINT_MAX = 0xffffffff;
pub const INT_MAX = 2147483647;
pub const INT_MIN = -2147483647 - 1;
pub const ULONG_MAX = @as(c_ulong, 0xffffffffffffffff);
pub const LONG_MAX = @as(c_long, 0x7fffffffffffffff);
pub const LONG_MIN = -@as(c_long, 0x7fffffffffffffff) - 1;
pub const ULLONG_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const LLONG_MAX = @as(c_longlong, 0x7fffffffffffffff);
pub const LLONG_MIN = -@as(c_longlong, 0x7fffffffffffffff) - 1;
pub const LONG_BIT = 64;
pub const SSIZE_MAX = LONG_MAX;
pub const WORD_BIT = 32;
pub const SIZE_T_MAX = ULONG_MAX;
pub const UQUAD_MAX = ULLONG_MAX;
pub const QUAD_MAX = LLONG_MAX;
pub const QUAD_MIN = LLONG_MIN;
pub const ARG_MAX = 256 * 1024;
pub const CHILD_MAX = 266;
pub const GID_MAX = @as(c_uint, 2147483647);
pub const LINK_MAX = 32767;
pub const MAX_CANON = 1024;
pub const MAX_INPUT = 1024;
pub const NAME_MAX = 255;
pub const NGROUPS_MAX = 16;
pub const UID_MAX = @as(c_uint, 2147483647);
pub const OPEN_MAX = 10240;
pub const PATH_MAX = 1024;
pub const PIPE_BUF = 512;
pub const BC_BASE_MAX = 99;
pub const BC_DIM_MAX = 2048;
pub const BC_SCALE_MAX = 99;
pub const BC_STRING_MAX = 1000;
pub const CHARCLASS_NAME_MAX = 14;
pub const COLL_WEIGHTS_MAX = 2;
pub const EQUIV_CLASS_MAX = 2;
pub const EXPR_NEST_MAX = 32;
pub const LINE_MAX = 2048;
pub const RE_DUP_MAX = 255;
pub const NZERO = 20;
pub const _POSIX_ARG_MAX = 4096;
pub const _POSIX_CHILD_MAX = 25;
pub const _POSIX_LINK_MAX = 8;
pub const _POSIX_MAX_CANON = 255;
pub const _POSIX_MAX_INPUT = 255;
pub const _POSIX_NAME_MAX = 14;
pub const _POSIX_NGROUPS_MAX = 8;
pub const _POSIX_OPEN_MAX = 20;
pub const _POSIX_PATH_MAX = 256;
pub const _POSIX_PIPE_BUF = 512;
pub const _POSIX_SSIZE_MAX = 32767;
pub const _POSIX_STREAM_MAX = 8;
pub const _POSIX_TZNAME_MAX = 6;
pub const _POSIX2_BC_BASE_MAX = 99;
pub const _POSIX2_BC_DIM_MAX = 2048;
pub const _POSIX2_BC_SCALE_MAX = 99;
pub const _POSIX2_BC_STRING_MAX = 1000;
pub const _POSIX2_EQUIV_CLASS_MAX = 2;
pub const _POSIX2_EXPR_NEST_MAX = 32;
pub const _POSIX2_LINE_MAX = 2048;
pub const _POSIX2_RE_DUP_MAX = 255;
pub const _POSIX_AIO_LISTIO_MAX = 2;
pub const _POSIX_AIO_MAX = 1;
pub const _POSIX_DELAYTIMER_MAX = 32;
pub const _POSIX_MQ_OPEN_MAX = 8;
pub const _POSIX_MQ_PRIO_MAX = 32;
pub const _POSIX_RTSIG_MAX = 8;
pub const _POSIX_SEM_NSEMS_MAX = 256;
pub const _POSIX_SEM_VALUE_MAX = 32767;
pub const _POSIX_SIGQUEUE_MAX = 32;
pub const _POSIX_TIMER_MAX = 32;
pub const _POSIX_CLOCKRES_MIN = 20000000;
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = 4;
pub const _POSIX_THREAD_KEYS_MAX = 128;
pub const _POSIX_THREAD_THREADS_MAX = 64;
pub const PTHREAD_DESTRUCTOR_ITERATIONS = 4;
pub const PTHREAD_KEYS_MAX = 512;
pub const PTHREAD_STACK_MIN = 8192;
pub const _POSIX_HOST_NAME_MAX = 255;
pub const _POSIX_LOGIN_NAME_MAX = 9;
pub const _POSIX_SS_REPL_MAX = 4;
pub const _POSIX_SYMLINK_MAX = 255;
pub const _POSIX_SYMLOOP_MAX = 8;
pub const _POSIX_TRACE_EVENT_NAME_MAX = 30;
pub const _POSIX_TRACE_NAME_MAX = 8;
pub const _POSIX_TRACE_SYS_MAX = 8;
pub const _POSIX_TRACE_USER_EVENT_MAX = 32;
pub const _POSIX_TTY_NAME_MAX = 9;
pub const _POSIX2_CHARCLASS_NAME_MAX = 14;
pub const _POSIX2_COLL_WEIGHTS_MAX = 2;
pub const _POSIX_RE_DUP_MAX = _POSIX2_RE_DUP_MAX;
pub const OFF_MIN = LLONG_MIN;
pub const OFF_MAX = LLONG_MAX;
pub const PASS_MAX = 128;
pub const NL_ARGMAX = 9;
pub const NL_LANGMAX = 14;
pub const NL_MSGMAX = 32767;
pub const NL_NMAX = 1;
pub const NL_SETMAX = 255;
pub const NL_TEXTMAX = 2048;
pub const _XOPEN_IOV_MAX = 16;
pub const IOV_MAX = 1024;
pub const _XOPEN_NAME_MAX = 255;
pub const _XOPEN_PATH_MAX = 1024;
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const __API_TO_BE_DEPRECATED = 100000;
pub const __MAC_10_0 = 1000;
pub const __MAC_10_1 = 1010;
pub const __MAC_10_2 = 1020;
pub const __MAC_10_3 = 1030;
pub const __MAC_10_4 = 1040;
pub const __MAC_10_5 = 1050;
pub const __MAC_10_6 = 1060;
pub const __MAC_10_7 = 1070;
pub const __MAC_10_8 = 1080;
pub const __MAC_10_9 = 1090;
pub const __MAC_10_10 = 101000;
pub const __MAC_10_10_2 = 101002;
pub const __MAC_10_10_3 = 101003;
pub const __MAC_10_11 = 101100;
pub const __MAC_10_11_2 = 101102;
pub const __MAC_10_11_3 = 101103;
pub const __MAC_10_11_4 = 101104;
pub const __MAC_10_12 = 101200;
pub const __MAC_10_12_1 = 101201;
pub const __MAC_10_12_2 = 101202;
pub const __MAC_10_12_4 = 101204;
pub const __MAC_10_13 = 101300;
pub const __MAC_10_13_1 = 101301;
pub const __MAC_10_13_2 = 101302;
pub const __MAC_10_13_4 = 101304;
pub const __MAC_10_14 = 101400;
pub const __MAC_10_14_1 = 101401;
pub const __MAC_10_14_4 = 101404;
pub const __MAC_10_15 = 101500;
pub const __MAC_10_15_1 = 101501;
pub const __MAC_10_15_4 = 101504;
pub const __IPHONE_2_0 = 20000;
pub const __IPHONE_2_1 = 20100;
pub const __IPHONE_2_2 = 20200;
pub const __IPHONE_3_0 = 30000;
pub const __IPHONE_3_1 = 30100;
pub const __IPHONE_3_2 = 30200;
pub const __IPHONE_4_0 = 40000;
pub const __IPHONE_4_1 = 40100;
pub const __IPHONE_4_2 = 40200;
pub const __IPHONE_4_3 = 40300;
pub const __IPHONE_5_0 = 50000;
pub const __IPHONE_5_1 = 50100;
pub const __IPHONE_6_0 = 60000;
pub const __IPHONE_6_1 = 60100;
pub const __IPHONE_7_0 = 70000;
pub const __IPHONE_7_1 = 70100;
pub const __IPHONE_8_0 = 80000;
pub const __IPHONE_8_1 = 80100;
pub const __IPHONE_8_2 = 80200;
pub const __IPHONE_8_3 = 80300;
pub const __IPHONE_8_4 = 80400;
pub const __IPHONE_9_0 = 90000;
pub const __IPHONE_9_1 = 90100;
pub const __IPHONE_9_2 = 90200;
pub const __IPHONE_9_3 = 90300;
pub const __IPHONE_10_0 = 100000;
pub const __IPHONE_10_1 = 100100;
pub const __IPHONE_10_2 = 100200;
pub const __IPHONE_10_3 = 100300;
pub const __IPHONE_11_0 = 110000;
pub const __IPHONE_11_1 = 110100;
pub const __IPHONE_11_2 = 110200;
pub const __IPHONE_11_3 = 110300;
pub const __IPHONE_11_4 = 110400;
pub const __IPHONE_12_0 = 120000;
pub const __IPHONE_12_1 = 120100;
pub const __IPHONE_12_2 = 120200;
pub const __IPHONE_12_3 = 120300;
pub const __IPHONE_13_0 = 130000;
pub const __IPHONE_13_1 = 130100;
pub const __IPHONE_13_2 = 130200;
pub const __IPHONE_13_3 = 130300;
pub const __IPHONE_13_4 = 130400;
pub const __IPHONE_13_5 = 130500;
pub const __IPHONE_13_6 = 130600;
pub const __TVOS_9_0 = 90000;
pub const __TVOS_9_1 = 90100;
pub const __TVOS_9_2 = 90200;
pub const __TVOS_10_0 = 100000;
pub const __TVOS_10_0_1 = 100001;
pub const __TVOS_10_1 = 100100;
pub const __TVOS_10_2 = 100200;
pub const __TVOS_11_0 = 110000;
pub const __TVOS_11_1 = 110100;
pub const __TVOS_11_2 = 110200;
pub const __TVOS_11_3 = 110300;
pub const __TVOS_11_4 = 110400;
pub const __TVOS_12_0 = 120000;
pub const __TVOS_12_1 = 120100;
pub const __TVOS_12_2 = 120200;
pub const __TVOS_12_3 = 120300;
pub const __TVOS_13_0 = 130000;
pub const __TVOS_13_2 = 130200;
pub const __TVOS_13_3 = 130300;
pub const __TVOS_13_4 = 130400;
pub const __WATCHOS_1_0 = 10000;
pub const __WATCHOS_2_0 = 20000;
pub const __WATCHOS_2_1 = 20100;
pub const __WATCHOS_2_2 = 20200;
pub const __WATCHOS_3_0 = 30000;
pub const __WATCHOS_3_1 = 30100;
pub const __WATCHOS_3_1_1 = 30101;
pub const __WATCHOS_3_2 = 30200;
pub const __WATCHOS_4_0 = 40000;
pub const __WATCHOS_4_1 = 40100;
pub const __WATCHOS_4_2 = 40200;
pub const __WATCHOS_4_3 = 40300;
pub const __WATCHOS_5_0 = 50000;
pub const __WATCHOS_5_1 = 50100;
pub const __WATCHOS_5_2 = 50200;
pub const __WATCHOS_6_0 = 60000;
pub const __WATCHOS_6_1 = 60100;
pub const __WATCHOS_6_2 = 60200;
pub const __DRIVERKIT_19_0 = 190000;
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_10_15;
pub const __AVAILABILITY_INTERNAL_DEPRECATED = __attribute__(deprecated);
pub fn __AVAILABILITY_INTERNAL_DEPRECATED_MSG(_msg: anytype) callconv(.Inline) @TypeOf(__attribute__(deprecated(_msg))) {
    return __attribute__(deprecated(_msg));
}
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = __attribute__(unavailable);
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = __attribute__(weak_import);
pub const __ENABLE_LEGACY_MAC_AVAILABILITY = 1;
pub const __AVAILABILITY_INTERNAL__MAC_NA = __attribute__(availability(macosx, unavailable));
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA = __attribute__(availability(macosx, unavailable));
pub fn __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA_MSG(_msg: anytype) callconv(.Inline) @TypeOf(__attribute__(availability(macosx, unavailable))) {
    return __attribute__(availability(macosx, unavailable));
}
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub fn __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG(_msg: anytype) callconv(.Inline) @TypeOf(__attribute__(availability(ios, unavailable))) {
    return __attribute__(availability(ios, unavailable));
}
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = __attribute__(availability(ios, unavailable));
pub fn __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG(_msg: anytype) callconv(.Inline) @TypeOf(__attribute__(availability(ios, unavailable))) {
    return __attribute__(availability(ios, unavailable));
}
pub fn __API_AVAILABLE1(x: anytype) callconv(.Inline) @TypeOf(__API_A(x)) {
    return __API_A(x);
}
pub fn __API_RANGE_STRINGIFY(x: anytype) callconv(.Inline) @TypeOf(__API_RANGE_STRINGIFY2(x)) {
    return __API_RANGE_STRINGIFY2(x);
}
pub fn __API_AVAILABLE_BEGIN1(a: anytype) callconv(.Inline) @TypeOf(__API_A_BEGIN(a)) {
    return __API_A_BEGIN(a);
}
pub fn __API_DEPRECATED_MSG2(msg: anytype, x: anytype) callconv(.Inline) @TypeOf(__API_D(msg, x)) {
    return __API_D(msg, x);
}
pub fn __API_DEPRECATED_BEGIN_MSG2(msg: anytype, a: anytype) callconv(.Inline) @TypeOf(__API_D_BEGIN(msg, a)) {
    return __API_D_BEGIN(msg, a);
}
pub fn __API_DEPRECATED_REP2(rep: anytype, x: anytype) callconv(.Inline) @TypeOf(__API_R(rep, x)) {
    return __API_R(rep, x);
}
pub fn __API_DEPRECATED_BEGIN_REP2(rep: anytype, a: anytype) callconv(.Inline) @TypeOf(__API_R_BEGIN(rep, a)) {
    return __API_R_BEGIN(rep, a);
}
pub const __API_UNAVAILABLE_PLATFORM_macos = blk: {
    _ = macos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_macosx = blk: {
    _ = macosx;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_ios = blk: {
    _ = ios;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_watchos = blk: {
    _ = watchos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_tvos = blk: {
    _ = tvos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = blk: {
    _ = macCatalyst;
    break :blk unavailable;
};
pub fn __API_UNAVAILABLE_PLATFORM_uikitformac(x: anytype) callconv(.Inline) @TypeOf(unavailable) {
    return blk: {
        _ = uikitformac;
        break :blk unavailable;
    };
}
pub const __API_UNAVAILABLE_PLATFORM_driverkit = blk: {
    _ = driverkit;
    break :blk unavailable;
};
pub fn __API_UNAVAILABLE1(x: anytype) callconv(.Inline) @TypeOf(__API_U(x)) {
    return __API_U(x);
}
pub fn __API_UNAVAILABLE_BEGIN1(a: anytype) callconv(.Inline) @TypeOf(__API_U_BEGIN(a)) {
    return __API_U_BEGIN(a);
}
pub fn __OS_AVAILABILITY(_target: anytype, _availability: anytype) callconv(.Inline) @TypeOf(__attribute__(availability(_target, _availability))) {
    return __attribute__(availability(_target, _availability));
}
pub fn __OSX_EXTENSION_UNAVAILABLE(_msg: anytype) callconv(.Inline) @TypeOf(__OS_AVAILABILITY_MSG(macosx_app_extension, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(macosx_app_extension, unavailable, _msg);
}
pub fn __IOS_EXTENSION_UNAVAILABLE(_msg: anytype) callconv(.Inline) @TypeOf(__OS_AVAILABILITY_MSG(ios_app_extension, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(ios_app_extension, unavailable, _msg);
}
pub const __OSX_UNAVAILABLE = __OS_AVAILABILITY(macosx, unavailable);
pub const __IOS_UNAVAILABLE = __OS_AVAILABILITY(ios, unavailable);
pub const __IOS_PROHIBITED = __OS_AVAILABILITY(ios, unavailable);
pub const __TVOS_UNAVAILABLE = __OS_AVAILABILITY(tvos, unavailable);
pub const __TVOS_PROHIBITED = __OS_AVAILABILITY(tvos, unavailable);
pub const __WATCHOS_UNAVAILABLE = __OS_AVAILABILITY(watchos, unavailable);
pub const __WATCHOS_PROHIBITED = __OS_AVAILABILITY(watchos, unavailable);
pub const __SWIFT_UNAVAILABLE = __OS_AVAILABILITY(swift, unavailable);
pub fn __SWIFT_UNAVAILABLE_MSG(_msg: anytype) callconv(.Inline) @TypeOf(__OS_AVAILABILITY_MSG(swift, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(swift, unavailable, _msg);
}
pub const __API_AVAILABLE_END = _Pragma("clang attribute pop");
pub const __API_DEPRECATED_END = _Pragma("clang attribute pop");
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = _Pragma("clang attribute pop");
pub const __API_UNAVAILABLE_END = _Pragma("clang attribute pop");
pub const __DARWIN_NULL = (@import("std").meta.cast(?*c_void, 0));
pub const __PTHREAD_SIZE__ = 8176;
pub const __PTHREAD_ATTR_SIZE__ = 56;
pub const __PTHREAD_MUTEXATTR_SIZE__ = 8;
pub const __PTHREAD_MUTEX_SIZE__ = 56;
pub const __PTHREAD_CONDATTR_SIZE__ = 8;
pub const __PTHREAD_COND_SIZE__ = 40;
pub const __PTHREAD_ONCE_SIZE__ = 8;
pub const __PTHREAD_RWLOCK_SIZE__ = 192;
pub const __PTHREAD_RWLOCKATTR_SIZE__ = 16;
pub fn __offsetof(type_1: anytype, field: anytype) callconv(.Inline) @TypeOf(__builtin_offsetof(type_1, field)) {
    return __builtin_offsetof(type_1, field);
}
pub fn __strfmonlike(fmtarg: anytype, firstvararg: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(__strfmon__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__strfmon__, fmtarg, firstvararg));
}
pub fn __strftimelike(fmtarg: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(__strftime__, fmtarg, 0))) {
    return __attribute__(__format__(__strftime__, fmtarg, 0));
}
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -0x7fffffff - 1;
pub const __DARWIN_WEOF = __darwin_wint_t - 1;
pub const _FORTIFY_SOURCE = 2;
pub const __DARWIN_NSIG = 32;
pub const NSIG = __DARWIN_NSIG;
pub const _I386_SIGNAL_H_ = 1;
pub const SIGHUP = 1;
pub const SIGINT = 2;
pub const SIGQUIT = 3;
pub const SIGILL = 4;
pub const SIGTRAP = 5;
pub const SIGABRT = 6;
pub const SIGIOT = SIGABRT;
pub const SIGEMT = 7;
pub const SIGFPE = 8;
pub const SIGKILL = 9;
pub const SIGBUS = 10;
pub const SIGSEGV = 11;
pub const SIGSYS = 12;
pub const SIGPIPE = 13;
pub const SIGALRM = 14;
pub const SIGTERM = 15;
pub const SIGURG = 16;
pub const SIGSTOP = 17;
pub const SIGTSTP = 18;
pub const SIGCONT = 19;
pub const SIGCHLD = 20;
pub const SIGTTIN = 21;
pub const SIGTTOU = 22;
pub const SIGIO = 23;
pub const SIGXCPU = 24;
pub const SIGXFSZ = 25;
pub const SIGVTALRM = 26;
pub const SIGPROF = 27;
pub const SIGWINCH = 28;
pub const SIGINFO = 29;
pub const SIGUSR1 = 30;
pub const SIGUSR2 = 31;
pub const USER_ADDR_NULL = (@import("std").meta.cast(user_addr_t, 0));
pub fn CAST_USER_ADDR_T(a_ptr: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(user_addr_t, (@import("std").meta.cast(usize, a_ptr))))) {
    return (@import("std").meta.cast(user_addr_t, (@import("std").meta.cast(usize, a_ptr))));
}
pub const _STRUCT_X86_THREAD_STATE32 = struct___darwin_i386_thread_state;
pub const _STRUCT_FP_CONTROL = struct___darwin_fp_control;
pub const FP_PREC_24B = 0;
pub const FP_PREC_53B = 2;
pub const FP_PREC_64B = 3;
pub const FP_RND_NEAR = 0;
pub const FP_RND_DOWN = 1;
pub const FP_RND_UP = 2;
pub const FP_CHOP = 3;
pub const _STRUCT_FP_STATUS = struct___darwin_fp_status;
pub const _STRUCT_MMST_REG = struct___darwin_mmst_reg;
pub const _STRUCT_XMM_REG = struct___darwin_xmm_reg;
pub const _STRUCT_YMM_REG = struct___darwin_ymm_reg;
pub const _STRUCT_ZMM_REG = struct___darwin_zmm_reg;
pub const _STRUCT_OPMASK_REG = struct___darwin_opmask_reg;
pub const FP_STATE_BYTES = 512;
pub const _STRUCT_X86_FLOAT_STATE32 = struct___darwin_i386_float_state;
pub const _STRUCT_X86_AVX_STATE32 = struct___darwin_i386_avx_state;
pub const _STRUCT_X86_AVX512_STATE32 = struct___darwin_i386_avx512_state;
pub const _STRUCT_X86_EXCEPTION_STATE32 = struct___darwin_i386_exception_state;
pub const _STRUCT_X86_DEBUG_STATE32 = struct___darwin_x86_debug_state32;
pub const _STRUCT_X86_PAGEIN_STATE = struct___x86_pagein_state;
pub const _STRUCT_X86_THREAD_STATE64 = struct___darwin_x86_thread_state64;
pub const _STRUCT_X86_THREAD_FULL_STATE64 = struct___darwin_x86_thread_full_state64;
pub const _STRUCT_X86_FLOAT_STATE64 = struct___darwin_x86_float_state64;
pub const _STRUCT_X86_AVX_STATE64 = struct___darwin_x86_avx_state64;
pub const _STRUCT_X86_AVX512_STATE64 = struct___darwin_x86_avx512_state64;
pub const _STRUCT_X86_EXCEPTION_STATE64 = struct___darwin_x86_exception_state64;
pub const _STRUCT_X86_DEBUG_STATE64 = struct___darwin_x86_debug_state64;
pub const _STRUCT_X86_CPMU_STATE64 = struct___darwin_x86_cpmu_state64;
pub const _STRUCT_MCONTEXT32 = struct___darwin_mcontext32;
pub const _STRUCT_MCONTEXT_AVX32 = struct___darwin_mcontext_avx32;
pub const _STRUCT_MCONTEXT_AVX512_32 = struct___darwin_mcontext_avx512_32;
pub const _STRUCT_MCONTEXT64 = struct___darwin_mcontext64;
pub const _STRUCT_MCONTEXT64_FULL = struct___darwin_mcontext64_full;
pub const _STRUCT_MCONTEXT_AVX64 = struct___darwin_mcontext_avx64;
pub const _STRUCT_MCONTEXT_AVX64_FULL = struct___darwin_mcontext_avx64_full;
pub const _STRUCT_MCONTEXT_AVX512_64 = struct___darwin_mcontext_avx512_64;
pub const _STRUCT_MCONTEXT_AVX512_64_FULL = struct___darwin_mcontext_avx512_64_full;
pub const _STRUCT_MCONTEXT = _STRUCT_MCONTEXT64;
pub const _STRUCT_SIGALTSTACK = struct___darwin_sigaltstack;
pub const _STRUCT_UCONTEXT = struct___darwin_ucontext;
pub const SIGEV_NONE = 0;
pub const SIGEV_SIGNAL = 1;
pub const SIGEV_THREAD = 3;
pub const ILL_NOOP = 0;
pub const ILL_ILLOPC = 1;
pub const ILL_ILLTRP = 2;
pub const ILL_PRVOPC = 3;
pub const ILL_ILLOPN = 4;
pub const ILL_ILLADR = 5;
pub const ILL_PRVREG = 6;
pub const ILL_COPROC = 7;
pub const ILL_BADSTK = 8;
pub const FPE_NOOP = 0;
pub const FPE_FLTDIV = 1;
pub const FPE_FLTOVF = 2;
pub const FPE_FLTUND = 3;
pub const FPE_FLTRES = 4;
pub const FPE_FLTINV = 5;
pub const FPE_FLTSUB = 6;
pub const FPE_INTDIV = 7;
pub const FPE_INTOVF = 8;
pub const SEGV_NOOP = 0;
pub const SEGV_MAPERR = 1;
pub const SEGV_ACCERR = 2;
pub const BUS_NOOP = 0;
pub const BUS_ADRALN = 1;
pub const BUS_ADRERR = 2;
pub const BUS_OBJERR = 3;
pub const TRAP_BRKPT = 1;
pub const TRAP_TRACE = 2;
pub const CLD_NOOP = 0;
pub const CLD_EXITED = 1;
pub const CLD_KILLED = 2;
pub const CLD_DUMPED = 3;
pub const CLD_TRAPPED = 4;
pub const CLD_STOPPED = 5;
pub const CLD_CONTINUED = 6;
pub const POLL_IN = 1;
pub const POLL_OUT = 2;
pub const POLL_MSG = 3;
pub const POLL_ERR = 4;
pub const POLL_PRI = 5;
pub const POLL_HUP = 6;
pub const sa_handler = __sigaction_u.__sa_handler;
pub const sa_sigaction = __sigaction_u.__sa_sigaction;
pub const SA_ONSTACK = 0x0001;
pub const SA_RESTART = 0x0002;
pub const SA_RESETHAND = 0x0004;
pub const SA_NOCLDSTOP = 0x0008;
pub const SA_NODEFER = 0x0010;
pub const SA_NOCLDWAIT = 0x0020;
pub const SA_SIGINFO = 0x0040;
pub const SA_USERTRAMP = 0x0100;
pub const SA_64REGSET = 0x0200;
pub const SA_USERSPACE_MASK = (((((SA_ONSTACK | SA_RESTART) | SA_RESETHAND) | SA_NOCLDSTOP) | SA_NODEFER) | SA_NOCLDWAIT) | SA_SIGINFO;
pub const SIG_BLOCK = 1;
pub const SIG_UNBLOCK = 2;
pub const SIG_SETMASK = 3;
pub const SI_USER = 0x10001;
pub const SI_QUEUE = 0x10002;
pub const SI_TIMER = 0x10003;
pub const SI_ASYNCIO = 0x10004;
pub const SI_MESGQ = 0x10005;
pub const SS_ONSTACK = 0x0001;
pub const SS_DISABLE = 0x0004;
pub const MINSIGSTKSZ = 32768;
pub const SIGSTKSZ = 131072;
pub const SV_ONSTACK = SA_ONSTACK;
pub const SV_INTERRUPT = SA_RESTART;
pub const SV_RESETHAND = SA_RESETHAND;
pub const SV_NODEFER = SA_NODEFER;
pub const SV_NOCLDSTOP = SA_NOCLDSTOP;
pub const SV_SIGINFO = SA_SIGINFO;
pub const sv_onstack = sv_flags;
pub fn sigmask(m: anytype) callconv(.Inline) @TypeOf(1 << (m - 1)) {
    return 1 << (m - 1);
}
pub const BADSIG = SIG_ERR;
pub const __WORDSIZE = 64;
pub fn INT8_C(v: anytype) callconv(.Inline) @TypeOf(v) {
    return v;
}
pub fn INT16_C(v: anytype) callconv(.Inline) @TypeOf(v) {
    return v;
}
pub fn INT32_C(v: anytype) callconv(.Inline) @TypeOf(v) {
    return v;
}
pub fn UINT8_C(v: anytype) callconv(.Inline) @TypeOf(v) {
    return v;
}
pub fn UINT16_C(v: anytype) callconv(.Inline) @TypeOf(v) {
    return v;
}
pub const INT8_MAX = 127;
pub const INT16_MAX = 32767;
pub const INT32_MAX = 2147483647;
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const INT8_MIN = -128;
pub const INT16_MIN = -32768;
pub const INT32_MIN = -INT32_MAX - 1;
pub const INT64_MIN = -INT64_MAX - 1;
pub const UINT8_MAX = 255;
pub const UINT16_MAX = 65535;
pub const UINT32_MAX = @as(c_uint, 4294967295);
pub const UINT64_MAX = @as(c_ulonglong, 18446744073709551615);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MAX = @as(c_long, 9223372036854775807);
pub const INTPTR_MIN = -INTPTR_MAX - 1;
pub const UINTPTR_MAX = @as(c_ulong, 18446744073709551615);
pub const INTMAX_MAX = INTMAX_C(9223372036854775807);
pub const UINTMAX_MAX = UINTMAX_C(18446744073709551615);
pub const INTMAX_MIN = -INTMAX_MAX - 1;
pub const PTRDIFF_MIN = INTMAX_MIN;
pub const PTRDIFF_MAX = INTMAX_MAX;
pub const SIZE_MAX = UINTPTR_MAX;
pub const RSIZE_MAX = SIZE_MAX >> 1;
pub const WCHAR_MAX = __WCHAR_MAX__;
pub const WCHAR_MIN = -WCHAR_MAX - 1;
pub const WINT_MIN = INT32_MIN;
pub const WINT_MAX = INT32_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const _STRUCT_TIMEVAL = struct_timeval;
pub const PRIO_PROCESS = 0;
pub const PRIO_PGRP = 1;
pub const PRIO_USER = 2;
pub const PRIO_DARWIN_THREAD = 3;
pub const PRIO_DARWIN_PROCESS = 4;
pub const PRIO_MIN = -20;
pub const PRIO_MAX = 20;
pub const PRIO_DARWIN_BG = 0x1000;
pub const PRIO_DARWIN_NONUI = 0x1001;
pub const RUSAGE_SELF = 0;
pub const RUSAGE_CHILDREN = -1;
pub const ru_first = ru_ixrss;
pub const ru_last = ru_nivcsw;
pub const RUSAGE_INFO_V0 = 0;
pub const RUSAGE_INFO_V1 = 1;
pub const RUSAGE_INFO_V2 = 2;
pub const RUSAGE_INFO_V3 = 3;
pub const RUSAGE_INFO_V4 = 4;
pub const RUSAGE_INFO_CURRENT = RUSAGE_INFO_V4;
pub const RLIM_INFINITY = (@import("std").meta.cast(__uint64_t, 1 << 63)) - 1;
pub const RLIM_SAVED_MAX = RLIM_INFINITY;
pub const RLIM_SAVED_CUR = RLIM_INFINITY;
pub const RLIMIT_CPU = 0;
pub const RLIMIT_FSIZE = 1;
pub const RLIMIT_DATA = 2;
pub const RLIMIT_STACK = 3;
pub const RLIMIT_CORE = 4;
pub const RLIMIT_AS = 5;
pub const RLIMIT_RSS = RLIMIT_AS;
pub const RLIMIT_MEMLOCK = 6;
pub const RLIMIT_NPROC = 7;
pub const RLIMIT_NOFILE = 8;
pub const RLIM_NLIMITS = 9;
pub const _RLIMIT_POSIX_FLAG = 0x1000;
pub const RLIMIT_WAKEUPS_MONITOR = 0x1;
pub const RLIMIT_CPU_USAGE_MONITOR = 0x2;
pub const RLIMIT_THREAD_CPULIMITS = 0x3;
pub const RLIMIT_FOOTPRINT_INTERVAL = 0x4;
pub const WAKEMON_ENABLE = 0x01;
pub const WAKEMON_DISABLE = 0x02;
pub const WAKEMON_GET_PARAMS = 0x04;
pub const WAKEMON_SET_DEFAULTS = 0x08;
pub const WAKEMON_MAKE_FATAL = 0x10;
pub const CPUMON_MAKE_FATAL = 0x1000;
pub const FOOTPRINT_INTERVAL_RESET = 0x1;
pub const IOPOL_TYPE_DISK = 0;
pub const IOPOL_TYPE_VFS_ATIME_UPDATES = 2;
pub const IOPOL_TYPE_VFS_MATERIALIZE_DATALESS_FILES = 3;
pub const IOPOL_TYPE_VFS_STATFS_NO_DATA_VOLUME = 4;
pub const IOPOL_SCOPE_PROCESS = 0;
pub const IOPOL_SCOPE_THREAD = 1;
pub const IOPOL_SCOPE_DARWIN_BG = 2;
pub const IOPOL_DEFAULT = 0;
pub const IOPOL_IMPORTANT = 1;
pub const IOPOL_PASSIVE = 2;
pub const IOPOL_THROTTLE = 3;
pub const IOPOL_UTILITY = 4;
pub const IOPOL_STANDARD = 5;
pub const IOPOL_APPLICATION = IOPOL_STANDARD;
pub const IOPOL_NORMAL = IOPOL_IMPORTANT;
pub const IOPOL_ATIME_UPDATES_DEFAULT = 0;
pub const IOPOL_ATIME_UPDATES_OFF = 1;
pub const IOPOL_MATERIALIZE_DATALESS_FILES_DEFAULT = 0;
pub const IOPOL_MATERIALIZE_DATALESS_FILES_OFF = 1;
pub const IOPOL_MATERIALIZE_DATALESS_FILES_ON = 2;
pub const IOPOL_VFS_STATFS_NO_DATA_VOLUME_DEFAULT = 0;
pub const IOPOL_VFS_STATFS_FORCE_NO_DATA_VOLUME = 1;
pub const WNOHANG = 0x00000001;
pub const WUNTRACED = 0x00000002;
pub fn _W_INT(w: anytype) callconv(.Inline) @TypeOf([*c]c_int.* & w) {
    return [*c]c_int.* & w;
}
pub const WCOREFLAG = 0o0200;
pub fn _WSTATUS(x: anytype) callconv(.Inline) @TypeOf(_W_INT(x) & 0o0177) {
    return _W_INT(x) & 0o0177;
}
pub const _WSTOPPED = 0o0177;
pub fn WEXITSTATUS(x: anytype) callconv(.Inline) @TypeOf((_W_INT(x) >> 8) & 0x000000ff) {
    return (_W_INT(x) >> 8) & 0x000000ff;
}
pub fn WSTOPSIG(x: anytype) callconv(.Inline) @TypeOf(_W_INT(x) >> 8) {
    return _W_INT(x) >> 8;
}
pub fn WIFCONTINUED(x: anytype) callconv(.Inline) @TypeOf((_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) == 0x13)) {
    return (_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) == 0x13);
}
pub fn WIFSTOPPED(x: anytype) callconv(.Inline) @TypeOf((_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) != 0x13)) {
    return (_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) != 0x13);
}
pub fn WIFEXITED(x: anytype) callconv(.Inline) @TypeOf(_WSTATUS(x) == 0) {
    return _WSTATUS(x) == 0;
}
pub fn WIFSIGNALED(x: anytype) callconv(.Inline) @TypeOf((_WSTATUS(x) != _WSTOPPED) and (_WSTATUS(x) != 0)) {
    return (_WSTATUS(x) != _WSTOPPED) and (_WSTATUS(x) != 0);
}
pub fn WTERMSIG(x: anytype) callconv(.Inline) @TypeOf(_WSTATUS(x)) {
    return _WSTATUS(x);
}
pub fn WCOREDUMP(x: anytype) callconv(.Inline) @TypeOf(_W_INT(x) & WCOREFLAG) {
    return _W_INT(x) & WCOREFLAG;
}
pub fn W_EXITCODE(ret: anytype, sig: anytype) callconv(.Inline) @TypeOf((ret << 8) | sig) {
    return (ret << 8) | sig;
}
pub fn W_STOPCODE(sig: anytype) callconv(.Inline) @TypeOf((sig << 8) | _WSTOPPED) {
    return (sig << 8) | _WSTOPPED;
}
pub const WEXITED = 0x00000004;
pub const WSTOPPED = 0x00000008;
pub const WCONTINUED = 0x00000010;
pub const WNOWAIT = 0x00000020;
pub const WAIT_ANY = -1;
pub const WAIT_MYPGRP = 0;
pub const _QUAD_HIGHWORD = 1;
pub const _QUAD_LOWWORD = 0;
pub const __DARWIN_LITTLE_ENDIAN = 1234;
pub const __DARWIN_BIG_ENDIAN = 4321;
pub const __DARWIN_PDP_ENDIAN = 3412;
pub const __DARWIN_BYTE_ORDER = __DARWIN_LITTLE_ENDIAN;
pub const LITTLE_ENDIAN = __DARWIN_LITTLE_ENDIAN;
pub const BIG_ENDIAN = __DARWIN_BIG_ENDIAN;
pub const PDP_ENDIAN = __DARWIN_PDP_ENDIAN;
pub const BYTE_ORDER = __DARWIN_BYTE_ORDER;
pub fn __DARWIN_OSSwapConstInt16(x: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(__uint16_t, (((@import("std").meta.cast(__uint16_t, x)) & 0xff00) >> 8) | (((@import("std").meta.cast(__uint16_t, x)) & 0x00ff) << 8)))) {
    return (@import("std").meta.cast(__uint16_t, (((@import("std").meta.cast(__uint16_t, x)) & 0xff00) >> 8) | (((@import("std").meta.cast(__uint16_t, x)) & 0x00ff) << 8)));
}
pub fn __DARWIN_OSSwapConstInt32(x: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(__uint32_t, (((((@import("std").meta.cast(__uint32_t, x)) & 0xff000000) >> 24) | (((@import("std").meta.cast(__uint32_t, x)) & 0x00ff0000) >> 8)) | (((@import("std").meta.cast(__uint32_t, x)) & 0x0000ff00) << 8)) | (((@import("std").meta.cast(__uint32_t, x)) & 0x000000ff) << 24)))) {
    return (@import("std").meta.cast(__uint32_t, (((((@import("std").meta.cast(__uint32_t, x)) & 0xff000000) >> 24) | (((@import("std").meta.cast(__uint32_t, x)) & 0x00ff0000) >> 8)) | (((@import("std").meta.cast(__uint32_t, x)) & 0x0000ff00) << 8)) | (((@import("std").meta.cast(__uint32_t, x)) & 0x000000ff) << 24)));
}
pub fn __DARWIN_OSSwapConstInt64(x: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(__uint64_t, (((((((((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0xff00000000000000)) >> 56) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x00ff000000000000)) >> 40)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x0000ff0000000000)) >> 24)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x000000ff00000000)) >> 8)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x00000000ff000000)) << 8)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x0000000000ff0000)) << 24)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x000000000000ff00)) << 40)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x00000000000000ff)) << 56)))) {
    return (@import("std").meta.cast(__uint64_t, (((((((((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0xff00000000000000)) >> 56) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x00ff000000000000)) >> 40)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x0000ff0000000000)) >> 24)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x000000ff00000000)) >> 8)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x00000000ff000000)) << 8)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x0000000000ff0000)) << 24)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x000000000000ff00)) << 40)) | (((@import("std").meta.cast(__uint64_t, x)) & @as(c_ulonglong, 0x00000000000000ff)) << 56)));
}
pub fn __DARWIN_OSSwapInt16(x: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(__uint16_t, if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt16(x) else _OSSwapInt16(x)))) {
    return (@import("std").meta.cast(__uint16_t, if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt16(x) else _OSSwapInt16(x)));
}
pub fn __DARWIN_OSSwapInt32(x: anytype) callconv(.Inline) @TypeOf(if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt32(x) else _OSSwapInt32(x)) {
    return if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt32(x) else _OSSwapInt32(x);
}
pub fn __DARWIN_OSSwapInt64(x: anytype) callconv(.Inline) @TypeOf(if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt64(x) else _OSSwapInt64(x)) {
    return if (__builtin_constant_p(x)) __DARWIN_OSSwapConstInt64(x) else _OSSwapInt64(x);
}
pub fn ntohs(x: anytype) callconv(.Inline) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    return __DARWIN_OSSwapInt16(x);
}
pub fn htons(x: anytype) callconv(.Inline) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    return __DARWIN_OSSwapInt16(x);
}
pub fn ntohl(x: anytype) callconv(.Inline) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    return __DARWIN_OSSwapInt32(x);
}
pub fn htonl(x: anytype) callconv(.Inline) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    return __DARWIN_OSSwapInt32(x);
}
pub fn ntohll(x: anytype) callconv(.Inline) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    return __DARWIN_OSSwapInt64(x);
}
pub fn htonll(x: anytype) callconv(.Inline) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    return __DARWIN_OSSwapInt64(x);
}
pub const w_termsig = w_T.w_Termsig;
pub const w_coredump = w_T.w_Coredump;
pub const w_retcode = w_T.w_Retcode;
pub const w_stopval = w_S.w_Stopval;
pub const w_stopsig = w_S.w_Stopsig;
pub fn __alloca(size: anytype) callconv(.Inline) @TypeOf(__builtin_alloca(size)) {
    return __builtin_alloca(size);
}
pub const EXIT_FAILURE = 1;
pub const EXIT_SUCCESS = 0;
pub const RAND_MAX = 0x7fffffff;
pub const MB_CUR_MAX = __mb_cur_max;
pub fn __swift_unavailable_on(osx_msg: anytype, ios_msg: anytype) callconv(.Inline) @TypeOf(__swift_unavailable(osx_msg)) {
    return __swift_unavailable(osx_msg);
}
pub const __sort_noescape = __attribute__(__noescape__);
pub const _USE_FORTIFY_LEVEL = 2;
pub fn __darwin_obsz0(object: anytype) callconv(.Inline) @TypeOf(__builtin_object_size(object, 0)) {
    return __builtin_object_size(object, 0);
}
pub fn __darwin_obsz(object: anytype) callconv(.Inline) @TypeOf(__builtin_object_size(object, if (_USE_FORTIFY_LEVEL > 1) 1 else 0)) {
    return __builtin_object_size(object, if (_USE_FORTIFY_LEVEL > 1) 1 else 0);
}
pub const __HAS_FIXED_CHK_PROTOTYPES = 1;
pub const _CACHED_RUNES = 1 << 8;
pub const _CRMASK = ~(_CACHED_RUNES - 1);
pub const _RUNE_MAGIC_A = "RuneMagA";
pub const _CTYPE_A = @as(c_long, 0x00000100);
pub const _CTYPE_C = @as(c_long, 0x00000200);
pub const _CTYPE_D = @as(c_long, 0x00000400);
pub const _CTYPE_G = @as(c_long, 0x00000800);
pub const _CTYPE_L = @as(c_long, 0x00001000);
pub const _CTYPE_P = @as(c_long, 0x00002000);
pub const _CTYPE_S = @as(c_long, 0x00004000);
pub const _CTYPE_U = @as(c_long, 0x00008000);
pub const _CTYPE_X = @as(c_long, 0x00010000);
pub const _CTYPE_B = @as(c_long, 0x00020000);
pub const _CTYPE_R = @as(c_long, 0x00040000);
pub const _CTYPE_I = @as(c_long, 0x00080000);
pub const _CTYPE_T = @as(c_long, 0x00100000);
pub const _CTYPE_Q = @as(c_long, 0x00200000);
pub const _CTYPE_SW0 = @as(c_long, 0x20000000);
pub const _CTYPE_SW1 = @as(c_long, 0x40000000);
pub const _CTYPE_SW2 = @as(c_long, 0x80000000);
pub const _CTYPE_SW3 = @as(c_long, 0xc0000000);
pub const _CTYPE_SWM = @as(c_long, 0xe0000000);
pub const _CTYPE_SWS = 30;
pub const __DARWIN_CTYPE_inline = __header_inline;
pub const __DARWIN_CTYPE_TOP_inline = __header_inline;
pub fn _tolower(c: anytype) callconv(.Inline) @TypeOf(__tolower(c)) {
    return __tolower(c);
}
pub fn _toupper(c: anytype) callconv(.Inline) @TypeOf(__toupper(c)) {
    return __toupper(c);
}
pub fn major(x: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(i32, ((@import("std").meta.cast(u_int32_t, x)) >> 24) & 0xff))) {
    return (@import("std").meta.cast(i32, ((@import("std").meta.cast(u_int32_t, x)) >> 24) & 0xff));
}
pub fn minor(x: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(i32, x & 0xffffff))) {
    return (@import("std").meta.cast(i32, x & 0xffffff));
}
pub fn makedev(x: anytype, y: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(dev_t, (x << 24) | y))) {
    return (@import("std").meta.cast(dev_t, (x << 24) | y));
}
pub const __DARWIN_FD_SETSIZE = 1024;
pub const __DARWIN_NBBY = 8;
pub const __DARWIN_NFDBITS = @import("std").meta.sizeof(__int32_t) * __DARWIN_NBBY;
pub fn __DARWIN_howmany(x: anytype, y: anytype) callconv(.Inline) @TypeOf(if ((x % y) == 0) x / y else (x / y) + 1) {
    return if ((x % y) == 0) x / y else (x / y) + 1;
}
pub fn __DARWIN_FD_SET(n: anytype, p: anytype) callconv(.Inline) @TypeOf(__darwin_fd_set(n, p)) {
    return __darwin_fd_set(n, p);
}
pub fn __DARWIN_FD_CLR(n: anytype, p: anytype) callconv(.Inline) @TypeOf(__darwin_fd_clr(n, p)) {
    return __darwin_fd_clr(n, p);
}
pub fn __DARWIN_FD_ISSET(n: anytype, p: anytype) callconv(.Inline) @TypeOf(__darwin_fd_isset(n, p)) {
    return __darwin_fd_isset(n, p);
}
pub fn __DARWIN_FD_ZERO(p: anytype) callconv(.Inline) @TypeOf(__builtin_bzero(p, @import("std").meta.sizeof(p.*))) {
    return __builtin_bzero(p, @import("std").meta.sizeof(p.*));
}
pub fn __DARWIN_FD_COPY(f: anytype, t: anytype) callconv(.Inline) @TypeOf(bcopy(f, t, @import("std").meta.sizeof(f.*))) {
    return bcopy(f, t, @import("std").meta.sizeof(f.*));
}
pub const NBBY = __DARWIN_NBBY;
pub const NFDBITS = __DARWIN_NFDBITS;
pub fn howmany(x: anytype, y: anytype) callconv(.Inline) @TypeOf(__DARWIN_howmany(x, y)) {
    return __DARWIN_howmany(x, y);
}
pub const FD_SETSIZE = __DARWIN_FD_SETSIZE;
pub fn FD_SET(n: anytype, p: anytype) callconv(.Inline) @TypeOf(__DARWIN_FD_SET(n, p)) {
    return __DARWIN_FD_SET(n, p);
}
pub fn FD_CLR(n: anytype, p: anytype) callconv(.Inline) @TypeOf(__DARWIN_FD_CLR(n, p)) {
    return __DARWIN_FD_CLR(n, p);
}
pub fn FD_ZERO(p: anytype) callconv(.Inline) @TypeOf(__DARWIN_FD_ZERO(p)) {
    return __DARWIN_FD_ZERO(p);
}
pub fn FD_ISSET(n: anytype, p: anytype) callconv(.Inline) @TypeOf(__DARWIN_FD_ISSET(n, p)) {
    return __DARWIN_FD_ISSET(n, p);
}
pub fn FD_COPY(f: anytype, t: anytype) callconv(.Inline) @TypeOf(__DARWIN_FD_COPY(f, t)) {
    return __DARWIN_FD_COPY(f, t);
}
pub const __PRI_8_LENGTH_MODIFIER__ = "hh";
pub const __PRI_64_LENGTH_MODIFIER__ = "ll";
pub const __SCN_64_LENGTH_MODIFIER__ = "ll";
pub const __PRI_MAX_LENGTH_MODIFIER__ = "j";
pub const __SCN_MAX_LENGTH_MODIFIER__ = "j";
pub const PRId8 = __PRI_8_LENGTH_MODIFIER__ ++ "d";
pub const PRIi8 = __PRI_8_LENGTH_MODIFIER__ ++ "i";
pub const PRIo8 = __PRI_8_LENGTH_MODIFIER__ ++ "o";
pub const PRIu8 = __PRI_8_LENGTH_MODIFIER__ ++ "u";
pub const PRIx8 = __PRI_8_LENGTH_MODIFIER__ ++ "x";
pub const PRIX8 = __PRI_8_LENGTH_MODIFIER__ ++ "X";
pub const PRId16 = "hd";
pub const PRIi16 = "hi";
pub const PRIo16 = "ho";
pub const PRIu16 = "hu";
pub const PRIx16 = "hx";
pub const PRIX16 = "hX";
pub const PRId32 = "d";
pub const PRIi32 = "i";
pub const PRIo32 = "o";
pub const PRIu32 = "u";
pub const PRIx32 = "x";
pub const PRIX32 = "X";
pub const PRId64 = __PRI_64_LENGTH_MODIFIER__ ++ "d";
pub const PRIi64 = __PRI_64_LENGTH_MODIFIER__ ++ "i";
pub const PRIo64 = __PRI_64_LENGTH_MODIFIER__ ++ "o";
pub const PRIu64 = __PRI_64_LENGTH_MODIFIER__ ++ "u";
pub const PRIx64 = __PRI_64_LENGTH_MODIFIER__ ++ "x";
pub const PRIX64 = __PRI_64_LENGTH_MODIFIER__ ++ "X";
pub const PRIdLEAST8 = PRId8;
pub const PRIiLEAST8 = PRIi8;
pub const PRIoLEAST8 = PRIo8;
pub const PRIuLEAST8 = PRIu8;
pub const PRIxLEAST8 = PRIx8;
pub const PRIXLEAST8 = PRIX8;
pub const PRIdLEAST16 = PRId16;
pub const PRIiLEAST16 = PRIi16;
pub const PRIoLEAST16 = PRIo16;
pub const PRIuLEAST16 = PRIu16;
pub const PRIxLEAST16 = PRIx16;
pub const PRIXLEAST16 = PRIX16;
pub const PRIdLEAST32 = PRId32;
pub const PRIiLEAST32 = PRIi32;
pub const PRIoLEAST32 = PRIo32;
pub const PRIuLEAST32 = PRIu32;
pub const PRIxLEAST32 = PRIx32;
pub const PRIXLEAST32 = PRIX32;
pub const PRIdLEAST64 = PRId64;
pub const PRIiLEAST64 = PRIi64;
pub const PRIoLEAST64 = PRIo64;
pub const PRIuLEAST64 = PRIu64;
pub const PRIxLEAST64 = PRIx64;
pub const PRIXLEAST64 = PRIX64;
pub const PRIdFAST8 = PRId8;
pub const PRIiFAST8 = PRIi8;
pub const PRIoFAST8 = PRIo8;
pub const PRIuFAST8 = PRIu8;
pub const PRIxFAST8 = PRIx8;
pub const PRIXFAST8 = PRIX8;
pub const PRIdFAST16 = PRId16;
pub const PRIiFAST16 = PRIi16;
pub const PRIoFAST16 = PRIo16;
pub const PRIuFAST16 = PRIu16;
pub const PRIxFAST16 = PRIx16;
pub const PRIXFAST16 = PRIX16;
pub const PRIdFAST32 = PRId32;
pub const PRIiFAST32 = PRIi32;
pub const PRIoFAST32 = PRIo32;
pub const PRIuFAST32 = PRIu32;
pub const PRIxFAST32 = PRIx32;
pub const PRIXFAST32 = PRIX32;
pub const PRIdFAST64 = PRId64;
pub const PRIiFAST64 = PRIi64;
pub const PRIoFAST64 = PRIo64;
pub const PRIuFAST64 = PRIu64;
pub const PRIxFAST64 = PRIx64;
pub const PRIXFAST64 = PRIX64;
pub const PRIdPTR = "ld";
pub const PRIiPTR = "li";
pub const PRIoPTR = "lo";
pub const PRIuPTR = "lu";
pub const PRIxPTR = "lx";
pub const PRIXPTR = "lX";
pub const PRIdMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "d";
pub const PRIiMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "i";
pub const PRIoMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "o";
pub const PRIuMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "u";
pub const PRIxMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "x";
pub const PRIXMAX = __PRI_MAX_LENGTH_MODIFIER__ ++ "X";
pub const SCNd8 = __PRI_8_LENGTH_MODIFIER__ ++ "d";
pub const SCNi8 = __PRI_8_LENGTH_MODIFIER__ ++ "i";
pub const SCNo8 = __PRI_8_LENGTH_MODIFIER__ ++ "o";
pub const SCNu8 = __PRI_8_LENGTH_MODIFIER__ ++ "u";
pub const SCNx8 = __PRI_8_LENGTH_MODIFIER__ ++ "x";
pub const SCNd16 = "hd";
pub const SCNi16 = "hi";
pub const SCNo16 = "ho";
pub const SCNu16 = "hu";
pub const SCNx16 = "hx";
pub const SCNd32 = "d";
pub const SCNi32 = "i";
pub const SCNo32 = "o";
pub const SCNu32 = "u";
pub const SCNx32 = "x";
pub const SCNd64 = __SCN_64_LENGTH_MODIFIER__ ++ "d";
pub const SCNi64 = __SCN_64_LENGTH_MODIFIER__ ++ "i";
pub const SCNo64 = __SCN_64_LENGTH_MODIFIER__ ++ "o";
pub const SCNu64 = __SCN_64_LENGTH_MODIFIER__ ++ "u";
pub const SCNx64 = __SCN_64_LENGTH_MODIFIER__ ++ "x";
pub const SCNdLEAST8 = SCNd8;
pub const SCNiLEAST8 = SCNi8;
pub const SCNoLEAST8 = SCNo8;
pub const SCNuLEAST8 = SCNu8;
pub const SCNxLEAST8 = SCNx8;
pub const SCNdLEAST16 = SCNd16;
pub const SCNiLEAST16 = SCNi16;
pub const SCNoLEAST16 = SCNo16;
pub const SCNuLEAST16 = SCNu16;
pub const SCNxLEAST16 = SCNx16;
pub const SCNdLEAST32 = SCNd32;
pub const SCNiLEAST32 = SCNi32;
pub const SCNoLEAST32 = SCNo32;
pub const SCNuLEAST32 = SCNu32;
pub const SCNxLEAST32 = SCNx32;
pub const SCNdLEAST64 = SCNd64;
pub const SCNiLEAST64 = SCNi64;
pub const SCNoLEAST64 = SCNo64;
pub const SCNuLEAST64 = SCNu64;
pub const SCNxLEAST64 = SCNx64;
pub const SCNdFAST8 = SCNd8;
pub const SCNiFAST8 = SCNi8;
pub const SCNoFAST8 = SCNo8;
pub const SCNuFAST8 = SCNu8;
pub const SCNxFAST8 = SCNx8;
pub const SCNdFAST16 = SCNd16;
pub const SCNiFAST16 = SCNi16;
pub const SCNoFAST16 = SCNo16;
pub const SCNuFAST16 = SCNu16;
pub const SCNxFAST16 = SCNx16;
pub const SCNdFAST32 = SCNd32;
pub const SCNiFAST32 = SCNi32;
pub const SCNoFAST32 = SCNo32;
pub const SCNuFAST32 = SCNu32;
pub const SCNxFAST32 = SCNx32;
pub const SCNdFAST64 = SCNd64;
pub const SCNiFAST64 = SCNi64;
pub const SCNoFAST64 = SCNo64;
pub const SCNuFAST64 = SCNu64;
pub const SCNxFAST64 = SCNx64;
pub const SCNdPTR = "ld";
pub const SCNiPTR = "li";
pub const SCNoPTR = "lo";
pub const SCNuPTR = "lu";
pub const SCNxPTR = "lx";
pub const SCNdMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "d";
pub const SCNiMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "i";
pub const SCNoMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "o";
pub const SCNuMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "u";
pub const SCNxMAX = __SCN_MAX_LENGTH_MODIFIER__ ++ "x";
pub const xmemset = memset;
pub const xmemcpy = memcpy;
pub const xmemmove = memmove;
pub fn MIN(a: anytype, b: anytype) callconv(.Inline) @TypeOf(if (a > b) b else a) {
    return if (a > b) b else a;
}
pub fn MAX(a: anytype, b: anytype) callconv(.Inline) @TypeOf(if (a < b) b else a) {
    return if (a < b) b else a;
}
pub fn IS_NULL(p: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(?*c_void, p)) == (@import("std").meta.cast(?*c_void, 0))) {
    return (@import("std").meta.cast(?*c_void, p)) == (@import("std").meta.cast(?*c_void, 0));
}
pub fn IS_NOT_NULL(p: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(?*c_void, p)) != (@import("std").meta.cast(?*c_void, 0))) {
    return (@import("std").meta.cast(?*c_void, p)) != (@import("std").meta.cast(?*c_void, 0));
}
pub const NULL_UCHARP = (@import("std").meta.cast([*c]UChar, 0));
pub fn PTR_GE(p: anytype, q: anytype) callconv(.Inline) @TypeOf((p != NULL) and (p >= q)) {
    return (p != NULL) and (p >= q);
}
pub const ONIG_INT_MAX = INT_MAX;
pub const CHAR_MAP_SIZE = 256;
pub const INFINITE_LEN = ONIG_INFINITE_DISTANCE;
pub const STEP_BACK_MAX_CHAR_LEN = 65535;
pub const LOOK_BEHIND_MAX_CHAR_LEN = STEP_BACK_MAX_CHAR_LEN;
pub const xmalloc = malloc;
pub const xrealloc = realloc;
pub const xcalloc = calloc;
pub const xfree = free;
pub const st_init_table = onig_st_init_table;
pub const st_init_table_with_size = onig_st_init_table_with_size;
pub const st_init_numtable = onig_st_init_numtable;
pub const st_init_numtable_with_size = onig_st_init_numtable_with_size;
pub const st_init_strtable = onig_st_init_strtable;
pub const st_init_strtable_with_size = onig_st_init_strtable_with_size;
pub const st_delete = onig_st_delete;
pub const st_delete_safe = onig_st_delete_safe;
pub const st_insert = onig_st_insert;
pub const st_lookup = onig_st_lookup;
pub const st_foreach = onig_st_foreach;
pub const st_add_direct = onig_st_add_direct;
pub const st_free_table = onig_st_free_table;
pub const st_cleanup_safe = onig_st_cleanup_safe;
pub const st_copy = onig_st_copy;
pub const st_nothing_key_clone = onig_st_nothing_key_clone;
pub const st_nothing_key_free = onig_st_nothing_key_free;
pub const onig_st_is_member = st_is_member;
pub const xalloca = alloca;
pub const xvsnprintf = vsnprintf;
pub const xsnprintf = snprintf;
pub fn xstrcat(dest: anytype, src: anytype, size: anytype) callconv(.Inline) @TypeOf(strcat(dest, src)) {
    return strcat(dest, src);
}
pub const MEM_STATUS_BITS_NUM = @import("std").meta.sizeof(MemStatusType) * 8;
pub fn MEM_STATUS_AT(stats: anytype, n: anytype) callconv(.Inline) @TypeOf(n < (@import("std").meta.cast(c_int, if (MEM_STATUS_BITS_NUM) stats & (@import("std").meta.cast(MemStatusType, 1 << n)) else stats & 1))) {
    return n < (@import("std").meta.cast(c_int, if (MEM_STATUS_BITS_NUM) stats & (@import("std").meta.cast(MemStatusType, 1 << n)) else stats & 1));
}
pub fn MEM_STATUS_AT0(stats: anytype, n: anytype) callconv(.Inline) @TypeOf((n > 0) and (n < (@import("std").meta.cast(c_int, if (MEM_STATUS_BITS_NUM) stats & (@import("std").meta.cast(MemStatusType, 1 << n)) else stats & 1)))) {
    return (n > 0) and (n < (@import("std").meta.cast(c_int, if (MEM_STATUS_BITS_NUM) stats & (@import("std").meta.cast(MemStatusType, 1 << n)) else stats & 1)));
}
pub fn MEM_STATUS_IS_ALL_ON(stats: anytype) callconv(.Inline) @TypeOf((stats & 1) != 0) {
    return (stats & 1) != 0;
}
pub fn MEM_STATUS_LIMIT_AT(stats: anytype, n: anytype) callconv(.Inline) @TypeOf(n < (@import("std").meta.cast(c_int, if (MEM_STATUS_BITS_NUM) stats & (@import("std").meta.cast(MemStatusType, 1 << n)) else 0))) {
    return n < (@import("std").meta.cast(c_int, if (MEM_STATUS_BITS_NUM) stats & (@import("std").meta.cast(MemStatusType, 1 << n)) else 0));
}
pub fn IS_CODE_WORD_ASCII(enc: anytype, code: anytype) callconv(.Inline) @TypeOf((ONIGENC_IS_CODE_ASCII(code) != 0) and (ONIGENC_IS_CODE_WORD(enc, code) != 0)) {
    return (ONIGENC_IS_CODE_ASCII(code) != 0) and (ONIGENC_IS_CODE_WORD(enc, code) != 0);
}
pub fn IS_CODE_DIGIT_ASCII(enc: anytype, code: anytype) callconv(.Inline) @TypeOf((ONIGENC_IS_CODE_ASCII(code) != 0) and (ONIGENC_IS_CODE_DIGIT(enc, code) != 0)) {
    return (ONIGENC_IS_CODE_ASCII(code) != 0) and (ONIGENC_IS_CODE_DIGIT(enc, code) != 0);
}
pub fn IS_CODE_XDIGIT_ASCII(enc: anytype, code: anytype) callconv(.Inline) @TypeOf((ONIGENC_IS_CODE_ASCII(code) != 0) and (ONIGENC_IS_CODE_XDIGIT(enc, code) != 0)) {
    return (ONIGENC_IS_CODE_ASCII(code) != 0) and (ONIGENC_IS_CODE_XDIGIT(enc, code) != 0);
}
pub fn DIGITVAL(code: anytype) callconv(.Inline) @TypeOf(code - '0') {
    return code - '0';
}
pub fn ODIGITVAL(code: anytype) callconv(.Inline) @TypeOf(DIGITVAL(code)) {
    return DIGITVAL(code);
}
pub fn XDIGITVAL(enc: anytype, code: anytype) callconv(.Inline) @TypeOf(if (IS_CODE_DIGIT_ASCII(enc, code)) DIGITVAL(code) else if (ONIGENC_IS_CODE_UPPER(enc, code)) (code - 'A') + 10 else (code - 'a') + 10) {
    return if (IS_CODE_DIGIT_ASCII(enc, code)) DIGITVAL(code) else if (ONIGENC_IS_CODE_UPPER(enc, code)) (code - 'A') + 10 else (code - 'a') + 10;
}
pub fn OPTON_FIND_LONGEST(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_FIND_LONGEST) {
    return option & ONIG_OPTION_FIND_LONGEST;
}
pub fn OPTON_FIND_NOT_EMPTY(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_FIND_NOT_EMPTY) {
    return option & ONIG_OPTION_FIND_NOT_EMPTY;
}
pub fn OPTON_FIND_CONDITION(option: anytype) callconv(.Inline) @TypeOf(option & (ONIG_OPTION_FIND_LONGEST | ONIG_OPTION_FIND_NOT_EMPTY)) {
    return option & (ONIG_OPTION_FIND_LONGEST | ONIG_OPTION_FIND_NOT_EMPTY);
}
pub fn OPTON_NEGATE_SINGLELINE(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_NEGATE_SINGLELINE) {
    return option & ONIG_OPTION_NEGATE_SINGLELINE;
}
pub fn OPTON_DONT_CAPTURE_GROUP(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_DONT_CAPTURE_GROUP) {
    return option & ONIG_OPTION_DONT_CAPTURE_GROUP;
}
pub fn OPTON_CAPTURE_GROUP(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_CAPTURE_GROUP) {
    return option & ONIG_OPTION_CAPTURE_GROUP;
}
pub fn OPTON_NOTBOL(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_NOTBOL) {
    return option & ONIG_OPTION_NOTBOL;
}
pub fn OPTON_NOTEOL(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_NOTEOL) {
    return option & ONIG_OPTION_NOTEOL;
}
pub fn OPTON_POSIX_REGION(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_POSIX_REGION) {
    return option & ONIG_OPTION_POSIX_REGION;
}
pub fn OPTON_CHECK_VALIDITY_OF_STRING(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_CHECK_VALIDITY_OF_STRING) {
    return option & ONIG_OPTION_CHECK_VALIDITY_OF_STRING;
}
pub fn OPTON_NOT_BEGIN_STRING(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_NOT_BEGIN_STRING) {
    return option & ONIG_OPTION_NOT_BEGIN_STRING;
}
pub fn OPTON_NOT_END_STRING(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_NOT_END_STRING) {
    return option & ONIG_OPTION_NOT_END_STRING;
}
pub fn OPTON_NOT_BEGIN_POSITION(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_NOT_BEGIN_POSITION) {
    return option & ONIG_OPTION_NOT_BEGIN_POSITION;
}
pub const INFINITE_REPEAT = -1;
pub fn IS_INFINITE_REPEAT(n: anytype) callconv(.Inline) @TypeOf(n == INFINITE_REPEAT) {
    return n == INFINITE_REPEAT;
}
pub const BITS_PER_BYTE = 8;
pub const SINGLE_BYTE_SIZE = 1 << BITS_PER_BYTE;
pub const BITS_IN_ROOM = 32;
pub const BITSET_REAL_SIZE = SINGLE_BYTE_SIZE / BITS_IN_ROOM;
pub const SIZE_BITSET = @import("std").meta.sizeof(BitSet);
pub fn BS_ROOM(bs: anytype, pos: anytype) callconv(.Inline) @TypeOf(bs[(@import("std").meta.cast(c_uint, pos)) >> 5]) {
    return bs[(@import("std").meta.cast(c_uint, pos)) >> 5];
}
pub fn BS_BIT(pos: anytype) callconv(.Inline) @TypeOf(@as(c_uint, 1) << ((@import("std").meta.cast(c_uint, pos)) & 0x1f)) {
    return @as(c_uint, 1) << ((@import("std").meta.cast(c_uint, pos)) & 0x1f);
}
pub fn BITSET_AT(bs: anytype, pos: anytype) callconv(.Inline) @TypeOf(BS_ROOM(bs, pos) & BS_BIT(pos)) {
    return BS_ROOM(bs, pos) & BS_BIT(pos);
}
pub fn BB_INIT(buf: anytype, size: anytype) callconv(.Inline) @TypeOf(bbuf_init((@import("std").meta.cast([*c]BBuf, buf)), size)) {
    return bbuf_init((@import("std").meta.cast([*c]BBuf, buf)), size);
}
pub fn BB_ADD(buf: anytype, bytes: anytype, n: anytype) callconv(.Inline) @TypeOf(BB_WRITE(buf, buf.*.used, bytes, n)) {
    return BB_WRITE(buf, buf.*.used, bytes, n);
}
pub fn BB_ADD1(buf: anytype, byte: anytype) callconv(.Inline) @TypeOf(BB_WRITE1(buf, buf.*.used, byte)) {
    return BB_WRITE1(buf, buf.*.used, byte);
}
pub fn BB_GET_ADD_ADDRESS(buf: anytype) callconv(.Inline) @TypeOf((buf.*.p) + (buf.*.used)) {
    return (buf.*.p) + (buf.*.used);
}
pub fn BB_GET_OFFSET_POS(buf: anytype) callconv(.Inline) @TypeOf(buf.*.used) {
    return buf.*.used;
}
pub fn BB_GET_BYTE(buf: anytype, pos: anytype) callconv(.Inline) @TypeOf(buf.*.p[pos]) {
    return buf.*.p[pos];
}
pub const ANCR_PREC_READ = 1 << 0;
pub const ANCR_PREC_READ_NOT = 1 << 1;
pub const ANCR_LOOK_BEHIND = 1 << 2;
pub const ANCR_LOOK_BEHIND_NOT = 1 << 3;
pub const ANCR_BEGIN_BUF = 1 << 4;
pub const ANCR_BEGIN_LINE = 1 << 5;
pub const ANCR_BEGIN_POSITION = 1 << 6;
pub const ANCR_END_BUF = 1 << 7;
pub const ANCR_SEMI_END_BUF = 1 << 8;
pub const ANCR_END_LINE = 1 << 9;
pub const ANCR_WORD_BOUNDARY = 1 << 10;
pub const ANCR_NO_WORD_BOUNDARY = 1 << 11;
pub const ANCR_WORD_BEGIN = 1 << 12;
pub const ANCR_WORD_END = 1 << 13;
pub const ANCR_ANYCHAR_INF = 1 << 14;
pub const ANCR_ANYCHAR_INF_ML = 1 << 15;
pub const ANCR_TEXT_SEGMENT_BOUNDARY = 1 << 16;
pub const ANCR_NO_TEXT_SEGMENT_BOUNDARY = 1 << 17;
pub fn ANCHOR_HAS_BODY(a: anytype) callconv(.Inline) @TypeOf((a.*.type) < ANCR_BEGIN_BUF) {
    return (a.*.type) < ANCR_BEGIN_BUF;
}
pub fn IS_WORD_ANCHOR_TYPE(type_1: anytype) callconv(.Inline) @TypeOf((((type_1 == ANCR_WORD_BOUNDARY) or (type_1 == ANCR_NO_WORD_BOUNDARY)) or (type_1 == ANCR_WORD_BEGIN)) or (type_1 == ANCR_WORD_END)) {
    return (((type_1 == ANCR_WORD_BOUNDARY) or (type_1 == ANCR_NO_WORD_BOUNDARY)) or (type_1 == ANCR_WORD_BEGIN)) or (type_1 == ANCR_WORD_END);
}
pub const SIZE_OPCODE = 1;
pub const SIZE_RELADDR = @import("std").meta.sizeof(RelAddrType);
pub const SIZE_ABSADDR = @import("std").meta.sizeof(AbsAddrType);
pub const SIZE_LENGTH = @import("std").meta.sizeof(LengthType);
pub const SIZE_MEMNUM = @import("std").meta.sizeof(MemNumType);
pub const SIZE_REPEATNUM = @import("std").meta.sizeof(RepeatNumType);
pub const SIZE_OPTION = @import("std").meta.sizeof(OnigOptionType);
pub const SIZE_CODE_POINT = @import("std").meta.sizeof(OnigCodePoint);
pub const SIZE_POINTER = @import("std").meta.sizeof(PointerType);
pub const SIZE_SAVE_TYPE = @import("std").meta.sizeof(SaveType);
pub const SIZE_UPDATE_VAR_TYPE = @import("std").meta.sizeof(UpdateVarType);
pub const SIZE_MODE = @import("std").meta.sizeof(ModeType);
pub const SIZE_INC = 1;
pub const OPSIZE_ANYCHAR_STAR = 1;
pub const OPSIZE_ANYCHAR_STAR_PEEK_NEXT = 1;
pub const OPSIZE_JUMP = 1;
pub const OPSIZE_PUSH = 1;
pub const OPSIZE_PUSH_SUPER = 1;
pub const OPSIZE_POP = 1;
pub const OPSIZE_POP_TO_MARK = 1;
pub const OPSIZE_PUSH_OR_JUMP_EXACT1 = 1;
pub const OPSIZE_PUSH_IF_PEEK_NEXT = 1;
pub const OPSIZE_REPEAT = 1;
pub const OPSIZE_REPEAT_INC = 1;
pub const OPSIZE_REPEAT_INC_NG = 1;
pub const OPSIZE_WORD_BOUNDARY = 1;
pub const OPSIZE_BACKREF = 1;
pub const OPSIZE_FAIL = 1;
pub const OPSIZE_MEM_START = 1;
pub const OPSIZE_MEM_START_PUSH = 1;
pub const OPSIZE_MEM_END_PUSH = 1;
pub const OPSIZE_MEM_END_PUSH_REC = 1;
pub const OPSIZE_MEM_END = 1;
pub const OPSIZE_MEM_END_REC = 1;
pub const OPSIZE_EMPTY_CHECK_START = 1;
pub const OPSIZE_EMPTY_CHECK_END = 1;
pub const OPSIZE_CHECK_POSITION = 1;
pub const OPSIZE_CALL = 1;
pub const OPSIZE_RETURN = 1;
pub const OPSIZE_MOVE = 1;
pub const OPSIZE_STEP_BACK_START = 1;
pub const OPSIZE_STEP_BACK_NEXT = 1;
pub const OPSIZE_CUT_TO_MARK = 1;
pub const OPSIZE_MARK = 1;
pub const OPSIZE_SAVE_VAL = 1;
pub const OPSIZE_UPDATE_VAR = 1;
pub const OPSIZE_CALLOUT_CONTENTS = 1;
pub const OPSIZE_CALLOUT_NAME = 1;
pub fn MC_ESC(syn: anytype) callconv(.Inline) @TypeOf(syn.*.meta_char_table.esc) {
    return syn.*.meta_char_table.esc;
}
pub fn MC_ANYCHAR(syn: anytype) callconv(.Inline) @TypeOf(syn.*.meta_char_table.anychar) {
    return syn.*.meta_char_table.anychar;
}
pub fn MC_ANYTIME(syn: anytype) callconv(.Inline) @TypeOf(syn.*.meta_char_table.anytime) {
    return syn.*.meta_char_table.anytime;
}
pub fn MC_ZERO_OR_ONE_TIME(syn: anytype) callconv(.Inline) @TypeOf(syn.*.meta_char_table.zero_or_one_time) {
    return syn.*.meta_char_table.zero_or_one_time;
}
pub fn MC_ONE_OR_MORE_TIME(syn: anytype) callconv(.Inline) @TypeOf(syn.*.meta_char_table.one_or_more_time) {
    return syn.*.meta_char_table.one_or_more_time;
}
pub fn MC_ANYCHAR_ANYTIME(syn: anytype) callconv(.Inline) @TypeOf(syn.*.meta_char_table.anychar_anytime) {
    return syn.*.meta_char_table.anychar_anytime;
}
pub fn IS_MC_ESC_CODE(code: anytype, syn: anytype) callconv(.Inline) @TypeOf((code == MC_ESC(syn)) and !(IS_SYNTAX_OP2(syn, ONIG_SYN_OP2_INEFFECTIVE_ESCAPE) != 0)) {
    return (code == MC_ESC(syn)) and !(IS_SYNTAX_OP2(syn, ONIG_SYN_OP2_INEFFECTIVE_ESCAPE) != 0);
}
pub const SYN_POSIX_COMMON_OP = (((((ONIG_SYN_OP_DOT_ANYCHAR | ONIG_SYN_OP_POSIX_BRACKET) | ONIG_SYN_OP_DECIMAL_BACKREF) | ONIG_SYN_OP_BRACKET_CC) | ONIG_SYN_OP_ASTERISK_ZERO_INF) | ONIG_SYN_OP_LINE_ANCHOR) | ONIG_SYN_OP_ESC_CONTROL_CHARS;
pub const SYN_GNU_REGEX_OP = ((((((((((((((((ONIG_SYN_OP_DOT_ANYCHAR | ONIG_SYN_OP_BRACKET_CC) | ONIG_SYN_OP_POSIX_BRACKET) | ONIG_SYN_OP_DECIMAL_BACKREF) | ONIG_SYN_OP_BRACE_INTERVAL) | ONIG_SYN_OP_LPAREN_SUBEXP) | ONIG_SYN_OP_VBAR_ALT) | ONIG_SYN_OP_ASTERISK_ZERO_INF) | ONIG_SYN_OP_PLUS_ONE_INF) | ONIG_SYN_OP_QMARK_ZERO_ONE) | ONIG_SYN_OP_ESC_AZ_BUF_ANCHOR) | ONIG_SYN_OP_ESC_CAPITAL_G_BEGIN_ANCHOR) | ONIG_SYN_OP_ESC_W_WORD) | ONIG_SYN_OP_ESC_B_WORD_BOUND) | ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END) | ONIG_SYN_OP_ESC_S_WHITE_SPACE) | ONIG_SYN_OP_ESC_D_DIGIT) | ONIG_SYN_OP_LINE_ANCHOR;
pub const SYN_GNU_REGEX_BV = ((((ONIG_SYN_CONTEXT_INDEP_ANCHORS | ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS) | ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS) | ONIG_SYN_ALLOW_INVALID_INTERVAL) | ONIG_SYN_BACKSLASH_ESCAPE_IN_CC) | ONIG_SYN_ALLOW_DOUBLE_RANGE_OP_IN_CC;
pub fn NCCLASS_FLAGS(cc: anytype) callconv(.Inline) @TypeOf(cc.*.flags) {
    return cc.*.flags;
}
pub fn IS_NCCLASS_FLAG_ON(cc: anytype, flag: anytype) callconv(.Inline) @TypeOf((NCCLASS_FLAGS(cc) & flag) != 0) {
    return (NCCLASS_FLAGS(cc) & flag) != 0;
}
pub const FLAG_NCCLASS_NOT = 1 << 0;
pub const FLAG_NCCLASS_SHARE = 1 << 1;
pub fn NCCLASS_SET_NOT(nd: anytype) callconv(.Inline) @TypeOf(NCCLASS_FLAG_SET(nd, FLAG_NCCLASS_NOT)) {
    return NCCLASS_FLAG_SET(nd, FLAG_NCCLASS_NOT);
}
pub fn NCCLASS_CLEAR_NOT(nd: anytype) callconv(.Inline) @TypeOf(NCCLASS_FLAG_CLEAR(nd, FLAG_NCCLASS_NOT)) {
    return NCCLASS_FLAG_CLEAR(nd, FLAG_NCCLASS_NOT);
}
pub fn IS_NCCLASS_NOT(nd: anytype) callconv(.Inline) @TypeOf(IS_NCCLASS_FLAG_ON(nd, FLAG_NCCLASS_NOT)) {
    return IS_NCCLASS_FLAG_ON(nd, FLAG_NCCLASS_NOT);
}
pub fn COP(reg: anytype) callconv(.Inline) @TypeOf(reg.*.ops_curr) {
    return reg.*.ops_curr;
}
pub fn COP_CURR_OFFSET(reg: anytype) callconv(.Inline) @TypeOf((reg.*.ops_used) - 1) {
    return (reg.*.ops_used) - 1;
}
pub fn COP_CURR_OFFSET_BYTES(reg: anytype, p: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(c_int, (@import("std").meta.cast([*c]u8, &(reg.*.ops_curr.*.p))) - (@import("std").meta.cast([*c]u8, reg.*.ops))))) {
    return (@import("std").meta.cast(c_int, (@import("std").meta.cast([*c]u8, &(reg.*.ops_curr.*.p))) - (@import("std").meta.cast([*c]u8, reg.*.ops))));
}
pub const NODE_STRING_MARGIN = 16;
pub const NODE_STRING_BUF_SIZE = 24;
pub const NODE_BACKREFS_SIZE = 6;
pub const NULL_NODE = (@import("std").meta.cast([*c]Node, 0));
pub fn NODE_TYPE2BIT(type_1: anytype) callconv(.Inline) @TypeOf(1 << type_1) {
    return 1 << type_1;
}
pub const NODE_BIT_STRING = NODE_TYPE2BIT(NODE_STRING);
pub const NODE_BIT_CCLASS = NODE_TYPE2BIT(NODE_CCLASS);
pub const NODE_BIT_CTYPE = NODE_TYPE2BIT(NODE_CTYPE);
pub const NODE_BIT_BACKREF = NODE_TYPE2BIT(NODE_BACKREF);
pub const NODE_BIT_QUANT = NODE_TYPE2BIT(NODE_QUANT);
pub const NODE_BIT_BAG = NODE_TYPE2BIT(NODE_BAG);
pub const NODE_BIT_ANCHOR = NODE_TYPE2BIT(NODE_ANCHOR);
pub const NODE_BIT_LIST = NODE_TYPE2BIT(NODE_LIST);
pub const NODE_BIT_ALT = NODE_TYPE2BIT(NODE_ALT);
pub const NODE_BIT_CALL = NODE_TYPE2BIT(NODE_CALL);
pub const NODE_BIT_GIMMICK = NODE_TYPE2BIT(NODE_GIMMICK);
pub fn NODE_TYPE(node: anytype) callconv(.Inline) @TypeOf(node.*.u.base.node_type) {
    return node.*.u.base.node_type;
}
pub fn STR_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.str)) {
    return &(node.*.u.str);
}
pub fn CCLASS_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.cclass)) {
    return &(node.*.u.cclass);
}
pub fn CTYPE_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.ctype)) {
    return &(node.*.u.ctype);
}
pub fn BACKREF_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.backref)) {
    return &(node.*.u.backref);
}
pub fn QUANT_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.quant)) {
    return &(node.*.u.quant);
}
pub fn BAG_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.bag)) {
    return &(node.*.u.bag);
}
pub fn ANCHOR_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.anchor)) {
    return &(node.*.u.anchor);
}
pub fn CONS_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.cons)) {
    return &(node.*.u.cons);
}
pub fn CALL_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.call)) {
    return &(node.*.u.call);
}
pub fn GIMMICK_(node: anytype) callconv(.Inline) @TypeOf(&(node.*.u.gimmick)) {
    return &(node.*.u.gimmick);
}
pub fn NODE_CAR(node: anytype) callconv(.Inline) @TypeOf(CONS_(node).*.car) {
    return CONS_(node).*.car;
}
pub fn NODE_CDR(node: anytype) callconv(.Inline) @TypeOf(CONS_(node).*.cdr) {
    return CONS_(node).*.cdr;
}
pub const CTYPE_ANYCHAR = -1;
pub fn NODE_IS_ANYCHAR(node: anytype) callconv(.Inline) @TypeOf((NODE_TYPE(node) == NODE_CTYPE) and ((CTYPE_(node).*.ctype) == CTYPE_ANYCHAR)) {
    return (NODE_TYPE(node) == NODE_CTYPE) and ((CTYPE_(node).*.ctype) == CTYPE_ANYCHAR);
}
pub const ANCR_ANYCHAR_INF_MASK = ANCR_ANYCHAR_INF | ANCR_ANYCHAR_INF_ML;
pub const ANCR_END_BUF_MASK = ANCR_END_BUF | ANCR_SEMI_END_BUF;
pub const NODE_STRING_CRUDE = 1 << 0;
pub const NODE_STRING_CASE_EXPANDED = 1 << 1;
pub fn NODE_STRING_LEN(node: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(c_int, (node.*.u.str.end) - (node.*.u.str.s)))) {
    return (@import("std").meta.cast(c_int, (node.*.u.str.end) - (node.*.u.str.s)));
}
pub fn NODE_STRING_IS_CRUDE(node: anytype) callconv(.Inline) @TypeOf(((node.*.u.str.flag) & NODE_STRING_CRUDE) != 0) {
    return ((node.*.u.str.flag) & NODE_STRING_CRUDE) != 0;
}
pub fn NODE_STRING_IS_CASE_EXPANDED(node: anytype) callconv(.Inline) @TypeOf(((node.*.u.str.flag) & NODE_STRING_CASE_EXPANDED) != 0) {
    return ((node.*.u.str.flag) & NODE_STRING_CASE_EXPANDED) != 0;
}
pub fn BACKREFS_P(br: anytype) callconv(.Inline) @TypeOf(if (IS_NOT_NULL(br.*.back_dynamic)) br.*.back_dynamic else br.*.back_static) {
    return if (IS_NOT_NULL(br.*.back_dynamic)) br.*.back_dynamic else br.*.back_static;
}
pub const NODE_ST_FIXED_MIN = 1 << 0;
pub const NODE_ST_FIXED_MAX = 1 << 1;
pub const NODE_ST_FIXED_CLEN = 1 << 2;
pub const NODE_ST_MARK1 = 1 << 3;
pub const NODE_ST_MARK2 = 1 << 4;
pub const NODE_ST_STRICT_REAL_REPEAT = 1 << 5;
pub const NODE_ST_RECURSION = 1 << 6;
pub const NODE_ST_CALLED = 1 << 7;
pub const NODE_ST_FIXED_ADDR = 1 << 8;
pub const NODE_ST_NAMED_GROUP = 1 << 9;
pub const NODE_ST_IN_REAL_REPEAT = 1 << 10;
pub const NODE_ST_IN_ZERO_REPEAT = 1 << 11;
pub const NODE_ST_IN_MULTI_ENTRY = 1 << 12;
pub const NODE_ST_NEST_LEVEL = 1 << 13;
pub const NODE_ST_BY_NUMBER = 1 << 14;
pub const NODE_ST_BY_NAME = 1 << 15;
pub const NODE_ST_BACKREF = 1 << 16;
pub const NODE_ST_CHECKER = 1 << 17;
pub const NODE_ST_PROHIBIT_RECURSION = 1 << 18;
pub const NODE_ST_SUPER = 1 << 19;
pub const NODE_ST_EMPTY_STATUS_CHECK = 1 << 20;
pub const NODE_ST_IGNORECASE = 1 << 21;
pub const NODE_ST_MULTILINE = 1 << 22;
pub const NODE_ST_TEXT_SEGMENT_WORD = 1 << 23;
pub const NODE_ST_ABSENT_WITH_SIDE_EFFECTS = 1 << 24;
pub const NODE_ST_FIXED_CLEN_MIN_SURE = 1 << 25;
pub const NODE_ST_REFERENCED = 1 << 26;
pub const NODE_ST_INPEEK = 1 << 27;
pub fn NODE_STATUS(node: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast([*c]Node, node)).*.u.base.status) {
    return (@import("std").meta.cast([*c]Node, node)).*.u.base.status;
}
pub fn NODE_IS_BY_NUMBER(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_BY_NUMBER) != 0) {
    return (NODE_STATUS(node) & NODE_ST_BY_NUMBER) != 0;
}
pub fn NODE_IS_IN_REAL_REPEAT(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_IN_REAL_REPEAT) != 0) {
    return (NODE_STATUS(node) & NODE_ST_IN_REAL_REPEAT) != 0;
}
pub fn NODE_IS_CALLED(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_CALLED) != 0) {
    return (NODE_STATUS(node) & NODE_ST_CALLED) != 0;
}
pub fn NODE_IS_IN_MULTI_ENTRY(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_IN_MULTI_ENTRY) != 0) {
    return (NODE_STATUS(node) & NODE_ST_IN_MULTI_ENTRY) != 0;
}
pub fn NODE_IS_RECURSION(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_RECURSION) != 0) {
    return (NODE_STATUS(node) & NODE_ST_RECURSION) != 0;
}
pub fn NODE_IS_IN_ZERO_REPEAT(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_IN_ZERO_REPEAT) != 0) {
    return (NODE_STATUS(node) & NODE_ST_IN_ZERO_REPEAT) != 0;
}
pub fn NODE_IS_NAMED_GROUP(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_NAMED_GROUP) != 0) {
    return (NODE_STATUS(node) & NODE_ST_NAMED_GROUP) != 0;
}
pub fn NODE_IS_FIXED_ADDR(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_FIXED_ADDR) != 0) {
    return (NODE_STATUS(node) & NODE_ST_FIXED_ADDR) != 0;
}
pub fn NODE_IS_FIXED_CLEN(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_FIXED_CLEN) != 0) {
    return (NODE_STATUS(node) & NODE_ST_FIXED_CLEN) != 0;
}
pub fn NODE_IS_FIXED_MIN(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_FIXED_MIN) != 0) {
    return (NODE_STATUS(node) & NODE_ST_FIXED_MIN) != 0;
}
pub fn NODE_IS_FIXED_MAX(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_FIXED_MAX) != 0) {
    return (NODE_STATUS(node) & NODE_ST_FIXED_MAX) != 0;
}
pub fn NODE_IS_MARK1(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_MARK1) != 0) {
    return (NODE_STATUS(node) & NODE_ST_MARK1) != 0;
}
pub fn NODE_IS_MARK2(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_MARK2) != 0) {
    return (NODE_STATUS(node) & NODE_ST_MARK2) != 0;
}
pub fn NODE_IS_NEST_LEVEL(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_NEST_LEVEL) != 0) {
    return (NODE_STATUS(node) & NODE_ST_NEST_LEVEL) != 0;
}
pub fn NODE_IS_BY_NAME(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_BY_NAME) != 0) {
    return (NODE_STATUS(node) & NODE_ST_BY_NAME) != 0;
}
pub fn NODE_IS_BACKREF(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_BACKREF) != 0) {
    return (NODE_STATUS(node) & NODE_ST_BACKREF) != 0;
}
pub fn NODE_IS_CHECKER(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_CHECKER) != 0) {
    return (NODE_STATUS(node) & NODE_ST_CHECKER) != 0;
}
pub fn NODE_IS_SUPER(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_SUPER) != 0) {
    return (NODE_STATUS(node) & NODE_ST_SUPER) != 0;
}
pub fn NODE_IS_PROHIBIT_RECURSION(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_PROHIBIT_RECURSION) != 0) {
    return (NODE_STATUS(node) & NODE_ST_PROHIBIT_RECURSION) != 0;
}
pub fn NODE_IS_STRICT_REAL_REPEAT(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_STRICT_REAL_REPEAT) != 0) {
    return (NODE_STATUS(node) & NODE_ST_STRICT_REAL_REPEAT) != 0;
}
pub fn NODE_IS_EMPTY_STATUS_CHECK(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_EMPTY_STATUS_CHECK) != 0) {
    return (NODE_STATUS(node) & NODE_ST_EMPTY_STATUS_CHECK) != 0;
}
pub fn NODE_IS_IGNORECASE(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_IGNORECASE) != 0) {
    return (NODE_STATUS(node) & NODE_ST_IGNORECASE) != 0;
}
pub fn NODE_IS_MULTILINE(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_MULTILINE) != 0) {
    return (NODE_STATUS(node) & NODE_ST_MULTILINE) != 0;
}
pub fn NODE_IS_TEXT_SEGMENT_WORD(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_TEXT_SEGMENT_WORD) != 0) {
    return (NODE_STATUS(node) & NODE_ST_TEXT_SEGMENT_WORD) != 0;
}
pub fn NODE_IS_ABSENT_WITH_SIDE_EFFECTS(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_ABSENT_WITH_SIDE_EFFECTS) != 0) {
    return (NODE_STATUS(node) & NODE_ST_ABSENT_WITH_SIDE_EFFECTS) != 0;
}
pub fn NODE_IS_FIXED_CLEN_MIN_SURE(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_FIXED_CLEN_MIN_SURE) != 0) {
    return (NODE_STATUS(node) & NODE_ST_FIXED_CLEN_MIN_SURE) != 0;
}
pub fn NODE_IS_REFERENCED(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_REFERENCED) != 0) {
    return (NODE_STATUS(node) & NODE_ST_REFERENCED) != 0;
}
pub fn NODE_IS_INPEEK(node: anytype) callconv(.Inline) @TypeOf((NODE_STATUS(node) & NODE_ST_INPEEK) != 0) {
    return (NODE_STATUS(node) & NODE_ST_INPEEK) != 0;
}
pub fn NODE_PARENT(node: anytype) callconv(.Inline) @TypeOf(node.*.u.base.parent) {
    return node.*.u.base.parent;
}
pub fn NODE_BODY(node: anytype) callconv(.Inline) @TypeOf(node.*.u.base.body) {
    return node.*.u.base.body;
}
pub fn NODE_QUANT_BODY(node: anytype) callconv(.Inline) @TypeOf(node.*.body) {
    return node.*.body;
}
pub fn NODE_BAG_BODY(node: anytype) callconv(.Inline) @TypeOf(node.*.body) {
    return node.*.body;
}
pub fn NODE_CALL_BODY(node: anytype) callconv(.Inline) @TypeOf(node.*.body) {
    return node.*.body;
}
pub fn NODE_ANCHOR_BODY(node: anytype) callconv(.Inline) @TypeOf(node.*.body) {
    return node.*.body;
}
pub const PARSEENV_MEMENV_SIZE = 8;
pub fn PARSEENV_MEMENV(senv: anytype) callconv(.Inline) @TypeOf(if (IS_NOT_NULL(senv.*.mem_env_dynamic)) senv.*.mem_env_dynamic else senv.*.mem_env_static) {
    return if (IS_NOT_NULL(senv.*.mem_env_dynamic)) senv.*.mem_env_dynamic else senv.*.mem_env_static;
}
pub fn IS_SYNTAX_OP(syn: anytype, opm: anytype) callconv(.Inline) @TypeOf(((syn.*.op) & opm) != 0) {
    return ((syn.*.op) & opm) != 0;
}
pub fn IS_SYNTAX_OP2(syn: anytype, opm: anytype) callconv(.Inline) @TypeOf(((syn.*.op2) & opm) != 0) {
    return ((syn.*.op2) & opm) != 0;
}
pub fn IS_SYNTAX_BV(syn: anytype, bvm: anytype) callconv(.Inline) @TypeOf(((syn.*.behavior) & bvm) != 0) {
    return ((syn.*.behavior) & bvm) != 0;
}
pub fn st_is_member(table: anytype, key: anytype) callconv(.Inline) @TypeOf(st_lookup(table, key, (@import("std").meta.cast([*c]st_data_t, 0)))) {
    return st_lookup(table, key, (@import("std").meta.cast([*c]st_data_t, 0)));
}
pub fn _(args: anytype) callconv(.Inline) @TypeOf(args) {
    return args;
}
pub const st_numcmp = ST_NUMCMP;
pub const st_numhash = ST_NUMHASH;
pub const INIT_TAG_NAMES_ALLOC_NUM = 5;
pub const WARN_BUFSIZE = 256;
pub fn IS_ALLOWED_CODE_IN_CALLOUT_NAME(c: anytype) callconv(.Inline) @TypeOf(((((c >= 'A') and (c <= 'Z')) or ((c >= 'a') and (c <= 'z'))) or ((c >= '0') and (c <= '9'))) or (c == '_')) {
    return ((((c >= 'A') and (c <= 'Z')) or ((c >= 'a') and (c <= 'z'))) or ((c >= '0') and (c <= '9'))) or (c == '_');
}
pub fn IS_ALLOWED_CODE_IN_CALLOUT_TAG_NAME(c: anytype) callconv(.Inline) @TypeOf(((((c >= 'A') and (c <= 'Z')) or ((c >= 'a') and (c <= 'z'))) or ((c >= '0') and (c <= '9'))) or (c == '_')) {
    return ((((c >= 'A') and (c <= 'Z')) or ((c >= 'a') and (c <= 'z'))) or ((c >= '0') and (c <= '9'))) or (c == '_');
}
pub fn OPTON_SINGLELINE(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_SINGLELINE) {
    return option & ONIG_OPTION_SINGLELINE;
}
pub fn OPTON_MULTILINE(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_MULTILINE) {
    return option & ONIG_OPTION_MULTILINE;
}
pub fn OPTON_IGNORECASE(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_IGNORECASE) {
    return option & ONIG_OPTION_IGNORECASE;
}
pub fn OPTON_EXTEND(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_EXTEND) {
    return option & ONIG_OPTION_EXTEND;
}
pub fn OPTON_WORD_ASCII(option: anytype) callconv(.Inline) @TypeOf(option & (ONIG_OPTION_WORD_IS_ASCII | ONIG_OPTION_POSIX_IS_ASCII)) {
    return option & (ONIG_OPTION_WORD_IS_ASCII | ONIG_OPTION_POSIX_IS_ASCII);
}
pub fn OPTON_DIGIT_ASCII(option: anytype) callconv(.Inline) @TypeOf(option & (ONIG_OPTION_DIGIT_IS_ASCII | ONIG_OPTION_POSIX_IS_ASCII)) {
    return option & (ONIG_OPTION_DIGIT_IS_ASCII | ONIG_OPTION_POSIX_IS_ASCII);
}
pub fn OPTON_SPACE_ASCII(option: anytype) callconv(.Inline) @TypeOf(option & (ONIG_OPTION_SPACE_IS_ASCII | ONIG_OPTION_POSIX_IS_ASCII)) {
    return option & (ONIG_OPTION_SPACE_IS_ASCII | ONIG_OPTION_POSIX_IS_ASCII);
}
pub fn OPTON_POSIX_ASCII(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_POSIX_IS_ASCII) {
    return option & ONIG_OPTION_POSIX_IS_ASCII;
}
pub fn OPTON_TEXT_SEGMENT_WORD(option: anytype) callconv(.Inline) @TypeOf(option & ONIG_OPTION_TEXT_SEGMENT_WORD) {
    return option & ONIG_OPTION_TEXT_SEGMENT_WORD;
}
pub fn OPTON_IS_ASCII_MODE_CTYPE(ctype: anytype, options: anytype) callconv(.Inline) @TypeOf((ctype >= 0) and (((((ctype < ONIGENC_CTYPE_ASCII) and (OPTON_POSIX_ASCII(options) != 0)) or ((ctype == ONIGENC_CTYPE_WORD) and (OPTON_WORD_ASCII(options) != 0))) or ((ctype == ONIGENC_CTYPE_DIGIT) and (OPTON_DIGIT_ASCII(options) != 0))) or ((ctype == ONIGENC_CTYPE_SPACE) and (OPTON_SPACE_ASCII(options) != 0)))) {
    return (ctype >= 0) and (((((ctype < ONIGENC_CTYPE_ASCII) and (OPTON_POSIX_ASCII(options) != 0)) or ((ctype == ONIGENC_CTYPE_WORD) and (OPTON_WORD_ASCII(options) != 0))) or ((ctype == ONIGENC_CTYPE_DIGIT) and (OPTON_DIGIT_ASCII(options) != 0))) or ((ctype == ONIGENC_CTYPE_SPACE) and (OPTON_SPACE_ASCII(options) != 0)));
}
pub const DEFAULT_MAX_CAPTURE_NUM = 32767;
pub fn MBCODE_START_POS(enc: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(OnigCodePoint, if (ONIGENC_MBC_MINLEN(enc) > 1) 0 else 0x80))) {
    return (@import("std").meta.cast(OnigCodePoint, if (ONIGENC_MBC_MINLEN(enc) > 1) 0 else 0x80));
}
pub fn SET_ALL_MULTI_BYTE_RANGE(enc: anytype, pbuf: anytype) callconv(.Inline) @TypeOf(add_code_range_to_buf(pbuf, MBCODE_START_POS(enc), ~(@import("std").meta.cast(OnigCodePoint, 0)))) {
    return add_code_range_to_buf(pbuf, MBCODE_START_POS(enc), ~(@import("std").meta.cast(OnigCodePoint, 0)));
}
pub const PEND_VALUE = 0;
pub const PFETCH_READY = UChar * pfetch_prev;
pub const PEND = if (p < end) 0 else 1;
pub const PPEEK = if (p < end) ONIGENC_MBC_TO_CODE(enc, p, end) else PEND_VALUE;
pub fn PPEEK_IS(c: anytype) callconv(.Inline) @TypeOf(PPEEK == (@import("std").meta.cast(OnigCodePoint, c))) {
    return PPEEK == (@import("std").meta.cast(OnigCodePoint, c));
}
pub const INIT_NAME_BACKREFS_ALLOC_NUM = 8;
pub const INIT_NAMES_ALLOC_NUM = 5;
pub const NAMEBUF_SIZE = 24;
pub const NAMEBUF_SIZE_1 = 25;
pub const CALLOUT_TAG_LIST_FLAG_TAG_EXIST = 1 << 0;
pub const INIT_PARSEENV_MEMENV_ALLOC_SIZE = 16;
pub const INIT_CALLOUT_LIST_NUM = 3;
pub const ID_NOT_USED_DONT_CARE_ME = 0;
pub fn IS_CODE_POINT_DIVIDE(c: anytype) callconv(.Inline) @TypeOf((c == ' ') or (c == '\n')) {
    return (c == ' ') or (c == '\n');
}
pub fn BB_WRITE_CODE_POINT(bbuf: anytype, pos: anytype, code: anytype) callconv(.Inline) @TypeOf(BB_WRITE(bbuf, pos, &code, SIZE_CODE_POINT)) {
    return BB_WRITE(bbuf, pos, &code, SIZE_CODE_POINT);
}
pub const INIT_MULTI_BYTE_RANGE_SIZE = SIZE_CODE_POINT * 5;
pub const POSIX_BRACKET_CHECK_LIMIT_LENGTH = 20;
pub const POSIX_BRACKET_NAME_MIN_LEN = 4;
pub const MAX_CALLOUT_ARG_BYTE_LENGTH = 128;
pub const OnigEncodingTypeST = struct_OnigEncodingTypeST;
pub const OnigCaptureTreeNodeStruct = struct_OnigCaptureTreeNodeStruct;
pub const re_registers = struct_re_registers;
pub const OpCode = enum_OpCode;
pub const re_pattern_buffer = struct_re_pattern_buffer;
pub const OnigRegSetStruct = struct_OnigRegSetStruct;
pub const OnigCalloutArgsStruct = struct_OnigCalloutArgsStruct;
pub const OnigMatchParamStruct = struct_OnigMatchParamStruct;
pub const PropertyNameCtype = struct_PropertyNameCtype;
pub const ByUnfoldKey = struct_ByUnfoldKey;
pub const __darwin_pthread_handler_rec = struct___darwin_pthread_handler_rec;
pub const _opaque_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const _opaque_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const _opaque_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const _opaque_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const _opaque_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const _opaque_pthread_once_t = struct__opaque_pthread_once_t;
pub const _opaque_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const _opaque_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const _opaque_pthread_t = struct__opaque_pthread_t;
pub const __darwin_i386_thread_state = struct___darwin_i386_thread_state;
pub const __darwin_fp_control = struct___darwin_fp_control;
pub const __darwin_fp_status = struct___darwin_fp_status;
pub const __darwin_mmst_reg = struct___darwin_mmst_reg;
pub const __darwin_xmm_reg = struct___darwin_xmm_reg;
pub const __darwin_ymm_reg = struct___darwin_ymm_reg;
pub const __darwin_zmm_reg = struct___darwin_zmm_reg;
pub const __darwin_opmask_reg = struct___darwin_opmask_reg;
pub const __darwin_i386_float_state = struct___darwin_i386_float_state;
pub const __darwin_i386_avx_state = struct___darwin_i386_avx_state;
pub const __darwin_i386_avx512_state = struct___darwin_i386_avx512_state;
pub const __darwin_i386_exception_state = struct___darwin_i386_exception_state;
pub const __darwin_x86_debug_state32 = struct___darwin_x86_debug_state32;
pub const __x86_pagein_state = struct___x86_pagein_state;
pub const __darwin_x86_thread_state64 = struct___darwin_x86_thread_state64;
pub const __darwin_x86_thread_full_state64 = struct___darwin_x86_thread_full_state64;
pub const __darwin_x86_float_state64 = struct___darwin_x86_float_state64;
pub const __darwin_x86_avx_state64 = struct___darwin_x86_avx_state64;
pub const __darwin_x86_avx512_state64 = struct___darwin_x86_avx512_state64;
pub const __darwin_x86_exception_state64 = struct___darwin_x86_exception_state64;
pub const __darwin_x86_debug_state64 = struct___darwin_x86_debug_state64;
pub const __darwin_x86_cpmu_state64 = struct___darwin_x86_cpmu_state64;
pub const __darwin_mcontext32 = struct___darwin_mcontext32;
pub const __darwin_mcontext_avx32 = struct___darwin_mcontext_avx32;
pub const __darwin_mcontext_avx512_32 = struct___darwin_mcontext_avx512_32;
pub const __darwin_mcontext64 = struct___darwin_mcontext64;
pub const __darwin_mcontext64_full = struct___darwin_mcontext64_full;
pub const __darwin_mcontext_avx64 = struct___darwin_mcontext_avx64;
pub const __darwin_mcontext_avx64_full = struct___darwin_mcontext_avx64_full;
pub const __darwin_mcontext_avx512_64 = struct___darwin_mcontext_avx512_64;
pub const __darwin_mcontext_avx512_64_full = struct___darwin_mcontext_avx512_64_full;
pub const __darwin_sigaltstack = struct___darwin_sigaltstack;
pub const __darwin_ucontext = struct___darwin_ucontext;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const __siginfo = struct___siginfo;
pub const __sigaction_u = union___sigaction_u;
pub const __sigaction = struct___sigaction;
pub const sigaction = struct_sigaction;
pub const sigvec = struct_sigvec;
pub const sigstack = struct_sigstack;
pub const timeval = struct_timeval;
pub const rusage = struct_rusage;
pub const rusage_info_v0 = struct_rusage_info_v0;
pub const rusage_info_v1 = struct_rusage_info_v1;
pub const rusage_info_v2 = struct_rusage_info_v2;
pub const rusage_info_v3 = struct_rusage_info_v3;
pub const rusage_info_v4 = struct_rusage_info_v4;
pub const rlimit = struct_rlimit;
pub const proc_rlimit_control_wakeupmon = struct_proc_rlimit_control_wakeupmon;
pub const StackPopLevel = enum_StackPopLevel;
pub const OptimizeType = enum_OptimizeType;
pub const _BBuf = struct__BBuf;
pub const CheckPositionType = enum_CheckPositionType;
pub const TextSegmentBoundaryType = enum_TextSegmentBoundaryType;
pub const st_hash_type = struct_st_hash_type;
pub const BagType = enum_BagType;
pub const GimmickType = enum_GimmickType;
pub const BodyEmptyType = enum_BodyEmptyType;
pub const _Node = struct__Node;
pub const st_table_entry = struct_st_table_entry;
pub const st_retval = enum_st_retval;
pub const CPS_STATE = enum_CPS_STATE;
pub const ReduceType = enum_ReduceType;
pub const TokenSyms = enum_TokenSyms;
pub const REF_NUM = enum_REF_NUM;
