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
pub fn onig_initialize(arg_encodings: [*c]OnigEncoding, arg_n: c_int) callconv(.C) c_int {
    var encodings = arg_encodings;
    var n = arg_n;
    var i: c_int = undefined;
    var r: c_int = undefined;
    if (onig_inited != @as(c_int, 0)) return 0;
    _ = onigenc_init();
    onig_inited = 1;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var enc: OnigEncoding = encodings[@intCast(c_uint, i)];
            r = onig_initialize_encoding(enc);
            if (r != @as(c_int, 0)) return r;
        }
    }
    return 0;
}
pub extern fn onig_init() c_int;
pub extern fn onig_error_code_to_str(s: [*c]OnigUChar, err_code: c_int, ...) c_int;
pub extern fn onig_is_error_code_needs_param(code: c_int) c_int;
pub extern fn onig_set_warn_func(f: OnigWarnFunc) void;
pub extern fn onig_set_verb_warn_func(f: OnigWarnFunc) void;
pub fn onig_new(arg_reg: [*c]OnigRegex, arg_pattern: [*c]const OnigUChar, arg_pattern_end: [*c]const OnigUChar, arg_option: OnigOptionType, arg_enc: OnigEncoding, arg_syntax: [*c]OnigSyntaxType, arg_einfo: [*c]OnigErrorInfo) callconv(.C) c_int {
    var reg = arg_reg;
    var pattern = arg_pattern;
    var pattern_end = arg_pattern_end;
    var option = arg_option;
    var enc = arg_enc;
    var syntax = arg_syntax;
    var einfo = arg_einfo;
    var r: c_int = undefined;
    reg.?.* = @ptrCast([*c]regex_t, @alignCast(@alignOf(regex_t), malloc(@sizeOf(regex_t))));
    if ((@ptrCast(?*c_void, (reg.?.*))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    r = onig_reg_init(reg.?.*, option, OnigDefaultCaseFoldFlag, enc, syntax);
    if (r != @as(c_int, 0)) {
        free(@ptrCast(?*c_void, reg.?.*));
        reg.?.* = null;
        return r;
    }
    r = onig_compile(reg.?.*, pattern, pattern_end, einfo);
    if (r != @as(c_int, 0)) {
        onig_free(reg.?.*);
        reg.?.* = null;
    }
    return r;
}
pub fn onig_reg_init(arg_reg: OnigRegex, arg_option: OnigOptionType, arg_case_fold_flag: OnigCaseFoldType, arg_enc: OnigEncoding, arg_syntax: [*c]OnigSyntaxType) callconv(.C) c_int {
    var reg = arg_reg;
    var option = arg_option;
    var case_fold_flag = arg_case_fold_flag;
    var enc = arg_enc;
    var syntax = arg_syntax;
    var r: c_int = undefined;
    _ = __builtin___memset_chk(@ptrCast(?*c_void, reg), @as(c_int, 0), @sizeOf(regex_t), __builtin_object_size(@ptrCast(?*const c_void, reg), @as(c_int, 0)));
    if (onig_inited == @as(c_int, 0)) {
        r = onig_initialize(&enc, @as(c_int, 1));
        if (r != @as(c_int, 0)) return -@as(c_int, 23);
        onig_warning("You didn\'t call onig_initialize() explicitly");
    }
    if ((@ptrCast(?*c_void, (reg))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 30);
    if ((enc) == (@intToPtr(OnigEncoding, @as(c_int, 0)))) return -@as(c_int, 21);
    if ((option & ((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) | ((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)))) == ((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) | ((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)))) {
        return -@as(c_int, 403);
    }
    if ((option & ((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1))) != @bitCast(c_uint, @as(c_int, 0))) {
        option |= syntax.*.options;
        option &= ~(((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1));
    } else option |= syntax.*.options;
    if ((option & (((((((((((((@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 1)) << @intCast(@import("std").math.Log2Int(c_uint), 3))) != @bitCast(c_uint, @as(c_int, 0))) {
        case_fold_flag &= @bitCast(c_uint, ~((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 30)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 20))));
        case_fold_flag |= @bitCast(c_uint, (@as(c_int, 1)));
    }
    (reg).*.enc = enc;
    (reg).*.options = option;
    (reg).*.syntax = syntax;
    (reg).*.optimize = 0;
    (reg).*.exact = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (@intToPtr(?*c_void, @as(c_int, 0)))));
    (reg).*.extp = @ptrCast([*c]RegexExt, @alignCast(@alignOf(RegexExt), (@intToPtr(?*c_void, @as(c_int, 0)))));
    (reg).*.ops = @ptrCast([*c]Operation, @alignCast(@alignOf(Operation), (@intToPtr(?*c_void, @as(c_int, 0)))));
    (reg).*.ops_curr = @ptrCast([*c]Operation, @alignCast(@alignOf(Operation), (@intToPtr(?*c_void, @as(c_int, 0)))));
    (reg).*.ops_used = @bitCast(c_uint, @as(c_int, 0));
    (reg).*.ops_alloc = @bitCast(c_uint, @as(c_int, 0));
    (reg).*.name_table = (@intToPtr(?*c_void, @as(c_int, 0)));
    (reg).*.case_fold_flag = case_fold_flag;
    return 0;
}
pub fn onig_new_without_alloc(arg_reg: OnigRegex, arg_pattern: [*c]const OnigUChar, arg_pattern_end: [*c]const OnigUChar, arg_option: OnigOptionType, arg_enc: OnigEncoding, arg_syntax: [*c]OnigSyntaxType, arg_einfo: [*c]OnigErrorInfo) callconv(.C) c_int {
    var reg = arg_reg;
    var pattern = arg_pattern;
    var pattern_end = arg_pattern_end;
    var option = arg_option;
    var enc = arg_enc;
    var syntax = arg_syntax;
    var einfo = arg_einfo;
    var r: c_int = undefined;
    r = onig_reg_init(reg, option, OnigDefaultCaseFoldFlag, enc, syntax);
    if (r != @as(c_int, 0)) return r;
    r = onig_compile(reg, pattern, pattern_end, einfo);
    return r;
}
pub extern fn onig_new_deluxe(reg: [*c]OnigRegex, pattern: [*c]const OnigUChar, pattern_end: [*c]const OnigUChar, ci: [*c]OnigCompileInfo, einfo: [*c]OnigErrorInfo) c_int;
pub fn onig_free(arg_reg: OnigRegex) callconv(.C) void {
    var reg = arg_reg;
    if ((@ptrCast(?*c_void, (reg))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        onig_free_body(reg);
        free(@ptrCast(?*c_void, reg));
    }
}
pub fn onig_free_body(arg_reg: OnigRegex) callconv(.C) void {
    var reg = arg_reg;
    if ((@ptrCast(?*c_void, (reg))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        ops_free(reg);
        if ((@ptrCast(?*c_void, (reg.*.string_pool))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            free(@ptrCast(?*c_void, reg.*.string_pool));
            reg.*.string_pool_end = blk: {
                const tmp = null;
                reg.*.string_pool = tmp;
                break :blk tmp;
            };
        }
        if ((@ptrCast(?*c_void, (reg.*.exact))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, reg.*.exact));
        if ((@ptrCast(?*c_void, (reg.*.repeat_range))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, reg.*.repeat_range));
        if ((@ptrCast(?*c_void, (reg.*.extp))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            free_regex_ext(reg.*.extp);
            reg.*.extp = null;
        }
        _ = onig_names_free(reg);
    }
}
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
pub fn onig_get_default_case_fold_flag() callconv(.C) OnigCaseFoldType {
    return OnigDefaultCaseFoldFlag;
}
pub fn onig_set_default_case_fold_flag(arg_case_fold_flag: OnigCaseFoldType) callconv(.C) c_int {
    var case_fold_flag = arg_case_fold_flag;
    OnigDefaultCaseFoldFlag = case_fold_flag;
    return 0;
}
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
pub fn onig_end() callconv(.C) c_int {
    exec_end_call_list();
    _ = onig_global_callout_names_free();
    _ = onigenc_end();
    onig_inited = 0;
    return 0;
}
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
pub fn onig_is_in_code_range(arg_p: [*c]const OnigUChar, arg_code: OnigCodePoint) callconv(.C) c_int {
    var p = arg_p;
    var code = arg_code;
    var n: OnigCodePoint = undefined;
    var data: [*c]OnigCodePoint = undefined;
    var low: OnigCodePoint = undefined;
    var high: OnigCodePoint = undefined;
    var x: OnigCodePoint = undefined;
    n = (@intToPtr([*c]OnigCodePoint, @ptrToInt((p)))).?.*;
    data = @intToPtr([*c]OnigCodePoint, @ptrToInt(p));
    data += 1;
    {
        _ = (blk: {
            low = @bitCast(OnigCodePoint, @as(c_int, 0));
            break :blk blk_1: {
                const tmp = n;
                high = tmp;
                break :blk_1 tmp;
            };
        });
        while (low < high) {
            x = (low +% high) >> @intCast(@import("std").math.Log2Int(c_uint), 1);
            if (code > data[((x *% @bitCast(c_uint, @as(c_int, 2))) +% @bitCast(c_uint, @as(c_int, 1)))]) low = (x +% @bitCast(c_uint, @as(c_int, 1))) else high = x;
        }
    }
    return (if ((low < n) and (code >= data[(low *% @bitCast(c_uint, @as(c_int, 2)))])) @as(c_int, 1) else @as(c_int, 0));
}
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
pub const hash_data_type = c_ulong;
pub const hash_table_type = ?*c_void;
const struct_unnamed_31 = extern struct {
    start: [*c]const OnigUChar,
    end: [*c]const OnigUChar,
};
const struct_unnamed_32 = extern struct {
    num: c_int,
    passed_num: c_int,
    types: [4]OnigType,
    vals: [4]OnigValue,
};
const union_unnamed_30 = extern union {
    content: struct_unnamed_31,
    arg: struct_unnamed_32,
};
const struct_unnamed_29 = extern struct {
    flag: c_int,
    of: OnigCalloutOf,
    in: c_int,
    name_id: c_int,
    tag_start: [*c]const OnigUChar,
    tag_end: [*c]const OnigUChar,
    type: OnigCalloutType,
    start_func: OnigCalloutFunc,
    end_func: OnigCalloutFunc,
    u: union_unnamed_30,
};
pub const CalloutListEntry = struct_unnamed_29;
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
const struct_unnamed_35 = extern struct {
    s: [16]OnigUChar,
};
const struct_unnamed_36 = extern struct {
    s: [*c]OnigUChar,
    n: LengthType,
};
const struct_unnamed_37 = extern struct {
    s: [*c]OnigUChar,
    n: LengthType,
    len: LengthType,
};
const struct_unnamed_38 = extern struct {
    bsp: BitSetRef,
};
const struct_unnamed_39 = extern struct {
    mb: ?*c_void,
};
const struct_unnamed_40 = extern struct {
    mb: ?*c_void,
    bsp: BitSetRef,
};
const struct_unnamed_41 = extern struct {
    c: OnigUChar,
};
const struct_unnamed_42 = extern struct {
    mode: ModeType,
};
const struct_unnamed_43 = extern struct {
    type: enum_TextSegmentBoundaryType,
    not: c_int,
};
const struct_unnamed_44 = extern struct {
    type: enum_CheckPositionType,
};
const union_unnamed_46 = extern union {
    n1: MemNumType,
    ns: [*c]MemNumType,
};
const struct_unnamed_45 = extern struct {
    unnamed_0: union_unnamed_46,
    num: c_int,
    nest_level: c_int,
};
const struct_unnamed_47 = extern struct {
    n1: MemNumType,
};
const struct_unnamed_48 = extern struct {
    num: MemNumType,
};
const struct_unnamed_49 = extern struct {
    num: MemNumType,
};
const struct_unnamed_50 = extern struct {
    addr: RelAddrType,
};
const struct_unnamed_51 = extern struct {
    addr: RelAddrType,
};
const struct_unnamed_52 = extern struct {
    addr: RelAddrType,
    c: OnigUChar,
};
const struct_unnamed_53 = extern struct {
    addr: RelAddrType,
    c: OnigUChar,
};
const struct_unnamed_54 = extern struct {
    id: MemNumType,
};
const struct_unnamed_55 = extern struct {
    id: MemNumType,
    addr: RelAddrType,
};
const struct_unnamed_56 = extern struct {
    id: MemNumType,
};
const struct_unnamed_57 = extern struct {
    mem: MemNumType,
};
const struct_unnamed_58 = extern struct {
    mem: MemNumType,
    empty_status_mem: MemStatusType,
};
const struct_unnamed_59 = extern struct {
    addr: RelAddrType,
};
const struct_unnamed_60 = extern struct {
    len: LengthType,
};
const struct_unnamed_61 = extern struct {
    len: LengthType,
    addr: RelAddrType,
};
const struct_unnamed_62 = extern struct {
    n: RelPositionType,
};
const struct_unnamed_63 = extern struct {
    initial: LengthType,
    remaining: LengthType,
    addr: RelAddrType,
};
const struct_unnamed_64 = extern struct {
    id: MemNumType,
    restore_pos: c_int,
};
const struct_unnamed_65 = extern struct {
    id: MemNumType,
    save_pos: c_int,
};
const struct_unnamed_66 = extern struct {
    type: SaveType,
    id: MemNumType,
};
const struct_unnamed_67 = extern struct {
    type: UpdateVarType,
    id: MemNumType,
    clear: c_int,
};
const struct_unnamed_68 = extern struct {
    addr: AbsAddrType,
};
const struct_unnamed_69 = extern struct {
    num: MemNumType,
};
const struct_unnamed_70 = extern struct {
    num: MemNumType,
    id: MemNumType,
};
const union_unnamed_34 = extern union {
    exact: struct_unnamed_35,
    exact_n: struct_unnamed_36,
    exact_len_n: struct_unnamed_37,
    cclass: struct_unnamed_38,
    cclass_mb: struct_unnamed_39,
    cclass_mix: struct_unnamed_40,
    anychar_star_peek_next: struct_unnamed_41,
    word_boundary: struct_unnamed_42,
    text_segment_boundary: struct_unnamed_43,
    check_position: struct_unnamed_44,
    backref_general: struct_unnamed_45,
    backref_n: struct_unnamed_47,
    memory_start: struct_unnamed_48,
    memory_end: struct_unnamed_49,
    jump: struct_unnamed_50,
    push: struct_unnamed_51,
    push_or_jump_exact1: struct_unnamed_52,
    push_if_peek_next: struct_unnamed_53,
    pop_to_mark: struct_unnamed_54,
    repeat: struct_unnamed_55,
    repeat_inc: struct_unnamed_56,
    empty_check_start: struct_unnamed_57,
    empty_check_end: struct_unnamed_58,
    prec_read_not_start: struct_unnamed_59,
    look_behind: struct_unnamed_60,
    look_behind_not_start: struct_unnamed_61,
    move: struct_unnamed_62,
    step_back_start: struct_unnamed_63,
    cut_to_mark: struct_unnamed_64,
    mark: struct_unnamed_65,
    save_val: struct_unnamed_66,
    update_var: struct_unnamed_67,
    call: struct_unnamed_68,
    callout_contents: struct_unnamed_69,
    callout_name: struct_unnamed_70,
};
const struct_unnamed_33 = extern struct {
    opaddr: ?*const c_void,
    unnamed_0: union_unnamed_34,
};
pub const Operation = struct_unnamed_33;
const struct_unnamed_71 = extern struct {
    pattern: [*c]const OnigUChar,
    pattern_end: [*c]const OnigUChar,
    tag_table: ?*c_void,
    callout_num: c_int,
    callout_list_alloc: c_int,
    callout_list: [*c]CalloutListEntry,
};
pub const RegexExt = struct_unnamed_71;
const union_unnamed_73 = extern union {
    pcode: [*c]Operation,
    offset: c_int,
};
const struct_unnamed_72 = extern struct {
    lower: c_int,
    upper: c_int,
    u: union_unnamed_73,
};
pub const RepeatRange = struct_unnamed_72;
pub fn onig_add_end_call(arg_func: ?fn () callconv(.C) void) callconv(.C) void {
    var func = arg_func;
    var item: [*c]EndCallListItemType = undefined;
    item = @ptrCast([*c]EndCallListItemType, @alignCast(@alignOf(EndCallListItemType), malloc(@sizeOf(EndCallListItemType))));
    if (item == null) return;
    item.*.next = EndCallTop;
    item.*.func = func;
    EndCallTop = item;
}
pub extern fn onig_warning(s: [*c]const u8) void;
pub extern fn onig_error_code_to_format(code: c_int) [*c]OnigUChar;
pub extern fn onig_snprintf_with_pattern(buf: [*c]OnigUChar, bufsize: c_int, enc: OnigEncoding, pat: [*c]OnigUChar, pat_end: [*c]OnigUChar, fmt: [*c]const OnigUChar, ...) void; // ./src/todo/regcomp.c:7503:5: warning: TODO implement translation of stmt class GotoStmtClass
pub const onig_compile = @compileError("unable to translate function"); // ./src/todo/regcomp.c:7427:1
pub fn onig_is_code_in_cc_len(arg_elen: c_int, arg_code: OnigCodePoint, arg_cc_arg: ?*c_void) callconv(.C) c_int {
    var elen = arg_elen;
    var code = arg_code;
    var cc_arg = arg_cc_arg;
    var found: c_int = undefined;
    var cc: [*c]CClassNode = @ptrCast([*c]CClassNode, @alignCast(@alignOf(CClassNode), cc_arg));
    if ((elen > @as(c_int, 1)) or (code >= @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8))))) {
        if ((@ptrCast(?*c_void, (cc.*.mbuf))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            found = 0;
        } else {
            found = @boolToInt((onig_is_in_code_range(cc.*.mbuf.*.p, code) != @as(c_int, 0)));
        }
    } else {
        found = @boolToInt((((cc.*.bs)[@bitCast(c_uint, (code)) >> @intCast(@import("std").math.Log2Int(c_uint), 5)] & (@as(c_uint, 1) << @intCast(@import("std").math.Log2Int(c_uint), (@bitCast(c_uint, (code)) & @bitCast(c_uint, @as(c_int, 31)))))) != @bitCast(c_uint, @as(c_int, 0))));
    }
    if ((((cc).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))) return @boolToInt(!(found != 0)) else return found;
    return 0;
}
pub fn onig_get_regex_ext(arg_reg: [*c]regex_t) callconv(.C) [*c]RegexExt {
    var reg = arg_reg;
    if ((@ptrCast(?*c_void, (reg.*.extp))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        var ext: [*c]RegexExt = @ptrCast([*c]RegexExt, @alignCast(@alignOf(RegexExt), malloc(@sizeOf(RegexExt))));
        if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return null;
        ext.*.pattern = null;
        ext.*.pattern_end = null;
        ext.*.tag_table = null;
        ext.*.callout_num = 0;
        ext.*.callout_list_alloc = 0;
        ext.*.callout_list = null;
        reg.*.extp = ext;
    }
    return reg.*.extp;
}
pub fn onig_ext_set_pattern(arg_reg: [*c]regex_t, arg_pattern: [*c]const OnigUChar, arg_pattern_end: [*c]const OnigUChar) callconv(.C) c_int {
    var reg = arg_reg;
    var pattern = arg_pattern;
    var pattern_end = arg_pattern_end;
    var ext: [*c]RegexExt = undefined;
    var s: [*c]OnigUChar = undefined;
    ext = onig_get_regex_ext(reg);
    if ((@ptrCast(?*c_void, (ext))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    s = onigenc_strdup(reg.*.enc, pattern, pattern_end);
    if ((@ptrCast(?*c_void, (s))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    ext.*.pattern = s;
    ext.*.pattern_end = (s + (pattern_end - pattern));
    return 0;
}
pub fn onig_positive_int_multiply(arg_x: c_int, arg_y: c_int) callconv(.C) c_int {
    var x = arg_x;
    var y = arg_y;
    if ((x == @as(c_int, 0)) or (y == @as(c_int, 0))) return 0;
    if (x < @divTrunc(@as(c_int, 2147483647), y)) return (x * y) else return -@as(c_int, 1);
    return 0;
}
pub extern fn onig_st_init_strend_table_with_size(size: c_int) hash_table_type;
pub extern fn onig_st_lookup_strend(table: hash_table_type, str_key: [*c]const OnigUChar, end_key: [*c]const OnigUChar, value: [*c]hash_data_type) c_int;
pub extern fn onig_st_insert_strend(table: hash_table_type, str_key: [*c]const OnigUChar, end_key: [*c]const OnigUChar, value: hash_data_type) c_int;
pub extern fn onig_get_callout_type_by_name_id(name_id: c_int) OnigCalloutType;
pub extern fn onig_get_callout_start_func_by_name_id(id: c_int) OnigCalloutFunc;
pub extern fn onig_get_callout_end_func_by_name_id(id: c_int) OnigCalloutFunc;
pub extern fn onig_callout_tag_table_free(table: ?*c_void) c_int;
pub extern fn onig_free_reg_callout_list(n: c_int, list: [*c]CalloutListEntry) void;
pub extern fn onig_reg_callout_list_at(reg: [*c]regex_t, num: c_int) [*c]CalloutListEntry;
pub extern fn onig_get_callout_start_func(reg: [*c]regex_t, callout_num: c_int) OnigCalloutFunc;
pub const ONIGENC_INIT_PROPERTY_LIST_FUNC_TYPE = ?fn () callconv(.C) c_int;
pub const NODE_STRING = @enumToInt(enum_unnamed_74.NODE_STRING);
pub const NODE_CCLASS = @enumToInt(enum_unnamed_74.NODE_CCLASS);
pub const NODE_CTYPE = @enumToInt(enum_unnamed_74.NODE_CTYPE);
pub const NODE_BACKREF = @enumToInt(enum_unnamed_74.NODE_BACKREF);
pub const NODE_QUANT = @enumToInt(enum_unnamed_74.NODE_QUANT);
pub const NODE_BAG = @enumToInt(enum_unnamed_74.NODE_BAG);
pub const NODE_ANCHOR = @enumToInt(enum_unnamed_74.NODE_ANCHOR);
pub const NODE_LIST = @enumToInt(enum_unnamed_74.NODE_LIST);
pub const NODE_ALT = @enumToInt(enum_unnamed_74.NODE_ALT);
pub const NODE_CALL = @enumToInt(enum_unnamed_74.NODE_CALL);
pub const NODE_GIMMICK = @enumToInt(enum_unnamed_74.NODE_GIMMICK);
const enum_unnamed_74 = extern enum(c_int) {
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
pub const NodeType = enum_unnamed_74;
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
const struct_unnamed_76 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
};
const union_unnamed_75 = extern union {
    base: struct_unnamed_76,
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
    u: union_unnamed_75,
};
const struct_unnamed_77 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    s: [*c]OnigUChar,
    end: [*c]OnigUChar,
    flag: c_uint,
    buf: [24]OnigUChar,
    capacity: c_int,
};
pub const StrNode = struct_unnamed_77;
const struct_unnamed_78 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    flags: c_uint,
    bs: BitSet,
    mbuf: [*c]BBuf,
};
pub const CClassNode = struct_unnamed_78;
const struct_unnamed_79 = extern struct {
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
pub const QuantNode = struct_unnamed_79;
const struct_unnamed_82 = extern struct {
    regnum: c_int,
    called_addr: AbsAddrType,
    entry_count: c_int,
    called_state: c_int,
};
const struct_unnamed_83 = extern struct {
    options: OnigOptionType,
};
const struct_unnamed_84 = extern struct {
    Then: [*c]struct__Node,
    Else: [*c]struct__Node,
};
const union_unnamed_81 = extern union {
    m: struct_unnamed_82,
    o: struct_unnamed_83,
    te: struct_unnamed_84,
};
const struct_unnamed_80 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    body: [*c]struct__Node,
    type: enum_BagType,
    unnamed_0: union_unnamed_81,
    min_len: OnigLen,
    max_len: OnigLen,
    min_char_len: OnigLen,
    max_char_len: OnigLen,
    opt_count: c_int,
};
pub const BagNode = struct_unnamed_80;
const struct_unnamed_85 = extern struct {
    offset: c_int,
    target: [*c]struct__Node,
};
pub const UnsetAddr = struct_unnamed_85;
const struct_unnamed_86 = extern struct {
    num: c_int,
    alloc: c_int,
    us: [*c]UnsetAddr,
};
pub const UnsetAddrList = struct_unnamed_86;
const struct_unnamed_87 = extern struct {
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
pub const CallNode = struct_unnamed_87;
const struct_unnamed_88 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    back_num: c_int,
    back_static: [6]c_int,
    back_dynamic: [*c]c_int,
    nest_level: c_int,
};
pub const BackRefNode = struct_unnamed_88;
const struct_unnamed_89 = extern struct {
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
pub const AnchorNode = struct_unnamed_89;
const struct_unnamed_90 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    car: [*c]struct__Node,
    cdr: [*c]struct__Node,
};
pub const ConsAltNode = struct_unnamed_90;
const struct_unnamed_91 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    ctype: c_int,
    not: c_int,
    ascii_mode: c_int,
};
pub const CtypeNode = struct_unnamed_91;
const struct_unnamed_92 = extern struct {
    node_type: NodeType,
    status: c_int,
    parent: [*c]struct__Node,
    type: enum_GimmickType,
    detail_type: c_int,
    num: c_int,
    id: c_int,
};
pub const GimmickNode = struct_unnamed_92;
pub const Node = struct__Node;
const struct_unnamed_93 = extern struct {
    new_val: c_int,
};
pub const GroupNumMap = struct_unnamed_93;
const struct_unnamed_94 = extern struct {
    mem_node: [*c]Node,
    empty_repeat_node: [*c]Node,
};
pub const MemEnv = struct_unnamed_94;
const struct_unnamed_95 = extern struct {
    type: enum_SaveType,
};
pub const SaveItem = struct_unnamed_95;
const struct_unnamed_96 = extern struct {
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
pub const ParseEnv = struct_unnamed_96;
pub extern fn onig_renumber_name_table(reg: [*c]regex_t, map: [*c]GroupNumMap) c_int;
pub extern fn onig_strncmp(s1: [*c]const OnigUChar, s2: [*c]const OnigUChar, n: c_int) c_int;
pub extern fn onig_strcpy(dest: [*c]OnigUChar, src: [*c]const OnigUChar, end: [*c]const OnigUChar) void;
pub extern fn onig_scan_env_set_error_string(env: [*c]ParseEnv, ecode: c_int, arg: [*c]OnigUChar, arg_end: [*c]OnigUChar) void;
pub extern fn onig_reduce_nested_quantifier(pnode: [*c]Node) c_int;
pub extern fn onig_node_copy(rcopy: [*c][*c]Node, from: [*c]Node) c_int;
pub extern fn onig_node_str_cat(node: [*c]Node, s: [*c]const OnigUChar, end: [*c]const OnigUChar) c_int;
pub extern fn onig_node_str_set(node: [*c]Node, s: [*c]const OnigUChar, end: [*c]const OnigUChar, need_free: c_int) c_int;
pub extern fn onig_node_str_clear(node: [*c]Node, need_free: c_int) void;
pub extern fn onig_node_free(node: [*c]Node) void;
pub extern fn onig_node_reset_empty(node: [*c]Node) c_int;
pub extern fn onig_node_reset_fail(node: [*c]Node) c_int;
pub extern fn onig_node_new_bag(type: enum_BagType) [*c]Node;
pub extern fn onig_node_new_str(s: [*c]const OnigUChar, end: [*c]const OnigUChar) [*c]Node;
pub extern fn onig_node_new_list(left: [*c]Node, right: [*c]Node) [*c]Node;
pub extern fn onig_node_new_alt(left: [*c]Node, right: [*c]Node) [*c]Node;
pub extern fn onig_names_free(reg: [*c]regex_t) c_int;
pub extern fn onig_parse_tree(root: [*c][*c]Node, pattern: [*c]const OnigUChar, end: [*c]const OnigUChar, reg: [*c]regex_t, env: [*c]ParseEnv) c_int;
pub extern fn onig_free_shared_cclass_table() c_int;
pub fn onig_is_code_in_cc(arg_enc: OnigEncoding, arg_code: OnigCodePoint, arg_cc: [*c]CClassNode) callconv(.C) c_int {
    var enc = arg_enc;
    var code = arg_code;
    var cc = arg_cc;
    var len: c_int = undefined;
    if (((enc).*.min_enc_len) > @as(c_int, 1)) {
        len = 2;
    } else {
        len = (enc).*.code_to_mbclen.?(code);
        if (len < @as(c_int, 0)) return 0;
    }
    return onig_is_code_in_cc_len(len, code, @ptrCast(?*c_void, cc));
}
pub extern fn onig_new_cclass_with_code_list(rnode: [*c][*c]Node, enc: OnigEncoding, n: c_int, codes: [*c]OnigCodePoint) c_int;
pub extern fn onig_get_tiny_min_len(node: [*c]Node, inhibit_node_types: c_uint, invalid_node: [*c]c_int) OnigLen;
pub extern fn onig_global_callout_names_free() c_int;
const struct_unnamed_97 = extern struct {
    min: OnigLen,
    max: OnigLen,
};
pub const MinMaxLen = struct_unnamed_97;
const struct_unnamed_98 = extern struct {
    min: OnigLen,
    max: OnigLen,
    min_is_sure: c_int,
};
pub const MinMaxCharLen = struct_unnamed_98;
pub fn node_min_byte_len(arg_node: [*c]Node, arg_env: [*c]ParseEnv) callconv(.C) OnigLen {
    var node = arg_node;
    var env = arg_env;
    var len: OnigLen = undefined;
    var tmin: OnigLen = undefined;
    len = @bitCast(OnigLen, @as(c_int, 0));
    switch_18: {
        default: {
            case_17: {
                case_16: {
                    case_14: {
                        case_12: {
                            case_10: {
                                case_9: {
                                    case_7: {
                                        case_5: {
                                            case_3: {
                                                case_1: {
                                                    case: {
                                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                            @bitCast(c_uint, @as(c_int, 3)) => break :case,
                                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_1,
                                                            @bitCast(c_uint, @as(c_int, 7)) => break :case_3,
                                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_5,
                                                            @bitCast(c_uint, @as(c_int, 0)) => break :case_7,
                                                            @bitCast(c_uint, @as(c_int, 2)) => break :case_9,
                                                            @bitCast(c_uint, @as(c_int, 1)) => break :case_10,
                                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_12,
                                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_14,
                                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_16,
                                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_17,
                                                            else => break :default,
                                                        }
                                                    }
                                                    if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 17))) != @as(c_int, 0))) {
                                                        var i: c_int = undefined;
                                                        var backs: [*c]c_int = undefined;
                                                        var mem_env: [*c]MemEnv = (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static);
                                                        var br: [*c]BackRefNode = (&((node).*.u.backref));
                                                        if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) break :@"switch";
                                                        backs = (if ((@ptrCast(?*c_void, ((br).*.back_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (br).*.back_dynamic else &(br).*.back_static);
                                                        len = node_min_byte_len(mem_env[@intCast(c_uint, backs[@intCast(c_uint, @as(c_int, 0))])].mem_node, env);
                                                        {
                                                            i = 1;
                                                            while (i < br.*.back_num) : (i += 1) {
                                                                tmin = node_min_byte_len(mem_env[@intCast(c_uint, backs[@intCast(c_uint, i)])].mem_node, env);
                                                                if (len > tmin) len = tmin;
                                                            }
                                                        }
                                                    }
                                                    break :@"switch";
                                                }
                                                {
                                                    var t: [*c]Node = ((node).*.u.base.body);
                                                    if ((((t).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))) != @as(c_int, 0)) len = (&((t).*.u.bag)).*.min_len else len = node_min_byte_len(t, env);
                                                }
                                                break :switch_2;
                                            }
                                            while (true) {
                                                tmin = node_min_byte_len(((&((node).*.u.cons)).*.car), env);
                                                len = distance_add(len, tmin);
                                                if (!((@ptrCast(?*c_void, (blk: {
                                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                                    node = tmp;
                                                    break :blk tmp;
                                                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                            }
                                            break :switch_4;
                                        }
                                        {
                                            var x: [*c]Node = undefined;
                                            var y: [*c]Node = undefined;
                                            y = node;
                                            while (true) {
                                                x = ((&((y).*.u.cons)).*.car);
                                                tmin = node_min_byte_len(x, env);
                                                if (y == node) len = tmin else if (len > tmin) len = tmin;
                                                if (!((@ptrCast(?*c_void, (blk: {
                                                    const tmp = ((&((y).*.u.cons)).*.cdr);
                                                    y = tmp;
                                                    break :blk tmp;
                                                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                            }
                                        }
                                        break :switch_6;
                                    }
                                    {
                                        var sn: [*c]StrNode = (&((node).*.u.str));
                                        len = @bitCast(OnigLen, @bitCast(c_int, @truncate(c_int, (sn.*.end - sn.*.s))));
                                    }
                                    break :switch_8;
                                }
                            }
                            len = @bitCast(OnigLen, ((env.*.enc).*.min_enc_len));
                            break :switch_11;
                        }
                        {
                            var qn: [*c]QuantNode = (&((node).*.u.quant));
                            if (qn.*.lower > @as(c_int, 0)) {
                                len = node_min_byte_len(((node).*.u.base.body), env);
                                len = distance_multiply(len, qn.*.lower);
                            }
                        }
                        break :switch_13;
                    }
                    {
                        var en: [*c]BagNode = (&((node).*.u.bag));
                        switch_1: {
                            case_8: {
                                case_6: {
                                    case_4: {
                                        case_2: {
                                            switch (@bitCast(c_uint, @enumToInt(en.*.type))) {
                                                @bitCast(c_uint, @as(c_int, 0)) => break :case_2,
                                                @bitCast(c_uint, @as(c_int, 1)) => break :case_4,
                                                @bitCast(c_uint, @as(c_int, 2)) => break :case_6,
                                                @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                                else => break :switch_1,
                                            }
                                        }
                                        if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))) != @as(c_int, 0)) len = en.*.min_len else {
                                            if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) len = @bitCast(OnigLen, @as(c_int, 0)) else {
                                                _ = (blk: {
                                                    const ref = &((node).*.u.base.status);
                                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                                    break :blk ref.*;
                                                });
                                                len = node_min_byte_len(((node).*.u.base.body), env);
                                                _ = (blk: {
                                                    const ref = &((node).*.u.base.status);
                                                    ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                                    break :blk ref.*;
                                                });
                                                en.*.min_len = len;
                                                _ = (blk: {
                                                    const ref = &((node).*.u.base.status);
                                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0));
                                                    break :blk ref.*;
                                                });
                                            }
                                        }
                                        break :switch_3;
                                    }
                                }
                                len = node_min_byte_len(((node).*.u.base.body), env);
                                break :switch_7;
                            }
                            {
                                var elen: OnigLen = undefined;
                                len = node_min_byte_len(((node).*.u.base.body), env);
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) len +%= node_min_byte_len(en.*.unnamed_0.te.Then, env);
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) elen = node_min_byte_len(en.*.unnamed_0.te.Else, env) else elen = @bitCast(OnigLen, @as(c_int, 0));
                                if (elen < len) len = elen;
                            }
                            break :switch_9;
                        }
                    }
                    break :switch_15;
                }
                {
                    var g: [*c]GimmickNode = (&((node).*.u.gimmick));
                    if (@bitCast(c_uint, @enumToInt(g.*.type)) == @bitCast(c_uint, GIMMICK_FAIL)) {
                        len = ~(@bitCast(OnigLen, @as(c_int, 0)));
                        break :switch_1;
                    }
                }
            }
        }
        break :switch_18;
    }
    return len;
}
pub fn ops_init(arg_reg: [*c]regex_t, arg_init_alloc_size: c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var init_alloc_size = arg_init_alloc_size;
    var p: [*c]Operation = undefined;
    var size: usize = undefined;
    if (init_alloc_size > @as(c_int, 0)) {
        size = (@sizeOf(Operation) *% @bitCast(c_ulong, @as(c_long, init_alloc_size)));
        p = @ptrCast([*c]Operation, @alignCast(@alignOf(Operation), realloc(@ptrCast(?*c_void, reg.*.ops), size)));
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        reg.*.ops = p;
        {
            var cp: [*c]enum_OpCode = undefined;
            size = (@sizeOf(enum_OpCode) *% @bitCast(c_ulong, @as(c_long, init_alloc_size)));
            cp = @ptrCast([*c]enum_OpCode, @alignCast(@alignOf(enum_OpCode), realloc(@ptrCast(?*c_void, reg.*.ocs), size)));
            if ((@ptrCast(?*c_void, (cp))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            reg.*.ocs = cp;
        }
    } else {
        reg.*.ops = @intToPtr([*c]Operation, @as(c_int, 0));
        reg.*.ocs = @intToPtr([*c]enum_OpCode, @as(c_int, 0));
    }
    reg.*.ops_curr = null;
    reg.*.ops_alloc = @bitCast(c_uint, init_alloc_size);
    reg.*.ops_used = @bitCast(c_uint, @as(c_int, 0));
    return 0;
}
pub fn ops_expand(arg_reg: [*c]regex_t, arg_n: c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var n = arg_n;
    var cp: [*c]enum_OpCode = undefined;
    var p: [*c]Operation = undefined;
    var size: usize = undefined;
    if (n <= @as(c_int, 0)) n = 4;
    n += @intCast(c_int, reg.*.ops_alloc);
    size = (@sizeOf(Operation) *% @bitCast(c_ulong, @as(c_long, n)));
    p = @ptrCast([*c]Operation, @alignCast(@alignOf(Operation), realloc(@ptrCast(?*c_void, reg.*.ops), size)));
    if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    reg.*.ops = p;
    size = (@sizeOf(enum_OpCode) *% @bitCast(c_ulong, @as(c_long, n)));
    cp = @ptrCast([*c]enum_OpCode, @alignCast(@alignOf(enum_OpCode), realloc(@ptrCast(?*c_void, reg.*.ocs), size)));
    if ((@ptrCast(?*c_void, (cp))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    reg.*.ocs = cp;
    reg.*.ops_alloc = @bitCast(c_uint, n);
    if (reg.*.ops_used == @bitCast(c_uint, @as(c_int, 0))) reg.*.ops_curr = null else reg.*.ops_curr = (reg.*.ops + (reg.*.ops_used -% @bitCast(c_uint, @as(c_int, 1))));
    return 0;
}
pub fn ops_new(arg_reg: [*c]regex_t) callconv(.C) c_int {
    var reg = arg_reg;
    var r: c_int = undefined;
    if (reg.*.ops_used >= reg.*.ops_alloc) {
        r = ops_expand(reg, @bitCast(c_int, reg.*.ops_alloc));
        if (r != @as(c_int, 0)) return r;
    }
    reg.*.ops_curr = (reg.*.ops + reg.*.ops_used);
    reg.*.ops_used +%= 1;
    _ = __builtin___memset_chk(@ptrCast(?*c_void, reg.*.ops_curr), @as(c_int, 0), @sizeOf(Operation), __builtin_object_size(@ptrCast(?*const c_void, reg.*.ops_curr), @as(c_int, 0)));
    return 0;
}
pub fn is_in_string_pool(arg_reg: [*c]regex_t, arg_s: [*c]OnigUChar) callconv(.C) c_int {
    var reg = arg_reg;
    var s = arg_s;
    return @boolToInt(((s >= reg.*.string_pool) and (s < reg.*.string_pool_end)));
} // ./src/todo/regcomp.c:263:29: warning: TODO complex switch cases
pub const ops_free = @compileError("unable to translate function"); // ./src/todo/regcomp.c:224:1
pub fn ops_calc_size_of_string_pool(arg_reg: [*c]regex_t) callconv(.C) c_int {
    var reg = arg_reg;
    var i: c_int = undefined;
    var total: c_int = undefined;
    if ((@ptrCast(?*c_void, (reg.*.ops))) == @intToPtr(?*c_void, @as(c_int, 0))) return 0;
    total = 0;
    {
        i = 0;
        while (i < @bitCast(c_int, reg.*.ops_used)) : (i += 1) {
            var opcode: enum_OpCode = undefined;
            var op: [*c]Operation = undefined;
            op = (reg.*.ops + i);
            opcode = (reg.*.ocs + i).?.*;
            switch_6: {
                default: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(opcode))) {
                                        @bitCast(c_uint, @as(c_int, 13)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 11)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 12)) => break :case_4,
                                        else => break :default,
                                    }
                                }
                                total += (op.*.unnamed_0.exact_len_n.len * op.*.unnamed_0.exact_len_n.n);
                                break :@"switch";
                            }
                        }
                        total += (op.*.unnamed_0.exact_n.n * @as(c_int, 2));
                        break :switch_3;
                    }
                    total += (op.*.unnamed_0.exact_n.n * @as(c_int, 3));
                    break :switch_5;
                }
                break :switch_6;
            }
        }
    }
    return total;
} // ./src/todo/regcomp.c:376:5: warning: TODO implement translation of stmt class LabelStmtClass
pub const ops_make_string_pool = @compileError("unable to translate function"); // ./src/todo/regcomp.c:339:1
pub fn len_multiply_cmp(arg_x: OnigLen, arg_y: c_int, arg_v: OnigLen) callconv(.C) c_int {
    var x = arg_x;
    var y = arg_y;
    var v = arg_v;
    if ((x == @bitCast(c_uint, @as(c_int, 0))) or (y == @as(c_int, 0))) return -@as(c_int, 1);
    if (x < (~(@bitCast(OnigLen, @as(c_int, 0))) / @bitCast(c_uint, y))) {
        var xy: OnigLen = (x *% @bitCast(OnigLen, y));
        if (xy > v) return 1 else {
            if (xy == v) return 0 else return -@as(c_int, 1);
        }
    } else return if (v == ~(@bitCast(OnigLen, @as(c_int, 0)))) @as(c_int, 0) else @as(c_int, 1);
    return 0;
}
pub fn node_swap(arg_a: [*c]Node, arg_b: [*c]Node) callconv(.C) void {
    var a = arg_a;
    var b = arg_b;
    var c: Node = undefined;
    c = a.?.*;
    a.?.* = b.?.*;
    b.?.* = c;
    if (@bitCast(c_uint, @enumToInt(((a).*.u.base.node_type))) == @bitCast(c_uint, NODE_STRING)) {
        var sn: [*c]StrNode = (&((a).*.u.str));
        if (sn.*.capacity == @as(c_int, 0)) {
            var len: c_int = @bitCast(c_int, @truncate(c_int, (sn.*.end - sn.*.s)));
            sn.*.s = &sn.*.buf;
            sn.*.end = (sn.*.s + len);
        }
    }
    if (@bitCast(c_uint, @enumToInt(((b).*.u.base.node_type))) == @bitCast(c_uint, NODE_STRING)) {
        var sn: [*c]StrNode = (&((b).*.u.str));
        if (sn.*.capacity == @as(c_int, 0)) {
            var len: c_int = @bitCast(c_int, @truncate(c_int, (sn.*.end - sn.*.s)));
            sn.*.s = &sn.*.buf;
            sn.*.end = (sn.*.s + len);
        }
    }
}
pub fn node_list_len(arg_list: [*c]Node) callconv(.C) c_int {
    var list = arg_list;
    var len: c_int = undefined;
    len = 1;
    while ((@ptrCast(?*c_void, ((&((list).*.u.cons)).*.cdr))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        list = ((&((list).*.u.cons)).*.cdr);
        len += 1;
    }
    return len;
}
pub fn node_list_add(arg_list: [*c]Node, arg_x: [*c]Node) callconv(.C) [*c]Node {
    var list = arg_list;
    var x = arg_x;
    var n: [*c]Node = undefined;
    n = onig_node_new_list(x, null);
    if ((@ptrCast(?*c_void, (n))) == @intToPtr(?*c_void, @as(c_int, 0))) return (@intToPtr([*c]Node, @as(c_int, 0)));
    if ((@ptrCast(?*c_void, (list))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        while ((@ptrCast(?*c_void, ((&((list).*.u.cons)).*.cdr))) != @intToPtr(?*c_void, @as(c_int, 0))) list = ((&((list).*.u.cons)).*.cdr);
        ((&((list).*.u.cons)).*.cdr) = n;
    }
    return n;
}
pub fn node_str_node_cat(arg_node: [*c]Node, arg_add: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var add = arg_add;
    var r: c_int = undefined;
    if (((node).*.u.base.status) != ((add).*.u.base.status)) return -@as(c_int, 6);
    if ((&((node).*.u.str)).*.flag != (&((add).*.u.str)).*.flag) return -@as(c_int, 6);
    r = onig_node_str_cat(node, (&((add).*.u.str)).*.s, (&((add).*.u.str)).*.end);
    if (r != @as(c_int, 0)) return r;
    return 0;
}
pub fn node_conv_to_str_node(arg_node: [*c]Node, arg_ref_node: [*c]Node) callconv(.C) void {
    var node = arg_node;
    var ref_node = arg_ref_node;
    _ = __builtin___memset_chk(@ptrCast(?*c_void, node), @as(c_int, 0), @sizeOf(Node), __builtin_object_size(@ptrCast(?*const c_void, node), @as(c_int, 0)));
    (node).*.u.base.node_type = @intToEnum(NodeType, (NODE_STRING));
    ((node).*.u.base.status) = ((ref_node).*.u.base.status);
    (&((node).*.u.str)).*.flag = (&((ref_node).*.u.str)).*.flag;
    (&((node).*.u.str)).*.s = &(&((node).*.u.str)).*.buf;
    (&((node).*.u.str)).*.end = &(&((node).*.u.str)).*.buf;
    (&((node).*.u.str)).*.capacity = 0;
}
pub fn distance_add(arg_d1: OnigLen, arg_d2: OnigLen) callconv(.C) OnigLen {
    var d1 = arg_d1;
    var d2 = arg_d2;
    if ((d1 == ~(@bitCast(OnigLen, @as(c_int, 0)))) or (d2 == ~(@bitCast(OnigLen, @as(c_int, 0))))) return ~(@bitCast(OnigLen, @as(c_int, 0))) else {
        if (d1 <= (~(@bitCast(OnigLen, @as(c_int, 0))) -% d2)) return (d1 +% d2) else return ~(@bitCast(OnigLen, @as(c_int, 0)));
    }
    return 0;
}
pub fn distance_multiply(arg_d: OnigLen, arg_m: c_int) callconv(.C) OnigLen {
    var d = arg_d;
    var m = arg_m;
    if (m == @as(c_int, 0)) return @bitCast(OnigLen, @as(c_int, 0));
    if (d < (~(@bitCast(OnigLen, @as(c_int, 0))) / @bitCast(c_uint, m))) return (d *% @bitCast(c_uint, m)) else return ~(@bitCast(OnigLen, @as(c_int, 0)));
    return 0;
}
pub fn bitset_is_empty(arg_bs: BitSetRef) callconv(.C) c_int {
    var bs = arg_bs;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < (@divTrunc((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)), @as(c_int, 32)))) : (i += 1) {
            if (bs[@intCast(c_uint, i)] != @bitCast(c_uint, @as(c_int, 0))) return 0;
        }
    }
    return 1;
}
pub fn unset_addr_list_init(arg_list: [*c]UnsetAddrList, arg_size: c_int) callconv(.C) c_int {
    var list = arg_list;
    var size = arg_size;
    var p: [*c]UnsetAddr = @ptrCast([*c]UnsetAddr, @alignCast(@alignOf(UnsetAddr), malloc((@sizeOf(UnsetAddr) *% @bitCast(c_ulong, @as(c_long, size))))));
    if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    list.*.num = 0;
    list.*.alloc = size;
    list.*.us = p;
    return 0;
}
pub fn unset_addr_list_end(arg_list: [*c]UnsetAddrList) callconv(.C) void {
    var list = arg_list;
    if ((@ptrCast(?*c_void, (list.*.us))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@ptrCast(?*c_void, list.*.us));
}
pub fn unset_addr_list_add(arg_list: [*c]UnsetAddrList, arg_offset: c_int, arg_node: [*c]struct__Node) callconv(.C) c_int {
    var list = arg_list;
    var offset = arg_offset;
    var node = arg_node;
    var p: [*c]UnsetAddr = undefined;
    var size: c_int = undefined;
    if (list.*.num >= list.*.alloc) {
        size = (list.*.alloc * @as(c_int, 2));
        p = @ptrCast([*c]UnsetAddr, @alignCast(@alignOf(UnsetAddr), realloc(@ptrCast(?*c_void, list.*.us), (@sizeOf(UnsetAddr) *% @bitCast(c_ulong, @as(c_long, size))))));
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        list.*.alloc = size;
        list.*.us = p;
    }
    list.*.us[@intCast(c_uint, list.*.num)].offset = offset;
    list.*.us[@intCast(c_uint, list.*.num)].target = node;
    list.*.num += 1;
    return 0;
}
pub const CHAR_LEN_NORMAL = @enumToInt(enum_CharLenReturnType.CHAR_LEN_NORMAL);
pub const CHAR_LEN_TOP_ALT_FIXED = @enumToInt(enum_CharLenReturnType.CHAR_LEN_TOP_ALT_FIXED);
pub const enum_CharLenReturnType = extern enum(c_int) {
    CHAR_LEN_NORMAL = 0,
    CHAR_LEN_TOP_ALT_FIXED = 1,
    _,
};
pub fn mmcl_fixed(arg_c: [*c]MinMaxCharLen) callconv(.C) c_int {
    var c = arg_c;
    return @boolToInt(((c.*.min == c.*.max) and (c.*.min != ~(@bitCast(OnigLen, @as(c_int, 0))))));
}
pub fn mmcl_set(arg_l: [*c]MinMaxCharLen, arg_len: OnigLen) callconv(.C) void {
    var l = arg_l;
    var len = arg_len;
    l.*.min = len;
    l.*.max = len;
    l.*.min_is_sure = 1;
}
pub fn mmcl_set_min_max(arg_l: [*c]MinMaxCharLen, arg_min: OnigLen, arg_max: OnigLen, arg_min_is_sure: c_int) callconv(.C) void {
    var l = arg_l;
    var min = arg_min;
    var max = arg_max;
    var min_is_sure = arg_min_is_sure;
    l.*.min = min;
    l.*.max = max;
    l.*.min_is_sure = min_is_sure;
}
pub fn mmcl_add(arg_to: [*c]MinMaxCharLen, arg_add: [*c]MinMaxCharLen) callconv(.C) void {
    var to = arg_to;
    var add = arg_add;
    to.*.min = distance_add(to.*.min, add.*.min);
    to.*.max = distance_add(to.*.max, add.*.max);
    to.*.min_is_sure = @boolToInt(((add.*.min_is_sure != @as(c_int, 0)) and (to.*.min_is_sure != @as(c_int, 0))));
}
pub fn mmcl_multiply(arg_to: [*c]MinMaxCharLen, arg_m: c_int) callconv(.C) void {
    var to = arg_to;
    var m = arg_m;
    to.*.min = distance_multiply(to.*.min, m);
    to.*.max = distance_multiply(to.*.max, m);
}
pub fn mmcl_repeat_range_multiply(arg_to: [*c]MinMaxCharLen, arg_mlow: c_int, arg_mhigh: c_int) callconv(.C) void {
    var to = arg_to;
    var mlow = arg_mlow;
    var mhigh = arg_mhigh;
    to.*.min = distance_multiply(to.*.min, mlow);
    if ((mhigh) == -@as(c_int, 1)) to.*.max = ~(@bitCast(OnigLen, @as(c_int, 0))) else to.*.max = distance_multiply(to.*.max, mhigh);
}
pub fn mmcl_alt_merge(arg_to: [*c]MinMaxCharLen, arg_alt: [*c]MinMaxCharLen) callconv(.C) void {
    var to = arg_to;
    var alt = arg_alt;
    if (to.*.min > alt.*.min) {
        to.*.min = alt.*.min;
        to.*.min_is_sure = alt.*.min_is_sure;
    } else if (to.*.min == alt.*.min) {
        if (alt.*.min_is_sure != @as(c_int, 0)) to.*.min_is_sure = 1;
    }
    if (to.*.max < alt.*.max) to.*.max = alt.*.max;
}
pub fn mml_is_equal(arg_a: [*c]MinMaxLen, arg_b: [*c]MinMaxLen) callconv(.C) c_int {
    var a = arg_a;
    var b = arg_b;
    return @boolToInt(((a.*.min == b.*.min) and (a.*.max == b.*.max)));
}
pub fn mml_set_min_max(arg_l: [*c]MinMaxLen, arg_min: OnigLen, arg_max: OnigLen) callconv(.C) void {
    var l = arg_l;
    var min = arg_min;
    var max = arg_max;
    l.*.min = min;
    l.*.max = max;
}
pub fn mml_clear(arg_l: [*c]MinMaxLen) callconv(.C) void {
    var l = arg_l;
    l.*.min = blk: {
        const tmp = @bitCast(OnigLen, @as(c_int, 0));
        l.*.max = tmp;
        break :blk tmp;
    };
}
pub fn mml_copy(arg_to: [*c]MinMaxLen, arg_from: [*c]MinMaxLen) callconv(.C) void {
    var to = arg_to;
    var from = arg_from;
    to.*.min = from.*.min;
    to.*.max = from.*.max;
}
pub fn mml_add(arg_to: [*c]MinMaxLen, arg_add: [*c]MinMaxLen) callconv(.C) void {
    var to = arg_to;
    var add = arg_add;
    to.*.min = distance_add(to.*.min, add.*.min);
    to.*.max = distance_add(to.*.max, add.*.max);
}
pub fn mml_alt_merge(arg_to: [*c]MinMaxLen, arg_alt: [*c]MinMaxLen) callconv(.C) void {
    var to = arg_to;
    var alt = arg_alt;
    if (to.*.min > alt.*.min) to.*.min = alt.*.min;
    if (to.*.max < alt.*.max) to.*.max = alt.*.max;
} // ./src/todo/regcomp.c:899:3: warning: TODO implement translation of stmt class LabelStmtClass
pub const node_char_len1 = @compileError("unable to translate function"); // ./src/todo/regcomp.c:717:1
pub fn node_char_len(arg_node: [*c]Node, arg_reg: [*c]regex_t, arg_ci: [*c]MinMaxCharLen, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var ci = arg_ci;
    var env = arg_env;
    return node_char_len1(node, reg, ci, env, @as(c_int, 0));
}
pub fn add_op(arg_reg: [*c]regex_t, arg_opcode: c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var opcode = arg_opcode;
    var r: c_int = undefined;
    r = ops_new(reg);
    if (r != @as(c_int, 0)) return r;
    (reg.*.ocs + (reg.*.ops_curr - reg.*.ops)).?.* = @intToEnum(enum_OpCode, opcode);
    return 0;
}
pub fn compile_length_tree(arg_node: [*c]Node, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var len: c_int = undefined;
    var r: c_int = undefined;
    switch_21: {
        default: {
            case_19: {
                case_17: {
                    case_15: {
                        case_13: {
                            case_11: {
                                case_9: {
                                    case_7: {
                                        case_5: {
                                            case_3: {
                                                case_1: {
                                                    case: {
                                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                            @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                                            @bitCast(c_uint, @as(c_int, 0)) => break :case_3,
                                                            @bitCast(c_uint, @as(c_int, 1)) => break :case_5,
                                                            @bitCast(c_uint, @as(c_int, 2)) => break :case_7,
                                                            @bitCast(c_uint, @as(c_int, 3)) => break :case_9,
                                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_11,
                                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_13,
                                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_15,
                                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_17,
                                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_19,
                                                            else => break :default,
                                                        }
                                                    }
                                                    len = 0;
                                                    while (true) {
                                                        r = compile_length_tree(((&((node).*.u.cons)).*.car), reg);
                                                        if (r < @as(c_int, 0)) return r;
                                                        len += r;
                                                        if (!((@ptrCast(?*c_void, (blk: {
                                                            const tmp = ((&((node).*.u.cons)).*.cdr);
                                                            node = tmp;
                                                            break :blk tmp;
                                                        }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                                    }
                                                    r = len;
                                                    break :@"switch";
                                                }
                                                {
                                                    var n: c_int = undefined;
                                                    n = blk: {
                                                        const tmp = @as(c_int, 0);
                                                        r = tmp;
                                                        break :blk tmp;
                                                    };
                                                    while (true) {
                                                        r += compile_length_tree(((&((node).*.u.cons)).*.car), reg);
                                                        n += 1;
                                                        if (!((@ptrCast(?*c_void, (blk: {
                                                            const tmp = ((&((node).*.u.cons)).*.cdr);
                                                            node = tmp;
                                                            break :blk tmp;
                                                        }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                                    }
                                                    r += ((@as(c_int, 1) + @as(c_int, 1)) * (n - @as(c_int, 1)));
                                                }
                                                break :switch_2;
                                            }
                                            if (((node).*.u.str.flag & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))) r = compile_length_string_crude_node((&((node).*.u.str)), reg) else r = compile_length_string_node(node, reg);
                                            break :switch_4;
                                        }
                                        r = compile_length_cclass_node((&((node).*.u.cclass)), reg);
                                        break :switch_6;
                                    }
                                    r = 1;
                                    break :switch_8;
                                }
                                r = 1;
                                break :switch_10;
                            }
                            r = 1;
                            break :switch_12;
                        }
                        r = compile_length_quantifier_node((&((node).*.u.quant)), reg);
                        break :switch_14;
                    }
                    r = compile_length_bag_node((&((node).*.u.bag)), reg);
                    break :switch_16;
                }
                r = compile_length_anchor_node((&((node).*.u.anchor)), reg);
                break :switch_18;
            }
            r = compile_length_gimmick_node((&((node).*.u.gimmick)), reg);
            break :switch_20;
        }
        return -@as(c_int, 6);
        break :switch_21;
    }
    return r;
} // ./src/todo/regcomp.c:2683:9: warning: TODO implement translation of stmt class GotoStmtClass
pub const compile_tree = @compileError("unable to translate function"); // ./src/todo/regcomp.c:2586:1
pub fn select_str_opcode(arg_mb_len: c_int, arg_str_len: c_int) callconv(.C) c_int {
    var mb_len = arg_mb_len;
    var str_len = arg_str_len;
    var op: c_int = undefined;
    switch_5: {
        default: {
            case_3: {
                case_1: {
                    case: {
                        switch (mb_len) {
                            @as(c_int, 1) => break :case,
                            @as(c_int, 2) => break :case_1,
                            @as(c_int, 3) => break :case_3,
                            else => break :default,
                        }
                    }
                    switch_10: {
                        default: {
                            case_8: {
                                case_6: {
                                    case_4: {
                                        case_2: {
                                            case_1: {
                                                switch (str_len) {
                                                    @as(c_int, 1) => break :case_1,
                                                    @as(c_int, 2) => break :case_2,
                                                    @as(c_int, 3) => break :case_4,
                                                    @as(c_int, 4) => break :case_6,
                                                    @as(c_int, 5) => break :case_8,
                                                    else => break :default,
                                                }
                                            }
                                            op = OP_STR_1;
                                            break :@"switch";
                                        }
                                        op = OP_STR_2;
                                        break :switch_3;
                                    }
                                    op = OP_STR_3;
                                    break :switch_5;
                                }
                                op = OP_STR_4;
                                break :switch_7;
                            }
                            op = OP_STR_5;
                            break :switch_9;
                        }
                        op = OP_STR_N;
                        break :switch_10;
                    }
                    break :@"switch";
                }
                switch_8: {
                    default: {
                        case_6: {
                            case_4: {
                                case_2: {
                                    switch (str_len) {
                                        @as(c_int, 1) => break :case_2,
                                        @as(c_int, 2) => break :case_4,
                                        @as(c_int, 3) => break :case_6,
                                        else => break :default,
                                    }
                                }
                                op = OP_STR_MB2N1;
                                break :switch_3;
                            }
                            op = OP_STR_MB2N2;
                            break :switch_5;
                        }
                        op = OP_STR_MB2N3;
                        break :switch_7;
                    }
                    op = OP_STR_MB2N;
                    break :switch_8;
                }
                break :switch_2;
            }
            op = OP_STR_MB3N;
            break :switch_4;
        }
        op = OP_STR_MBN;
        break :switch_5;
    }
    return op;
}
pub fn is_strict_real_node(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    switch_4: {
        default: {
            case_2: {
                case_1: {
                    case: {
                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                            @bitCast(c_uint, @as(c_int, 0)) => break :case,
                            @bitCast(c_uint, @as(c_int, 1)) => break :case_1,
                            @bitCast(c_uint, @as(c_int, 2)) => break :case_2,
                            else => break :default,
                        }
                    }
                    {
                        var sn: [*c]StrNode = (&((node).*.u.str));
                        return @boolToInt((sn.*.end != sn.*.s));
                    }
                    break :@"switch";
                }
            }
            return 1;
            break :switch_3;
        }
        return 0;
        break :switch_4;
    }
    return 0;
}
pub fn compile_quant_body_with_empty_check(arg_qn: [*c]QuantNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var qn = arg_qn;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var saved_num_empty_check: c_int = undefined;
    var emptiness: c_int = undefined;
    var body: [*c]Node = undefined;
    body = ((@ptrCast([*c]Node, @alignCast(@alignOf(Node), qn))).*.u.base.body);
    emptiness = @bitCast(c_int, @enumToInt(qn.*.emptiness));
    saved_num_empty_check = reg.*.num_empty_check;
    if (emptiness != BODY_IS_NOT_EMPTY) {
        r = add_op(reg, OP_EMPTY_CHECK_START);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.empty_check_start.mem = reg.*.num_empty_check;
        reg.*.num_empty_check += 1;
    }
    r = compile_tree(body, reg, env);
    if (r != @as(c_int, 0)) return r;
    if (emptiness != BODY_IS_NOT_EMPTY) {
        if (emptiness == BODY_MAY_BE_EMPTY) r = add_op(reg, OP_EMPTY_CHECK_END) else if (emptiness == BODY_MAY_BE_EMPTY_MEM) {
            if ((@boolToInt(((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), qn))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 20))) != @as(c_int, 0))) != @as(c_int, 0)) and (qn.*.empty_status_mem != @bitCast(c_uint, @as(c_int, 0)))) {
                r = add_op(reg, OP_EMPTY_CHECK_END_MEMST);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.empty_check_end.empty_status_mem = qn.*.empty_status_mem;
            } else r = add_op(reg, OP_EMPTY_CHECK_END);
        } else if (emptiness == BODY_MAY_BE_EMPTY_REC) {
            r = add_op(reg, OP_EMPTY_CHECK_END_MEMST_PUSH);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.empty_check_end.empty_status_mem = qn.*.empty_status_mem;
        }
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.empty_check_end.mem = saved_num_empty_check;
    }
    return r;
}
pub fn compile_call(arg_node: [*c]CallNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var offset: c_int = undefined;
    r = add_op(reg, OP_CALL);
    if (r != @as(c_int, 0)) return r;
    ((reg).*.ops_curr).*.unnamed_0.call.addr = 0;
    offset = (@bitCast(c_int, @truncate(c_int, (@ptrCast([*c]u8, @alignCast(@alignOf(u8), (&((reg).*.ops_curr.*.unnamed_0.call.addr)))) - @ptrCast([*c]u8, @alignCast(@alignOf(u8), ((reg).*.ops)))))));
    r = unset_addr_list_add(env.*.unset_addr_list, offset, ((node).*.body));
    return r;
}
pub fn compile_tree_n_times(arg_node: [*c]Node, arg_n: c_int, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var n = arg_n;
    var reg = arg_reg;
    var env = arg_env;
    var i: c_int = undefined;
    var r: c_int = undefined;
    {
        i = 0;
        while (i < n) : (i += 1) {
            r = compile_tree(node, reg, env);
            if (r != @as(c_int, 0)) return r;
        }
    }
    return 0;
}
pub fn add_compile_string_length(arg_s: [*c]OnigUChar, arg_mb_len: c_int, arg_str_len: c_int, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var s = arg_s;
    var mb_len = arg_mb_len;
    var str_len = arg_str_len;
    var reg = arg_reg;
    return 1;
}
pub fn add_compile_string(arg_s: [*c]OnigUChar, arg_mb_len: c_int, arg_str_len: c_int, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var s = arg_s;
    var mb_len = arg_mb_len;
    var str_len = arg_str_len;
    var reg = arg_reg;
    var op: c_int = undefined;
    var r: c_int = undefined;
    var byte_len: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var end: [*c]OnigUChar = undefined;
    op = select_str_opcode(mb_len, str_len);
    r = add_op(reg, op);
    if (r != @as(c_int, 0)) return r;
    byte_len = (mb_len * str_len);
    end = (s + byte_len);
    if (op == OP_STR_MBN) {
        p = onigenc_strdup(reg.*.enc, s, end);
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        ((reg).*.ops_curr).*.unnamed_0.exact_len_n.len = mb_len;
        ((reg).*.ops_curr).*.unnamed_0.exact_len_n.n = str_len;
        ((reg).*.ops_curr).*.unnamed_0.exact_len_n.s = p;
    } else if (((((op) == OP_STR_N) or ((op) == OP_STR_MB2N)) or ((op) == OP_STR_MB3N)) or ((op) == OP_STR_MBN)) {
        p = onigenc_strdup(reg.*.enc, s, end);
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        ((reg).*.ops_curr).*.unnamed_0.exact_n.n = str_len;
        ((reg).*.ops_curr).*.unnamed_0.exact_n.s = p;
    } else {
        _ = __builtin___memset_chk(@ptrCast(?*c_void, &((reg).*.ops_curr).*.unnamed_0.exact.s), @as(c_int, 0), @sizeOf([16]OnigUChar), __builtin_object_size(@ptrCast(?*const c_void, &((reg).*.ops_curr).*.unnamed_0.exact.s), @as(c_int, 0)));
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, &((reg).*.ops_curr).*.unnamed_0.exact.s), @ptrCast(?*const c_void, s), @bitCast(usize, @as(c_long, byte_len)), __builtin_object_size(@ptrCast(?*const c_void, &((reg).*.ops_curr).*.unnamed_0.exact.s), @as(c_int, 0)));
    }
    return 0;
}
pub fn compile_length_string_node(arg_node: [*c]Node, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var rlen: c_int = undefined;
    var r: c_int = undefined;
    var len: c_int = undefined;
    var prev_len: c_int = undefined;
    var slen: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var prev: [*c]OnigUChar = undefined;
    var sn: [*c]StrNode = undefined;
    var enc: OnigEncoding = reg.*.enc;
    sn = (&((node).*.u.str));
    if (sn.*.end <= sn.*.s) return 0;
    p = blk: {
        const tmp = sn.*.s;
        prev = tmp;
        break :blk tmp;
    };
    prev_len = (enc).*.mbc_enc_len.?(p);
    p += prev_len;
    slen = 1;
    rlen = 0;
    while (p < sn.*.end) {
        len = (enc).*.mbc_enc_len.?(p);
        if (len == prev_len) {
            slen += 1;
        } else {
            r = add_compile_string_length(prev, prev_len, slen, reg);
            rlen += r;
            prev = p;
            slen = 1;
            prev_len = len;
        }
        p += len;
    }
    r = add_compile_string_length(prev, prev_len, slen, reg);
    rlen += r;
    return rlen;
}
pub fn compile_length_string_crude_node(arg_sn: [*c]StrNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var sn = arg_sn;
    var reg = arg_reg;
    if (sn.*.end <= sn.*.s) return 0;
    return add_compile_string_length(sn.*.s, @as(c_int, 1), @bitCast(c_int, @truncate(c_int, (sn.*.end - sn.*.s))), reg);
}
pub fn compile_string_node(arg_node: [*c]Node, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var r: c_int = undefined;
    var len: c_int = undefined;
    var prev_len: c_int = undefined;
    var slen: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var prev: [*c]OnigUChar = undefined;
    var end: [*c]OnigUChar = undefined;
    var sn: [*c]StrNode = undefined;
    var enc: OnigEncoding = reg.*.enc;
    sn = (&((node).*.u.str));
    if (sn.*.end <= sn.*.s) return 0;
    end = sn.*.end;
    p = blk: {
        const tmp = sn.*.s;
        prev = tmp;
        break :blk tmp;
    };
    prev_len = (enc).*.mbc_enc_len.?(p);
    p += prev_len;
    slen = 1;
    while (p < end) {
        len = (enc).*.mbc_enc_len.?(p);
        if (len == prev_len) {
            slen += 1;
        } else {
            r = add_compile_string(prev, prev_len, slen, reg);
            if (r != @as(c_int, 0)) return r;
            prev = p;
            slen = 1;
            prev_len = len;
        }
        p += len;
    }
    return add_compile_string(prev, prev_len, slen, reg);
}
pub fn compile_string_crude_node(arg_sn: [*c]StrNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var sn = arg_sn;
    var reg = arg_reg;
    if (sn.*.end <= sn.*.s) return 0;
    return add_compile_string(sn.*.s, @as(c_int, 1), @bitCast(c_int, @truncate(c_int, (sn.*.end - sn.*.s))), reg);
}
pub fn set_multi_byte_cclass(arg_mbuf: [*c]BBuf, arg_reg: [*c]regex_t) callconv(.C) ?*c_void {
    var mbuf = arg_mbuf;
    var reg = arg_reg;
    var len: usize = undefined;
    var p: ?*c_void = undefined;
    len = @bitCast(usize, @as(c_ulong, mbuf.*.used));
    p = malloc(len);
    if ((p) == @intToPtr(?*c_void, @as(c_int, 0))) return (@intToPtr(?*c_void, @as(c_int, 0)));
    _ = __builtin___memcpy_chk(p, @ptrCast(?*const c_void, mbuf.*.p), len, __builtin_object_size(p, @as(c_int, 0)));
    return p;
}
pub fn compile_length_cclass_node(arg_cc: [*c]CClassNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var cc = arg_cc;
    var reg = arg_reg;
    return 1;
}
pub fn compile_cclass_node(arg_cc: [*c]CClassNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var cc = arg_cc;
    var reg = arg_reg;
    var r: c_int = undefined;
    if ((@ptrCast(?*c_void, (cc.*.mbuf))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        r = add_op(reg, if ((((cc).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))) OP_CCLASS_NOT else OP_CCLASS);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.cclass.bsp = @ptrCast(BitSetRef, @alignCast(@alignOf(Bits), malloc(@sizeOf(BitSet))));
        if ((@ptrCast(?*c_void, (((reg).*.ops_curr).*.unnamed_0.cclass.bsp))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        _ = __builtin___memcpy_chk(@ptrCast(?*c_void, ((reg).*.ops_curr).*.unnamed_0.cclass.bsp), @ptrCast(?*const c_void, &cc.*.bs), @sizeOf(BitSet), __builtin_object_size(@ptrCast(?*const c_void, ((reg).*.ops_curr).*.unnamed_0.cclass.bsp), @as(c_int, 0)));
    } else {
        var p: ?*c_void = undefined;
        if ((((reg.*.enc).*.min_enc_len) > @as(c_int, 1)) or (bitset_is_empty(&cc.*.bs) != 0)) {
            r = add_op(reg, if ((((cc).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))) OP_CCLASS_MB_NOT else OP_CCLASS_MB);
            if (r != @as(c_int, 0)) return r;
            p = set_multi_byte_cclass(cc.*.mbuf, reg);
            if ((p) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            ((reg).*.ops_curr).*.unnamed_0.cclass_mb.mb = p;
        } else {
            r = add_op(reg, if ((((cc).*.flags) & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0))) OP_CCLASS_MIX_NOT else OP_CCLASS_MIX);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.cclass_mix.bsp = @ptrCast(BitSetRef, @alignCast(@alignOf(Bits), malloc(@sizeOf(BitSet))));
            if ((@ptrCast(?*c_void, (((reg).*.ops_curr).*.unnamed_0.cclass_mix.bsp))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            _ = __builtin___memcpy_chk(@ptrCast(?*c_void, ((reg).*.ops_curr).*.unnamed_0.cclass_mix.bsp), @ptrCast(?*const c_void, &cc.*.bs), @sizeOf(BitSet), __builtin_object_size(@ptrCast(?*const c_void, ((reg).*.ops_curr).*.unnamed_0.cclass_mix.bsp), @as(c_int, 0)));
            p = set_multi_byte_cclass(cc.*.mbuf, reg);
            if ((p) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
            ((reg).*.ops_curr).*.unnamed_0.cclass_mix.mb = p;
        }
    }
    return 0;
}
pub fn set_addr_in_repeat_range(arg_reg: [*c]regex_t) callconv(.C) void {
    var reg = arg_reg;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < reg.*.num_repeat) : (i += 1) {
            var p: [*c]RepeatRange = (reg.*.repeat_range + i);
            var offset: c_int = p.*.u.offset;
            p.*.u.pcode = (reg.*.ops + offset);
        }
    }
}
pub fn entry_repeat_range(arg_reg: [*c]regex_t, arg_id: c_int, arg_lower: c_int, arg_upper: c_int, arg_ops_index: c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var id = arg_id;
    var lower = arg_lower;
    var upper = arg_upper;
    var ops_index = arg_ops_index;
    var p: [*c]RepeatRange = undefined;
    if (reg.*.repeat_range_alloc == @as(c_int, 0)) {
        p = @ptrCast([*c]RepeatRange, @alignCast(@alignOf(RepeatRange), malloc((@sizeOf(RepeatRange) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 4)))))));
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        reg.*.repeat_range = p;
        reg.*.repeat_range_alloc = 4;
    } else if (reg.*.repeat_range_alloc <= id) {
        var n: c_int = undefined;
        n = (reg.*.repeat_range_alloc + @as(c_int, 4));
        p = @ptrCast([*c]RepeatRange, @alignCast(@alignOf(RepeatRange), realloc(@ptrCast(?*c_void, reg.*.repeat_range), (@sizeOf(RepeatRange) *% @bitCast(c_ulong, @as(c_long, n))))));
        if ((@ptrCast(?*c_void, (p))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        reg.*.repeat_range = p;
        reg.*.repeat_range_alloc = n;
    } else {
        p = reg.*.repeat_range;
    }
    p[@intCast(c_uint, id)].lower = lower;
    p[@intCast(c_uint, id)].upper = (if ((upper) == -@as(c_int, 1)) @as(c_int, 2147483647) else upper);
    p[@intCast(c_uint, id)].u.offset = ops_index;
    return 0;
}
pub fn compile_range_repeat_node(arg_qn: [*c]QuantNode, arg_target_len: c_int, arg_emptiness: c_int, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var qn = arg_qn;
    var target_len = arg_target_len;
    var emptiness = arg_emptiness;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var num_repeat: c_int = (blk: {
        const ref = &reg.*.num_repeat;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    });
    r = add_op(reg, if (qn.*.greedy != 0) OP_REPEAT else OP_REPEAT_NG);
    if (r != @as(c_int, 0)) return r;
    ((reg).*.ops_curr).*.unnamed_0.repeat.id = num_repeat;
    ((reg).*.ops_curr).*.unnamed_0.repeat.addr = ((@as(c_int, 1) + target_len) + @as(c_int, 1));
    r = entry_repeat_range(reg, num_repeat, qn.*.lower, qn.*.upper, @bitCast(c_int, (((reg).*.ops_used -% @bitCast(c_uint, @as(c_int, 1))) +% @bitCast(c_uint, @as(c_int, 1)))));
    if (r != @as(c_int, 0)) return r;
    r = compile_quant_body_with_empty_check(qn, reg, env);
    if (r != @as(c_int, 0)) return r;
    r = add_op(reg, if (qn.*.greedy != 0) OP_REPEAT_INC else OP_REPEAT_INC_NG);
    if (r != @as(c_int, 0)) return r;
    ((reg).*.ops_curr).*.unnamed_0.repeat_inc.id = num_repeat;
    return r;
}
pub fn is_anychar_infinite_greedy(arg_qn: [*c]QuantNode) callconv(.C) c_int {
    var qn = arg_qn;
    if (((qn.*.greedy != 0) and ((qn.*.upper) == -@as(c_int, 1))) and ((@bitCast(c_uint, @enumToInt((((qn).*.body).*.u.base.node_type))) == @bitCast(c_uint, NODE_CTYPE)) and ((&(((qn).*.body).*.u.ctype)).*.ctype == -@as(c_int, 1)))) return 1 else return 0;
    return 0;
}
pub fn compile_length_quantifier_node(arg_qn: [*c]QuantNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var qn = arg_qn;
    var reg = arg_reg;
    var len: c_int = undefined;
    var mod_tlen: c_int = undefined;
    var infinite: c_int = @boolToInt(((qn.*.upper) == -@as(c_int, 1)));
    var emptiness: enum_BodyEmptyType = qn.*.emptiness;
    var tlen: c_int = compile_length_tree(((qn).*.body), reg);
    if (tlen < @as(c_int, 0)) return tlen;
    if (tlen == @as(c_int, 0)) return 0;
    if (is_anychar_infinite_greedy(qn) != 0) {
        if ((qn.*.lower <= @as(c_int, 1)) or (len_multiply_cmp(@bitCast(OnigLen, tlen), qn.*.lower, @bitCast(OnigLen, @as(c_int, 10))) <= @as(c_int, 0))) {
            if ((@ptrCast(?*c_void, (qn.*.next_head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) return (@as(c_int, 1) + (tlen * qn.*.lower)) else return (@as(c_int, 1) + (tlen * qn.*.lower));
        }
    }
    mod_tlen = tlen;
    if (@bitCast(c_uint, @enumToInt(emptiness)) != @bitCast(c_uint, BODY_IS_NOT_EMPTY)) mod_tlen += (@as(c_int, 1) + @as(c_int, 1));
    if ((infinite != 0) and ((qn.*.lower <= @as(c_int, 1)) or (len_multiply_cmp(@bitCast(OnigLen, tlen), qn.*.lower, @bitCast(OnigLen, @as(c_int, 10))) <= @as(c_int, 0)))) {
        if ((qn.*.lower == @as(c_int, 1)) and (tlen > @as(c_int, 10))) {
            len = 1;
        } else {
            len = (tlen * qn.*.lower);
        }
        if (qn.*.greedy != 0) {
            if ((@ptrCast(?*c_void, (qn.*.head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) len += ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1)) else if ((@ptrCast(?*c_void, (qn.*.next_head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) len += ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1)) else len += ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1));
        } else len += ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1));
    } else if (qn.*.upper == @as(c_int, 0)) {
        if (qn.*.include_referred != @as(c_int, 0)) {
            len = (@as(c_int, 1) + tlen);
        } else len = 0;
    } else if ((!(infinite != 0) and (qn.*.greedy != 0)) and ((qn.*.upper == @as(c_int, 1)) or (len_multiply_cmp((@bitCast(OnigLen, tlen) +% @bitCast(c_uint, @as(c_int, 1))), qn.*.upper, @bitCast(OnigLen, @as(c_int, 10))) <= @as(c_int, 0)))) {
        len = (tlen * qn.*.lower);
        len += ((@as(c_int, 1) + tlen) * (qn.*.upper - qn.*.lower));
    } else if ((!(qn.*.greedy != 0) and (qn.*.upper == @as(c_int, 1))) and (qn.*.lower == @as(c_int, 0))) {
        len = ((@as(c_int, 1) + @as(c_int, 1)) + tlen);
    } else {
        len = ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1));
    }
    return len;
}
pub fn compile_quantifier_node(arg_qn: [*c]QuantNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var qn = arg_qn;
    var reg = arg_reg;
    var env = arg_env;
    var i: c_int = undefined;
    var r: c_int = undefined;
    var mod_tlen: c_int = undefined;
    var infinite: c_int = @boolToInt(((qn.*.upper) == -@as(c_int, 1)));
    var emptiness: enum_BodyEmptyType = qn.*.emptiness;
    var tlen: c_int = compile_length_tree(((qn).*.body), reg);
    if (tlen < @as(c_int, 0)) return tlen;
    if (tlen == @as(c_int, 0)) return 0;
    if ((is_anychar_infinite_greedy(qn) != 0) and ((qn.*.lower <= @as(c_int, 1)) or (len_multiply_cmp(@bitCast(OnigLen, tlen), qn.*.lower, @bitCast(OnigLen, @as(c_int, 10))) <= @as(c_int, 0)))) {
        r = compile_tree_n_times(((qn).*.body), qn.*.lower, reg, env);
        if (r != @as(c_int, 0)) return r;
        if ((@ptrCast(?*c_void, (qn.*.next_head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            r = add_op(reg, if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), ((qn).*.body)))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 22))) != @as(c_int, 0)) OP_ANYCHAR_ML_STAR_PEEK_NEXT else OP_ANYCHAR_STAR_PEEK_NEXT);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.anychar_star_peek_next.c = (&((qn.*.next_head_exact).*.u.str)).*.s[@intCast(c_uint, @as(c_int, 0))];
            return 0;
        } else {
            r = add_op(reg, if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), ((qn).*.body)))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 22))) != @as(c_int, 0)) OP_ANYCHAR_ML_STAR else OP_ANYCHAR_STAR);
            return r;
        }
    }
    mod_tlen = tlen;
    if (@bitCast(c_uint, @enumToInt(emptiness)) != @bitCast(c_uint, BODY_IS_NOT_EMPTY)) mod_tlen += (@as(c_int, 1) + @as(c_int, 1));
    if ((infinite != 0) and ((qn.*.lower <= @as(c_int, 1)) or (len_multiply_cmp(@bitCast(OnigLen, tlen), qn.*.lower, @bitCast(OnigLen, @as(c_int, 10))) <= @as(c_int, 0)))) {
        var addr: c_int = undefined;
        if ((qn.*.lower == @as(c_int, 1)) and (tlen > @as(c_int, 10))) {
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            if (qn.*.greedy != 0) {
                if ((@ptrCast(?*c_void, (qn.*.head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) ((reg).*.ops_curr).*.unnamed_0.jump.addr = (@as(c_int, 1) + @as(c_int, 1)) else if ((@ptrCast(?*c_void, (qn.*.next_head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) ((reg).*.ops_curr).*.unnamed_0.jump.addr = (@as(c_int, 1) + @as(c_int, 1)) else ((reg).*.ops_curr).*.unnamed_0.jump.addr = (@as(c_int, 1) + @as(c_int, 1));
            } else {
                ((reg).*.ops_curr).*.unnamed_0.jump.addr = (@as(c_int, 1) + @as(c_int, 1));
            }
        } else {
            r = compile_tree_n_times(((qn).*.body), qn.*.lower, reg, env);
            if (r != @as(c_int, 0)) return r;
        }
        if (qn.*.greedy != 0) {
            if ((@ptrCast(?*c_void, (qn.*.head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                r = add_op(reg, OP_PUSH_OR_JUMP_EXACT1);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.push_or_jump_exact1.addr = ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1));
                ((reg).*.ops_curr).*.unnamed_0.push_or_jump_exact1.c = (&((qn.*.head_exact).*.u.str)).*.s[@intCast(c_uint, @as(c_int, 0))];
                r = compile_quant_body_with_empty_check(qn, reg, env);
                if (r != @as(c_int, 0)) return r;
                addr = -(mod_tlen + @as(c_int, 1));
            } else if ((@ptrCast(?*c_void, (qn.*.next_head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                r = add_op(reg, OP_PUSH_IF_PEEK_NEXT);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.push_if_peek_next.addr = ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1));
                ((reg).*.ops_curr).*.unnamed_0.push_if_peek_next.c = (&((qn.*.next_head_exact).*.u.str)).*.s[@intCast(c_uint, @as(c_int, 0))];
                r = compile_quant_body_with_empty_check(qn, reg, env);
                if (r != @as(c_int, 0)) return r;
                addr = -(mod_tlen + @as(c_int, 1));
            } else {
                r = add_op(reg, OP_PUSH);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.push.addr = ((@as(c_int, 1) + mod_tlen) + @as(c_int, 1));
                r = compile_quant_body_with_empty_check(qn, reg, env);
                if (r != @as(c_int, 0)) return r;
                addr = -(mod_tlen + @as(c_int, 1));
            }
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.jump.addr = addr;
        } else {
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.jump.addr = (mod_tlen + @as(c_int, 1));
            r = compile_quant_body_with_empty_check(qn, reg, env);
            if (r != @as(c_int, 0)) return r;
            r = add_op(reg, OP_PUSH);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.push.addr = -mod_tlen;
        }
    } else if (qn.*.upper == @as(c_int, 0)) {
        if (qn.*.include_referred != @as(c_int, 0)) {
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.jump.addr = (tlen + @as(c_int, 1));
            r = compile_tree(((qn).*.body), reg, env);
        } else {
            r = 0;
        }
    } else if ((!(infinite != 0) and (qn.*.greedy != 0)) and ((qn.*.upper == @as(c_int, 1)) or (len_multiply_cmp((@bitCast(OnigLen, tlen) +% @bitCast(c_uint, @as(c_int, 1))), qn.*.upper, @bitCast(OnigLen, @as(c_int, 10))) <= @as(c_int, 0)))) {
        var n: c_int = (qn.*.upper - qn.*.lower);
        r = compile_tree_n_times(((qn).*.body), qn.*.lower, reg, env);
        if (r != @as(c_int, 0)) return r;
        {
            i = 0;
            while (i < n) : (i += 1) {
                var v: c_int = onig_positive_int_multiply((n - i), (tlen + @as(c_int, 1)));
                if (v < @as(c_int, 0)) return -@as(c_int, 201);
                r = add_op(reg, OP_PUSH);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.push.addr = v;
                r = compile_tree(((qn).*.body), reg, env);
                if (r != @as(c_int, 0)) return r;
            }
        }
    } else if ((!(qn.*.greedy != 0) and (qn.*.upper == @as(c_int, 1))) and (qn.*.lower == @as(c_int, 0))) {
        r = add_op(reg, OP_PUSH);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.push.addr = (@as(c_int, 1) + @as(c_int, 1));
        r = add_op(reg, OP_JUMP);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.jump.addr = (tlen + @as(c_int, 1));
        r = compile_tree(((qn).*.body), reg, env);
    } else {
        r = compile_range_repeat_node(qn, mod_tlen, @bitCast(c_int, @enumToInt(emptiness)), reg, env);
    }
    return r;
}
pub fn compile_length_option_node(arg_node: [*c]BagNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var tlen: c_int = undefined;
    tlen = compile_length_tree(((node).*.body), reg);
    return tlen;
}
pub fn compile_option_node(arg_node: [*c]BagNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    r = compile_tree(((node).*.body), reg, env);
    return r;
}
pub fn compile_length_bag_node(arg_node: [*c]BagNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var len: c_int = undefined;
    var tlen: c_int = undefined;
    if (@bitCast(c_uint, @enumToInt(node.*.type)) == @bitCast(c_uint, BAG_OPTION)) return compile_length_option_node(node, reg);
    if (((node).*.body) != null) {
        tlen = compile_length_tree(((node).*.body), reg);
        if (tlen < @as(c_int, 0)) return tlen;
    } else tlen = 0;
    @"switch": {
        case_5: {
            case_3: {
                case_1: {
                    case: {
                        switch (@bitCast(c_uint, @enumToInt(node.*.type))) {
                            @bitCast(c_uint, @as(c_int, 0)) => break :case,
                            @bitCast(c_uint, @as(c_int, 2)) => break :case_1,
                            @bitCast(c_uint, @as(c_int, 3)) => break :case_3,
                            @bitCast(c_uint, @as(c_int, 1)) => break :case_5,
                            else => break :@"switch",
                        }
                    }
                    if ((node.*.unnamed_0.m.regnum == @as(c_int, 0)) and ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0))) {
                        len = (((tlen + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1));
                        return len;
                    }
                    if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0)) {
                        len = ((((@as(c_int, 1) + tlen) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1));
                        if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_end) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_end) & @bitCast(c_uint, @as(c_int, 1)))) != 0) len += (if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 1)) else len += (if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 1));
                    } else if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) {
                        len = 1;
                        len += (tlen + (if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_end) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_end) & @bitCast(c_uint, @as(c_int, 1)))) != 0) @as(c_int, 1) else @as(c_int, 1)));
                    } else {
                        if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_start) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_start) & @bitCast(c_uint, @as(c_int, 1)))) != 0) len = 1 else len = 1;
                        len += (tlen + (if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_end) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_end) & @bitCast(c_uint, @as(c_int, 1)))) != 0) @as(c_int, 1) else @as(c_int, 1)));
                    }
                    break :@"switch";
                }
                if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5))) != @as(c_int, 0)) {
                    var v: c_int = undefined;
                    var qn: [*c]QuantNode = undefined;
                    qn = (&(((node).*.body).*.u.quant));
                    tlen = compile_length_tree(((qn).*.body), reg);
                    if (tlen < @as(c_int, 0)) return tlen;
                    v = onig_positive_int_multiply(qn.*.lower, tlen);
                    if (v < @as(c_int, 0)) return -@as(c_int, 201);
                    len = ((((v + @as(c_int, 1)) + tlen) + @as(c_int, 1)) + @as(c_int, 1));
                } else {
                    len = ((@as(c_int, 1) + tlen) + @as(c_int, 1));
                }
                break :switch_2;
            }
            {
                var cond: [*c]Node = ((node).*.body);
                var Then: [*c]Node = node.*.unnamed_0.te.Then;
                var Else: [*c]Node = node.*.unnamed_0.te.Else;
                len = compile_length_tree(cond, reg);
                if (len < @as(c_int, 0)) return len;
                len += ((@as(c_int, 1) + @as(c_int, 1)) + @as(c_int, 1));
                if ((@ptrCast(?*c_void, (Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                    tlen = compile_length_tree(Then, reg);
                    if (tlen < @as(c_int, 0)) return tlen;
                    len += tlen;
                }
                len += (@as(c_int, 1) + @as(c_int, 1));
                if ((@ptrCast(?*c_void, (Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                    tlen = compile_length_tree(Else, reg);
                    if (tlen < @as(c_int, 0)) return tlen;
                    len += tlen;
                }
            }
            break :switch_4;
        }
        len = 0;
        break :switch_6;
    }
    return len;
}
pub fn compile_bag_memory_node(arg_node: [*c]BagNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0)) {
        var len: c_int = undefined;
        r = add_op(reg, OP_CALL);
        if (r != @as(c_int, 0)) return r;
        node.*.unnamed_0.m.called_addr = @bitCast(AbsAddrType, ((((reg).*.ops_used -% @bitCast(c_uint, @as(c_int, 1))) +% @bitCast(c_uint, @as(c_int, 1))) +% @bitCast(c_uint, @as(c_int, 1))));
        _ = (blk: {
            const ref = &((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status);
            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8));
            break :blk ref.*;
        });
        ((reg).*.ops_curr).*.unnamed_0.call.addr = @bitCast(c_int, node.*.unnamed_0.m.called_addr);
        if (node.*.unnamed_0.m.regnum == @as(c_int, 0)) {
            len = compile_length_tree(((node).*.body), reg);
            len += @as(c_int, 1);
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.jump.addr = (len + @as(c_int, 1));
            r = compile_tree(((node).*.body), reg, env);
            if (r != @as(c_int, 0)) return r;
            r = add_op(reg, OP_RETURN);
            return r;
        } else {
            len = compile_length_tree(((node).*.body), reg);
            len += (@as(c_int, 1) + @as(c_int, 1));
            if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_end) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_end) & @bitCast(c_uint, @as(c_int, 1)))) != 0) len += (if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 1)) else len += (if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 1));
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.jump.addr = (len + @as(c_int, 1));
        }
    }
    if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_start) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_start) & @bitCast(c_uint, @as(c_int, 1)))) != 0) r = add_op(reg, OP_MEM_START_PUSH) else r = add_op(reg, OP_MEM_START);
    if (r != @as(c_int, 0)) return r;
    ((reg).*.ops_curr).*.unnamed_0.memory_start.num = node.*.unnamed_0.m.regnum;
    r = compile_tree(((node).*.body), reg, env);
    if (r != @as(c_int, 0)) return r;
    if ((if (((node.*.unnamed_0.m.regnum) > @as(c_int, 0)) and ((node.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8)))))))) ((reg.*.push_mem_end) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), node.*.unnamed_0.m.regnum))) else ((reg.*.push_mem_end) & @bitCast(c_uint, @as(c_int, 1)))) != 0) r = add_op(reg, (if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) OP_MEM_END_PUSH_REC else OP_MEM_END_PUSH)) else r = add_op(reg, (if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) OP_MEM_END_REC else OP_MEM_END));
    if (r != @as(c_int, 0)) return r;
    ((reg).*.ops_curr).*.unnamed_0.memory_end.num = node.*.unnamed_0.m.regnum;
    if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0)) {
        r = add_op(reg, OP_RETURN);
    }
    return r;
}
pub fn compile_bag_node(arg_node: [*c]BagNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var len: c_int = undefined;
    @"switch": {
        case_5: {
            case_3: {
                case_1: {
                    case: {
                        switch (@bitCast(c_uint, @enumToInt(node.*.type))) {
                            @bitCast(c_uint, @as(c_int, 0)) => break :case,
                            @bitCast(c_uint, @as(c_int, 1)) => break :case_1,
                            @bitCast(c_uint, @as(c_int, 2)) => break :case_3,
                            @bitCast(c_uint, @as(c_int, 3)) => break :case_5,
                            else => break :@"switch",
                        }
                    }
                    r = compile_bag_memory_node(node, reg, env);
                    break :@"switch";
                }
                r = compile_option_node(node, reg, env);
                break :switch_2;
            }
            if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), node))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5))) != @as(c_int, 0)) {
                var qn: [*c]QuantNode = (&(((node).*.body).*.u.quant));
                r = compile_tree_n_times(((qn).*.body), qn.*.lower, reg, env);
                if (r != @as(c_int, 0)) return r;
                len = compile_length_tree(((qn).*.body), reg);
                if (len < @as(c_int, 0)) return len;
                r = add_op(reg, OP_PUSH);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.push.addr = (((@as(c_int, 1) + len) + @as(c_int, 1)) + @as(c_int, 1));
                r = compile_tree(((qn).*.body), reg, env);
                if (r != @as(c_int, 0)) return r;
                r = add_op(reg, OP_POP);
                if (r != @as(c_int, 0)) return r;
                r = add_op(reg, OP_JUMP);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.jump.addr = -((@as(c_int, 1) + len) + @as(c_int, 1));
            } else {
                var mid: MemNumType = undefined;
                while (true) {
                    mid = (blk: {
                        const ref = &(env).*.id_num;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    });
                    if (!false) break;
                }
                r = add_op(reg, OP_MARK);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.mark.id = mid;
                ((reg).*.ops_curr).*.unnamed_0.mark.save_pos = 0;
                r = compile_tree(((node).*.body), reg, env);
                if (r != @as(c_int, 0)) return r;
                r = add_op(reg, OP_CUT_TO_MARK);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.id = mid;
                ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.restore_pos = 0;
            }
            break :switch_4;
        }
        {
            var cond_len: c_int = undefined;
            var then_len: c_int = undefined;
            var else_len: c_int = undefined;
            var jump_len: c_int = undefined;
            var mid: MemNumType = undefined;
            var cond: [*c]Node = ((node).*.body);
            var Then: [*c]Node = node.*.unnamed_0.te.Then;
            var Else: [*c]Node = node.*.unnamed_0.te.Else;
            while (true) {
                mid = (blk: {
                    const ref = &(env).*.id_num;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                if (!false) break;
            }
            r = add_op(reg, OP_MARK);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.mark.id = mid;
            ((reg).*.ops_curr).*.unnamed_0.mark.save_pos = 0;
            cond_len = compile_length_tree(cond, reg);
            if (cond_len < @as(c_int, 0)) return cond_len;
            if ((@ptrCast(?*c_void, (Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                then_len = compile_length_tree(Then, reg);
                if (then_len < @as(c_int, 0)) return then_len;
            } else then_len = 0;
            jump_len = (((cond_len + then_len) + @as(c_int, 1)) + @as(c_int, 1));
            r = add_op(reg, OP_PUSH);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.push.addr = (@as(c_int, 1) + jump_len);
            r = compile_tree(cond, reg, env);
            if (r != @as(c_int, 0)) return r;
            r = add_op(reg, OP_CUT_TO_MARK);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.id = mid;
            ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.restore_pos = 0;
            if ((@ptrCast(?*c_void, (Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                r = compile_tree(Then, reg, env);
                if (r != @as(c_int, 0)) return r;
            }
            if ((@ptrCast(?*c_void, (Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                else_len = compile_length_tree(Else, reg);
                if (else_len < @as(c_int, 0)) return else_len;
            } else else_len = 0;
            r = add_op(reg, OP_JUMP);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.jump.addr = ((@as(c_int, 1) + else_len) + @as(c_int, 1));
            r = add_op(reg, OP_CUT_TO_MARK);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.id = mid;
            ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.restore_pos = 0;
            if ((@ptrCast(?*c_void, (Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                r = compile_tree(Else, reg, env);
            }
        }
        break :switch_6;
    }
    return r;
}
pub fn compile_length_anchor_node(arg_node: [*c]AnchorNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var len: c_int = undefined;
    var tlen: c_int = 0;
    if ((@ptrCast(?*c_void, ((node).*.body))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        tlen = compile_length_tree(((node).*.body), reg);
        if (tlen < @as(c_int, 0)) return tlen;
    }
    switch_15: {
        default: {
            case_13: {
                case_12: {
                    case_10: {
                        case_9: {
                            case_8: {
                                case_7: {
                                    case_5: {
                                        case_3: {
                                            case_1: {
                                                case: {
                                                    switch (node.*.type) {
                                                        @as(c_int, 1) => break :case,
                                                        @as(c_int, 2) => break :case_1,
                                                        @as(c_int, 4) => break :case_3,
                                                        @as(c_int, 8) => break :case_5,
                                                        @as(c_int, 1024) => break :case_7,
                                                        @as(c_int, 2048) => break :case_8,
                                                        @as(c_int, 4096) => break :case_9,
                                                        @as(c_int, 8192) => break :case_10,
                                                        @as(c_int, 65536) => break :case_12,
                                                        @as(c_int, 131072) => break :case_13,
                                                        else => break :default,
                                                    }
                                                }
                                                len = ((@as(c_int, 1) + tlen) + @as(c_int, 1));
                                                break :@"switch";
                                            }
                                            len = (((((@as(c_int, 1) + @as(c_int, 1)) + tlen) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1));
                                            break :switch_2;
                                        }
                                        if (node.*.char_min_len == node.*.char_max_len) len = (((@as(c_int, 1) + @as(c_int, 1)) + tlen) + @as(c_int, 1)) else {
                                            len = ((((((((((((@as(c_int, 1) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + tlen) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1));
                                            if ((@ptrCast(?*c_void, (node.*.lead_node))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                                var llen: c_int = compile_length_tree(node.*.lead_node, reg);
                                                if (llen < @as(c_int, 0)) return llen;
                                                len += (@as(c_int, 1) + llen);
                                            }
                                        }
                                        break :switch_4;
                                    }
                                    if (node.*.char_min_len == node.*.char_max_len) len = ((((((@as(c_int, 1) + @as(c_int, 1)) + @as(c_int, 1)) + tlen) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) else {
                                        len = ((((((((((((((@as(c_int, 1) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + tlen) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1));
                                        if ((@ptrCast(?*c_void, (node.*.lead_node))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                            var llen: c_int = compile_length_tree(node.*.lead_node, reg);
                                            if (llen < @as(c_int, 0)) return llen;
                                            len += (@as(c_int, 1) + llen);
                                        }
                                    }
                                    break :switch_6;
                                }
                            }
                        }
                    }
                    len = 1;
                    break :switch_11;
                }
            }
            len = 1;
            break :switch_14;
        }
        len = 1;
        break :switch_15;
    }
    return len;
}
pub fn compile_anchor_look_behind_node(arg_node: [*c]AnchorNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    if (node.*.char_min_len == node.*.char_max_len) {
        var mid: MemNumType = undefined;
        while (true) {
            mid = (blk: {
                const ref = &(env).*.id_num;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            if (!false) break;
        }
        r = add_op(reg, OP_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.mark.id = mid;
        ((reg).*.ops_curr).*.unnamed_0.mark.save_pos = 0;
        r = add_op(reg, OP_STEP_BACK_START);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.initial = @bitCast(LengthType, node.*.char_min_len);
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.remaining = 0;
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.addr = 1;
        r = compile_tree(((node).*.body), reg, env);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_CUT_TO_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.id = mid;
        ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.restore_pos = 0;
    } else {
        var mid1: MemNumType = undefined;
        var mid2: MemNumType = undefined;
        var diff: OnigLen = undefined;
        if ((@ptrCast(?*c_void, (node.*.lead_node))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            var ci: MinMaxCharLen = undefined;
            r = node_char_len(node.*.lead_node, reg, &ci, env);
            if (r < @as(c_int, 0)) return r;
            r = add_op(reg, OP_MOVE);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.move.n = -(@bitCast(RelPositionType, ci.min));
            r = compile_tree(node.*.lead_node, reg, env);
            if (r != @as(c_int, 0)) return r;
        }
        while (true) {
            mid1 = (blk: {
                const ref = &(env).*.id_num;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            if (!false) break;
        }
        r = add_op(reg, OP_SAVE_VAL);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.save_val.type = SAVE_RIGHT_RANGE;
        ((reg).*.ops_curr).*.unnamed_0.save_val.id = mid1;
        r = add_op(reg, OP_UPDATE_VAR);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.update_var.type = UPDATE_VAR_RIGHT_RANGE_TO_S;
        while (true) {
            mid2 = (blk: {
                const ref = &(env).*.id_num;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            if (!false) break;
        }
        r = add_op(reg, OP_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.mark.id = mid2;
        ((reg).*.ops_curr).*.unnamed_0.mark.save_pos = 0;
        r = add_op(reg, OP_PUSH);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.push.addr = (@as(c_int, 1) + @as(c_int, 1));
        r = add_op(reg, OP_JUMP);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.jump.addr = ((@as(c_int, 1) + @as(c_int, 1)) + @as(c_int, 1));
        r = add_op(reg, OP_UPDATE_VAR);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.update_var.type = UPDATE_VAR_RIGHT_RANGE_FROM_STACK;
        ((reg).*.ops_curr).*.unnamed_0.update_var.id = mid1;
        ((reg).*.ops_curr).*.unnamed_0.update_var.clear = 0;
        r = add_op(reg, OP_FAIL);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_STEP_BACK_START);
        if (r != @as(c_int, 0)) return r;
        if (node.*.char_max_len != ~(@bitCast(OnigLen, @as(c_int, 0)))) diff = (node.*.char_max_len -% node.*.char_min_len) else diff = ~(@bitCast(OnigLen, @as(c_int, 0)));
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.initial = @bitCast(LengthType, node.*.char_min_len);
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.remaining = @bitCast(LengthType, diff);
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.addr = 2;
        r = add_op(reg, OP_STEP_BACK_NEXT);
        if (r != @as(c_int, 0)) return r;
        r = compile_tree(((node).*.body), reg, env);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_CHECK_POSITION);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.check_position.type = @intToEnum(enum_CheckPositionType, CHECK_POSITION_CURRENT_RIGHT_RANGE);
        r = add_op(reg, OP_CUT_TO_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.id = mid2;
        ((reg).*.ops_curr).*.unnamed_0.cut_to_mark.restore_pos = 0;
        r = add_op(reg, OP_UPDATE_VAR);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.update_var.type = UPDATE_VAR_RIGHT_RANGE_FROM_STACK;
        ((reg).*.ops_curr).*.unnamed_0.update_var.id = mid1;
        ((reg).*.ops_curr).*.unnamed_0.update_var.clear = 1;
    }
    return r;
}
pub fn compile_anchor_look_behind_not_node(arg_node: [*c]AnchorNode, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var len: c_int = undefined;
    len = compile_length_tree(((node).*.body), reg);
    if (node.*.char_min_len == node.*.char_max_len) {
        var mid: MemNumType = undefined;
        while (true) {
            mid = (blk: {
                const ref = &(env).*.id_num;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            if (!false) break;
        }
        r = add_op(reg, OP_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.mark.id = mid;
        ((reg).*.ops_curr).*.unnamed_0.mark.save_pos = 0;
        r = add_op(reg, OP_PUSH);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.push.addr = ((((@as(c_int, 1) + @as(c_int, 1)) + len) + @as(c_int, 1)) + @as(c_int, 1));
        r = add_op(reg, OP_STEP_BACK_START);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.initial = @bitCast(LengthType, node.*.char_min_len);
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.remaining = 0;
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.addr = 1;
        r = compile_tree(((node).*.body), reg, env);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_POP_TO_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.pop_to_mark.id = mid;
        r = add_op(reg, OP_FAIL);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_POP);
    } else {
        var mid1: MemNumType = undefined;
        var mid2: MemNumType = undefined;
        var diff: OnigLen = undefined;
        while (true) {
            mid1 = (blk: {
                const ref = &(env).*.id_num;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            if (!false) break;
        }
        r = add_op(reg, OP_SAVE_VAL);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.save_val.type = SAVE_RIGHT_RANGE;
        ((reg).*.ops_curr).*.unnamed_0.save_val.id = mid1;
        r = add_op(reg, OP_UPDATE_VAR);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.update_var.type = UPDATE_VAR_RIGHT_RANGE_TO_S;
        while (true) {
            mid2 = (blk: {
                const ref = &(env).*.id_num;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            if (!false) break;
        }
        r = add_op(reg, OP_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.mark.id = mid2;
        ((reg).*.ops_curr).*.unnamed_0.mark.save_pos = 0;
        r = add_op(reg, OP_PUSH);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.push.addr = ((((((((@as(c_int, 1) + @as(c_int, 1)) + @as(c_int, 1)) + len) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1)) + @as(c_int, 1));
        if ((@ptrCast(?*c_void, (node.*.lead_node))) != @intToPtr(?*c_void, @as(c_int, 0))) {
            var clen: c_int = undefined;
            var ci: MinMaxCharLen = undefined;
            clen = compile_length_tree(node.*.lead_node, reg);
            ((reg).*.ops_curr).*.unnamed_0.push.addr += (@as(c_int, 1) + clen);
            r = node_char_len(node.*.lead_node, reg, &ci, env);
            if (r < @as(c_int, 0)) return r;
            r = add_op(reg, OP_MOVE);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.move.n = -(@bitCast(RelPositionType, ci.min));
            r = compile_tree(node.*.lead_node, reg, env);
            if (r != @as(c_int, 0)) return r;
        }
        r = add_op(reg, OP_STEP_BACK_START);
        if (r != @as(c_int, 0)) return r;
        if (node.*.char_max_len != ~(@bitCast(OnigLen, @as(c_int, 0)))) diff = (node.*.char_max_len -% node.*.char_min_len) else diff = ~(@bitCast(OnigLen, @as(c_int, 0)));
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.initial = @bitCast(LengthType, node.*.char_min_len);
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.remaining = @bitCast(LengthType, diff);
        ((reg).*.ops_curr).*.unnamed_0.step_back_start.addr = 2;
        r = add_op(reg, OP_STEP_BACK_NEXT);
        if (r != @as(c_int, 0)) return r;
        r = compile_tree(((node).*.body), reg, env);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_CHECK_POSITION);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.check_position.type = @intToEnum(enum_CheckPositionType, CHECK_POSITION_CURRENT_RIGHT_RANGE);
        r = add_op(reg, OP_POP_TO_MARK);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.pop_to_mark.id = mid2;
        r = add_op(reg, OP_UPDATE_VAR);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.update_var.type = UPDATE_VAR_RIGHT_RANGE_FROM_STACK;
        ((reg).*.ops_curr).*.unnamed_0.update_var.id = mid1;
        ((reg).*.ops_curr).*.unnamed_0.update_var.clear = 0;
        r = add_op(reg, OP_POP);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_FAIL);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_UPDATE_VAR);
        if (r != @as(c_int, 0)) return r;
        ((reg).*.ops_curr).*.unnamed_0.update_var.type = UPDATE_VAR_RIGHT_RANGE_FROM_STACK;
        ((reg).*.ops_curr).*.unnamed_0.update_var.id = mid1;
        ((reg).*.ops_curr).*.unnamed_0.update_var.clear = 0;
        r = add_op(reg, OP_POP);
        if (r != @as(c_int, 0)) return r;
        r = add_op(reg, OP_POP);
    }
    return r;
} // ./src/todo/regcomp.c:2312:3: warning: TODO implement translation of stmt class LabelStmtClass
pub const compile_anchor_node = @compileError("unable to translate function"); // ./src/todo/regcomp.c:2292:1
pub fn compile_gimmick_node(arg_node: [*c]GimmickNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var r: c_int = 0;
    @"switch": {
        case_5: {
            case_3: {
                case_1: {
                    case: {
                        switch (@bitCast(c_uint, @enumToInt(node.*.type))) {
                            @bitCast(c_uint, @as(c_int, 0)) => break :case,
                            @bitCast(c_uint, @as(c_int, 1)) => break :case_1,
                            @bitCast(c_uint, @as(c_int, 2)) => break :case_3,
                            @bitCast(c_uint, @as(c_int, 3)) => break :case_5,
                            else => break :@"switch",
                        }
                    }
                    r = add_op(reg, OP_FAIL);
                    break :@"switch";
                }
                r = add_op(reg, OP_SAVE_VAL);
                if (r != @as(c_int, 0)) return r;
                ((reg).*.ops_curr).*.unnamed_0.save_val.type = node.*.detail_type;
                ((reg).*.ops_curr).*.unnamed_0.save_val.id = node.*.id;
                break :switch_2;
            }
            r = add_op(reg, OP_UPDATE_VAR);
            if (r != @as(c_int, 0)) return r;
            ((reg).*.ops_curr).*.unnamed_0.update_var.type = node.*.detail_type;
            ((reg).*.ops_curr).*.unnamed_0.update_var.id = node.*.id;
            ((reg).*.ops_curr).*.unnamed_0.update_var.clear = 0;
            break :switch_4;
        }
        switch_6: {
            default: {
                case_4: {
                    case_2: {
                        switch (node.*.detail_type) {
                            @as(c_int, 0) => break :case_2,
                            @as(c_int, 1) => break :case_4,
                            else => break :default,
                        }
                    }
                }
                {
                    if (node.*.detail_type == ONIG_CALLOUT_OF_NAME) {
                        r = add_op(reg, OP_CALLOUT_NAME);
                        if (r != @as(c_int, 0)) return r;
                        ((reg).*.ops_curr).*.unnamed_0.callout_name.id = node.*.id;
                        ((reg).*.ops_curr).*.unnamed_0.callout_name.num = node.*.num;
                    } else {
                        r = add_op(reg, OP_CALLOUT_CONTENTS);
                        if (r != @as(c_int, 0)) return r;
                        ((reg).*.ops_curr).*.unnamed_0.callout_contents.num = node.*.num;
                    }
                }
                break :switch_5;
            }
            r = -@as(c_int, 6);
            break :switch_6;
        }
    }
    return r;
}
pub fn compile_length_gimmick_node(arg_node: [*c]GimmickNode, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var len: c_int = undefined;
    @"switch": {
        case_5: {
            case_3: {
                case_1: {
                    case: {
                        switch (@bitCast(c_uint, @enumToInt(node.*.type))) {
                            @bitCast(c_uint, @as(c_int, 0)) => break :case,
                            @bitCast(c_uint, @as(c_int, 1)) => break :case_1,
                            @bitCast(c_uint, @as(c_int, 2)) => break :case_3,
                            @bitCast(c_uint, @as(c_int, 3)) => break :case_5,
                            else => break :@"switch",
                        }
                    }
                    len = 1;
                    break :@"switch";
                }
                len = 1;
                break :switch_2;
            }
            len = 1;
            break :switch_4;
        }
        switch_6: {
            default: {
                case_4: {
                    case_2: {
                        switch (node.*.detail_type) {
                            @as(c_int, 0) => break :case_2,
                            @as(c_int, 1) => break :case_4,
                            else => break :default,
                        }
                    }
                    len = 1;
                    break :switch_3;
                }
                len = 1;
                break :switch_5;
            }
            len = -@as(c_int, 6);
            break :switch_6;
        }
        break :switch_6;
    }
    return len;
}
pub fn make_named_capture_number_map(arg_plink: [*c][*c]Node, arg_map: [*c]GroupNumMap, arg_counter: [*c]c_int) callconv(.C) c_int {
    var plink = arg_plink;
    var map = arg_map;
    var counter = arg_counter;
    var r: c_int = undefined;
    var node: [*c]Node = plink.?.*;
    switch_8: {
        default: {
            case_6: {
                case_4: {
                    case_2: {
                        case_1: {
                            case: {
                                switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                    @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                    @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                    @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                    @bitCast(c_uint, @as(c_int, 5)) => break :case_4,
                                    @bitCast(c_uint, @as(c_int, 6)) => break :case_6,
                                    else => break :default,
                                }
                            }
                        }
                        while (true) {
                            r = make_named_capture_number_map(&((&((node).*.u.cons)).*.car), map, counter);
                            if (!((r >= @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                const tmp = ((&((node).*.u.cons)).*.cdr);
                                node = tmp;
                                break :blk tmp;
                            }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                        }
                        if (r < @as(c_int, 0)) return r;
                        break :@"switch";
                    }
                    {
                        var ptarget: [*c][*c]Node = &((node).*.u.base.body);
                        r = make_named_capture_number_map(ptarget, map, counter);
                        if (r < @as(c_int, 0)) return r;
                        if ((r == @as(c_int, 1)) and (@bitCast(c_uint, @enumToInt(((ptarget.?.*).*.u.base.node_type))) == @bitCast(c_uint, NODE_QUANT))) {
                            return onig_reduce_nested_quantifier(node);
                        }
                    }
                    break :switch_3;
                }
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                        if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 9))) != @as(c_int, 0)) {
                            (counter.?.*) += 1;
                            map[@intCast(c_uint, en.*.unnamed_0.m.regnum)].new_val = counter.?.*;
                            en.*.unnamed_0.m.regnum = counter.?.*;
                            r = make_named_capture_number_map(&((node).*.u.base.body), map, counter);
                            if (r < @as(c_int, 0)) return r;
                        } else {
                            plink.?.* = ((node).*.u.base.body);
                            ((node).*.u.base.body) = (@intToPtr([*c]Node, @as(c_int, 0)));
                            onig_node_free(node);
                            r = make_named_capture_number_map(plink, map, counter);
                            if (r < @as(c_int, 0)) return r;
                            return 1;
                        }
                    } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        r = make_named_capture_number_map(&((en).*.body), map, counter);
                        if (r < @as(c_int, 0)) return r;
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = make_named_capture_number_map(&(en.*.unnamed_0.te.Then), map, counter);
                            if (r < @as(c_int, 0)) return r;
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = make_named_capture_number_map(&(en.*.unnamed_0.te.Else), map, counter);
                            if (r < @as(c_int, 0)) return r;
                        }
                    } else {
                        r = make_named_capture_number_map(&((node).*.u.base.body), map, counter);
                        if (r < @as(c_int, 0)) return r;
                    }
                }
                break :switch_5;
            }
            if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                r = make_named_capture_number_map(&((node).*.u.base.body), map, counter);
                if (r < @as(c_int, 0)) return r;
            }
            break :switch_7;
        }
        break :switch_8;
    }
    return 0;
}
pub fn renumber_backref_node(arg_node: [*c]Node, arg_map: [*c]GroupNumMap) callconv(.C) c_int {
    var node = arg_node;
    var map = arg_map;
    var i: c_int = undefined;
    var pos: c_int = undefined;
    var n: c_int = undefined;
    var old_num: c_int = undefined;
    var backs: [*c]c_int = undefined;
    var bn: [*c]BackRefNode = (&((node).*.u.backref));
    if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 15))) != @as(c_int, 0))) return -@as(c_int, 209);
    old_num = bn.*.back_num;
    if ((@ptrCast(?*c_void, (bn.*.back_dynamic))) == @intToPtr(?*c_void, @as(c_int, 0))) backs = &bn.*.back_static else backs = bn.*.back_dynamic;
    {
        _ = (blk: {
            i = 0;
            break :blk blk_1: {
                const tmp = @as(c_int, 0);
                pos = tmp;
                break :blk_1 tmp;
            };
        });
        while (i < old_num) : (i += 1) {
            n = map[@intCast(c_uint, backs[@intCast(c_uint, i)])].new_val;
            if (n > @as(c_int, 0)) {
                backs[@intCast(c_uint, pos)] = n;
                pos += 1;
            }
        }
    }
    bn.*.back_num = pos;
    return 0;
}
pub fn renumber_backref_traverse(arg_node: [*c]Node, arg_map: [*c]GroupNumMap) callconv(.C) c_int {
    var node = arg_node;
    var map = arg_map;
    var r: c_int = 0;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 3)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                r = renumber_backref_traverse(((&((node).*.u.cons)).*.car), map);
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :@"switch";
                        }
                        r = renumber_backref_traverse(((node).*.u.base.body), map);
                        break :switch_3;
                    }
                    {
                        var en: [*c]BagNode = (&((node).*.u.bag));
                        r = renumber_backref_traverse(((node).*.u.base.body), map);
                        if (r != @as(c_int, 0)) return r;
                        if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                            if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                r = renumber_backref_traverse(en.*.unnamed_0.te.Then, map);
                                if (r != @as(c_int, 0)) return r;
                            }
                            if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                r = renumber_backref_traverse(en.*.unnamed_0.te.Else, map);
                                if (r != @as(c_int, 0)) return r;
                            }
                        }
                    }
                    break :switch_5;
                }
                r = renumber_backref_node(node, map);
                break :switch_7;
            }
            if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) r = renumber_backref_traverse(((node).*.u.base.body), map);
            break :switch_9;
        }
        break :switch_10;
    }
    return r;
}
pub fn numbered_ref_check(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var r: c_int = 0;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                r = numbered_ref_check(((&((node).*.u.cons)).*.car));
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :@"switch";
                        }
                        if ((@ptrCast(?*c_void, ((node).*.u.base.body))) == @intToPtr(?*c_void, @as(c_int, 0))) break :switch_3;
                    }
                    r = numbered_ref_check(((node).*.u.base.body));
                    break :switch_5;
                }
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    r = numbered_ref_check(((node).*.u.base.body));
                    if (r != @as(c_int, 0)) return r;
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = numbered_ref_check(en.*.unnamed_0.te.Then);
                            if (r != @as(c_int, 0)) return r;
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = numbered_ref_check(en.*.unnamed_0.te.Else);
                            if (r != @as(c_int, 0)) return r;
                        }
                    }
                }
                break :switch_7;
            }
            if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 15))) != @as(c_int, 0))) return -@as(c_int, 209);
            break :switch_9;
        }
        break :switch_10;
    }
    return r;
}
pub fn disable_noname_group_capture(arg_root: [*c][*c]Node, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var root = arg_root;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    var i: c_int = undefined;
    var pos: c_int = undefined;
    var counter: c_int = undefined;
    var loc: MemStatusType = undefined;
    var map: [*c]GroupNumMap = undefined;
    map = @ptrCast([*c]GroupNumMap, @alignCast(@alignOf(GroupNumMap), __builtin_alloca((@sizeOf(GroupNumMap) *% @bitCast(c_ulong, @as(c_long, (env.*.num_mem + @as(c_int, 1))))))));
    if ((@ptrCast(?*c_void, (map))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    {
        i = 1;
        while (i <= env.*.num_mem) : (i += 1) {
            map[@intCast(c_uint, i)].new_val = 0;
        }
    }
    counter = 0;
    r = make_named_capture_number_map(root, map, &counter);
    if (r < @as(c_int, 0)) return r;
    r = renumber_backref_traverse(root.?.*, map);
    if (r != @as(c_int, 0)) return r;
    {
        _ = (blk: {
            i = 1;
            break :blk blk_1: {
                const tmp = @as(c_int, 1);
                pos = tmp;
                break :blk_1 tmp;
            };
        });
        while (i <= env.*.num_mem) : (i += 1) {
            if (map[@intCast(c_uint, i)].new_val > @as(c_int, 0)) {
                (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static)[@intCast(c_uint, pos)] = (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static)[@intCast(c_uint, i)];
                pos += 1;
            }
        }
    }
    loc = env.*.cap_history;
    (env.*.cap_history) = @bitCast(MemStatusType, @as(c_int, 0));
    {
        i = 1;
        while (i <= @as(c_int, 31)) : (i += 1) {
            if ((if ((i) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))) ((loc) & (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), i))) else ((loc) & @bitCast(c_uint, @as(c_int, 1)))) != 0) {
                while (true) {
                    if ((map[@intCast(c_uint, i)].new_val) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))) (env.*.cap_history) |= (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), (map[@intCast(c_uint, i)].new_val)));
                    if (!false) break;
                }
            }
        }
    }
    env.*.num_mem = env.*.num_named;
    reg.*.num_mem = env.*.num_named;
    return onig_renumber_name_table(reg, map);
}
pub fn fix_unset_addr_list(arg_uslist: [*c]UnsetAddrList, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var uslist = arg_uslist;
    var reg = arg_reg;
    var i: c_int = undefined;
    var offset: c_int = undefined;
    var en: [*c]BagNode = undefined;
    var addr: AbsAddrType = undefined;
    var paddr: [*c]AbsAddrType = undefined;
    {
        i = 0;
        while (i < uslist.*.num) : (i += 1) {
            if (!((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), uslist.*.us[@intCast(c_uint, i)].target))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8))) != @as(c_int, 0))) {
                if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), uslist.*.us[@intCast(c_uint, i)].target))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0)) return -@as(c_int, 11) else {
                    continue;
                }
            }
            en = (&((uslist.*.us[@intCast(c_uint, i)].target).*.u.bag));
            addr = en.*.unnamed_0.m.called_addr;
            offset = uslist.*.us[@intCast(c_uint, i)].offset;
            paddr = @ptrCast([*c]AbsAddrType, @alignCast(@alignOf(AbsAddrType), (@ptrCast([*c]u8, @alignCast(@alignOf(u8), reg.*.ops)) + offset)));
            paddr.?.* = addr;
        }
    }
    return 0;
} // ./src/todo/regcomp.c:3078:2: warning: TODO implement translation of stmt class LabelStmtClass
pub const is_exclusive = @compileError("unable to translate function"); // ./src/todo/regcomp.c:3071:1
// ./src/todo/regcomp.c:3323:7: warning: TODO complex switch cases
pub const get_tree_head_literal = @compileError("unable to translate function"); // ./src/todo/regcomp.c:3265:1
pub const GET_VALUE_NONE = @enumToInt(enum_GetValue.GET_VALUE_NONE);
pub const GET_VALUE_IGNORE = @enumToInt(enum_GetValue.GET_VALUE_IGNORE);
pub const GET_VALUE_FOUND = @enumToInt(enum_GetValue.GET_VALUE_FOUND);
pub const enum_GetValue = extern enum(c_int) {
    GET_VALUE_NONE = -1,
    GET_VALUE_IGNORE = 0,
    GET_VALUE_FOUND = 1,
    _,
};
pub fn get_tree_tail_literal(arg_node: [*c]Node, arg_rnode: [*c][*c]Node, arg_reg: [*c]regex_t) callconv(.C) c_int {
    var node = arg_node;
    var rnode = arg_rnode;
    var reg = arg_reg;
    var r: c_int = undefined;
    switch_17: {
        default: {
            case_16: {
                case_15: {
                    case_13: {
                        case_12: {
                            case_10: {
                                case_8: {
                                    case_6: {
                                        case_4: {
                                            case_3: {
                                                case_1: {
                                                    case: {
                                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                            @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_1,
                                                            @bitCast(c_uint, @as(c_int, 2)) => break :case_3,
                                                            @bitCast(c_uint, @as(c_int, 1)) => break :case_4,
                                                            @bitCast(c_uint, @as(c_int, 0)) => break :case_6,
                                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_8,
                                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_10,
                                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_12,
                                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_13,
                                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_15,
                                                            @bitCast(c_uint, @as(c_int, 3)) => break :case_16,
                                                            else => break :default,
                                                        }
                                                    }
                                                    if ((@ptrCast(?*c_void, ((&((node).*.u.cons)).*.cdr))) == @intToPtr(?*c_void, @as(c_int, 0))) {
                                                        r = get_tree_tail_literal(((&((node).*.u.cons)).*.car), rnode, reg);
                                                    } else {
                                                        r = get_tree_tail_literal(((&((node).*.u.cons)).*.cdr), rnode, reg);
                                                        if (r == GET_VALUE_IGNORE) {
                                                            r = get_tree_tail_literal(((&((node).*.u.cons)).*.car), rnode, reg);
                                                        }
                                                    }
                                                    break :@"switch";
                                                }
                                                r = get_tree_tail_literal(((node).*.u.base.body), rnode, reg);
                                                break :switch_2;
                                            }
                                            if ((&((node).*.u.ctype)).*.ctype == -@as(c_int, 1)) {
                                                r = GET_VALUE_NONE;
                                                break :switch_1;
                                            }
                                        }
                                        rnode.?.* = node;
                                        r = GET_VALUE_FOUND;
                                        break :switch_5;
                                    }
                                    {
                                        var sn: [*c]StrNode = (&((node).*.u.str));
                                        if (sn.*.end <= sn.*.s) {
                                            r = GET_VALUE_IGNORE;
                                            break :switch_1;
                                        }
                                        if (((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 21))) != @as(c_int, 0)) and !(((node).*.u.str.flag & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0)))) {
                                            r = GET_VALUE_NONE;
                                            break :switch_1;
                                        }
                                        rnode.?.* = node;
                                        r = GET_VALUE_FOUND;
                                    }
                                    break :switch_7;
                                }
                                {
                                    var qn: [*c]QuantNode = (&((node).*.u.quant));
                                    if (qn.*.lower != @as(c_int, 0)) {
                                        r = get_tree_tail_literal(((node).*.u.base.body), rnode, reg);
                                    } else r = GET_VALUE_NONE;
                                }
                                break :switch_9;
                            }
                            {
                                var en: [*c]BagNode = (&((node).*.u.bag));
                                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                                    if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) r = GET_VALUE_NONE else {
                                        _ = (blk: {
                                            const ref = &((node).*.u.base.status);
                                            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                            break :blk ref.*;
                                        });
                                        r = get_tree_tail_literal(((node).*.u.base.body), rnode, reg);
                                        _ = (blk: {
                                            const ref = &((node).*.u.base.status);
                                            ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                            break :blk ref.*;
                                        });
                                    }
                                } else {
                                    r = get_tree_tail_literal(((node).*.u.base.body), rnode, reg);
                                }
                            }
                            break :switch_11;
                        }
                    }
                    r = GET_VALUE_IGNORE;
                    break :switch_14;
                }
            }
        }
        r = GET_VALUE_NONE;
        break :switch_17;
    }
    return r;
}
pub fn check_called_node_in_look_behind(arg_node: [*c]Node, arg_not: c_int) callconv(.C) c_int {
    var node = arg_node;
    var not = arg_not;
    var r: c_int = undefined;
    r = 0;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 10)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                r = check_called_node_in_look_behind(((&((node).*.u.cons)).*.car), not);
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :@"switch";
                        }
                        r = check_called_node_in_look_behind(((node).*.u.base.body), not);
                        break :switch_3;
                    }
                    {
                        var en: [*c]BagNode = (&((node).*.u.bag));
                        if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                            if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) return 0 else {
                                _ = (blk: {
                                    const ref = &((node).*.u.base.status);
                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                    break :blk ref.*;
                                });
                                r = check_called_node_in_look_behind(((node).*.u.base.body), not);
                                _ = (blk: {
                                    const ref = &((node).*.u.base.status);
                                    ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                    break :blk ref.*;
                                });
                            }
                        } else {
                            r = check_called_node_in_look_behind(((node).*.u.base.body), not);
                            if ((r == @as(c_int, 0)) and (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE))) {
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                    r = check_called_node_in_look_behind(en.*.unnamed_0.te.Then, not);
                                    if (r != @as(c_int, 0)) break :switch_1;
                                }
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                    r = check_called_node_in_look_behind(en.*.unnamed_0.te.Else, not);
                                }
                            }
                        }
                    }
                    break :switch_5;
                }
                if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) r = check_called_node_in_look_behind(((node).*.u.base.body), not);
                break :switch_7;
            }
            if (@boolToInt(((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 24))) != @as(c_int, 0))) != @as(c_int, 0)@boolToInt return 1;
            break :switch_9;
        }
        break :switch_10;
    }
    return r;
}
var bag_mask: [2]c_uint = [2]c_uint{
    @bitCast(c_uint, (((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_MEMORY) | @as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_OPTION)) | @as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_STOP_BACKTRACK)) | @as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_IF_ELSE))),
    @bitCast(c_uint, ((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_OPTION) | @as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_STOP_BACKTRACK)) | @as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), BAG_IF_ELSE))),
};
var anchor_mask: [2]c_uint = [2]c_uint{
    @bitCast(c_uint, (((((((((((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 9))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 12))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 13))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 16))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 17)))),
    @bitCast(c_uint, ((((((((((((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 9))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 12))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 13))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 16))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 17)))),
};
pub fn check_node_in_look_behind(arg_node: [*c]Node, arg_not: c_int, arg_used: [*c]c_int) callconv(.C) c_int {
    var node = arg_node;
    var not = arg_not;
    var used = arg_used;
    _ = bag_mask;
    _ = anchor_mask;
    var type_1: NodeType = undefined;
    var r: c_int = 0;
    type_1 = ((node).*.u.base.node_type);
    if (((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), @bitCast(c_uint, @enumToInt((type_1))))) & (((((((((((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_LIST))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_ALT)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_STRING)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_CCLASS)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_CTYPE)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_ANCHOR)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_BAG)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_QUANT)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_CALL)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_BACKREF)))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), (NODE_GIMMICK))))) == @as(c_int, 0)) return 1;
    switch_12: {
        default: {
            case_10: {
                case_8: {
                    case_6: {
                        case_4: {
                            case_2: {
                                case_1: {
                                    case: {
                                        switch (@bitCast(c_uint, @enumToInt(type_1))) {
                                            @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_4,
                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_6,
                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_8,
                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_10,
                                            else => break :default,
                                        }
                                    }
                                }
                                while (true) {
                                    r = check_node_in_look_behind(((&((node).*.u.cons)).*.car), not, used);
                                    if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                        const tmp = ((&((node).*.u.cons)).*.cdr);
                                        node = tmp;
                                        break :blk tmp;
                                    }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                                }
                                break :@"switch";
                            }
                            r = check_node_in_look_behind(((node).*.u.base.body), not, used);
                            break :switch_3;
                        }
                        {
                            var en: [*c]BagNode = (&((node).*.u.bag));
                            if ((@bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), @bitCast(c_uint, @enumToInt(en.*.type))))) & bag_mask[@intCast(c_uint, not)]) == @bitCast(c_uint, @as(c_int, 0))) return 1;
                            r = check_node_in_look_behind(((node).*.u.base.body), not, used);
                            if (r != @as(c_int, 0)) break :switch_1;
                            if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                                if ((((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 16))) != @as(c_int, 0)) or ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0))) or ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 26))) != @as(c_int, 0))) used.?.* = 1;
                            } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                    r = check_node_in_look_behind(en.*.unnamed_0.te.Then, not, used);
                                    if (r != @as(c_int, 0)) break :switch_2;
                                }
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                    r = check_node_in_look_behind(en.*.unnamed_0.te.Else, not, used);
                                }
                            }
                        }
                        break :switch_5;
                    }
                    type_1 = @intToEnum(NodeType, (&((node).*.u.anchor)).*.type);
                    if ((@bitCast(c_uint, @enumToInt(type_1)) & anchor_mask[@intCast(c_uint, not)]) == @bitCast(c_uint, @as(c_int, 0))) return 1;
                    if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) r = check_node_in_look_behind(((node).*.u.base.body), not, used);
                    break :switch_7;
                }
                if (@boolToInt(((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 24))) != @as(c_int, 0))) != @as(c_int, 0)@boolToInt return 1;
                break :switch_9;
            }
            r = check_called_node_in_look_behind(((node).*.u.base.body), not);
            break :switch_11;
        }
        break :switch_12;
    }
    return r;
}
pub fn node_max_byte_len(arg_node: [*c]Node, arg_env: [*c]ParseEnv) callconv(.C) OnigLen {
    var node = arg_node;
    var env = arg_env;
    var len: OnigLen = undefined;
    var tmax: OnigLen = undefined;
    len = @bitCast(OnigLen, @as(c_int, 0));
    switch_18: {
        default: {
            case_17: {
                case_16: {
                    case_14: {
                        case_12: {
                            case_10: {
                                case_8: {
                                    case_6: {
                                        case_5: {
                                            case_3: {
                                                case_1: {
                                                    case: {
                                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                            @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                                            @bitCast(c_uint, @as(c_int, 0)) => break :case_3,
                                                            @bitCast(c_uint, @as(c_int, 2)) => break :case_5,
                                                            @bitCast(c_uint, @as(c_int, 1)) => break :case_6,
                                                            @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_10,
                                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_12,
                                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_14,
                                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_16,
                                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_17,
                                                            else => break :default,
                                                        }
                                                    }
                                                    while (true) {
                                                        tmax = node_max_byte_len(((&((node).*.u.cons)).*.car), env);
                                                        len = distance_add(len, tmax);
                                                        if (!((@ptrCast(?*c_void, (blk: {
                                                            const tmp = ((&((node).*.u.cons)).*.cdr);
                                                            node = tmp;
                                                            break :blk tmp;
                                                        }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                                    }
                                                    break :@"switch";
                                                }
                                                while (true) {
                                                    tmax = node_max_byte_len(((&((node).*.u.cons)).*.car), env);
                                                    if (len < tmax) len = tmax;
                                                    if (!((@ptrCast(?*c_void, (blk: {
                                                        const tmp = ((&((node).*.u.cons)).*.cdr);
                                                        node = tmp;
                                                        break :blk tmp;
                                                    }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                                }
                                                break :switch_2;
                                            }
                                            {
                                                var sn: [*c]StrNode = (&((node).*.u.str));
                                                len = @bitCast(OnigLen, @truncate(c_int, (sn.*.end - sn.*.s)));
                                            }
                                            break :switch_4;
                                        }
                                    }
                                    len = @bitCast(OnigLen, ((env.*.enc).*.max_enc_len));
                                    break :switch_7;
                                }
                                if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 17))) != @as(c_int, 0))) {
                                    var i: c_int = undefined;
                                    var backs: [*c]c_int = undefined;
                                    var mem_env: [*c]MemEnv = (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static);
                                    var br: [*c]BackRefNode = (&((node).*.u.backref));
                                    if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) {
                                        if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 13))) != @as(c_int, 0)) {
                                            len = ~(@bitCast(OnigLen, @as(c_int, 0)));
                                        }
                                        break :switch_1;
                                    }
                                    backs = (if ((@ptrCast(?*c_void, ((br).*.back_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (br).*.back_dynamic else &(br).*.back_static);
                                    {
                                        i = 0;
                                        while (i < br.*.back_num) : (i += 1) {
                                            tmax = node_max_byte_len(mem_env[@intCast(c_uint, backs[@intCast(c_uint, i)])].mem_node, env);
                                            if (len < tmax) len = tmax;
                                        }
                                    }
                                }
                                break :switch_9;
                            }
                            if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0))) len = node_max_byte_len(((node).*.u.base.body), env) else len = ~(@bitCast(OnigLen, @as(c_int, 0)));
                            break :switch_11;
                        }
                        {
                            var qn: [*c]QuantNode = (&((node).*.u.quant));
                            if (qn.*.upper != @as(c_int, 0)) {
                                len = node_max_byte_len(((node).*.u.base.body), env);
                                if (len != @bitCast(c_uint, @as(c_int, 0))) {
                                    if (!((qn.*.upper) == -@as(c_int, 1))) len = distance_multiply(len, qn.*.upper) else len = ~(@bitCast(OnigLen, @as(c_int, 0)));
                                }
                            }
                        }
                        break :switch_13;
                    }
                    {
                        var en: [*c]BagNode = (&((node).*.u.bag));
                        switch_1: {
                            case_9: {
                                case_7: {
                                    case_4: {
                                        case_2: {
                                            switch (@bitCast(c_uint, @enumToInt(en.*.type))) {
                                                @bitCast(c_uint, @as(c_int, 0)) => break :case_2,
                                                @bitCast(c_uint, @as(c_int, 1)) => break :case_4,
                                                @bitCast(c_uint, @as(c_int, 2)) => break :case_7,
                                                @bitCast(c_uint, @as(c_int, 3)) => break :case_9,
                                                else => break :switch_1,
                                            }
                                        }
                                        if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))) != @as(c_int, 0)) len = en.*.max_len else {
                                            if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) len = ~(@bitCast(OnigLen, @as(c_int, 0))) else {
                                                _ = (blk: {
                                                    const ref = &((node).*.u.base.status);
                                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                                    break :blk ref.*;
                                                });
                                                len = node_max_byte_len(((node).*.u.base.body), env);
                                                _ = (blk: {
                                                    const ref = &((node).*.u.base.status);
                                                    ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                                    break :blk ref.*;
                                                });
                                                en.*.max_len = len;
                                                _ = (blk: {
                                                    const ref = &((node).*.u.base.status);
                                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1));
                                                    break :blk ref.*;
                                                });
                                            }
                                        }
                                        break :switch_3;
                                    }
                                }
                                len = node_max_byte_len(((node).*.u.base.body), env);
                                break :switch_8;
                            }
                            {
                                var tlen: OnigLen = undefined;
                                var elen: OnigLen = undefined;
                                len = node_max_byte_len(((node).*.u.base.body), env);
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                    tlen = node_max_byte_len(en.*.unnamed_0.te.Then, env);
                                    len = distance_add(len, tlen);
                                }
                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) elen = node_max_byte_len(en.*.unnamed_0.te.Else, env) else elen = @bitCast(OnigLen, @as(c_int, 0));
                                if (elen > len) len = elen;
                            }
                            break :switch_10;
                        }
                    }
                    break :switch_15;
                }
            }
        }
        break :switch_18;
    }
    return len;
}
pub fn check_backrefs(arg_node: [*c]Node, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var r: c_int = undefined;
    switch_9: {
        default: {
            case_7: {
                case_5: {
                    case_3: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_3,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_5,
                                        @bitCast(c_uint, @as(c_int, 3)) => break :case_7,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                r = check_backrefs(((&((node).*.u.cons)).*.car), env);
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :@"switch";
                        }
                        if (!((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) {
                            r = 0;
                            break :switch_1;
                        }
                    }
                    r = check_backrefs(((node).*.u.base.body), env);
                    break :switch_4;
                }
                r = check_backrefs(((node).*.u.base.body), env);
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        if (r != @as(c_int, 0)) return r;
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = check_backrefs(en.*.unnamed_0.te.Then, env);
                            if (r != @as(c_int, 0)) return r;
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = check_backrefs(en.*.unnamed_0.te.Else, env);
                        }
                    }
                }
                break :switch_6;
            }
            {
                var i: c_int = undefined;
                var br: [*c]BackRefNode = (&((node).*.u.backref));
                var backs: [*c]c_int = (if ((@ptrCast(?*c_void, ((br).*.back_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (br).*.back_dynamic else &(br).*.back_static);
                var mem_env: [*c]MemEnv = (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static);
                {
                    i = 0;
                    while (i < br.*.back_num) : (i += 1) {
                        if (backs[@intCast(c_uint, i)] > env.*.num_mem) return -@as(c_int, 208);
                        _ = (blk: {
                            const ref = &((mem_env[@intCast(c_uint, backs[@intCast(c_uint, i)])].mem_node).*.u.base.status);
                            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 16));
                            break :blk ref.*;
                        });
                    }
                }
                r = 0;
            }
            break :switch_8;
        }
        r = 0;
        break :switch_9;
    }
    return r;
}
pub fn set_empty_repeat_node_trav(arg_node: [*c]Node, arg_empty: [*c]Node, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var empty = arg_empty;
    var env = arg_env;
    var r: c_int = undefined;
    switch_8: {
        default: {
            case_6: {
                case_4: {
                    case_2: {
                        case_1: {
                            case: {
                                switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                    @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                    @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                    @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                    @bitCast(c_uint, @as(c_int, 4)) => break :case_4,
                                    @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                    else => break :default,
                                }
                            }
                        }
                        while (true) {
                            r = set_empty_repeat_node_trav(((&((node).*.u.cons)).*.car), empty, env);
                            if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                const tmp = ((&((node).*.u.cons)).*.cdr);
                                node = tmp;
                                break :blk tmp;
                            }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                        }
                        break :@"switch";
                    }
                    {
                        var an: [*c]AnchorNode = (&((node).*.u.anchor));
                        if (!((an).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) {
                            r = 0;
                            break :switch_1;
                        }
                        switch_6: {
                            default: {
                                case_4: {
                                    case_3: {
                                        switch (an.*.type) {
                                            @as(c_int, 1) => break :case_3,
                                            @as(c_int, 4) => break :case_4,
                                            else => break :default,
                                        }
                                    }
                                }
                                empty = (@intToPtr([*c]Node, @as(c_int, 0)));
                                break :switch_5;
                            }
                            break :switch_6;
                        }
                        r = set_empty_repeat_node_trav(((node).*.u.base.body), empty, env);
                    }
                    break :switch_3;
                }
                {
                    var qn: [*c]QuantNode = (&((node).*.u.quant));
                    if (@bitCast(c_uint, @enumToInt(qn.*.emptiness)) != @bitCast(c_uint, BODY_IS_NOT_EMPTY)) empty = node;
                    r = set_empty_repeat_node_trav(((node).*.u.base.body), empty, env);
                }
                break :switch_5;
            }
            if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                r = set_empty_repeat_node_trav(((node).*.u.base.body), empty, env);
                if (r != @as(c_int, 0)) return r;
            }
            {
                var en: [*c]BagNode = (&((node).*.u.bag));
                r = 0;
                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                    if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 16))) != @as(c_int, 0)) {
                        if ((@ptrCast(?*c_void, (empty))) != @intToPtr(?*c_void, @as(c_int, 0))) (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static)[@intCast(c_uint, en.*.unnamed_0.m.regnum)].empty_repeat_node = empty;
                    }
                } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r = set_empty_repeat_node_trav(en.*.unnamed_0.te.Then, empty, env);
                        if (r != @as(c_int, 0)) return r;
                    }
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r = set_empty_repeat_node_trav(en.*.unnamed_0.te.Else, empty, env);
                    }
                }
            }
            break :switch_7;
        }
        r = 0;
        break :switch_8;
    }
    return r;
}
pub fn is_ancestor_node(arg_node: [*c]Node, arg_me: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var me = arg_me;
    var parent: [*c]Node = undefined;
    while ((blk: {
        const tmp = ((me).*.u.base.parent);
        parent = tmp;
        break :blk tmp;
    }) != (@intToPtr([*c]Node, @as(c_int, 0)))) {
        if (parent == node) return 1;
        me = parent;
    }
    return 0;
}
pub fn set_empty_status_check_trav(arg_node: [*c]Node, arg_env: [*c]ParseEnv) callconv(.C) void {
    var node = arg_node;
    var env = arg_env;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                set_empty_status_check_trav(((&((node).*.u.cons)).*.car), env);
                                if (!((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                            }
                            break :@"switch";
                        }
                        {
                            var an: [*c]AnchorNode = (&((node).*.u.anchor));
                            if (!((an).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) break :switch_1;
                            set_empty_status_check_trav(((node).*.u.base.body), env);
                        }
                        break :switch_3;
                    }
                    set_empty_status_check_trav(((node).*.u.base.body), env);
                    break :switch_5;
                }
                if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) set_empty_status_check_trav(((node).*.u.base.body), env);
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            set_empty_status_check_trav(en.*.unnamed_0.te.Then, env);
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            set_empty_status_check_trav(en.*.unnamed_0.te.Else, env);
                        }
                    }
                }
                break :switch_7;
            }
            {
                var i: c_int = undefined;
                var backs: [*c]c_int = undefined;
                var mem_env: [*c]MemEnv = (if ((@ptrCast(?*c_void, ((env).*.mem_env_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (env).*.mem_env_dynamic else &(env).*.mem_env_static);
                var br: [*c]BackRefNode = (&((node).*.u.backref));
                backs = (if ((@ptrCast(?*c_void, ((br).*.back_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (br).*.back_dynamic else &(br).*.back_static);
                {
                    i = 0;
                    while (i < br.*.back_num) : (i += 1) {
                        var ernode: [*c]Node = mem_env[@intCast(c_uint, backs[@intCast(c_uint, i)])].empty_repeat_node;
                        if ((@ptrCast(?*c_void, (ernode))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            if (!(is_ancestor_node(ernode, node) != 0)) {
                                while (true) {
                                    if (((backs[@intCast(c_uint, i)]) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))) and ((backs[@intCast(c_uint, i)]) != @as(c_int, 0))) {
                                        ((&((ernode).*.u.quant)).*.empty_status_mem) |= (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), (backs[@intCast(c_uint, i)])));
                                    }
                                    if (!false) break;
                                }
                                _ = (blk: {
                                    const ref = &((ernode).*.u.base.status);
                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 20));
                                    break :blk ref.*;
                                });
                                _ = (blk: {
                                    const ref = &((mem_env[@intCast(c_uint, backs[@intCast(c_uint, i)])].mem_node).*.u.base.status);
                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 20));
                                    break :blk ref.*;
                                });
                            }
                        }
                    }
                }
            }
            break :switch_9;
        }
        break :switch_10;
    }
}
pub fn set_parent_node_trav(arg_node: [*c]Node, arg_parent: [*c]Node) callconv(.C) void {
    var node = arg_node;
    var parent = arg_parent;
    ((node).*.u.base.parent) = parent;
    switch_9: {
        default: {
            case_7: {
                case_5: {
                    case_2: {
                        case_1: {
                            case: {
                                switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                    @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                    @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                    @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                    @bitCast(c_uint, @as(c_int, 4)) => break :case_5,
                                    @bitCast(c_uint, @as(c_int, 5)) => break :case_7,
                                    else => break :default,
                                }
                            }
                        }
                        while (true) {
                            set_parent_node_trav(((&((node).*.u.cons)).*.car), node);
                            if (!((@ptrCast(?*c_void, (blk: {
                                const tmp = ((&((node).*.u.cons)).*.cdr);
                                node = tmp;
                                break :blk tmp;
                            }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                        }
                        break :@"switch";
                    }
                    if (!((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) break :switch_3;
                    set_parent_node_trav(((node).*.u.base.body), node);
                    break :switch_4;
                }
                set_parent_node_trav(((node).*.u.base.body), node);
                break :switch_6;
            }
            if ((@ptrCast(?*c_void, ((node).*.u.base.body))) != @intToPtr(?*c_void, @as(c_int, 0))) set_parent_node_trav(((node).*.u.base.body), node);
            {
                var en: [*c]BagNode = (&((node).*.u.bag));
                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) set_parent_node_trav(en.*.unnamed_0.te.Then, node);
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        set_parent_node_trav(en.*.unnamed_0.te.Else, node);
                    }
                }
            }
            break :switch_8;
        }
        break :switch_9;
    }
}
pub fn infinite_recursive_call_check(arg_node: [*c]Node, arg_env: [*c]ParseEnv, arg_head: c_int) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var head = arg_head;
    var ret: c_int = undefined;
    var r: c_int = 0;
    switch_12: {
        default: {
            case_10: {
                case_8: {
                    case_6: {
                        case_3: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_3,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_8,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_10,
                                        else => break :default,
                                    }
                                }
                                {
                                    var x: [*c]Node = undefined;
                                    var min: OnigLen = undefined;
                                    x = node;
                                    while (true) {
                                        ret = infinite_recursive_call_check(((&((x).*.u.cons)).*.car), env, head);
                                        if ((ret < @as(c_int, 0)) or ((ret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0))) return ret;
                                        r |= ret;
                                        if (head != @as(c_int, 0)) {
                                            min = node_min_byte_len(((&((x).*.u.cons)).*.car), env);
                                            if (min != @bitCast(c_uint, @as(c_int, 0))) head = 0;
                                        }
                                        if (!((@ptrCast(?*c_void, (blk: {
                                            const tmp = ((&((x).*.u.cons)).*.cdr);
                                            x = tmp;
                                            break :blk tmp;
                                        }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                    }
                                }
                                break :@"switch";
                            }
                            {
                                var must: c_int = undefined;
                                must = (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1));
                                while (true) {
                                    ret = infinite_recursive_call_check(((&((node).*.u.cons)).*.car), env, head);
                                    if ((ret < @as(c_int, 0)) or ((ret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0))) return ret;
                                    r |= (ret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)));
                                    must &= ret;
                                    if (!((@ptrCast(?*c_void, (blk: {
                                        const tmp = ((&((node).*.u.cons)).*.cdr);
                                        node = tmp;
                                        break :blk tmp;
                                    }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                }
                                r |= must;
                            }
                            break :switch_2;
                        }
                        if ((&((node).*.u.quant)).*.upper == @as(c_int, 0)) break :switch_4;
                        r = infinite_recursive_call_check(((node).*.u.base.body), env, head);
                        if (r < @as(c_int, 0)) return r;
                        if ((r & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))) != @as(c_int, 0)) {
                            if ((&((node).*.u.quant)).*.lower == @as(c_int, 0)) r &= ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1));
                        }
                        break :switch_5;
                    }
                    if (!((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) break :switch_7;
                }
                r = infinite_recursive_call_check(((node).*.u.base.body), env, head);
                break :switch_9;
            }
            {
                var en: [*c]BagNode = (&((node).*.u.bag));
                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                    if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) != @as(c_int, 0)) return 0 else if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) return (if (head == @as(c_int, 0)) ((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))) else (((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2)))) else {
                        _ = (blk: {
                            const ref = &((node).*.u.base.status);
                            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4));
                            break :blk ref.*;
                        });
                        r = infinite_recursive_call_check(((node).*.u.base.body), env, head);
                        _ = (blk: {
                            const ref = &((node).*.u.base.status);
                            ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4));
                            break :blk ref.*;
                        });
                    }
                } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                    var eret: c_int = undefined;
                    ret = infinite_recursive_call_check(((node).*.u.base.body), env, head);
                    if ((ret < @as(c_int, 0)) or ((ret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0))) return ret;
                    r |= ret;
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        var min: OnigLen = undefined;
                        if (head != @as(c_int, 0)) {
                            min = node_min_byte_len(((node).*.u.base.body), env);
                        } else min = @bitCast(OnigLen, @as(c_int, 0));
                        ret = infinite_recursive_call_check(en.*.unnamed_0.te.Then, env, if (min != @bitCast(c_uint, @as(c_int, 0))) @as(c_int, 0) else head);
                        if ((ret < @as(c_int, 0)) or ((ret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0))) return ret;
                        r |= ret;
                    }
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        eret = infinite_recursive_call_check(en.*.unnamed_0.te.Else, env, head);
                        if ((eret < @as(c_int, 0)) or ((eret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0))) return eret;
                        r |= (eret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)));
                        if ((eret & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))) == @as(c_int, 0)) r &= ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1));
                    } else {
                        r &= ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1));
                    }
                } else {
                    r = infinite_recursive_call_check(((node).*.u.base.body), env, head);
                }
            }
            break :switch_11;
        }
        break :switch_12;
    }
    return r;
}
pub fn infinite_recursive_call_check_trav(arg_node: [*c]Node, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var r: c_int = undefined;
    switch_7: {
        default: {
            case_5: {
                case_3: {
                    case_2: {
                        case_1: {
                            case: {
                                switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                    @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                    @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                    @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                    @bitCast(c_uint, @as(c_int, 4)) => break :case_3,
                                    @bitCast(c_uint, @as(c_int, 5)) => break :case_5,
                                    else => break :default,
                                }
                            }
                        }
                        while (true) {
                            r = infinite_recursive_call_check_trav(((&((node).*.u.cons)).*.car), env);
                            if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                const tmp = ((&((node).*.u.cons)).*.cdr);
                                node = tmp;
                                break :blk tmp;
                            }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                        }
                        break :@"switch";
                    }
                    if (!((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) {
                        r = 0;
                        break :switch_1;
                    }
                }
                r = infinite_recursive_call_check_trav(((node).*.u.base.body), env);
                break :switch_4;
            }
            {
                var en: [*c]BagNode = (&((node).*.u.bag));
                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                    if (((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) and ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) != @as(c_int, 0))) {
                        var ret: c_int = undefined;
                        _ = (blk: {
                            const ref = &((node).*.u.base.status);
                            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                            break :blk ref.*;
                        });
                        ret = infinite_recursive_call_check(((node).*.u.base.body), env, @as(c_int, 1));
                        if (ret < @as(c_int, 0)) return ret else if ((ret & ((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2)))) != @as(c_int, 0)) return -@as(c_int, 221);
                        _ = (blk: {
                            const ref = &((node).*.u.base.status);
                            ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                            break :blk ref.*;
                        });
                    }
                } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r = infinite_recursive_call_check_trav(en.*.unnamed_0.te.Then, env);
                        if (r != @as(c_int, 0)) return r;
                    }
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r = infinite_recursive_call_check_trav(en.*.unnamed_0.te.Else, env);
                        if (r != @as(c_int, 0)) return r;
                    }
                }
            }
            r = infinite_recursive_call_check_trav(((node).*.u.base.body), env);
            break :switch_6;
        }
        r = 0;
        break :switch_7;
    }
    return r;
}
pub fn recursive_call_check(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var r: c_int = undefined;
    switch_9: {
        default: {
            case_7: {
                case_5: {
                    case_3: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_3,
                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_5,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_7,
                                        else => break :default,
                                    }
                                }
                            }
                            r = 0;
                            while (true) {
                                r |= recursive_call_check(((&((node).*.u.cons)).*.car));
                                if (!((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                            }
                            break :@"switch";
                        }
                        if (!((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4)))) {
                            r = 0;
                            break :switch_1;
                        }
                    }
                    r = recursive_call_check(((node).*.u.base.body));
                    break :switch_4;
                }
                r = recursive_call_check(((node).*.u.base.body));
                if (r != @as(c_int, 0)) {
                    if ((((@ptrCast([*c]Node, @alignCast(@alignOf(Node), ((node).*.u.base.body)))).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) _ = (blk: {
                        const ref = &((node).*.u.base.status);
                        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6));
                        break :blk ref.*;
                    });
                }
                break :switch_6;
            }
            {
                var en: [*c]BagNode = (&((node).*.u.bag));
                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                    if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) != @as(c_int, 0)) return 0 else if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) return 1 else {
                        _ = (blk: {
                            const ref = &((node).*.u.base.status);
                            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4));
                            break :blk ref.*;
                        });
                        r = recursive_call_check(((node).*.u.base.body));
                        _ = (blk: {
                            const ref = &((node).*.u.base.status);
                            ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4));
                            break :blk ref.*;
                        });
                    }
                } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                    r = 0;
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r |= recursive_call_check(en.*.unnamed_0.te.Then);
                    }
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r |= recursive_call_check(en.*.unnamed_0.te.Else);
                    }
                    r |= recursive_call_check(((node).*.u.base.body));
                } else {
                    r = recursive_call_check(((node).*.u.base.body));
                }
            }
            break :switch_8;
        }
        r = 0;
        break :switch_9;
    }
    return r;
} // ./src/todo/regcomp.c:4457:11: warning: TODO implement translation of stmt class GotoStmtClass
pub const recursive_call_check_trav = @compileError("unable to translate function"); // ./src/todo/regcomp.c:4415:1
pub fn remove_from_list(arg_prev: [*c]Node, arg_a: [*c]Node) callconv(.C) void {
    var prev = arg_prev;
    var a = arg_a;
    if (((&((prev).*.u.cons)).*.cdr) != a) return;
    ((&((prev).*.u.cons)).*.cdr) = ((&((a).*.u.cons)).*.cdr);
    ((&((a).*.u.cons)).*.cdr) = (@intToPtr([*c]Node, @as(c_int, 0)));
}
pub fn reduce_string_list(arg_node: [*c]Node, arg_enc: OnigEncoding) callconv(.C) c_int {
    var node = arg_node;
    var enc = arg_enc;
    var r: c_int = 0;
    switch_11: {
        default: {
            case_9: {
                case_7: {
                    case_5: {
                        case_3: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 0)) => break :case_3,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_5,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_7,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_9,
                                        else => break :default,
                                    }
                                }
                                {
                                    var prev: [*c]Node = undefined;
                                    var curr: [*c]Node = undefined;
                                    var prev_node: [*c]Node = undefined;
                                    var next_node: [*c]Node = undefined;
                                    prev = (@intToPtr([*c]Node, @as(c_int, 0)));
                                    while (true) {
                                        next_node = ((&((node).*.u.cons)).*.cdr);
                                        curr = ((&((node).*.u.cons)).*.car);
                                        if (@bitCast(c_uint, @enumToInt(((curr).*.u.base.node_type))) == @bitCast(c_uint, NODE_STRING)) {
                                            if ((((@ptrCast(?*c_void, (prev))) == @intToPtr(?*c_void, @as(c_int, 0))) or ((&((curr).*.u.str)).*.flag != (&((prev).*.u.str)).*.flag)) or (((curr).*.u.base.status) != ((prev).*.u.base.status))) {
                                                prev = curr;
                                                prev_node = node;
                                            } else {
                                                r = node_str_node_cat(prev, curr);
                                                if (r != @as(c_int, 0)) return r;
                                                remove_from_list(prev_node, node);
                                                onig_node_free(node);
                                            }
                                        } else {
                                            if ((@ptrCast(?*c_void, (prev))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                                var sn: [*c]StrNode = (&((prev).*.u.str));
                                                if (!((enc).*.is_valid_mbc_string.?(sn.*.s, sn.*.end) != 0)) return -@as(c_int, 400);
                                                prev = (@intToPtr([*c]Node, @as(c_int, 0)));
                                            }
                                            r = reduce_string_list(curr, enc);
                                            if (r != @as(c_int, 0)) return r;
                                            prev_node = node;
                                        }
                                        node = next_node;
                                        if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (node))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                                    }
                                    if ((@ptrCast(?*c_void, (prev))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                        var sn: [*c]StrNode = (&((prev).*.u.str));
                                        if (!((enc).*.is_valid_mbc_string.?(sn.*.s, sn.*.end) != 0)) return -@as(c_int, 400);
                                    }
                                }
                                break :@"switch";
                            }
                            while (true) {
                                r = reduce_string_list(((&((node).*.u.cons)).*.car), enc);
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :switch_2;
                        }
                        {
                            var sn: [*c]StrNode = (&((node).*.u.str));
                            if (!((enc).*.is_valid_mbc_string.?(sn.*.s, sn.*.end) != 0)) return -@as(c_int, 400);
                        }
                        break :switch_4;
                    }
                    if ((@ptrCast(?*c_void, ((node).*.u.base.body))) == @intToPtr(?*c_void, @as(c_int, 0))) break :switch_6;
                }
                r = reduce_string_list(((node).*.u.base.body), enc);
                break :switch_8;
            }
            {
                var en: [*c]BagNode = (&((node).*.u.bag));
                r = reduce_string_list(((node).*.u.base.body), enc);
                if (r != @as(c_int, 0)) return r;
                if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r = reduce_string_list(en.*.unnamed_0.te.Then, enc);
                        if (r != @as(c_int, 0)) return r;
                    }
                    if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                        r = reduce_string_list(en.*.unnamed_0.te.Else, enc);
                        if (r != @as(c_int, 0)) return r;
                    }
                }
            }
            break :switch_10;
        }
        break :switch_11;
    }
    return r;
}
pub fn divide_look_behind_alternatives(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var r: c_int = undefined;
    var anc_type: c_int = undefined;
    var head: [*c]Node = undefined;
    var np: [*c]Node = undefined;
    var insert_node: [*c]Node = undefined;
    var an: [*c]AnchorNode = undefined;
    an = (&((node).*.u.anchor));
    anc_type = an.*.type;
    head = ((an).*.body);
    np = ((&((head).*.u.cons)).*.car);
    node_swap(node, head);
    ((&((node).*.u.cons)).*.car) = head;
    ((head).*.u.base.body) = np;
    np = node;
    while ((@ptrCast(?*c_void, (blk: {
        const tmp = ((&((np).*.u.cons)).*.cdr);
        np = tmp;
        break :blk tmp;
    }))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        r = onig_node_copy(&insert_node, head);
        if (r != @as(c_int, 0)) return r;
        if ((@ptrCast(?*c_void, (insert_node))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        ((insert_node).*.u.base.body) = ((&((np).*.u.cons)).*.car);
        ((&((np).*.u.cons)).*.car) = insert_node;
    }
    if (anc_type == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) {
        np = node;
        while (true) {
            (np).*.u.base.node_type = @intToEnum(NodeType, (NODE_LIST));
            if (!((@ptrCast(?*c_void, (blk: {
                const tmp = ((&((np).*.u.cons)).*.cdr);
                np = tmp;
                break :blk tmp;
            }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
        }
    }
    return 0;
}
pub fn node_reduce_in_look_behind(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var type_1: NodeType = undefined;
    var body: [*c]Node = undefined;
    if (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type))) != @bitCast(c_uint, NODE_QUANT)) return 0;
    body = ((node).*.u.base.body);
    type_1 = ((body).*.u.base.node_type);
    if ((((@bitCast(c_uint, @enumToInt(type_1)) == @bitCast(c_uint, NODE_STRING)) or (@bitCast(c_uint, @enumToInt(type_1)) == @bitCast(c_uint, NODE_CTYPE))) or (@bitCast(c_uint, @enumToInt(type_1)) == @bitCast(c_uint, NODE_CCLASS))) or (@bitCast(c_uint, @enumToInt(type_1)) == @bitCast(c_uint, NODE_BACKREF))) {
        var qn: [*c]QuantNode = (&((node).*.u.quant));
        qn.*.upper = qn.*.lower;
        if (qn.*.upper == @as(c_int, 0)) return 1;
    }
    return 0;
}
pub fn list_reduce_in_look_behind(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var r: c_int = undefined;
    switch_3: {
        default: {
            case_1: {
                case: {
                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                        @bitCast(c_uint, @as(c_int, 4)) => break :case,
                        @bitCast(c_uint, @as(c_int, 7)) => break :case_1,
                        else => break :default,
                    }
                }
                r = node_reduce_in_look_behind(node);
                if (r > @as(c_int, 0)) r = 0;
                break :@"switch";
            }
            while (true) {
                r = node_reduce_in_look_behind(((&((node).*.u.cons)).*.car));
                if (r <= @as(c_int, 0)) break;
                if (!((@ptrCast(?*c_void, (blk: {
                    const tmp = ((&((node).*.u.cons)).*.cdr);
                    node = tmp;
                    break :blk tmp;
                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
            }
            break :switch_2;
        }
        r = 0;
        break :switch_3;
    }
    return r;
}
pub fn alt_reduce_in_look_behind(arg_node: [*c]Node, arg_reg: [*c]regex_t, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var env = arg_env;
    var r: c_int = undefined;
    switch_1: {
        default: {
            case: {
                switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                    @bitCast(c_uint, @as(c_int, 8)) => break :case,
                    else => break :default,
                }
            }
            while (true) {
                r = list_reduce_in_look_behind(((&((node).*.u.cons)).*.car));
                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                    const tmp = ((&((node).*.u.cons)).*.cdr);
                    node = tmp;
                    break :blk tmp;
                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
            }
            break :@"switch";
        }
        r = list_reduce_in_look_behind(node);
        break :switch_1;
    }
    return r;
}
pub fn tune_tree(arg_node: [*c]Node, arg_reg: [*c]regex_t, arg_state: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var state = arg_state;
    var env = arg_env;
    var r: c_int = 0;
    switch_17: {
        default: {
            case_16: {
                case_15: {
                    case_14: {
                        case_13: {
                            case_11: {
                                case_9: {
                                    case_7: {
                                        case_5: {
                                            case_3: {
                                                case_1: {
                                                    case: {
                                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                            @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                                            @bitCast(c_uint, @as(c_int, 0)) => break :case_3,
                                                            @bitCast(c_uint, @as(c_int, 3)) => break :case_5,
                                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_7,
                                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_9,
                                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_11,
                                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_13,
                                                            @bitCast(c_uint, @as(c_int, 2)) => break :case_14,
                                                            @bitCast(c_uint, @as(c_int, 1)) => break :case_15,
                                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_16,
                                                            else => break :default,
                                                        }
                                                    }
                                                    {
                                                        var prev: [*c]Node = (@intToPtr([*c]Node, @as(c_int, 0)));
                                                        while (true) {
                                                            r = tune_tree(((&((node).*.u.cons)).*.car), reg, state, env);
                                                            if (((@ptrCast(?*c_void, (prev))) != @intToPtr(?*c_void, @as(c_int, 0))) and (r == @as(c_int, 0))) {
                                                                r = tune_next(prev, ((&((node).*.u.cons)).*.car), reg);
                                                            }
                                                            prev = ((&((node).*.u.cons)).*.car);
                                                            if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                                                const tmp = ((&((node).*.u.cons)).*.cdr);
                                                                node = tmp;
                                                                break :blk tmp;
                                                            }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                                                        }
                                                    }
                                                    break :@"switch";
                                                }
                                                while (true) {
                                                    r = tune_tree(((&((node).*.u.cons)).*.car), reg, (state | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))), env);
                                                    if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                                        const tmp = ((&((node).*.u.cons)).*.cdr);
                                                        node = tmp;
                                                        break :blk tmp;
                                                    }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                                                }
                                                break :switch_2;
                                            }
                                            if (((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 21))) != @as(c_int, 0)) and !(((node).*.u.str.flag & @bitCast(c_uint, (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) != @bitCast(c_uint, @as(c_int, 0)))) {
                                                r = unravel_case_fold_string(node, reg, state);
                                            }
                                            break :switch_4;
                                        }
                                        {
                                            var i: c_int = undefined;
                                            var p: [*c]c_int = undefined;
                                            var br: [*c]BackRefNode = (&((node).*.u.backref));
                                            p = (if ((@ptrCast(?*c_void, ((br).*.back_dynamic))) != @intToPtr(?*c_void, @as(c_int, 0))) (br).*.back_dynamic else &(br).*.back_static);
                                            {
                                                i = 0;
                                                while (i < br.*.back_num) : (i += 1) {
                                                    if (p[@intCast(c_uint, i)] > env.*.num_mem) return -@as(c_int, 208);
                                                    while (true) {
                                                        if ((p[@intCast(c_uint, i)]) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))) {
                                                            if ((p[@intCast(c_uint, i)]) != @as(c_int, 0)) (env.*.backrefed_mem) |= (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), (p[@intCast(c_uint, i)])));
                                                        } else (env.*.backrefed_mem) |= @bitCast(c_uint, @as(c_int, 1));
                                                        if (!false) break;
                                                    }
                                                    while (true) {
                                                        if ((p[@intCast(c_uint, i)]) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))) {
                                                            if ((p[@intCast(c_uint, i)]) != @as(c_int, 0)) (env.*.backtrack_mem) |= (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), (p[@intCast(c_uint, i)])));
                                                        } else (env.*.backtrack_mem) |= @bitCast(c_uint, @as(c_int, 1));
                                                        if (!false) break;
                                                    }
                                                }
                                            }
                                        }
                                        break :switch_6;
                                    }
                                    {
                                        var en: [*c]BagNode = (&((node).*.u.bag));
                                        switch_1: {
                                            case_8: {
                                                case_6: {
                                                    case_4: {
                                                        case_2: {
                                                            switch (@bitCast(c_uint, @enumToInt(en.*.type))) {
                                                                @bitCast(c_uint, @as(c_int, 1)) => break :case_2,
                                                                @bitCast(c_uint, @as(c_int, 0)) => break :case_4,
                                                                @bitCast(c_uint, @as(c_int, 2)) => break :case_6,
                                                                @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                                                else => break :switch_1,
                                                            }
                                                        }
                                                        {
                                                            var options: OnigOptionType = reg.*.options;
                                                            reg.*.options = (&((node).*.u.bag)).*.unnamed_0.o.options;
                                                            r = tune_tree(((node).*.u.base.body), reg, state, env);
                                                            reg.*.options = options;
                                                        }
                                                        break :switch_3;
                                                    }
                                                    state |= en.*.unnamed_0.m.called_state;
                                                    if (((state & ((((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5)))) != @as(c_int, 0)) or ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0))) {
                                                        while (true) {
                                                            if ((en.*.unnamed_0.m.regnum) < @bitCast(c_int, @truncate(c_uint, (@sizeOf(MemStatusType) *% @bitCast(c_ulong, @as(c_long, @as(c_int, 8))))))) {
                                                                if ((en.*.unnamed_0.m.regnum) != @as(c_int, 0)) (env.*.backtrack_mem) |= (@bitCast(MemStatusType, @as(c_int, 1)) << @intCast(@import("std").math.Log2Int(MemStatusType), (en.*.unnamed_0.m.regnum)));
                                                            } else (env.*.backtrack_mem) |= @bitCast(c_uint, @as(c_int, 1));
                                                            if (!false) break;
                                                        }
                                                    }
                                                    r = tune_tree(((node).*.u.base.body), reg, state, env);
                                                    break :switch_5;
                                                }
                                                {
                                                    var target: [*c]Node = ((node).*.u.base.body);
                                                    r = tune_tree(target, reg, state, env);
                                                    if (@bitCast(c_uint, @enumToInt(((target).*.u.base.node_type))) == @bitCast(c_uint, NODE_QUANT)) {
                                                        var tqn: [*c]QuantNode = (&((target).*.u.quant));
                                                        if ((((tqn.*.upper) == -@as(c_int, 1)) and (tqn.*.lower <= @as(c_int, 1))) and (tqn.*.greedy != @as(c_int, 0))) {
                                                            if (is_strict_real_node(((target).*.u.base.body)) != 0) _ = (blk: {
                                                                const ref = &((node).*.u.base.status);
                                                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5));
                                                                break :blk ref.*;
                                                            });
                                                        }
                                                    }
                                                }
                                                break :switch_7;
                                            }
                                            r = tune_tree(((node).*.u.base.body), reg, (state | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))), env);
                                            if (r != @as(c_int, 0)) return r;
                                            if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                                r = tune_tree(en.*.unnamed_0.te.Then, reg, (state | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))), env);
                                                if (r != @as(c_int, 0)) return r;
                                            }
                                            if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) r = tune_tree(en.*.unnamed_0.te.Else, reg, (state | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0))), env);
                                            break :switch_9;
                                        }
                                    }
                                    break :switch_8;
                                }
                                if ((state & ((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7)))) != @as(c_int, 0)) _ = (blk: {
                                    const ref = &((node).*.u.base.status);
                                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27));
                                    break :blk ref.*;
                                });
                                r = tune_quant(node, reg, state, env);
                                break :switch_10;
                            }
                            r = tune_anchor(node, reg, state, env);
                            break :switch_12;
                        }
                    }
                }
            }
        }
        break :switch_17;
    }
    return r;
} // ./src/todo/regcomp.c:4798:9: warning: TODO implement translation of stmt class GotoStmtClass
pub const tune_look_behind = @compileError("unable to translate function"); // ./src/todo/regcomp.c:4743:1
// ./src/todo/regcomp.c:4843:2: warning: TODO implement translation of stmt class LabelStmtClass
pub const tune_next = @compileError("unable to translate function"); // ./src/todo/regcomp.c:4836:1
pub fn is_all_code_len_1_items(arg_n: c_int, arg_items: [*c]OnigCaseFoldCodeItem) callconv(.C) c_int {
    var n = arg_n;
    var items = arg_items;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var item: [*c]OnigCaseFoldCodeItem = (items + i);
            if (item.*.code_len != @as(c_int, 1)) return 0;
        }
    }
    return 1;
}
pub fn get_min_max_byte_len_case_fold_items(arg_n: c_int, arg_items: [*c]OnigCaseFoldCodeItem, arg_rmin: [*c]OnigLen, arg_rmax: [*c]OnigLen) callconv(.C) c_int {
    var n = arg_n;
    var items = arg_items;
    var rmin = arg_rmin;
    var rmax = arg_rmax;
    var i: c_int = undefined;
    var len: OnigLen = undefined;
    var minlen: OnigLen = undefined;
    var maxlen: OnigLen = undefined;
    minlen = ~(@bitCast(OnigLen, @as(c_int, 0)));
    maxlen = @bitCast(OnigLen, @as(c_int, 0));
    {
        i = 0;
        while (i < n) : (i += 1) {
            var item: [*c]OnigCaseFoldCodeItem = (items + i);
            len = @bitCast(OnigLen, item.*.byte_len);
            if (len < minlen) minlen = len;
            if (len > maxlen) maxlen = len;
        }
    }
    rmin.?.* = minlen;
    rmax.?.* = maxlen;
    return 0;
} // ./src/todo/regcomp.c:4940:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const make_code_list_to_string = @compileError("unable to translate function"); // ./src/todo/regcomp.c:4925:1
pub fn unravel_cf_node_add(arg_rlist: [*c][*c]Node, arg_add: [*c]Node) callconv(.C) c_int {
    var rlist = arg_rlist;
    var add = arg_add;
    var list: [*c]Node = undefined;
    list = rlist.?.*;
    if ((@ptrCast(?*c_void, (list))) == @intToPtr(?*c_void, @as(c_int, 0))) {
        list = onig_node_new_list(add, null);
        if ((@ptrCast(?*c_void, (list))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        rlist.?.* = list;
    } else {
        var r: [*c]Node = node_list_add(list, add);
        if ((@ptrCast(?*c_void, (r))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    }
    return 0;
}
pub fn unravel_cf_string_add(arg_rlist: [*c][*c]Node, arg_rsn: [*c][*c]Node, arg_s: [*c]OnigUChar, arg_end: [*c]OnigUChar, arg_flag: c_uint) callconv(.C) c_int {
    var rlist = arg_rlist;
    var rsn = arg_rsn;
    var s = arg_s;
    var end = arg_end;
    var flag = arg_flag;
    var r: c_int = undefined;
    var sn: [*c]Node = undefined;
    var list: [*c]Node = undefined;
    list = rlist.?.*;
    sn = rsn.?.*;
    if (((@ptrCast(?*c_void, (sn))) != @intToPtr(?*c_void, @as(c_int, 0))) and ((&((sn).*.u.str)).*.flag == flag)) {
        r = onig_node_str_cat(sn, s, end);
    } else {
        sn = onig_node_new_str(s, end);
        if ((@ptrCast(?*c_void, (sn))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        (&((sn).*.u.str)).*.flag = flag;
        r = unravel_cf_node_add(&list, sn);
    }
    if (r == @as(c_int, 0)) {
        rlist.?.* = list;
        rsn.?.* = sn;
    }
    return r;
}
pub fn unravel_cf_string_alt_or_cc_add(arg_rlist: [*c][*c]Node, arg_n: c_int, arg_items: [*c]OnigCaseFoldCodeItem, arg_enc: OnigEncoding, arg_case_fold_flag: OnigCaseFoldType, arg_s: [*c]OnigUChar, arg_end: [*c]OnigUChar) callconv(.C) c_int {
    var rlist = arg_rlist;
    var n = arg_n;
    var items = arg_items;
    var enc = arg_enc;
    var case_fold_flag = arg_case_fold_flag;
    var s = arg_s;
    var end = arg_end;
    var r: c_int = undefined;
    var i: c_int = undefined;
    var node: [*c]Node = undefined;
    if (is_all_code_len_1_items(n, items) != 0) {
        var codes: [14]OnigCodePoint = undefined;
        codes[@intCast(c_uint, @as(c_int, 0))] = (enc).*.mbc_to_code.?((s), (end));
        {
            i = 0;
            while (i < n) : (i += 1) {
                var item: [*c]OnigCaseFoldCodeItem = (items + i);
                codes[@intCast(c_uint, (i + @as(c_int, 1)))] = item.*.code[@intCast(c_uint, @as(c_int, 0))];
            }
        }
        r = onig_new_cclass_with_code_list(&node, enc, (n + @as(c_int, 1)), &codes);
        if (r != @as(c_int, 0)) return r;
    } else {
        var snode: [*c]Node = undefined;
        var alt: [*c]Node = undefined;
        var curr: [*c]Node = undefined;
        snode = onig_node_new_str(s, end);
        if ((@ptrCast(?*c_void, (snode))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
        node = blk: {
            const tmp = onig_node_new_alt(snode, (@intToPtr([*c]Node, @as(c_int, 0))));
            curr = tmp;
            break :blk tmp;
        };
        if ((@ptrCast(?*c_void, (curr))) == @intToPtr(?*c_void, @as(c_int, 0))) {
            onig_node_free(snode);
            return -@as(c_int, 5);
        }
        r = 0;
        {
            i = 0;
            while (i < n) : (i += 1) {
                var item: [*c]OnigCaseFoldCodeItem = (items + i);
                r = make_code_list_to_string(&snode, enc, item.*.code_len, &item.*.code);
                if (r != @as(c_int, 0)) {
                    onig_node_free(node);
                    return r;
                }
                alt = onig_node_new_alt(snode, (@intToPtr([*c]Node, @as(c_int, 0))));
                if ((@ptrCast(?*c_void, (alt))) == @intToPtr(?*c_void, @as(c_int, 0))) {
                    onig_node_free(snode);
                    onig_node_free(node);
                    return -@as(c_int, 5);
                }
                ((&((curr).*.u.cons)).*.cdr) = alt;
                curr = alt;
            }
        }
    }
    r = unravel_cf_node_add(rlist, node);
    if (r != @as(c_int, 0)) onig_node_free(node);
    return r;
}
pub fn unravel_cf_look_behind_add(arg_rlist: [*c][*c]Node, arg_rsn: [*c][*c]Node, arg_n: c_int, arg_items: [*c]OnigCaseFoldCodeItem, arg_enc: OnigEncoding, arg_s: [*c]OnigUChar, arg_one_len: OnigLen) callconv(.C) c_int {
    var rlist = arg_rlist;
    var rsn = arg_rsn;
    var n = arg_n;
    var items = arg_items;
    var enc = arg_enc;
    var s = arg_s;
    var one_len = arg_one_len;
    var r: c_int = undefined;
    var i: c_int = undefined;
    var found: c_int = undefined;
    found = 0;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var item: [*c]OnigCaseFoldCodeItem = (items + i);
            if (@bitCast(c_uint, item.*.byte_len) == one_len) {
                if (item.*.code_len == @as(c_int, 1)) {
                    found = 1;
                    break;
                }
            }
        }
    }
    if (found == @as(c_int, 0)) {
        r = unravel_cf_string_add(rlist, rsn, s, (s + one_len), @bitCast(c_uint, @as(c_int, 0)));
    } else {
        var node: [*c]Node = undefined;
        var codes: [14]OnigCodePoint = undefined;
        found = 0;
        codes[@intCast(c_uint, (blk: {
                const ref = &found;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }))] = (enc).*.mbc_to_code.?((s), (s + one_len));
        {
            i = 0;
            while (i < n) : (i += 1) {
                var item: [*c]OnigCaseFoldCodeItem = (items + i);
                if (@bitCast(c_uint, item.*.byte_len) == one_len) {
                    if (item.*.code_len == @as(c_int, 1)) {
                        codes[@intCast(c_uint, (blk: {
                                const ref = &found;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }))] = item.*.code[@intCast(c_uint, @as(c_int, 0))];
                    }
                }
            }
        }
        r = onig_new_cclass_with_code_list(&node, enc, found, &codes);
        if (r != @as(c_int, 0)) return r;
        r = unravel_cf_node_add(rlist, node);
        if (r != @as(c_int, 0)) onig_node_free(node);
        rsn.?.* = (@intToPtr([*c]Node, @as(c_int, 0)));
    }
    return r;
} // ./src/todo/regcomp.c:5134:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const unravel_case_fold_string = @compileError("unable to translate function"); // ./src/todo/regcomp.c:5106:1
// ./src/todo/regcomp.c:5273:3: warning: TODO complex switch cases
pub const quantifiers_memory_node_info = @compileError("unable to translate function"); // ./src/todo/regcomp.c:5200:1
// ./src/todo/regcomp.c:5308:3: warning: TODO implement translation of stmt class LabelStmtClass
pub const check_call_reference = @compileError("unable to translate function"); // ./src/todo/regcomp.c:5289:1
pub fn tune_call2_call(arg_node: [*c]Node) callconv(.C) void {
    var node = arg_node;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                tune_call2_call(((&((node).*.u.cons)).*.car));
                                if (!((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                            }
                            break :@"switch";
                        }
                        tune_call2_call(((node).*.u.base.body));
                        break :switch_3;
                    }
                    if ((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) tune_call2_call(((node).*.u.base.body));
                    break :switch_5;
                }
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                        if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0))) {
                            _ = (blk: {
                                const ref = &((node).*.u.base.status);
                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                break :blk ref.*;
                            });
                            tune_call2_call(((node).*.u.base.body));
                            _ = (blk: {
                                const ref = &((node).*.u.base.status);
                                ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                break :blk ref.*;
                            });
                        }
                    } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        tune_call2_call(((node).*.u.base.body));
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) tune_call2_call(en.*.unnamed_0.te.Then);
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) tune_call2_call(en.*.unnamed_0.te.Else);
                    } else {
                        tune_call2_call(((node).*.u.base.body));
                    }
                }
                break :switch_7;
            }
            if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0))) {
                _ = (blk: {
                    const ref = &((node).*.u.base.status);
                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                    break :blk ref.*;
                });
                {
                    var cn: [*c]CallNode = (&((node).*.u.call));
                    var called: [*c]Node = ((cn).*.body);
                    cn.*.entry_count += 1;
                    _ = (blk: {
                        const ref = &((called).*.u.base.status);
                        ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7));
                        break :blk ref.*;
                    });
                    (&((called).*.u.bag)).*.unnamed_0.m.entry_count += 1;
                    tune_call2_call(called);
                }
                _ = (blk: {
                    const ref = &((node).*.u.base.status);
                    ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                    break :blk ref.*;
                });
            }
            break :switch_9;
        }
        break :switch_10;
    }
}
pub fn tune_call(arg_node: [*c]Node, arg_env: [*c]ParseEnv, arg_state: c_int) callconv(.C) c_int {
    var node = arg_node;
    var env = arg_env;
    var state = arg_state;
    var r: c_int = undefined;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                r = tune_call(((&((node).*.u.cons)).*.car), env, state);
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :@"switch";
                        }
                        if ((&((node).*.u.quant)).*.upper == @as(c_int, 0)) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4));
                        r = tune_call(((node).*.u.base.body), env, state);
                        break :switch_3;
                    }
                    if ((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) r = tune_call(((node).*.u.base.body), env, state) else r = 0;
                    break :switch_5;
                }
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                        if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) != @as(c_int, 0)) {
                            _ = (blk: {
                                const ref = &((node).*.u.base.status);
                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11));
                                break :blk ref.*;
                            });
                            (&((node).*.u.bag)).*.unnamed_0.m.entry_count -= 1;
                        }
                        r = tune_call(((node).*.u.base.body), env, state);
                    } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        r = tune_call(((node).*.u.base.body), env, state);
                        if (r != @as(c_int, 0)) return r;
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = tune_call(en.*.unnamed_0.te.Then, env, state);
                            if (r != @as(c_int, 0)) return r;
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) r = tune_call(en.*.unnamed_0.te.Else, env, state);
                    } else r = tune_call(((node).*.u.base.body), env, state);
                }
                break :switch_7;
            }
            if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) != @as(c_int, 0)) {
                _ = (blk: {
                    const ref = &((node).*.u.base.status);
                    ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11));
                    break :blk ref.*;
                });
                (&((node).*.u.call)).*.entry_count -= 1;
            }
            r = check_call_reference((&((node).*.u.call)), env, state);
            break :switch_9;
        }
        r = 0;
        break :switch_10;
    }
    return r;
}
pub fn tune_call2(arg_node: [*c]Node) callconv(.C) c_int {
    var node = arg_node;
    var r: c_int = 0;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                            }
                            while (true) {
                                r = tune_call2(((&((node).*.u.cons)).*.car));
                                if (!((r == @as(c_int, 0)) and ((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0))))) break;
                            }
                            break :@"switch";
                        }
                        if ((&((node).*.u.quant)).*.upper != @as(c_int, 0)) r = tune_call2(((node).*.u.base.body));
                        break :switch_3;
                    }
                    if ((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) r = tune_call2(((node).*.u.base.body));
                    break :switch_5;
                }
                if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11))) != @as(c_int, 0))) r = tune_call2(((node).*.u.base.body));
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (r != @as(c_int, 0)) return r;
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            r = tune_call2(en.*.unnamed_0.te.Then);
                            if (r != @as(c_int, 0)) return r;
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) r = tune_call2(en.*.unnamed_0.te.Else);
                    }
                }
                break :switch_7;
            }
            if (!((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 11))) != @as(c_int, 0))) {
                tune_call2_call(node);
            }
            break :switch_9;
        }
        break :switch_10;
    }
    return r;
}
pub fn tune_called_state_call(arg_node: [*c]Node, arg_state: c_int) callconv(.C) void {
    var node = arg_node;
    var state = arg_state;
    switch_10: {
        default: {
            case_8: {
                case_6: {
                    case_4: {
                        case_2: {
                            case_1: {
                                case: {
                                    switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                        @bitCast(c_uint, @as(c_int, 8)) => break :case,
                                        @bitCast(c_uint, @as(c_int, 7)) => break :case_1,
                                        @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                        @bitCast(c_uint, @as(c_int, 6)) => break :case_4,
                                        @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                        @bitCast(c_uint, @as(c_int, 9)) => break :case_8,
                                        else => break :default,
                                    }
                                }
                                state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0));
                            }
                            while (true) {
                                tune_called_state_call(((&((node).*.u.cons)).*.car), state);
                                if (!((@ptrCast(?*c_void, (blk: {
                                    const tmp = ((&((node).*.u.cons)).*.cdr);
                                    node = tmp;
                                    break :blk tmp;
                                }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                            }
                            break :@"switch";
                        }
                        {
                            var qn: [*c]QuantNode = (&((node).*.u.quant));
                            if (((qn.*.upper) == -@as(c_int, 1)) or (qn.*.upper >= @as(c_int, 2))) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2));
                            if (qn.*.lower != qn.*.upper) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                            if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8))) != @as(c_int, 0)) _ = (blk: {
                                const ref = &((node).*.u.base.status);
                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27));
                                break :blk ref.*;
                            });
                            tune_called_state_call(((qn).*.body), state);
                        }
                        break :switch_3;
                    }
                    {
                        var an: [*c]AnchorNode = (&((node).*.u.anchor));
                        switch_10: {
                            default: {
                                case_8: {
                                    case_7: {
                                        case_5: {
                                            case_3: {
                                                switch (an.*.type) {
                                                    @as(c_int, 2) => break :case_3,
                                                    @as(c_int, 8) => break :case_5,
                                                    @as(c_int, 1) => break :case_7,
                                                    @as(c_int, 4) => break :case_8,
                                                    else => break :default,
                                                }
                                            }
                                        }
                                        state |= ((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)));
                                        tune_called_state_call(((an).*.body), state);
                                        break :switch_6;
                                    }
                                }
                                state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8));
                                tune_called_state_call(((an).*.body), state);
                                break :switch_9;
                            }
                            break :switch_10;
                        }
                    }
                    break :switch_5;
                }
                {
                    var en: [*c]BagNode = (&((node).*.u.bag));
                    if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_MEMORY)) {
                        if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3))) != @as(c_int, 0)) {
                            if ((~en.*.unnamed_0.m.called_state & state) != @as(c_int, 0)) {
                                en.*.unnamed_0.m.called_state |= state;
                                tune_called_state_call(((node).*.u.base.body), state);
                            }
                        } else {
                            _ = (blk: {
                                const ref = &((node).*.u.base.status);
                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                break :blk ref.*;
                            });
                            en.*.unnamed_0.m.called_state |= state;
                            tune_called_state_call(((node).*.u.base.body), state);
                            _ = (blk: {
                                const ref = &((node).*.u.base.status);
                                ref.* = ref.* & ~(@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                break :blk ref.*;
                            });
                        }
                    } else if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                        state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0));
                        tune_called_state_call(((node).*.u.base.body), state);
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                            tune_called_state_call(en.*.unnamed_0.te.Then, state);
                        }
                        if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) tune_called_state_call(en.*.unnamed_0.te.Else, state);
                    } else {
                        tune_called_state_call(((node).*.u.base.body), state);
                    }
                }
                break :switch_7;
            }
            if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8))) != @as(c_int, 0)) _ = (blk: {
                const ref = &((node).*.u.base.status);
                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27));
                break :blk ref.*;
            });
            if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0)) _ = (blk: {
                const ref = &((node).*.u.base.status);
                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10));
                break :blk ref.*;
            });
            tune_called_state_call(((node).*.u.base.body), state);
            break :switch_9;
        }
        break :switch_10;
    }
}
pub fn tune_called_state(arg_node: [*c]Node, arg_state: c_int) callconv(.C) void {
    var node = arg_node;
    var state = arg_state;
    switch_15: {
        default: {
            case_14: {
                case_13: {
                    case_12: {
                        case_11: {
                            case_10: {
                                case_8: {
                                    case_6: {
                                        case_4: {
                                            case_2: {
                                                case_1: {
                                                    case: {
                                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                                            @bitCast(c_uint, @as(c_int, 8)) => break :case,
                                                            @bitCast(c_uint, @as(c_int, 7)) => break :case_1,
                                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_2,
                                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_4,
                                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_6,
                                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_8,
                                                            @bitCast(c_uint, @as(c_int, 3)) => break :case_10,
                                                            @bitCast(c_uint, @as(c_int, 0)) => break :case_11,
                                                            @bitCast(c_uint, @as(c_int, 2)) => break :case_12,
                                                            @bitCast(c_uint, @as(c_int, 1)) => break :case_13,
                                                            @bitCast(c_uint, @as(c_int, 10)) => break :case_14,
                                                            else => break :default,
                                                        }
                                                    }
                                                    state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0));
                                                }
                                                while (true) {
                                                    tune_called_state(((&((node).*.u.cons)).*.car), state);
                                                    if (!((@ptrCast(?*c_void, (blk: {
                                                        const tmp = ((&((node).*.u.cons)).*.cdr);
                                                        node = tmp;
                                                        break :blk tmp;
                                                    }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                                }
                                                break :@"switch";
                                            }
                                            if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8))) != @as(c_int, 0)) _ = (blk: {
                                                const ref = &((node).*.u.base.status);
                                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27));
                                                break :blk ref.*;
                                            });
                                            if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0)) _ = (blk: {
                                                const ref = &((node).*.u.base.status);
                                                ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10));
                                                break :blk ref.*;
                                            });
                                            tune_called_state_call(node, state);
                                            break :switch_3;
                                        }
                                        {
                                            var en: [*c]BagNode = (&((node).*.u.bag));
                                            switch_1: {
                                                case_8: {
                                                    case_6: {
                                                        case_5: {
                                                            case_3: {
                                                                switch (@bitCast(c_uint, @enumToInt(en.*.type))) {
                                                                    @bitCast(c_uint, @as(c_int, 0)) => break :case_3,
                                                                    @bitCast(c_uint, @as(c_int, 1)) => break :case_5,
                                                                    @bitCast(c_uint, @as(c_int, 2)) => break :case_6,
                                                                    @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                                                    else => break :switch_1,
                                                                }
                                                            }
                                                            if (en.*.unnamed_0.m.entry_count > @as(c_int, 1)) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5));
                                                            en.*.unnamed_0.m.called_state |= state;
                                                        }
                                                    }
                                                    tune_called_state(((node).*.u.base.body), state);
                                                    break :switch_7;
                                                }
                                                state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0));
                                                tune_called_state(((node).*.u.base.body), state);
                                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) tune_called_state(en.*.unnamed_0.te.Then, state);
                                                if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) tune_called_state(en.*.unnamed_0.te.Else, state);
                                                break :switch_9;
                                            }
                                        }
                                        break :switch_5;
                                    }
                                    {
                                        var qn: [*c]QuantNode = (&((node).*.u.quant));
                                        if (((qn.*.upper) == -@as(c_int, 1)) or (qn.*.upper >= @as(c_int, 2))) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2));
                                        if (qn.*.lower != qn.*.upper) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
                                        if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8))) != @as(c_int, 0)) _ = (blk: {
                                            const ref = &((node).*.u.base.status);
                                            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27));
                                            break :blk ref.*;
                                        });
                                        tune_called_state(((qn).*.body), state);
                                    }
                                    break :switch_7;
                                }
                                {
                                    var an: [*c]AnchorNode = (&((node).*.u.anchor));
                                    switch_11: {
                                        default: {
                                            case_9: {
                                                case_7: {
                                                    case_5: {
                                                        case_3: {
                                                            switch (an.*.type) {
                                                                @as(c_int, 2) => break :case_3,
                                                                @as(c_int, 8) => break :case_5,
                                                                @as(c_int, 1) => break :case_7,
                                                                @as(c_int, 4) => break :case_9,
                                                                else => break :default,
                                                            }
                                                        }
                                                    }
                                                    state |= ((@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1)) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)));
                                                    tune_called_state(((an).*.body), state);
                                                    break :switch_6;
                                                }
                                            }
                                            state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8));
                                            tune_called_state(((an).*.body), state);
                                            break :switch_10;
                                        }
                                        break :switch_11;
                                    }
                                }
                                break :switch_9;
                            }
                        }
                    }
                }
            }
        }
        break :switch_15;
    }
}
pub fn tune_anchor(arg_node: [*c]Node, arg_reg: [*c]regex_t, arg_state: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var state = arg_state;
    var env = arg_env;
    var r: c_int = undefined;
    var an: [*c]AnchorNode = (&((node).*.u.anchor));
    switch_6: {
        default: {
            case_4: {
                case_3: {
                    case_1: {
                        case: {
                            switch (an.*.type) {
                                @as(c_int, 1) => break :case,
                                @as(c_int, 2) => break :case_1,
                                @as(c_int, 4) => break :case_3,
                                @as(c_int, 8) => break :case_4,
                                else => break :default,
                            }
                        }
                        r = tune_tree(((an).*.body), reg, (state | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))), env);
                        break :@"switch";
                    }
                    r = tune_tree(((an).*.body), reg, ((state | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1))), env);
                    break :switch_2;
                }
            }
            r = tune_look_behind(node, reg, state, env);
            break :switch_5;
        }
        r = 0;
        break :switch_6;
    }
    return r;
}
pub fn tune_quant(arg_node: [*c]Node, arg_reg: [*c]regex_t, arg_state: c_int, arg_env: [*c]ParseEnv) callconv(.C) c_int {
    var node = arg_node;
    var reg = arg_reg;
    var state = arg_state;
    var env = arg_env;
    var r: c_int = undefined;
    var qn: [*c]QuantNode = (&((node).*.u.quant));
    var body: [*c]Node = ((node).*.u.base.body);
    if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2))) != @as(c_int, 0)) {
        _ = (blk: {
            const ref = &((node).*.u.base.status);
            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10));
            break :blk ref.*;
        });
    }
    if ((state & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5))) != @as(c_int, 0)) {
        _ = (blk: {
            const ref = &((node).*.u.base.status);
            ref.* = ref.* | (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 12));
            break :blk ref.*;
        });
    }
    if (((qn.*.upper) == -@as(c_int, 1)) or (qn.*.upper >= @as(c_int, 1))) {
        var d: OnigLen = node_min_byte_len(body, env);
        if (d == @bitCast(c_uint, @as(c_int, 0))) {
            qn.*.emptiness = quantifiers_memory_node_info(body);
        }
    }
    if (((qn.*.upper) == -@as(c_int, 1)) or (qn.*.upper >= @as(c_int, 2))) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 2));
    if (qn.*.lower != qn.*.upper) state |= (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 3));
    r = tune_tree(body, reg, state, env);
    if (r != @as(c_int, 0)) return r;
    if (@bitCast(c_uint, @enumToInt(((body).*.u.base.node_type))) == @bitCast(c_uint, NODE_STRING)) {
        if (((!((qn.*.lower) == -@as(c_int, 1)) and (qn.*.lower == qn.*.upper)) and (qn.*.lower > @as(c_int, 1))) and (qn.*.lower <= @as(c_int, 100))) {
            var len: c_int = @bitCast(c_int, @truncate(c_int, ((body).*.u.str.end - (body).*.u.str.s)));
            if ((len * qn.*.lower) <= @as(c_int, 100)) {
                var i: c_int = undefined;
                var n: c_int = qn.*.lower;
                node_conv_to_str_node(node, body);
                {
                    i = 0;
                    while (i < n) : (i += 1) {
                        r = node_str_node_cat(node, body);
                        if (r != @as(c_int, 0)) return r;
                    }
                }
                onig_node_free(body);
                return r;
            }
        }
    }
    if ((qn.*.greedy != 0) and (@bitCast(c_uint, @enumToInt(qn.*.emptiness)) == @bitCast(c_uint, BODY_IS_NOT_EMPTY))) {
        if (@bitCast(c_uint, @enumToInt(((body).*.u.base.node_type))) == @bitCast(c_uint, NODE_QUANT)) {
            var tqn: [*c]QuantNode = (&((body).*.u.quant));
            if ((@ptrCast(?*c_void, (tqn.*.head_exact))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                qn.*.head_exact = tqn.*.head_exact;
                tqn.*.head_exact = null;
            }
        } else {
            qn.*.head_exact = get_tree_head_literal(((node).*.u.base.body), @as(c_int, 1), reg);
        }
    }
    return r;
}
pub fn set_sunday_quick_search_or_bmh_skip_table(arg_reg: [*c]regex_t, arg_case_expand: c_int, arg_s: [*c]OnigUChar, arg_end: [*c]OnigUChar, arg_skip: [*c]OnigUChar, arg_roffset: [*c]c_int) callconv(.C) c_int {
    var reg = arg_reg;
    var case_expand = arg_case_expand;
    var s = arg_s;
    var end = arg_end;
    var skip = arg_skip;
    var roffset = arg_roffset;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var k: c_int = undefined;
    var len: c_int = undefined;
    var offset: c_int = undefined;
    var n: c_int = undefined;
    var clen: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var enc: OnigEncoding = undefined;
    var items: [13]OnigCaseFoldCodeItem = undefined;
    var buf: [18]OnigUChar = undefined;
    enc = reg.*.enc;
    offset = @bitCast(c_int, (((enc).*.flag & @bitCast(c_uint, (@as(c_int, 7) << @intCast(@import("std").math.Log2Int(c_int), 2)))) >> @intCast(@import("std").math.Log2Int(c_uint), 2)));
    if (offset == @as(c_int, 7)) {
        var p_1: [*c]OnigUChar = s;
        while (true) {
            len = (enc).*.mbc_enc_len.?(p_1);
            if ((p_1 + len) >= end) {
                if (len == @as(c_int, 1)) offset = 1 else offset = 0;
                break;
            }
            p_1 += len;
        }
    }
    len = @bitCast(c_int, @truncate(c_int, (end - s)));
    if ((len + offset) >= ((@as(c_int, 127) * @as(c_int, 2)) + @as(c_int, 1))) return -@as(c_int, 11);
    roffset.?.* = offset;
    {
        i = 0;
        while (i < @as(c_int, 256)) : (i += 1) {
            skip[@intCast(c_uint, i)] = @bitCast(OnigUChar, @truncate(i8, (len + offset)));
        }
    }
    {
        p = s;
        while (p < end) {
            var z: c_int = undefined;
            clen = (enc).*.mbc_enc_len.?(p);
            if ((p + clen) > end) clen = @bitCast(c_int, @truncate(c_int, (end - p)));
            len = @bitCast(c_int, @truncate(c_int, (end - p)));
            {
                j = 0;
                while (j < clen) : (j += 1) {
                    z = ((len - j) + (offset - @as(c_int, 1)));
                    if (z <= @as(c_int, 0)) break;
                    skip[p[@intCast(c_uint, j)]] = @bitCast(OnigUChar, @truncate(i8, z));
                }
            }
            if (case_expand != @as(c_int, 0)) {
                n = (enc).*.get_case_fold_codes_by_str.?(reg.*.case_fold_flag, p, end, &items);
                {
                    k = 0;
                    while (k < n) : (k += 1) {
                        _ = (enc).*.code_to_mbc.?(items[@intCast(c_uint, k)].code[@intCast(c_uint, @as(c_int, 0))], &buf);
                        {
                            j = 0;
                            while (j < clen) : (j += 1) {
                                z = ((len - j) + (offset - @as(c_int, 1)));
                                if (z <= @as(c_int, 0)) break;
                                if (@bitCast(c_int, @as(c_uint, skip[buf[@intCast(c_uint, j)]])) > z) skip[buf[@intCast(c_uint, j)]] = @bitCast(OnigUChar, @truncate(i8, z));
                            }
                        }
                    }
                }
            }
            p += clen;
        }
    }
    return 0;
}
const struct_unnamed_99 = extern struct {
    mm: MinMaxLen,
    enc: OnigEncoding,
    case_fold_flag: OnigCaseFoldType,
    scan_env: [*c]ParseEnv,
};
pub const OptEnv = struct_unnamed_99;
const struct_unnamed_100 = extern struct {
    left: c_int,
    right: c_int,
};
pub const OptAnc = struct_unnamed_100;
const struct_unnamed_101 = extern struct {
    mm: MinMaxLen,
    anc: OptAnc,
    reach_end: c_int,
    len: c_int,
    s: [24]OnigUChar,
};
pub const OptStr = struct_unnamed_101;
const struct_unnamed_102 = extern struct {
    mm: MinMaxLen,
    anc: OptAnc,
    value: c_int,
    map: [256]OnigUChar,
};
pub const OptMap = struct_unnamed_102;
const struct_unnamed_103 = extern struct {
    len: MinMaxLen,
    anc: OptAnc,
    sb: OptStr,
    sm: OptStr,
    spr: OptStr,
    map: OptMap,
};
pub const OptNode = struct_unnamed_103;
const Vals: [128]c_short = [128]c_short{
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 7))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 4))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 7))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 7))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 6))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 5))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1))),
};
pub fn map_position_value(arg_enc: OnigEncoding, arg_i: c_int) callconv(.C) c_int {
    var enc = arg_enc;
    var i = arg_i;
    _ = Vals;
    if (i < @bitCast(c_int, @truncate(c_uint, (@sizeOf([128]c_short) / @sizeOf(c_short))))) {
        if ((i == @as(c_int, 0)) and (((enc).*.min_enc_len) > @as(c_int, 1))) return 20 else return @bitCast(c_int, @as(c_int, Vals[@intCast(c_uint, i)]));
    } else return 4;
    return 0;
}
const dist_vals: [100]c_short = [100]c_short{
    @bitCast(c_short, @truncate(c_short, @as(c_int, 1000))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 500))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 333))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 250))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 200))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 167))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 143))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 125))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 111))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 100))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 91))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 83))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 77))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 71))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 67))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 63))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 59))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 56))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 53))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 50))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 48))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 45))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 43))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 42))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 40))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 38))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 37))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 36))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 34))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 33))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 32))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 31))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 30))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 29))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 29))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 28))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 27))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 26))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 26))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 25))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 24))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 24))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 23))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 23))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 22))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 22))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 21))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 21))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 20))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 20))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 20))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 19))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 19))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 19))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 18))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 18))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 18))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 17))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 17))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 17))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 16))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 16))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 16))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 16))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 15))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 15))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 15))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 15))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 14))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 14))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 14))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 14))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 14))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 14))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 13))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 13))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 13))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 13))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 13))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 13))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 12))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 11))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
    @bitCast(c_short, @truncate(c_short, @as(c_int, 10))),
};
pub fn distance_value(arg_mm: [*c]MinMaxLen) callconv(.C) c_int {
    var mm = arg_mm;
    _ = dist_vals;
    var d: OnigLen = undefined;
    if (mm.*.max == ~(@bitCast(OnigLen, @as(c_int, 0)))) return 0;
    d = (mm.*.max -% mm.*.min);
    if (d < @bitCast(OnigLen, @truncate(c_uint, (@sizeOf([100]c_short) / @sizeOf(c_short))))) return @bitCast(c_int, @as(c_int, dist_vals[d])) else return 1;
    return 0;
}
pub fn comp_distance_value(arg_d1: [*c]MinMaxLen, arg_d2: [*c]MinMaxLen, arg_v1: c_int, arg_v2: c_int) callconv(.C) c_int {
    var d1 = arg_d1;
    var d2 = arg_d2;
    var v1 = arg_v1;
    var v2 = arg_v2;
    if (v2 <= @as(c_int, 0)) return -@as(c_int, 1);
    if (v1 <= @as(c_int, 0)) return 1;
    v1 *= distance_value(d1);
    v2 *= distance_value(d2);
    if (v2 > v1) return 1;
    if (v2 < v1) return -@as(c_int, 1);
    if (d2.*.min < d1.*.min) return 1;
    if (d2.*.min > d1.*.min) return -@as(c_int, 1);
    return 0;
}
pub fn copy_opt_env(arg_to: [*c]OptEnv, arg_from: [*c]OptEnv) callconv(.C) void {
    var to = arg_to;
    var from = arg_from;
    to.?.* = from.?.*;
}
pub fn clear_opt_anc_info(arg_a: [*c]OptAnc) callconv(.C) void {
    var a = arg_a;
    a.*.left = 0;
    a.*.right = 0;
}
pub fn copy_opt_anc_info(arg_to: [*c]OptAnc, arg_from: [*c]OptAnc) callconv(.C) void {
    var to = arg_to;
    var from = arg_from;
    to.?.* = from.?.*;
}
pub fn concat_opt_anc_info(arg_to: [*c]OptAnc, arg_left: [*c]OptAnc, arg_right: [*c]OptAnc, arg_left_len: OnigLen, arg_right_len: OnigLen) callconv(.C) void {
    var to = arg_to;
    var left = arg_left;
    var right = arg_right;
    var left_len = arg_left_len;
    var right_len = arg_right_len;
    clear_opt_anc_info(to);
    to.*.left = left.*.left;
    if (left_len == @bitCast(c_uint, @as(c_int, 0))) {
        to.*.left |= right.*.left;
    }
    to.*.right = right.*.right;
    if (right_len == @bitCast(c_uint, @as(c_int, 0))) {
        to.*.right |= left.*.right;
    } else {
        to.*.right |= (left.*.right & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1)));
    }
}
pub fn is_left(arg_a: c_int) callconv(.C) c_int {
    var a = arg_a;
    if (((((a == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 7))) or (a == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 8)))) or (a == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 9)))) or (a == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 0)))) or (a == (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 1)))) return 0;
    return 1;
}
pub fn is_set_opt_anc_info(arg_to: [*c]OptAnc, arg_anc: c_int) callconv(.C) c_int {
    var to = arg_to;
    var anc = arg_anc;
    if ((to.*.left & anc) != @as(c_int, 0)) return 1;
    return (if ((to.*.right & anc) != @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 0));
}
pub fn add_opt_anc_info(arg_to: [*c]OptAnc, arg_anc: c_int) callconv(.C) void {
    var to = arg_to;
    var anc = arg_anc;
    if (is_left(anc) != 0) to.*.left |= anc else to.*.right |= anc;
}
pub fn remove_opt_anc_info(arg_to: [*c]OptAnc, arg_anc: c_int) callconv(.C) void {
    var to = arg_to;
    var anc = arg_anc;
    if (is_left(anc) != 0) to.*.left &= ~anc else to.*.right &= ~anc;
}
pub fn alt_merge_opt_anc_info(arg_to: [*c]OptAnc, arg_add: [*c]OptAnc) callconv(.C) void {
    var to = arg_to;
    var add = arg_add;
    to.*.left &= add.*.left;
    to.*.right &= add.*.right;
}
pub fn is_full_opt_exact(arg_e: [*c]OptStr) callconv(.C) c_int {
    var e = arg_e;
    return @boolToInt((e.*.len >= @as(c_int, 24)));
}
pub fn clear_opt_exact(arg_e: [*c]OptStr) callconv(.C) void {
    var e = arg_e;
    mml_clear(&e.*.mm);
    clear_opt_anc_info(&e.*.anc);
    e.*.reach_end = 0;
    e.*.len = 0;
    e.*.s[@intCast(c_uint, @as(c_int, 0))] = @bitCast(OnigUChar, @truncate(i8, @as(c_int, '\x00')));
}
pub fn copy_opt_exact(arg_to: [*c]OptStr, arg_from: [*c]OptStr) callconv(.C) void {
    var to = arg_to;
    var from = arg_from;
    to.?.* = from.?.*;
}
pub fn concat_opt_exact(arg_to: [*c]OptStr, arg_add: [*c]OptStr, arg_enc: OnigEncoding) callconv(.C) c_int {
    var to = arg_to;
    var add = arg_add;
    var enc = arg_enc;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var len: c_int = undefined;
    var r: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    var end: [*c]OnigUChar = undefined;
    var tanc: OptAnc = undefined;
    r = 0;
    p = &add.*.s;
    end = (p + add.*.len);
    {
        i = to.*.len;
        while (p < end) {
            len = (enc).*.mbc_enc_len.?(p);
            if ((i + len) > @as(c_int, 24)) {
                r = 1;
                break;
            }
            {
                j = 0;
                while ((j < len) and (p < end)) : (j += 1) {
                    to.*.s[@intCast(c_uint, (blk: {
                            const ref = &i;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }))] = (blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).?.*;
                }
            }
        }
    }
    to.*.len = i;
    to.*.reach_end = (if (p == end) add.*.reach_end else @as(c_int, 0));
    concat_opt_anc_info(&tanc, &to.*.anc, &add.*.anc, @bitCast(OnigLen, @as(c_int, 1)), @bitCast(OnigLen, @as(c_int, 1)));
    if (!(to.*.reach_end != 0)) tanc.right = 0;
    copy_opt_anc_info(&to.*.anc, &tanc);
    return r;
}
pub fn concat_opt_exact_str(arg_to: [*c]OptStr, arg_s: [*c]OnigUChar, arg_end: [*c]OnigUChar, arg_enc: OnigEncoding) callconv(.C) void {
    var to = arg_to;
    var s = arg_s;
    var end = arg_end;
    var enc = arg_enc;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var len: c_int = undefined;
    var p: [*c]OnigUChar = undefined;
    {
        _ = (blk: {
            i = to.*.len;
            break :blk blk_1: {
                const tmp = s;
                p = tmp;
                break :blk_1 tmp;
            };
        });
        while ((p < end) and (i < @as(c_int, 24))) {
            len = (enc).*.mbc_enc_len.?(p);
            if ((i + len) > @as(c_int, 24)) break;
            {
                j = 0;
                while ((j < len) and (p < end)) : (j += 1) {
                    to.*.s[@intCast(c_uint, (blk: {
                            const ref = &i;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }))] = (blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).?.*;
                }
            }
        }
    }
    to.*.len = i;
    if (p >= end) to.*.reach_end = 1;
}
pub fn alt_merge_opt_exact(arg_to: [*c]OptStr, arg_add: [*c]OptStr, arg_env: [*c]OptEnv) callconv(.C) void {
    var to = arg_to;
    var add = arg_add;
    var env = arg_env;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var len: c_int = undefined;
    if ((add.*.len == @as(c_int, 0)) or (to.*.len == @as(c_int, 0))) {
        clear_opt_exact(to);
        return;
    }
    if (!(mml_is_equal(&to.*.mm, &add.*.mm) != 0)) {
        clear_opt_exact(to);
        return;
    }
    {
        i = 0;
        while ((i < to.*.len) and (i < add.*.len)) {
            if (@bitCast(c_int, @as(c_uint, to.*.s[@intCast(c_uint, i)])) != @bitCast(c_int, @as(c_uint, add.*.s[@intCast(c_uint, i)]))) break;
            len = (env.*.enc).*.mbc_enc_len.?((&to.*.s + i));
            {
                j = 1;
                while (j < len) : (j += 1) {
                    if (@bitCast(c_int, @as(c_uint, to.*.s[@intCast(c_uint, (i + j))])) != @bitCast(c_int, @as(c_uint, add.*.s[@intCast(c_uint, (i + j))]))) break;
                }
            }
            if (j < len) break;
            i += len;
        }
    }
    if ((!(add.*.reach_end != 0) or (i < add.*.len)) or (i < to.*.len)) {
        to.*.reach_end = 0;
    }
    to.*.len = i;
    alt_merge_opt_anc_info(&to.*.anc, &add.*.anc);
    if (!(to.*.reach_end != 0)) to.*.anc.right = 0;
}
pub fn select_opt_exact(arg_enc: OnigEncoding, arg_now: [*c]OptStr, arg_alt: [*c]OptStr) callconv(.C) void {
    var enc = arg_enc;
    var now = arg_now;
    var alt = arg_alt;
    var vn: c_int = undefined;
    var va: c_int = undefined;
    vn = now.*.len;
    va = alt.*.len;
    if (va == @as(c_int, 0)) {
        return;
    } else if (vn == @as(c_int, 0)) {
        copy_opt_exact(now, alt);
        return;
    } else if ((vn <= @as(c_int, 2)) and (va <= @as(c_int, 2))) {
        va = map_position_value(enc, @bitCast(c_int, @as(c_uint, now.*.s[@intCast(c_uint, @as(c_int, 0))])));
        vn = map_position_value(enc, @bitCast(c_int, @as(c_uint, alt.*.s[@intCast(c_uint, @as(c_int, 0))])));
        if (now.*.len > @as(c_int, 1)) vn += @as(c_int, 5);
        if (alt.*.len > @as(c_int, 1)) va += @as(c_int, 5);
    }
    vn *= @as(c_int, 2);
    va *= @as(c_int, 2);
    if (comp_distance_value(&now.*.mm, &alt.*.mm, vn, va) > @as(c_int, 0)) copy_opt_exact(now, alt);
}
const clean_info: OptMap = OptMap{
    .mm = MinMaxLen{
        .min = @bitCast(OnigLen, @as(c_int, 0)),
        .max = @bitCast(OnigLen, @as(c_int, 0)),
    },
    .anc = OptAnc{
        .left = @as(c_int, 0),
        .right = @as(c_int, 0),
    },
    .value = @as(c_int, 0),
    .map = [256]OnigUChar{
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
        @bitCast(OnigUChar, @truncate(i8, @as(c_int, 0))),
    },
};
pub fn clear_opt_map(arg_map: [*c]OptMap) callconv(.C) void {
    var map = arg_map;
    _ = clean_info;
    _ = __builtin___memcpy_chk(@ptrCast(?*c_void, map), @ptrCast(?*const c_void, &clean_info), @sizeOf(OptMap), __builtin_object_size(@ptrCast(?*const c_void, map), @as(c_int, 0)));
}
pub fn copy_opt_map(arg_to: [*c]OptMap, arg_from: [*c]OptMap) callconv(.C) void {
    var to = arg_to;
    var from = arg_from;
    to.?.* = from.?.*;
}
pub fn add_char_opt_map(arg_m: [*c]OptMap, arg_c: OnigUChar, arg_enc: OnigEncoding) callconv(.C) void {
    var m = arg_m;
    var c = arg_c;
    var enc = arg_enc;
    if (@bitCast(c_int, @as(c_uint, m.*.map[c])) == @as(c_int, 0)) {
        m.*.map[c] = @bitCast(OnigUChar, @truncate(i8, @as(c_int, 1)));
        m.*.value += map_position_value(enc, @bitCast(c_int, @as(c_uint, c)));
    }
}
var z: c_int = @as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 15);
pub fn select_opt_map(arg_now: [*c]OptMap, arg_alt: [*c]OptMap) callconv(.C) void {
    var now = arg_now;
    var alt = arg_alt;
    _ = z;
    var vn: c_int = undefined;
    var va: c_int = undefined;
    if (alt.*.value == @as(c_int, 0)) return;
    if (now.*.value == @as(c_int, 0)) {
        copy_opt_map(now, alt);
        return;
    }
    vn = @divTrunc(z, now.*.value);
    va = @divTrunc(z, alt.*.value);
    if (comp_distance_value(&now.*.mm, &alt.*.mm, vn, va) > @as(c_int, 0)) copy_opt_map(now, alt);
}
pub fn comp_opt_exact_or_map(arg_e: [*c]OptStr, arg_m: [*c]OptMap) callconv(.C) c_int {
    var e = arg_e;
    var m = arg_m;
    var ae: c_int = undefined;
    var am: c_int = undefined;
    var case_value: c_int = undefined;
    if (m.*.value <= @as(c_int, 0)) return -@as(c_int, 1);
    case_value = 3;
    ae = ((@as(c_int, 20) * e.*.len) * case_value);
    am = @divTrunc(((@as(c_int, 20) * @as(c_int, 5)) * @as(c_int, 2)), m.*.value);
    return comp_distance_value(&e.*.mm, &m.*.mm, ae, am);
}
pub fn alt_merge_opt_map(arg_enc: OnigEncoding, arg_to: [*c]OptMap, arg_add: [*c]OptMap) callconv(.C) void {
    var enc = arg_enc;
    var to = arg_to;
    var add = arg_add;
    var i: c_int = undefined;
    var val: c_int = undefined;
    if (to.*.value == @as(c_int, 0)) return;
    if ((add.*.value == @as(c_int, 0)) or (to.*.mm.max < add.*.mm.min)) {
        clear_opt_map(to);
        return;
    }
    mml_alt_merge(&to.*.mm, &add.*.mm);
    val = 0;
    {
        i = 0;
        while (i < @as(c_int, 256)) : (i += 1) {
            if (add.*.map[@intCast(c_uint, i)] != 0) to.*.map[@intCast(c_uint, i)] = @bitCast(OnigUChar, @truncate(i8, @as(c_int, 1)));
            if (to.*.map[@intCast(c_uint, i)] != 0) val += map_position_value(enc, i);
        }
    }
    to.*.value = val;
    alt_merge_opt_anc_info(&to.*.anc, &add.*.anc);
}
pub fn set_bound_node_opt_info(arg_opt: [*c]OptNode, arg_plen: [*c]MinMaxLen) callconv(.C) void {
    var opt = arg_opt;
    var plen = arg_plen;
    mml_copy(&(opt.*.sb.mm), plen);
    mml_copy(&(opt.*.spr.mm), plen);
    mml_copy(&(opt.*.map.mm), plen);
}
pub fn clear_node_opt_info(arg_opt: [*c]OptNode) callconv(.C) void {
    var opt = arg_opt;
    mml_clear(&opt.*.len);
    clear_opt_anc_info(&opt.*.anc);
    clear_opt_exact(&opt.*.sb);
    clear_opt_exact(&opt.*.sm);
    clear_opt_exact(&opt.*.spr);
    clear_opt_map(&opt.*.map);
}
pub fn copy_node_opt_info(arg_to: [*c]OptNode, arg_from: [*c]OptNode) callconv(.C) void {
    var to = arg_to;
    var from = arg_from;
    to.?.* = from.?.*;
}
pub fn concat_left_node_opt_info(arg_enc: OnigEncoding, arg_to: [*c]OptNode, arg_add: [*c]OptNode) callconv(.C) void {
    var enc = arg_enc;
    var to = arg_to;
    var add = arg_add;
    var sb_reach: c_int = undefined;
    var sm_reach: c_int = undefined;
    var tanc: OptAnc = undefined;
    concat_opt_anc_info(&tanc, &to.*.anc, &add.*.anc, to.*.len.max, add.*.len.max);
    copy_opt_anc_info(&to.*.anc, &tanc);
    if ((add.*.sb.len > @as(c_int, 0)) and (to.*.len.max == @bitCast(c_uint, @as(c_int, 0)))) {
        concat_opt_anc_info(&tanc, &to.*.anc, &add.*.sb.anc, to.*.len.max, add.*.len.max);
        copy_opt_anc_info(&add.*.sb.anc, &tanc);
    }
    if ((add.*.map.value > @as(c_int, 0)) and (to.*.len.max == @bitCast(c_uint, @as(c_int, 0)))) {
        if (add.*.map.mm.max == @bitCast(c_uint, @as(c_int, 0))) add.*.map.anc.left |= to.*.anc.left;
    }
    sb_reach = to.*.sb.reach_end;
    sm_reach = to.*.sm.reach_end;
    if (add.*.len.max != @bitCast(c_uint, @as(c_int, 0))) to.*.sb.reach_end = blk: {
        const tmp = @as(c_int, 0);
        to.*.sm.reach_end = tmp;
        break :blk tmp;
    };
    if (add.*.sb.len > @as(c_int, 0)) {
        if (sb_reach != 0) {
            _ = concat_opt_exact(&to.*.sb, &add.*.sb, enc);
            clear_opt_exact(&add.*.sb);
        } else if (sm_reach != 0) {
            _ = concat_opt_exact(&to.*.sm, &add.*.sb, enc);
            clear_opt_exact(&add.*.sb);
        }
    }
    select_opt_exact(enc, &to.*.sm, &add.*.sb);
    select_opt_exact(enc, &to.*.sm, &add.*.sm);
    if (to.*.spr.len > @as(c_int, 0)) {
        if (add.*.len.max > @bitCast(c_uint, @as(c_int, 0))) {
            if (to.*.spr.mm.max == @bitCast(c_uint, @as(c_int, 0))) select_opt_exact(enc, &to.*.sb, &to.*.spr) else select_opt_exact(enc, &to.*.sm, &to.*.spr);
        }
    } else if (add.*.spr.len > @as(c_int, 0)) {
        copy_opt_exact(&to.*.spr, &add.*.spr);
    }
    select_opt_map(&to.*.map, &add.*.map);
    mml_add(&to.*.len, &add.*.len);
}
pub fn alt_merge_node_opt_info(arg_to: [*c]OptNode, arg_add: [*c]OptNode, arg_env: [*c]OptEnv) callconv(.C) void {
    var to = arg_to;
    var add = arg_add;
    var env = arg_env;
    alt_merge_opt_anc_info(&to.*.anc, &add.*.anc);
    alt_merge_opt_exact(&to.*.sb, &add.*.sb, env);
    alt_merge_opt_exact(&to.*.sm, &add.*.sm, env);
    alt_merge_opt_exact(&to.*.spr, &add.*.spr, env);
    alt_merge_opt_map(env.*.enc, &to.*.map, &add.*.map);
    mml_alt_merge(&to.*.len, &add.*.len);
} // ./src/todo/regcomp.c:6713:5: warning: TODO complex switch cases
pub const optimize_nodes = @compileError("unable to translate function"); // ./src/todo/regcomp.c:6581:1
pub fn set_optimize_exact(arg_reg: [*c]regex_t, arg_e: [*c]OptStr) callconv(.C) c_int {
    var reg = arg_reg;
    var e = arg_e;
    var r: c_int = undefined;
    var allow_reverse: c_int = undefined;
    if (e.*.len == @as(c_int, 0)) return 0;
    reg.*.exact = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), malloc(@bitCast(c_ulong, @as(c_long, e.*.len)))));
    if ((@ptrCast(?*c_void, (reg.*.exact))) == @intToPtr(?*c_void, @as(c_int, 0))) return -@as(c_int, 5);
    _ = __builtin___memcpy_chk(@ptrCast(?*c_void, reg.*.exact), @ptrCast(?*const c_void, &e.*.s), @bitCast(c_ulong, @as(c_long, e.*.len)), __builtin_object_size(@ptrCast(?*const c_void, reg.*.exact), @as(c_int, 0)));
    reg.*.exact_end = (reg.*.exact + e.*.len);
    allow_reverse = (reg.*.enc).*.is_allowed_reverse_match.?(reg.*.exact, reg.*.exact_end);
    if ((e.*.len >= @as(c_int, 2)) or ((e.*.len >= @as(c_int, 1)) and (allow_reverse != 0))) {
        r = set_sunday_quick_search_or_bmh_skip_table(reg, @as(c_int, 0), reg.*.exact, reg.*.exact_end, &reg.*.map, &(reg.*.map_offset));
        if (r != @as(c_int, 0)) return r;
        reg.*.optimize = (if (allow_reverse != @as(c_int, 0)) OPTIMIZE_STR_FAST else OPTIMIZE_STR_FAST_STEP_FORWARD);
    } else {
        reg.*.optimize = OPTIMIZE_STR;
    }
    reg.*.dist_min = e.*.mm.min;
    reg.*.dist_max = e.*.mm.max;
    if (reg.*.dist_min != ~(@bitCast(OnigLen, @as(c_int, 0)))) {
        var n: c_int = @bitCast(c_int, @truncate(c_int, (reg.*.exact_end - reg.*.exact)));
        reg.*.threshold_len = @bitCast(c_int, (reg.*.dist_min +% @bitCast(c_uint, n)));
    }
    return 0;
}
pub fn set_optimize_map(arg_reg: [*c]regex_t, arg_m: [*c]OptMap) callconv(.C) void {
    var reg = arg_reg;
    var m = arg_m;
    var i: c_int = undefined;
    {
        i = 0;
        while (i < @as(c_int, 256)) : (i += 1) reg.*.map[@intCast(c_uint, i)] = m.*.map[@intCast(c_uint, i)];
    }
    reg.*.optimize = OPTIMIZE_MAP;
    reg.*.dist_min = m.*.mm.min;
    reg.*.dist_max = m.*.mm.max;
    if (reg.*.dist_min != ~(@bitCast(OnigLen, @as(c_int, 0)))) {
        reg.*.threshold_len = @bitCast(c_int, (reg.*.dist_min +% @bitCast(c_uint, ((reg.*.enc).*.min_enc_len))));
    }
}
pub fn set_sub_anchor(arg_reg: [*c]regex_t, arg_anc: [*c]OptAnc) callconv(.C) void {
    var reg = arg_reg;
    var anc = arg_anc;
    reg.*.sub_anchor |= (anc.*.left & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 5)));
    reg.*.sub_anchor |= (anc.*.right & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 9)));
} // ./src/todo/regcomp.c:6999:7: warning: TODO implement translation of stmt class GotoStmtClass
pub const set_optimize_info_from_tree = @compileError("unable to translate function"); // ./src/todo/regcomp.c:6967:1
pub fn clear_optimize_info(arg_reg: [*c]regex_t) callconv(.C) void {
    var reg = arg_reg;
    reg.*.optimize = OPTIMIZE_NONE;
    reg.*.anchor = 0;
    reg.*.anc_dist_min = @bitCast(OnigLen, @as(c_int, 0));
    reg.*.anc_dist_max = @bitCast(OnigLen, @as(c_int, 0));
    reg.*.sub_anchor = 0;
    reg.*.exact_end = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (@intToPtr(?*c_void, @as(c_int, 0)))));
    reg.*.map_offset = 0;
    reg.*.threshold_len = 0;
    if ((@ptrCast(?*c_void, (reg.*.exact))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        free(@ptrCast(?*c_void, reg.*.exact));
        reg.*.exact = @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (@intToPtr(?*c_void, @as(c_int, 0)))));
    }
}
pub fn free_regex_ext(arg_ext: [*c]RegexExt) callconv(.C) void {
    var ext = arg_ext;
    if ((@ptrCast(?*c_void, (ext))) != @intToPtr(?*c_void, @as(c_int, 0))) {
        if ((@intToPtr(?*c_void, @ptrToInt((ext.*.pattern)))) != @intToPtr(?*c_void, @as(c_int, 0))) free(@intToPtr(?*c_void, @ptrToInt(ext.*.pattern)));
        if ((ext.*.tag_table) != @intToPtr(?*c_void, @as(c_int, 0))) _ = onig_callout_tag_table_free(ext.*.tag_table);
        if ((@ptrCast(?*c_void, (ext.*.callout_list))) != @intToPtr(?*c_void, @as(c_int, 0))) onig_free_reg_callout_list(ext.*.callout_num, ext.*.callout_list);
        free(@ptrCast(?*c_void, ext));
    }
}
pub extern fn onig_init_for_match_at(reg: [*c]regex_t) c_int; // ./src/todo/regcomp.c:7340:15: warning: TODO implement translation of stmt class GotoStmtClass
pub const parse_and_tune = @compileError("unable to translate function"); // ./src/todo/regcomp.c:7322:12
pub var onig_inited: c_int = 0;
pub const struct_EndCallListItem = extern struct {
    next: [*c]struct_EndCallListItem,
    func: ?fn () callconv(.C) void,
};
pub const EndCallListItemType = struct_EndCallListItem;
pub var EndCallTop: [*c]EndCallListItemType = @import("std").mem.zeroes([*c]EndCallListItemType);
pub fn exec_end_call_list() callconv(.C) void {
    var prev: [*c]EndCallListItemType = undefined;
    var func: ?fn () callconv(.C) void = undefined;
    while (EndCallTop != null) {
        func = EndCallTop.*.func;
        (func).?();
        prev = EndCallTop;
        EndCallTop = EndCallTop.*.next;
        free(@ptrCast(?*c_void, prev));
    }
}
pub const MJ_NO = @enumToInt(enum_unnamed_104.MJ_NO);
pub const MJ_YES = @enumToInt(enum_unnamed_104.MJ_YES);
pub const MJ_IGNORE = @enumToInt(enum_unnamed_104.MJ_IGNORE);
const enum_unnamed_104 = extern enum(c_int) {
    MJ_NO = 0,
    MJ_YES = 1,
    MJ_IGNORE = 2,
    _,
};
pub const MJ_RESULT = enum_unnamed_104;
pub const mostly_just_anychar = @compileError("unable to translate function"); // ./src/todo/regcomp.c:7839:1
const struct_unnamed_105 = extern struct {
    prec_read: c_int,
    look_behind: c_int,
    backref: c_int,
    backref_with_level: c_int,
    call: c_int,
    anychar_reluctant_many: c_int,
    empty_check_nest_level: c_int,
    max_empty_check_nest_level: c_int,
    heavy_element: c_int,
};
pub const SlowElementCount = struct_unnamed_105;
pub fn detect_can_be_slow(arg_node: [*c]Node, arg_ct: [*c]SlowElementCount, arg_ncall: c_int, arg_calls: [*c]c_int) callconv(.C) c_int {
    var node = arg_node;
    var ct = arg_ct;
    var ncall = arg_ncall;
    var calls = arg_calls;
    var r: c_int = undefined;
    r = 0;
    switch_12: {
        default: {
            case_10: {
                case_8: {
                    case_6: {
                        case_4: {
                            case_2: {
                                case_1: {
                                    case: {
                                        switch (@bitCast(c_uint, @enumToInt(((node).*.u.base.node_type)))) {
                                            @bitCast(c_uint, @as(c_int, 7)) => break :case,
                                            @bitCast(c_uint, @as(c_int, 8)) => break :case_1,
                                            @bitCast(c_uint, @as(c_int, 4)) => break :case_2,
                                            @bitCast(c_uint, @as(c_int, 6)) => break :case_4,
                                            @bitCast(c_uint, @as(c_int, 5)) => break :case_6,
                                            @bitCast(c_uint, @as(c_int, 3)) => break :case_8,
                                            @bitCast(c_uint, @as(c_int, 9)) => break :case_10,
                                            else => break :default,
                                        }
                                    }
                                }
                                while (true) {
                                    r = detect_can_be_slow(((&((node).*.u.cons)).*.car), ct, ncall, calls);
                                    if (r != @as(c_int, 0)) return r;
                                    if (!((@ptrCast(?*c_void, (blk: {
                                        const tmp = ((&((node).*.u.cons)).*.cdr);
                                        node = tmp;
                                        break :blk tmp;
                                    }))) != @intToPtr(?*c_void, @as(c_int, 0)))) break;
                                }
                                break :@"switch";
                            }
                            {
                                var prev_heavy_element: c_int = undefined;
                                var qn: [*c]QuantNode = undefined;
                                var body: [*c]Node = undefined;
                                qn = (&((node).*.u.quant));
                                body = ((node).*.u.base.body);
                                if (@bitCast(c_uint, @enumToInt(qn.*.emptiness)) != @bitCast(c_uint, BODY_IS_NOT_EMPTY)) {
                                    prev_heavy_element = ct.*.heavy_element;
                                    ct.*.empty_check_nest_level += 1;
                                    if (ct.*.empty_check_nest_level > ct.*.max_empty_check_nest_level) ct.*.max_empty_check_nest_level = ct.*.empty_check_nest_level;
                                } else if (((qn.*.upper) == -@as(c_int, 1)) or (qn.*.upper > @as(c_int, 20))) {
                                    var mr: MJ_RESULT = mostly_just_anychar(body, @boolToInt((qn.*.greedy == @as(c_int, 0))));
                                    if (@bitCast(c_uint, @enumToInt(mr)) == @bitCast(c_uint, MJ_YES)) ct.*.anychar_reluctant_many += 1;
                                }
                                r = detect_can_be_slow(body, ct, ncall, calls);
                                if (@bitCast(c_uint, @enumToInt(qn.*.emptiness)) != @bitCast(c_uint, BODY_IS_NOT_EMPTY)) {
                                    if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27))) != @as(c_int, 0)) {
                                        if (ct.*.empty_check_nest_level > @as(c_int, 2)) {
                                            if (prev_heavy_element == ct.*.heavy_element) ct.*.heavy_element += 1;
                                        }
                                    }
                                    ct.*.empty_check_nest_level -= 1;
                                }
                            }
                            break :switch_3;
                        }
                        switch_10: {
                            default: {
                                case_8: {
                                    case_7: {
                                        case_5: {
                                            case_3: {
                                                switch ((&((node).*.u.anchor)).*.type) {
                                                    @as(c_int, 1) => break :case_3,
                                                    @as(c_int, 2) => break :case_5,
                                                    @as(c_int, 4) => break :case_7,
                                                    @as(c_int, 8) => break :case_8,
                                                    else => break :default,
                                                }
                                            }
                                        }
                                        ct.*.prec_read += 1;
                                        break :switch_6;
                                    }
                                }
                                ct.*.look_behind += 1;
                                break :switch_9;
                            }
                            break :switch_10;
                        }
                        if ((&((node).*.u.anchor)).*.type < (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 4))) r = detect_can_be_slow(((node).*.u.base.body), ct, ncall, calls);
                        break :switch_5;
                    }
                    {
                        var en: [*c]BagNode = (&((node).*.u.bag));
                        r = detect_can_be_slow(((node).*.u.base.body), ct, ncall, calls);
                        if (r != @as(c_int, 0)) return r;
                        if (@bitCast(c_uint, @enumToInt(en.*.type)) == @bitCast(c_uint, BAG_IF_ELSE)) {
                            if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Then))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                r = detect_can_be_slow(en.*.unnamed_0.te.Then, ct, ncall, calls);
                                if (r != @as(c_int, 0)) return r;
                            }
                            if ((@ptrCast(?*c_void, (en.*.unnamed_0.te.Else))) != @intToPtr(?*c_void, @as(c_int, 0))) {
                                r = detect_can_be_slow(en.*.unnamed_0.te.Else, ct, ncall, calls);
                                if (r != @as(c_int, 0)) return r;
                            }
                        }
                    }
                    break :switch_7;
                }
                if ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 13))) != @as(c_int, 0)) ct.*.backref_with_level += 1 else ct.*.backref += 1;
                break :switch_9;
            }
            {
                var i: c_int = undefined;
                var found: c_int = undefined;
                var gnum: c_int = undefined;
                gnum = (&((node).*.u.call)).*.called_gnum;
                ct.*.call += 1;
                if ((((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 6))) != @as(c_int, 0)) and ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 27))) != @as(c_int, 0))) and ((((node).*.u.base.status) & (@as(c_int, 1) << @intCast(@import("std").math.Log2Int(c_int), 10))) != @as(c_int, 0))) {
                    ct.*.heavy_element += @as(c_int, 10);
                }
                found = 0;
                {
                    i = 0;
                    while (i < ncall) : (i += 1) {
                        if (gnum == calls[@intCast(c_uint, i)]) {
                            found = 1;
                            break;
                        }
                    }
                }
                if (!(found != 0)) {
                    if ((ncall + @as(c_int, 1)) < @as(c_int, 10)) {
                        calls[@intCast(c_uint, ncall)] = gnum;
                        r = detect_can_be_slow(((node).*.u.base.body), ct, (ncall + @as(c_int, 1)), calls);
                    } else {
                        ct.*.heavy_element += 1;
                    }
                }
            }
            break :switch_11;
        }
        break :switch_12;
    }
    return r;
} // ./src/todo/regcomp.c:8136:15: warning: TODO implement translation of stmt class GotoStmtClass
pub const onig_detect_can_be_slow_pattern = @compileError("unable to translate function"); // ./src/todo/regcomp.c:8108:1
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
pub const ONIG_EXTERN = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // ./src/todo/oniguruma.h:68:9
pub const ONIGENC_MBC_CASE_FOLD = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // ./src/todo/oniguruma.h:265:9
pub const ONIG_OPTION_ON = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ./src/todo/oniguruma.h:407:9
pub const ONIG_OPTION_OFF = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ./src/todo/oniguruma.h:408:9
pub const ONIG_CHECK_NULL_RETURN = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ./src/todo/regenc.h:74:9
pub const ONIG_CHECK_NULL_RETURN_VAL = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ./src/todo/regenc.h:75:9
pub const FOLDS_FOLD_ADDR_BUK = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regenc.h:214:9
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
pub const CHECK_NULL_RETURN = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ./src/todo/regint.h:189:9
pub const CHECK_NULL_RETURN_MEMERR = @compileError("unable to translate C expr: unexpected token .Keyword_if"); // ./src/todo/regint.h:190:9
pub const MEM_STATUS_CLEAR = @compileError("unable to translate C expr: unexpected token .Equal"); // ./src/todo/regint.h:348:9
pub const MEM_STATUS_ON_ALL = @compileError("unable to translate C expr: unexpected token .Equal"); // ./src/todo/regint.h:349:9
pub const MEM_STATUS_ON = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:357:9
pub const MEM_STATUS_ON_SIMPLE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:366:9
pub const MEM_STATUS_LIMIT_ON = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:373:9
pub const BITSET_CLEAR = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:427:9
pub const BITSET_SET_BIT = @compileError("unable to translate C expr: unexpected token .PipeEqual"); // ./src/todo/regint.h:436:9
pub const BITSET_CLEAR_BIT = @compileError("unable to translate C expr: unexpected token .AmpersandEqual"); // ./src/todo/regint.h:437:9
pub const BITSET_INVERT_BIT = @compileError("unable to translate C expr: unexpected token .CaretEqual"); // ./src/todo/regint.h:438:9
pub const BB_EXPAND = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:449:9
pub const BB_ENSURE_SIZE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:455:9
pub const BB_WRITE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:465:9
pub const BB_WRITE1 = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:472:9
pub const BB_MOVE_RIGHT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:485:9
pub const BB_MOVE_LEFT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:492:9
pub const BB_MOVE_LEFT_REDUCE = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:497:9
pub const BB_INSERT = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:502:9
pub const GET_CODE_POINT = @compileError("unable to translate C expr: unexpected token .Equal"); // ./src/todo/regint.h:697:9
pub const NCCLASS_FLAG_SET = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ./src/todo/regint.h:786:9
pub const NCCLASS_FLAG_CLEAR = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ./src/todo/regint.h:787:9
pub const BC0_P = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1050:9
pub const BC0_R = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1059:9
pub const BC0_B = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1068:9
pub const BC_P = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1077:9
pub const BC_P_O = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1086:9
pub const BC_B = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1095:9
pub const BC_B_O = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regint.h:1104:9
pub const NODE_SET_TYPE = @compileError("unable to translate C expr: unexpected token .Equal"); // ./src/todo/regparse.h:277:9
pub const NODE_STRING_SET_CRUDE = @compileError("unable to translate C expr: unexpected token .PipeEqual"); // ./src/todo/regparse.h:305:9
pub const NODE_STRING_CLEAR_CRUDE = @compileError("unable to translate C expr: unexpected token .AmpersandEqual"); // ./src/todo/regparse.h:306:9
pub const NODE_STRING_SET_CASE_EXPANDED = @compileError("unable to translate C expr: unexpected token .PipeEqual"); // ./src/todo/regparse.h:307:9
pub const NODE_STATUS_ADD = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ./src/todo/regparse.h:348:9
pub const NODE_STATUS_REMOVE = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ./src/todo/regparse.h:349:9
pub const ID_ENTRY = @compileError("unable to translate C expr: unexpected token .Keyword_do"); // ./src/todo/regparse.h:399:9
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
pub const OPS_INIT_SIZE = 8;
pub fn NODE_IS_REAL_IGNORECASE(node: anytype) callconv(.Inline) @TypeOf((NODE_IS_IGNORECASE(node) != 0) and !(NODE_STRING_IS_CRUDE(node) != 0)) {
    return (NODE_IS_IGNORECASE(node) != 0) and !(NODE_STRING_IS_CRUDE(node) != 0);
}
pub const MIN_OPS_EXPAND_SIZE = 4;
pub fn IS_NEED_STR_LEN_OP(op: anytype) callconv(.Inline) @TypeOf((((op == OP_STR_N) or (op == OP_STR_MB2N)) or (op == OP_STR_MB3N)) or (op == OP_STR_MBN)) {
    return (((op == OP_STR_N) or (op == OP_STR_MB2N)) or (op == OP_STR_MB3N)) or (op == OP_STR_MBN);
}
pub const REPEAT_RANGE_ALLOC = 4;
pub const QUANTIFIER_EXPAND_LIMIT_SIZE = 10;
pub const CKN_ON = ckn > 0;
pub const ALLOWED_TYPE_IN_LB = (((((((((NODE_BIT_LIST | NODE_BIT_ALT) | NODE_BIT_STRING) | NODE_BIT_CCLASS) | NODE_BIT_CTYPE) | NODE_BIT_ANCHOR) | NODE_BIT_BAG) | NODE_BIT_QUANT) | NODE_BIT_CALL) | NODE_BIT_BACKREF) | NODE_BIT_GIMMICK;
pub const ALLOWED_BAG_IN_LB = (((1 << BAG_MEMORY) | (1 << BAG_OPTION)) | (1 << BAG_STOP_BACKTRACK)) | (1 << BAG_IF_ELSE);
pub const ALLOWED_BAG_IN_LB_NOT = ((1 << BAG_OPTION) | (1 << BAG_STOP_BACKTRACK)) | (1 << BAG_IF_ELSE);
pub const ALLOWED_ANCHOR_IN_LB = (((((((((ANCR_LOOK_BEHIND | ANCR_BEGIN_LINE) | ANCR_END_LINE) | ANCR_BEGIN_BUF) | ANCR_BEGIN_POSITION) | ANCR_WORD_BOUNDARY) | ANCR_NO_WORD_BOUNDARY) | ANCR_WORD_BEGIN) | ANCR_WORD_END) | ANCR_TEXT_SEGMENT_BOUNDARY) | ANCR_NO_TEXT_SEGMENT_BOUNDARY;
pub const ALLOWED_ANCHOR_IN_LB_NOT = ((((((((((ANCR_LOOK_BEHIND | ANCR_LOOK_BEHIND_NOT) | ANCR_BEGIN_LINE) | ANCR_END_LINE) | ANCR_BEGIN_BUF) | ANCR_BEGIN_POSITION) | ANCR_WORD_BOUNDARY) | ANCR_NO_WORD_BOUNDARY) | ANCR_WORD_BEGIN) | ANCR_WORD_END) | ANCR_TEXT_SEGMENT_BOUNDARY) | ANCR_NO_TEXT_SEGMENT_BOUNDARY;
pub const RECURSION_EXIST = 1 << 0;
pub const RECURSION_MUST = 1 << 1;
pub const RECURSION_INFINITE = 1 << 2;
pub const IN_RECURSION = 1 << 0;
pub const FOUND_CALLED_NODE = 1;
pub const IN_ALT = 1 << 0;
pub const IN_NOT = 1 << 1;
pub const IN_REAL_REPEAT = 1 << 2;
pub const IN_VAR_REPEAT = 1 << 3;
pub const IN_ZERO_REPEAT = 1 << 4;
pub const IN_MULTI_ENTRY = 1 << 5;
pub const IN_PREC_READ = 1 << 6;
pub const IN_LOOK_BEHIND = 1 << 7;
pub const IN_PEEK = 1 << 8;
pub const EXPAND_STRING_MAX_LENGTH = 100;
pub const OPT_EXACT_MAXLEN = 24;
pub const COMP_EM_BASE = 20;
pub const MAX_NODE_OPT_INFO_REF_COUNT = 5;
pub const MANY_REPEAT_OF_ANYCHAR = 20;
pub const MAX_CALLS_IN_DETECT = 10;
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
pub const BagType = enum_BagType;
pub const GimmickType = enum_GimmickType;
pub const BodyEmptyType = enum_BodyEmptyType;
pub const _Node = struct__Node;
pub const CharLenReturnType = enum_CharLenReturnType;
pub const GetValue = enum_GetValue;
pub const EndCallListItem = struct_EndCallListItem;
