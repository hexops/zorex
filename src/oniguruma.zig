
const CodePoint = usize;
const CType = usize;

const INFINITE_DISTANCE = ~(@intCast(usize, 0));

// TODO(slimsag): candidate for removal.
/// Case fold flags
pub const CaseFoldType = enum(u32) {
    Default = 0,
    ASCIIOnly = 1,
    InternalMultiChar = 1 << 30,
};

// TODO(slimsag): candidate for removal?
pub const CaseFoldMin = CaseFoldType.InternalMultiChar;

const ENC_MAX_COMP_CASE_FOLD_CODE_LEN      = 3;
const ENC_GET_CASE_FOLD_CODES_MAX_NUM     = 13 ; /// 13 => Unicode:0x1ffc

// TODO(slimsag)
/// code range
// #define ONIGENC_CODE_RANGE_NUM(range)     ((int )range[0])
// #define ONIGENC_CODE_RANGE_FROM(range,i)  range[((i)*2) + 1]
// #define ONIGENC_CODE_RANGE_TO(range,i)    range[((i)*2) + 2]

const CaseFoldCodeItem = struct {
    byte_len: isize, /// argument(original) character(s) byte length
    code_len: isize, /// number of code
    code: [ENC_MAX_COMP_CASE_FOLD_CODE_LEN]CodePoint,
};

pub const MetaCharTable = struct {
    esc: CodePoint,
    anyChar: CodePoint,
    anyTime: CodePoint,
    zeroOrOneTime: CodePoint,
    oneOrMoreTime: CodePoint,
    anyCharAnyTime: CodePoint,
};

// TODO(slimsag)
// typedef int (*OnigApplyAllCaseFoldFunc)(OnigCodePoint from, OnigCodePoint* to, int to_len, void* arg);

const Encoding = struct {
    //   int    (*mbc_enc_len)(const OnigUChar* p);
    name: []const u8,
    max_enc_len: isize,
    min_enc_len: isize,
    //   int    (*is_mbc_newline)(const OnigUChar* p, const OnigUChar* end);
    //   OnigCodePoint (*mbc_to_code)(const OnigUChar* p, const OnigUChar* end);
    //   int    (*code_to_mbclen)(OnigCodePoint code);
    //   int    (*code_to_mbc)(OnigCodePoint code, OnigUChar *buf);
    //   int    (*mbc_case_fold)(OnigCaseFoldType flag, const OnigUChar** pp, const OnigUChar* end, OnigUChar* to);
    //   int    (*apply_all_case_fold)(OnigCaseFoldType flag, OnigApplyAllCaseFoldFunc f, void* arg);
    //   int    (*get_case_fold_codes_by_str)(OnigCaseFoldType flag, const OnigUChar* p, const OnigUChar* end, OnigCaseFoldCodeItem acs[]);
    //   int    (*property_name_to_ctype)(struct OnigEncodingTypeST* enc, OnigUChar* p, OnigUChar* end);
    //   int    (*is_code_ctype)(OnigCodePoint code, OnigCtype ctype);
    //   int    (*get_ctype_code_range)(OnigCtype ctype, OnigCodePoint* sb_out, const OnigCodePoint* ranges[]);
    //   OnigUChar* (*left_adjust_char_head)(const OnigUChar* start, const OnigUChar* p);
    //   int    (*is_allowed_reverse_match)(const OnigUChar* p, const OnigUChar* end);
    //   int    (*init)(void);
    //   int    (*is_initialized)(void);
    //   int    (*is_valid_mbc_string)(const OnigUChar* s, const OnigUChar* end);
    flag: usize,
    sb_range: CodePoint,
    index: isize,
};

const EncodingUTF8 = Encoding{};
const ENCODING_UTF8 = &EncodingUTF8;

/// work size
const ENC_CODE_TO_MBC_MAXLEN =      7;
const ENC_MBC_CASE_FOLD_MAXLEN =   18; /// 18: 6(max-byte) * 3(case-fold chars)

/// character types
pub const EncCType = enum {
    AnyChar,
    NewLine,
    Alpha,
    Blank,
    CNTRL,
    Digit,
    Graph,
    Lower,
    Print,
    Punct,
    Space,
    Upper,
    XDigit,
    Word,
    Alnum, /// alpha || digit
    ASCII,
};

// #define onig_enc_len(enc,p,end)        ONIGENC_MBC_ENC_LEN(enc,p)

// #define ONIGENC_IS_UNDEF(enc)          ((enc) == ONIG_ENCODING_UNDEF)
// #define ONIGENC_IS_SINGLEBYTE(enc)     (ONIGENC_MBC_MAXLEN(enc) == 1)
// #define ONIGENC_IS_MBC_HEAD(enc,p)     (ONIGENC_MBC_ENC_LEN(enc,p) != 1)
// #define ONIGENC_IS_MBC_ASCII(p)           (*(p)   < 128)
// #define ONIGENC_IS_CODE_ASCII(code)       ((code) < 128)
// #define ONIGENC_IS_MBC_WORD(enc,s,end) \
//    ONIGENC_IS_CODE_WORD(enc,ONIGENC_MBC_TO_CODE(enc,s,end))
// #define ONIGENC_IS_MBC_WORD_ASCII(enc,s,end) onigenc_is_mbc_word_ascii(enc,s,end)

// #define ONIGENC_NAME(enc)                      ((enc)->name)

// #define ONIGENC_MBC_CASE_FOLD(enc,flag,pp,end,buf) \
//   (enc)->mbc_case_fold(flag,(const OnigUChar** )pp,end,buf)
// #define ONIGENC_IS_ALLOWED_REVERSE_MATCH(enc,s,end) \
//         (enc)->is_allowed_reverse_match(s,end)
// #define ONIGENC_LEFT_ADJUST_CHAR_HEAD(enc,start,s) \
//         (enc)->left_adjust_char_head(start, s)
// #define ONIGENC_IS_VALID_MBC_STRING(enc,s,end) \
//         (enc)->is_valid_mbc_string(s,end)
// #define ONIGENC_APPLY_ALL_CASE_FOLD(enc,case_fold_flag,f,arg) \
//         (enc)->apply_all_case_fold(case_fold_flag,f,arg)
// #define ONIGENC_GET_CASE_FOLD_CODES_BY_STR(enc,case_fold_flag,p,end,acs) \
//        (enc)->get_case_fold_codes_by_str(case_fold_flag,p,end,acs)
// #define ONIGENC_STEP_BACK(enc,start,s,n) \
//         onigenc_step_back((enc),(start),(s),(n))

// #define ONIGENC_MBC_ENC_LEN(enc,p)             (enc)->mbc_enc_len(p)
// #define ONIGENC_MBC_MAXLEN(enc)               ((enc)->max_enc_len)
// #define ONIGENC_MBC_MAXLEN_DIST(enc)           ONIGENC_MBC_MAXLEN(enc)
// #define ONIGENC_MBC_MINLEN(enc)               ((enc)->min_enc_len)
// #define ONIGENC_IS_MBC_NEWLINE(enc,p,end)      (enc)->is_mbc_newline((p),(end))
// #define ONIGENC_MBC_TO_CODE(enc,p,end)         (enc)->mbc_to_code((p),(end))
// #define ONIGENC_CODE_TO_MBCLEN(enc,code)       (enc)->code_to_mbclen(code)
// #define ONIGENC_CODE_TO_MBC(enc,code,buf)      (enc)->code_to_mbc(code,buf)
// #define ONIGENC_PROPERTY_NAME_TO_CTYPE(enc,p,end) \
//   (enc)->property_name_to_ctype(enc,p,end)

// #define ONIGENC_IS_CODE_CTYPE(enc,code,ctype)  (enc)->is_code_ctype(code,ctype)

// #define ONIGENC_IS_CODE_NEWLINE(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_NEWLINE)
// #define ONIGENC_IS_CODE_GRAPH(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_GRAPH)
// #define ONIGENC_IS_CODE_PRINT(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_PRINT)
// #define ONIGENC_IS_CODE_ALNUM(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_ALNUM)
// #define ONIGENC_IS_CODE_ALPHA(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_ALPHA)
// #define ONIGENC_IS_CODE_LOWER(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_LOWER)
// #define ONIGENC_IS_CODE_UPPER(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_UPPER)
// #define ONIGENC_IS_CODE_CNTRL(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_CNTRL)
// #define ONIGENC_IS_CODE_PUNCT(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_PUNCT)
// #define ONIGENC_IS_CODE_SPACE(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_SPACE)
// #define ONIGENC_IS_CODE_BLANK(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_BLANK)
// #define ONIGENC_IS_CODE_DIGIT(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_DIGIT)
// #define ONIGENC_IS_CODE_XDIGIT(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_XDIGIT)
// #define ONIGENC_IS_CODE_WORD(enc,code) \
//         ONIGENC_IS_CODE_CTYPE(enc,code,ONIGENC_CTYPE_WORD)

// #define ONIGENC_GET_CTYPE_CODE_RANGE(enc,ctype,sbout,ranges) \
//         (enc)->get_ctype_code_range(ctype,sbout,ranges)

// ONIG_EXTERN
// OnigUChar* onigenc_step_back P_((OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, int n));


// /* encoding API */
// ONIG_EXTERN
// int onigenc_init P_((void));
// ONIG_EXTERN
// int onig_initialize_encoding P_((OnigEncoding enc));
// ONIG_EXTERN
// int onigenc_set_default_encoding P_((OnigEncoding enc));
// ONIG_EXTERN
// OnigEncoding onigenc_get_default_encoding P_((void));
// ONIG_EXTERN
// void  onigenc_set_default_caseconv_table P_((const OnigUChar* table));
// ONIG_EXTERN
// OnigUChar* onigenc_get_right_adjust_char_head_with_prev P_((OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, const OnigUChar** prev));
// ONIG_EXTERN
// OnigUChar* onigenc_get_prev_char_head P_((OnigEncoding enc, const OnigUChar* start, const OnigUChar* s));
// ONIG_EXTERN
// OnigUChar* onigenc_get_left_adjust_char_head P_((OnigEncoding enc, const OnigUChar* start, const OnigUChar* s));
// ONIG_EXTERN
// OnigUChar* onigenc_get_right_adjust_char_head P_((OnigEncoding enc, const OnigUChar* start, const OnigUChar* s));
// ONIG_EXTERN
// int onigenc_strlen P_((OnigEncoding enc, const OnigUChar* p, const OnigUChar* end));
// ONIG_EXTERN
// int onigenc_strlen_null P_((OnigEncoding enc, const OnigUChar* p));
// ONIG_EXTERN
// int onigenc_str_bytelen_null P_((OnigEncoding enc, const OnigUChar* p));
// ONIG_EXTERN
// int onigenc_is_valid_mbc_string P_((OnigEncoding enc, const OnigUChar* s, const OnigUChar* end));
// ONIG_EXTERN
// OnigUChar* onigenc_strdup P_((OnigEncoding enc, const OnigUChar* s, const OnigUChar* end));


/// PART: regular expression

/// config parameters
const NREGION                        =  10;
const MAX_CAPTURE_NUM      =    2147483647; /// 2**31 - 1
const MAX_BACKREF_NUM       =         1000;
const MAX_REPEAT_NUM         =      100000;
const MAX_MULTI_BYTE_RANGES_NUM =    10000;
/// constants
const ONIG_MAX_ERROR_MESSAGE_LEN           = 90;

/// Options
pub const Option = enum(u32) {
    Default = 0,

    /// Compile-time options
    IgnoreCase = 1 << 1,
    Extend = 1 << 2,
    MultiLine = 1 << 3,
    SingleLine = 1 << 4,
    FindLongest = 1 << 5,
    FindNotEmpty = 1 << 6,
    NegateSingleLine = 1 << 7,
    DontCaptureGroup = 1 << 8,
    CaptureGroup = 1 << 9,

    /// Search-time options
    NotBOL = 1 << 10,
    NotEOL = 1 << 11,
    NotPOSIXRegion = 1 << 12,
    CheckValidityOfString = 1 << 13,

    /// Compile-time options
    IgnoreCaseIsASCII = 1 << 14,
    WordIsASCII = 1 << 15,
    DigitIsASCII = 1 << 16,
    SpaceIsASCII = 1 << 17,
    POSIXIsASCII = 1 << 18,
    TextSegmentExtendedGraphemeCluster = 1 << 19,
    TextSegmentWord = 1 << 20,

    /// Search-time options
    NotBeginString = 1 << 21,
    NotEndString = 1 << 22,
    NotBeginPosition = 1 << 23,

    pub fn on(self: Option, regopt: Option) callconv(.Inline) bool {
        return (self | regopt) > 0;
    }

    pub fn off(self: Option, regopt: Option) callconv(.Inline) bool {
        return (self & ~regopt) > 0;
    }

    pub fn withSingleLine(self: Option) callconv(.Inline) Option {
        return self & Option.SingleLine;
    }

    pub fn withMultiLine(self: Option) callconv(.Inline) Option {
        return self & Option.MultiLine;
    }

    pub fn withIgnoreCase(self: Option) callconv(.Inline) Option {
        return self & Option.IgnoreCase;
    }

    pub fn withExtend(self: Option) callconv(.Inline) Option {
        return self & Option.Extend;
    }

    pub fn withWordIsASCII(self: Option) callconv(.Inline) Option {
        return self & (Option.WordIsASCII | Option.POSIXIsASCII);
    }

    pub fn withDigitIsASCII(self: Option) callconv(.Inline) Option {
        return self & (Option.DigitIsASCII | Option.POSIXIsASCII);
    }

    pub fn withSpaceASCII(self: Option) callconv(.Inline) Option {
        return self & (Option.SpaceIsASCII | Option.POSIXIsASCII);
    }

    pub fn withPosixASCII(self: Option) callconv(.Inline) Option {
        return self & Option.POSIXIsASCII;
    }

    pub fn withTextSegmentWord(self: Option) callconv(.Inline) Option {
        return self & Option.TextSegmentWord;
    }

    pub fn withIsASCIIModeCType(self: Option, ctype: EncCType) callconv(.Inline) Option {
        // TODO(slimsag): this is crazy
        // #define OPTON_IS_ASCII_MODE_CTYPE(ctype, options) \
        //   ((ctype) >= 0 && \
        //   (((ctype) < ONIGENC_CTYPE_ASCII  && OPTON_POSIX_ASCII(options)) ||\
        //    ((ctype) == ONIGENC_CTYPE_WORD  && OPTON_WORD_ASCII(options))  ||\
        //    ((ctype) == ONIGENC_CTYPE_DIGIT && OPTON_DIGIT_ASCII(options)) ||\
        //    ((ctype) == ONIGENC_CTYPE_SPACE && OPTON_SPACE_ASCII(options))))

        // switch (ctype) {
        // // EncCType.AnyChar => return Option.Default,
        // // EncCType.NewLine => ,
        // // EncCType.Alpha => ,
        // // EncCType.Blank => ,
        // // EncCType.CNTRL => ,
        // // EncCType.Digit => ,
        // // EncCType.Graph => ,
        // // EncCType.Lower => ,
        // // EncCType.Print => ,
        // // EncCType.Punct => ,
        // // EncCType.Space => ,
        // // EncCType.Upper => ,
        // // EncCType.XDigit => ,
        // // EncCType.Word => ,
        // // EncCType.Alnum => ,
        // // EncCType.ASCII => ,
        // }
        // if (ctype <= EncCType.AnyChar) {
        //     return Option.Default;
        // } else if (ctype < EncCType.ASCII) {
        //     return self.withPosixASCII();
        // } else if (ctype == EncCType.Word) {
        //     return self.withWordASCII();
        // } else if (ctype == EncCType.Digit) {
        //     return self.withDigitASCII();
        // } else if (ctype == EncCType.Space) {
        //     return self.withSpaceASCII();
        // }
        return Option.Default;
    }
};

// /* meta character specifiers (onig_set_meta_char()) */
// #define ONIG_META_CHAR_ESCAPE               0
// #define ONIG_META_CHAR_ANYCHAR              1
// #define ONIG_META_CHAR_ANYTIME              2
// #define ONIG_META_CHAR_ZERO_OR_ONE_TIME     3
// #define ONIG_META_CHAR_ONE_OR_MORE_TIME     4
// #define ONIG_META_CHAR_ANYCHAR_ANYTIME      5

// #define ONIG_INEFFECTIVE_META_CHAR          0

// /* error codes */
// #define ONIG_IS_PATTERN_ERROR(ecode)   ((ecode) <= -100 && (ecode) > -1000)
// /* normal return */
// #define ONIG_NORMAL                                            0
// #define ONIG_MISMATCH                                         -1
// #define ONIG_NO_SUPPORT_CONFIG                                -2
// #define ONIG_ABORT                                            -3

// /* internal error */
// #define ONIGERR_MEMORY                                         -5
// #define ONIGERR_TYPE_BUG                                       -6
// #define ONIGERR_PARSER_BUG                                    -11
// #define ONIGERR_STACK_BUG                                     -12
// #define ONIGERR_UNDEFINED_BYTECODE                            -13
// #define ONIGERR_UNEXPECTED_BYTECODE                           -14
// #define ONIGERR_MATCH_STACK_LIMIT_OVER                        -15
// #define ONIGERR_PARSE_DEPTH_LIMIT_OVER                        -16
// #define ONIGERR_RETRY_LIMIT_IN_MATCH_OVER                     -17
// #define ONIGERR_RETRY_LIMIT_IN_SEARCH_OVER                    -18
// #define ONIGERR_SUBEXP_CALL_LIMIT_IN_SEARCH_OVER              -19
// #define ONIGERR_DEFAULT_ENCODING_IS_NOT_SETTED                -21
// #define ONIGERR_SPECIFIED_ENCODING_CANT_CONVERT_TO_WIDE_CHAR  -22
// #define ONIGERR_FAIL_TO_INITIALIZE                            -23
// /* general error */
// #define ONIGERR_INVALID_ARGUMENT                              -30
// /* syntax error */
// #define ONIGERR_END_PATTERN_AT_LEFT_BRACE                    -100
// #define ONIGERR_END_PATTERN_AT_LEFT_BRACKET                  -101
// #define ONIGERR_EMPTY_CHAR_CLASS                             -102
// #define ONIGERR_PREMATURE_END_OF_CHAR_CLASS                  -103
// #define ONIGERR_END_PATTERN_AT_ESCAPE                        -104
// #define ONIGERR_END_PATTERN_AT_META                          -105
// #define ONIGERR_END_PATTERN_AT_CONTROL                       -106
// #define ONIGERR_META_CODE_SYNTAX                             -108
// #define ONIGERR_CONTROL_CODE_SYNTAX                          -109
// #define ONIGERR_CHAR_CLASS_VALUE_AT_END_OF_RANGE             -110
// #define ONIGERR_CHAR_CLASS_VALUE_AT_START_OF_RANGE           -111
// #define ONIGERR_UNMATCHED_RANGE_SPECIFIER_IN_CHAR_CLASS      -112
// #define ONIGERR_TARGET_OF_REPEAT_OPERATOR_NOT_SPECIFIED      -113
// #define ONIGERR_TARGET_OF_REPEAT_OPERATOR_INVALID            -114
// #define ONIGERR_NESTED_REPEAT_OPERATOR                       -115
// #define ONIGERR_UNMATCHED_CLOSE_PARENTHESIS                  -116
// #define ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS       -117
// #define ONIGERR_END_PATTERN_IN_GROUP                         -118
// #define ONIGERR_UNDEFINED_GROUP_OPTION                       -119
// #define ONIGERR_INVALID_POSIX_BRACKET_TYPE                   -121
// #define ONIGERR_INVALID_LOOK_BEHIND_PATTERN                  -122
// #define ONIGERR_INVALID_REPEAT_RANGE_PATTERN                 -123
// /* values error (syntax error) */
// #define ONIGERR_TOO_BIG_NUMBER                               -200
// #define ONIGERR_TOO_BIG_NUMBER_FOR_REPEAT_RANGE              -201
// #define ONIGERR_UPPER_SMALLER_THAN_LOWER_IN_REPEAT_RANGE     -202
// #define ONIGERR_EMPTY_RANGE_IN_CHAR_CLASS                    -203
// #define ONIGERR_MISMATCH_CODE_LENGTH_IN_CLASS_RANGE          -204
// #define ONIGERR_TOO_MANY_MULTI_BYTE_RANGES                   -205
// #define ONIGERR_TOO_SHORT_MULTI_BYTE_STRING                  -206
// #define ONIGERR_TOO_BIG_BACKREF_NUMBER                       -207
// #define ONIGERR_INVALID_BACKREF                              -208
// #define ONIGERR_NUMBERED_BACKREF_OR_CALL_NOT_ALLOWED         -209
// #define ONIGERR_TOO_MANY_CAPTURES                            -210
// #define ONIGERR_TOO_LONG_WIDE_CHAR_VALUE                     -212
// #define ONIGERR_UNDEFINED_OPERATOR                           -213
// #define ONIGERR_EMPTY_GROUP_NAME                             -214
// #define ONIGERR_INVALID_GROUP_NAME                           -215
// #define ONIGERR_INVALID_CHAR_IN_GROUP_NAME                   -216
// #define ONIGERR_UNDEFINED_NAME_REFERENCE                     -217
// #define ONIGERR_UNDEFINED_GROUP_REFERENCE                    -218
// #define ONIGERR_MULTIPLEX_DEFINED_NAME                       -219
// #define ONIGERR_MULTIPLEX_DEFINITION_NAME_CALL               -220
// #define ONIGERR_NEVER_ENDING_RECURSION                       -221
// #define ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY        -222
// #define ONIGERR_INVALID_CHAR_PROPERTY_NAME                   -223
// #define ONIGERR_INVALID_IF_ELSE_SYNTAX                       -224
// #define ONIGERR_INVALID_ABSENT_GROUP_PATTERN                 -225
// #define ONIGERR_INVALID_ABSENT_GROUP_GENERATOR_PATTERN       -226
// #define ONIGERR_INVALID_CALLOUT_PATTERN                      -227
// #define ONIGERR_INVALID_CALLOUT_NAME                         -228
// #define ONIGERR_UNDEFINED_CALLOUT_NAME                       -229
// #define ONIGERR_INVALID_CALLOUT_BODY                         -230
// #define ONIGERR_INVALID_CALLOUT_TAG_NAME                     -231
// #define ONIGERR_INVALID_CALLOUT_ARG                          -232
// #define ONIGERR_INVALID_CODE_POINT_VALUE                     -400
// #define ONIGERR_INVALID_WIDE_CHAR_VALUE                      -400
// #define ONIGERR_TOO_BIG_WIDE_CHAR_VALUE                      -401
// #define ONIGERR_NOT_SUPPORTED_ENCODING_COMBINATION           -402
// #define ONIGERR_INVALID_COMBINATION_OF_OPTIONS               -403
// #define ONIGERR_TOO_MANY_USER_DEFINED_OBJECTS                -404
// #define ONIGERR_TOO_LONG_PROPERTY_NAME                       -405
// #define ONIGERR_VERY_INEFFICIENT_PATTERN                     -406
// #define ONIGERR_LIBRARY_IS_NOT_INITIALIZED                   -500

// /* errors related to thread */
// /* #define ONIGERR_OVER_THREAD_PASS_LIMIT_COUNT                -1001 */


// /* must be smaller than MEM_STATUS_BITS_NUM (unsigned int * 8) */
// #define ONIG_MAX_CAPTURE_HISTORY_GROUP   31
// #define ONIG_IS_CAPTURE_HISTORY_GROUP(r, i) \
//   ((i) <= ONIG_MAX_CAPTURE_HISTORY_GROUP && (r)->list && (r)->list[i])

const CaptureTreeNode = struct {
    group: isize, /// group number
    beg: isize,
    end: isize,
    allocated: isize,
    childs: []*CaptureTreeNode,
};

/// Match result region type
pub const ReRegisters = struct {
    allocated: isize,
    num_regs: isize,
    // TODO(slimsag): these are likely pointers into a slice and could be better
    // expressed another way.
    beg: *isize,
    end: *isize,
    // extended
    history_root: *CaptureTreeNode, /// capture history tree root
};

/// capture tree traverse
const TRAVERSE_CALLBACK_AT_FIRST =  1;
const TRAVERSE_CALLBACK_AT_LAST =   2;
const TRAVERSE_CALLBACK_AT_BOTH = ( ONIG_TRAVERSE_CALLBACK_AT_FIRST | ONIG_TRAVERSE_CALLBACK_AT_LAST );

const ONIG_REGION_NOTPOS =           -1;

// typedef struct re_registers   OnigRegion;

// typedef struct {
//   OnigEncoding enc;
//   OnigUChar* par;
//   OnigUChar* par_end;
// } OnigErrorInfo;

const RepeatRange = struct {
    lower: isize,
    upper: isize,
};

// typedef void (*OnigWarnFunc) P_((const char* s));
// extern void onig_null_warn P_((const char* s));
// #define ONIG_NULL_WARN       onig_null_warn

const CHAR_TABLE_SIZE =  256;

const RegSet = struct{};

const RegSetLead = enum {
    REGSET_POSITION_LEAD = 0,
    REGSET_REGEX_LEAD    = 1,
    REGSET_PRIORITY_TO_REGEX_ORDER = 2,
};

const CompileInfo = struct {
    num_of_elements: isize,
    pattern_enc: *Encoding,
    target_enc: *Encoding,
    syntax: *Syntax,
    option: Option,
    case_fold_flag: CaseFold,    
};

// /* types for callout */
// typedef enum {
//   ONIG_CALLOUT_IN_PROGRESS   = 1, /* 1<<0 */
//   ONIG_CALLOUT_IN_RETRACTION = 2  /* 1<<1 */
// } OnigCalloutIn;

// #define ONIG_CALLOUT_IN_BOTH  (ONIG_CALLOUT_IN_PROGRESS | ONIG_CALLOUT_IN_RETRACTION)

// typedef enum {
//   ONIG_CALLOUT_OF_CONTENTS = 0,
//   ONIG_CALLOUT_OF_NAME     = 1
// } OnigCalloutOf;

// typedef enum {
//   ONIG_CALLOUT_TYPE_SINGLE              = 0,
//   ONIG_CALLOUT_TYPE_START_CALL          = 1,
//   ONIG_CALLOUT_TYPE_BOTH_CALL           = 2,
//   ONIG_CALLOUT_TYPE_START_MARK_END_CALL = 3,
// } OnigCalloutType;


// #define ONIG_NON_NAME_ID        -1
// #define ONIG_NON_CALLOUT_NUM     0

// #define ONIG_CALLOUT_MAX_ARGS_NUM     4
// #define ONIG_CALLOUT_DATA_SLOT_NUM    5

// struct OnigCalloutArgsStruct;
// typedef struct OnigCalloutArgsStruct OnigCalloutArgs;

// typedef int (*OnigCalloutFunc)(OnigCalloutArgs* args, void* user_data);

// /* callout function return values (less than -1: error code) */
// typedef enum {
//   ONIG_CALLOUT_FAIL     =  1,
//   ONIG_CALLOUT_SUCCESS  =  0
// } OnigCalloutResult;

// typedef enum {
//   ONIG_TYPE_VOID     = 0,
//   ONIG_TYPE_LONG     = 1<<0,
//   ONIG_TYPE_CHAR     = 1<<1,
//   ONIG_TYPE_STRING   = 1<<2,
//   ONIG_TYPE_POINTER  = 1<<3,
//   ONIG_TYPE_TAG      = 1<<4,
// } OnigType;

// typedef union {
//   long l;
//   OnigCodePoint c;
//   struct {
//     OnigUChar* start;
//     OnigUChar* end;
//   } s;
//   void* p;
//   int tag;  /* tag -> callout_num */
// } OnigValue;


// struct OnigMatchParamStruct;
// typedef struct OnigMatchParamStruct OnigMatchParam;


// /* Oniguruma Native API */

// ONIG_EXTERN
// int onig_initialize P_((OnigEncoding encodings[], int number_of_encodings));
// /* onig_init(): deprecated function. Use onig_initialize(). */
// ONIG_EXTERN
// int onig_init P_((void));
// ONIG_EXTERN
// int ONIG_VARIADIC_FUNC_ATTR onig_error_code_to_str PV_((OnigUChar* s, int err_code, ...));
// ONIG_EXTERN
// int onig_is_error_code_needs_param PV_((int code));
// ONIG_EXTERN
// void onig_set_warn_func P_((OnigWarnFunc f));
// ONIG_EXTERN
// void onig_set_verb_warn_func P_((OnigWarnFunc f));
// ONIG_EXTERN
// int onig_new P_((OnigRegex*, const OnigUChar* pattern, const OnigUChar* pattern_end, OnigOptionType option, OnigEncoding enc, OnigSyntaxType* syntax, OnigErrorInfo* einfo));
// ONIG_EXTERN
// int  onig_reg_init P_((OnigRegex reg, OnigOptionType option, OnigCaseFoldType case_fold_flag, OnigEncoding enc, OnigSyntaxType* syntax));
// int onig_new_without_alloc P_((OnigRegex, const OnigUChar* pattern, const OnigUChar* pattern_end, OnigOptionType option, OnigEncoding enc, OnigSyntaxType* syntax, OnigErrorInfo* einfo));
// ONIG_EXTERN
// int onig_new_deluxe P_((OnigRegex* reg, const OnigUChar* pattern, const OnigUChar* pattern_end, OnigCompileInfo* ci, OnigErrorInfo* einfo));
// ONIG_EXTERN
// void onig_free P_((OnigRegex));
// ONIG_EXTERN
// void onig_free_body P_((OnigRegex));
// ONIG_EXTERN
// int onig_scan(OnigRegex reg, const OnigUChar* str, const OnigUChar* end, OnigRegion* region, OnigOptionType option, int (*scan_callback)(int, int, OnigRegion*, void*), void* callback_arg);
// ONIG_EXTERN
// int onig_search P_((OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* start, const OnigUChar* range, OnigRegion* region, OnigOptionType option));
// ONIG_EXTERN
// int onig_search_with_param P_((OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* start, const OnigUChar* range, OnigRegion* region, OnigOptionType option, OnigMatchParam* mp));
// ONIG_EXTERN
// int onig_match P_((OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* at, OnigRegion* region, OnigOptionType option));
// ONIG_EXTERN
// int onig_match_with_param P_((OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* at, OnigRegion* region, OnigOptionType option, OnigMatchParam* mp));

// ONIG_EXTERN
// int onig_regset_new P_((OnigRegSet** rset, int n, regex_t* regs[]));
// ONIG_EXTERN
// int onig_regset_add P_((OnigRegSet* set, regex_t* reg));
// ONIG_EXTERN
// int onig_regset_replace P_((OnigRegSet* set, int at, regex_t* reg));
// ONIG_EXTERN
// void onig_regset_free P_((OnigRegSet* set));
// ONIG_EXTERN
// int onig_regset_number_of_regex P_((OnigRegSet* set));
// ONIG_EXTERN
// regex_t* onig_regset_get_regex P_((OnigRegSet* set, int at));
// ONIG_EXTERN
// OnigRegion* onig_regset_get_region P_((OnigRegSet* set, int at));
// ONIG_EXTERN
// int onig_regset_search P_((OnigRegSet* set, const OnigUChar* str, const OnigUChar* end, const OnigUChar* start, const OnigUChar* range, OnigRegSetLead lead, OnigOptionType option, int* rmatch_pos));
// ONIG_EXTERN
// int onig_regset_search_with_param P_((OnigRegSet* set, const OnigUChar* str, const OnigUChar* end, const OnigUChar* start, const OnigUChar* range,  OnigRegSetLead lead, OnigOptionType option, OnigMatchParam* mps[], int* rmatch_pos));

// ONIG_EXTERN
// OnigRegion* onig_region_new P_((void));
// ONIG_EXTERN
// void onig_region_init P_((OnigRegion* region));
// ONIG_EXTERN
// void onig_region_free P_((OnigRegion* region, int free_self));
// ONIG_EXTERN
// void onig_region_copy P_((OnigRegion* to, OnigRegion* from));
// ONIG_EXTERN
// void onig_region_clear P_((OnigRegion* region));
// ONIG_EXTERN
// int onig_region_resize P_((OnigRegion* region, int n));
// ONIG_EXTERN
// int onig_region_set P_((OnigRegion* region, int at, int beg, int end));
// ONIG_EXTERN
// int onig_name_to_group_numbers P_((OnigRegex reg, const OnigUChar* name, const OnigUChar* name_end, int** nums));
// ONIG_EXTERN
// int onig_name_to_backref_number P_((OnigRegex reg, const OnigUChar* name, const OnigUChar* name_end, OnigRegion *region));
// ONIG_EXTERN
// int onig_foreach_name P_((OnigRegex reg, int (*func)(const OnigUChar*, const OnigUChar*,int,int*,OnigRegex,void*), void* arg));
// ONIG_EXTERN
// int onig_number_of_names P_((OnigRegex reg));
// ONIG_EXTERN
// int onig_number_of_captures P_((OnigRegex reg));
// ONIG_EXTERN
// int onig_number_of_capture_histories P_((OnigRegex reg));
// ONIG_EXTERN
// OnigCaptureTreeNode* onig_get_capture_tree P_((OnigRegion* region));
// ONIG_EXTERN
// int onig_capture_tree_traverse P_((OnigRegion* region, int at, int(*callback_func)(int,int,int,int,int,void*), void* arg));
// ONIG_EXTERN
// int onig_noname_group_capture_is_active P_((OnigRegex reg));
// ONIG_EXTERN
// OnigEncoding onig_get_encoding P_((OnigRegex reg));
// ONIG_EXTERN
// OnigOptionType onig_get_options P_((OnigRegex reg));
// ONIG_EXTERN
// OnigCaseFoldType onig_get_case_fold_flag P_((OnigRegex reg));
// ONIG_EXTERN
// OnigSyntaxType* onig_get_syntax P_((OnigRegex reg));
// ONIG_EXTERN
// int onig_set_default_syntax P_((OnigSyntaxType* syntax));
// ONIG_EXTERN
// void onig_copy_syntax P_((OnigSyntaxType* to, OnigSyntaxType* from));
// ONIG_EXTERN
// unsigned int onig_get_syntax_op P_((OnigSyntaxType* syntax));
// ONIG_EXTERN
// unsigned int onig_get_syntax_op2 P_((OnigSyntaxType* syntax));
// ONIG_EXTERN
// unsigned int onig_get_syntax_behavior P_((OnigSyntaxType* syntax));
// ONIG_EXTERN
// OnigOptionType onig_get_syntax_options P_((OnigSyntaxType* syntax));
// ONIG_EXTERN
// void onig_set_syntax_op P_((OnigSyntaxType* syntax, unsigned int op));
// ONIG_EXTERN
// void onig_set_syntax_op2 P_((OnigSyntaxType* syntax, unsigned int op2));
// ONIG_EXTERN
// void onig_set_syntax_behavior P_((OnigSyntaxType* syntax, unsigned int behavior));
// ONIG_EXTERN
// void onig_set_syntax_options P_((OnigSyntaxType* syntax, OnigOptionType options));
// ONIG_EXTERN
// int onig_set_meta_char P_((OnigSyntaxType* syntax, unsigned int what, OnigCodePoint code));
// ONIG_EXTERN
// void onig_copy_encoding P_((OnigEncoding to, OnigEncoding from));
// ONIG_EXTERN
// OnigCaseFoldType onig_get_default_case_fold_flag P_((void));
// ONIG_EXTERN
// int onig_set_default_case_fold_flag P_((OnigCaseFoldType case_fold_flag));
// ONIG_EXTERN
// unsigned int onig_get_match_stack_limit_size P_((void));
// ONIG_EXTERN
// int onig_set_match_stack_limit_size P_((unsigned int size));
// ONIG_EXTERN
// unsigned long onig_get_retry_limit_in_match P_((void));
// ONIG_EXTERN
// int onig_set_retry_limit_in_match P_((unsigned long n));
// ONIG_EXTERN
// unsigned long onig_get_retry_limit_in_search P_((void));
// ONIG_EXTERN
// int onig_set_retry_limit_in_search P_((unsigned long n));
// ONIG_EXTERN
// unsigned int onig_get_parse_depth_limit P_((void));
// ONIG_EXTERN
// int onig_set_capture_num_limit P_((int num));
// ONIG_EXTERN
// int onig_set_parse_depth_limit P_((unsigned int depth));
// ONIG_EXTERN
// unsigned long onig_get_subexp_call_limit_in_search P_((void));
// ONIG_EXTERN
// int onig_set_subexp_call_limit_in_search P_((unsigned long n));
// ONIG_EXTERN
// int onig_get_subexp_call_max_nest_level P_((void));
// ONIG_EXTERN
// int onig_set_subexp_call_max_nest_level P_((int level));
// ONIG_EXTERN
// int onig_unicode_define_user_property P_((const char* name, OnigCodePoint* ranges));
// ONIG_EXTERN
// int onig_end P_((void));
// ONIG_EXTERN
// const char* onig_version P_((void));
// ONIG_EXTERN
// const char* onig_copyright P_((void));

// /* for OnigMatchParam */
// ONIG_EXTERN
// OnigMatchParam* onig_new_match_param P_((void));
// ONIG_EXTERN
// void onig_free_match_param P_((OnigMatchParam* p));
// ONIG_EXTERN
// void onig_free_match_param_content P_((OnigMatchParam* p));
// ONIG_EXTERN
// int onig_initialize_match_param P_((OnigMatchParam* mp));
// ONIG_EXTERN
// int onig_set_match_stack_limit_size_of_match_param P_((OnigMatchParam* param, unsigned int limit));
// ONIG_EXTERN
// int onig_set_retry_limit_in_match_of_match_param P_((OnigMatchParam* param, unsigned long limit));
// ONIG_EXTERN
// int onig_set_retry_limit_in_search_of_match_param P_((OnigMatchParam* param, unsigned long limit));
// ONIG_EXTERN
// int onig_set_progress_callout_of_match_param P_((OnigMatchParam* param, OnigCalloutFunc f));
// ONIG_EXTERN
// int onig_set_retraction_callout_of_match_param P_((OnigMatchParam* param, OnigCalloutFunc f));
// ONIG_EXTERN
// int onig_set_callout_user_data_of_match_param P_((OnigMatchParam* param, void* user_data));

// /* for callout functions */
// ONIG_EXTERN
// OnigCalloutFunc onig_get_progress_callout P_((void));
// ONIG_EXTERN
// int onig_set_progress_callout P_((OnigCalloutFunc f));
// ONIG_EXTERN
// OnigCalloutFunc onig_get_retraction_callout P_((void));
// ONIG_EXTERN
// int onig_set_retraction_callout P_((OnigCalloutFunc f));
// ONIG_EXTERN
// int onig_set_callout_of_name P_((OnigEncoding enc, OnigCalloutType type, OnigUChar* name, OnigUChar* name_end, int callout_in, OnigCalloutFunc callout, OnigCalloutFunc end_callout, int arg_num, unsigned int arg_types[], int optional_arg_num, OnigValue opt_defaults[]));
// ONIG_EXTERN
// OnigUChar* onig_get_callout_name_by_name_id P_((int id));
// ONIG_EXTERN
// int onig_get_callout_num_by_tag P_((OnigRegex reg, const OnigUChar* tag, const OnigUChar* tag_end));
// ONIG_EXTERN
// int onig_get_callout_data_by_tag P_((OnigRegex reg, OnigMatchParam* mp, const OnigUChar* tag, const OnigUChar* tag_end, int slot, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// int onig_set_callout_data_by_tag P_((OnigRegex reg, OnigMatchParam* mp, const OnigUChar* tag, const OnigUChar* tag_end, int slot, OnigType type, OnigValue* val));

// /* used in callout functions */
// ONIG_EXTERN
// int onig_get_callout_num_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// OnigCalloutIn onig_get_callout_in_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// int onig_get_name_id_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// const OnigUChar* onig_get_contents_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// const OnigUChar* onig_get_contents_end_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// int onig_get_args_num_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// int onig_get_passed_args_num_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// int onig_get_arg_by_callout_args P_((OnigCalloutArgs* args, int index, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// const OnigUChar* onig_get_string_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// const OnigUChar* onig_get_string_end_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// const OnigUChar* onig_get_start_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// const OnigUChar* onig_get_right_range_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// const OnigUChar* onig_get_current_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// OnigRegex onig_get_regex_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// unsigned long onig_get_retry_counter_by_callout_args P_((OnigCalloutArgs* args));
// ONIG_EXTERN
// int onig_callout_tag_is_exist_at_callout_num P_((OnigRegex reg, int callout_num));
// ONIG_EXTERN
// const OnigUChar* onig_get_callout_tag_start P_((OnigRegex reg, int callout_num));
// ONIG_EXTERN
// const OnigUChar* onig_get_callout_tag_end P_((OnigRegex reg, int callout_num));
// ONIG_EXTERN
// int onig_get_callout_data_dont_clear_old P_((OnigRegex reg, OnigMatchParam* mp, int callout_num, int slot, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// int onig_get_callout_data_by_callout_args_self_dont_clear_old P_((OnigCalloutArgs* args, int slot, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// int onig_get_callout_data P_((OnigRegex reg, OnigMatchParam* mp, int callout_num, int slot, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// int onig_get_callout_data_by_callout_args P_((OnigCalloutArgs* args, int callout_num, int slot, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// int onig_get_callout_data_by_callout_args_self P_((OnigCalloutArgs* args, int slot, OnigType* type, OnigValue* val));
// ONIG_EXTERN
// int onig_set_callout_data P_((OnigRegex reg, OnigMatchParam* mp, int callout_num, int slot, OnigType type, OnigValue* val));
// ONIG_EXTERN
// int onig_set_callout_data_by_callout_args P_((OnigCalloutArgs* args, int callout_num, int slot, OnigType type, OnigValue* val));
// ONIG_EXTERN
// int onig_set_callout_data_by_callout_args_self P_((OnigCalloutArgs* args, int slot, OnigType type, OnigValue* val));
// ONIG_EXTERN
// int onig_get_capture_range_in_callout P_((OnigCalloutArgs* args, int mem_num, int* begin, int* end));
// ONIG_EXTERN
// int onig_get_used_stack_size_in_callout P_((OnigCalloutArgs* args, int* used_num, int* used_bytes));

// /* builtin callout functions */
// ONIG_EXTERN
// int onig_builtin_fail P_((OnigCalloutArgs* args, void* user_data));
// ONIG_EXTERN
// int onig_builtin_mismatch P_((OnigCalloutArgs* args, void* user_data));
// ONIG_EXTERN
// int onig_builtin_error P_((OnigCalloutArgs* args, void* user_data));
// ONIG_EXTERN
// int onig_builtin_count P_((OnigCalloutArgs* args, void* user_data));
// ONIG_EXTERN
// int onig_builtin_total_count P_((OnigCalloutArgs* args, void* user_data));
// ONIG_EXTERN
// int onig_builtin_max P_((OnigCalloutArgs* args, void* user_data));
// ONIG_EXTERN
// int onig_builtin_cmp P_((OnigCalloutArgs* args, void* user_data));

// ONIG_EXTERN
// int onig_setup_builtin_monitors_by_ascii_encoded_name P_((void* fp));
