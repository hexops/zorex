const MetaCharTable = @import("oniguruma.zig").MetaCharTable;
const Option = @import("oniguruma.zig").Option;

/// Syntax
pub const Syntax = struct {
    op: usize,
    op2: usize,
    behavior: usize,
    options: Option, /// default option
    meta_char_table: MetaCharTable,

    /// Default syntax
    pub const Default: *Syntax = undefined;
};

// /* syntax (operators) */
// #define ONIG_SYN_OP_VARIABLE_META_CHARACTERS    (1U<<0)
// #define ONIG_SYN_OP_DOT_ANYCHAR                 (1U<<1)   /* . */
// #define ONIG_SYN_OP_ASTERISK_ZERO_INF           (1U<<2)   /* * */
// #define ONIG_SYN_OP_ESC_ASTERISK_ZERO_INF       (1U<<3)
// #define ONIG_SYN_OP_PLUS_ONE_INF                (1U<<4)   /* + */
// #define ONIG_SYN_OP_ESC_PLUS_ONE_INF            (1U<<5)
// #define ONIG_SYN_OP_QMARK_ZERO_ONE              (1U<<6)   /* ? */
// #define ONIG_SYN_OP_ESC_QMARK_ZERO_ONE          (1U<<7)
// #define ONIG_SYN_OP_BRACE_INTERVAL              (1U<<8)   /* {lower,upper} */
// #define ONIG_SYN_OP_ESC_BRACE_INTERVAL          (1U<<9)   /* \{lower,upper\} */
// #define ONIG_SYN_OP_VBAR_ALT                    (1U<<10)   /* | */
// #define ONIG_SYN_OP_ESC_VBAR_ALT                (1U<<11)  /* \| */
// #define ONIG_SYN_OP_LPAREN_SUBEXP               (1U<<12)  /* (...)   */
// #define ONIG_SYN_OP_ESC_LPAREN_SUBEXP           (1U<<13)  /* \(...\) */
// #define ONIG_SYN_OP_ESC_AZ_BUF_ANCHOR           (1U<<14)  /* \A, \Z, \z */
// #define ONIG_SYN_OP_ESC_CAPITAL_G_BEGIN_ANCHOR  (1U<<15)  /* \G     */
// #define ONIG_SYN_OP_DECIMAL_BACKREF             (1U<<16)  /* \num   */
// #define ONIG_SYN_OP_BRACKET_CC                  (1U<<17)  /* [...]  */
// #define ONIG_SYN_OP_ESC_W_WORD                  (1U<<18)  /* \w, \W */
// #define ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END     (1U<<19)  /* \<. \> */
// #define ONIG_SYN_OP_ESC_B_WORD_BOUND            (1U<<20)  /* \b, \B */
// #define ONIG_SYN_OP_ESC_S_WHITE_SPACE           (1U<<21)  /* \s, \S */
// #define ONIG_SYN_OP_ESC_D_DIGIT                 (1U<<22)  /* \d, \D */
// #define ONIG_SYN_OP_LINE_ANCHOR                 (1U<<23)  /* ^, $   */
// #define ONIG_SYN_OP_POSIX_BRACKET               (1U<<24)  /* [:xxxx:] */
// #define ONIG_SYN_OP_QMARK_NON_GREEDY            (1U<<25)  /* ??,*?,+?,{n,m}? */
// #define ONIG_SYN_OP_ESC_CONTROL_CHARS           (1U<<26)  /* \n,\r,\t,\a ... */
// #define ONIG_SYN_OP_ESC_C_CONTROL               (1U<<27)  /* \cx  */
// #define ONIG_SYN_OP_ESC_OCTAL3                  (1U<<28)  /* \OOO */
// #define ONIG_SYN_OP_ESC_X_HEX2                  (1U<<29)  /* \xHH */
// #define ONIG_SYN_OP_ESC_X_BRACE_HEX8            (1U<<30)  /* \x{7HHHHHHH} */
// #define ONIG_SYN_OP_ESC_O_BRACE_OCTAL           (1U<<31)  /* \o{1OOOOOOOOOO} */

// #define ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE        (1U<<0)  /* \Q...\E */
// #define ONIG_SYN_OP2_QMARK_GROUP_EFFECT         (1U<<1)  /* (?...) */
// #define ONIG_SYN_OP2_OPTION_PERL                (1U<<2)  /* (?imsx),(?-imsx) */
// #define ONIG_SYN_OP2_OPTION_RUBY                (1U<<3)  /* (?imx), (?-imx)  */
// #define ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT     (1U<<4)  /* ?+,*+,++ */
// #define ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL   (1U<<5)  /* {n,m}+   */
// #define ONIG_SYN_OP2_CCLASS_SET_OP              (1U<<6)  /* [...&&..[..]..] */
// #define ONIG_SYN_OP2_QMARK_LT_NAMED_GROUP       (1U<<7)  /* (?<name>...) */
// #define ONIG_SYN_OP2_ESC_K_NAMED_BACKREF        (1U<<8)  /* \k<name> */
// #define ONIG_SYN_OP2_ESC_G_SUBEXP_CALL          (1U<<9)  /* \g<name>, \g<n> */
// #define ONIG_SYN_OP2_ATMARK_CAPTURE_HISTORY     (1U<<10) /* (?@..),(?@<x>..) */
// #define ONIG_SYN_OP2_ESC_CAPITAL_C_BAR_CONTROL  (1U<<11) /* \C-x */
// #define ONIG_SYN_OP2_ESC_CAPITAL_M_BAR_META     (1U<<12) /* \M-x */
// #define ONIG_SYN_OP2_ESC_V_VTAB                 (1U<<13) /* \v as VTAB */
// #define ONIG_SYN_OP2_ESC_U_HEX4                 (1U<<14) /* \uHHHH */
// #define ONIG_SYN_OP2_ESC_GNU_BUF_ANCHOR         (1U<<15) /* \`, \' */
// #define ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY  (1U<<16) /* \p{...}, \P{...} */
// #define ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT (1U<<17) /* \p{^..}, \P{^..} */
// /* #define ONIG_SYN_OP2_CHAR_PROPERTY_PREFIX_IS (1U<<18) */
// #define ONIG_SYN_OP2_ESC_H_XDIGIT               (1U<<19) /* \h, \H */
// #define ONIG_SYN_OP2_INEFFECTIVE_ESCAPE         (1U<<20) /* \ */
// #define ONIG_SYN_OP2_QMARK_LPAREN_IF_ELSE       (1U<<21) /* (?(n)) (?(...)...|...) */
// #define ONIG_SYN_OP2_ESC_CAPITAL_K_KEEP         (1U<<22) /* \K */
// #define ONIG_SYN_OP2_ESC_CAPITAL_R_GENERAL_NEWLINE (1U<<23) /* \R \r\n else [\x0a-\x0d] */
// #define ONIG_SYN_OP2_ESC_CAPITAL_N_O_SUPER_DOT  (1U<<24) /* \N (?-m:.), \O (?m:.) */
// #define ONIG_SYN_OP2_QMARK_TILDE_ABSENT_GROUP   (1U<<25) /* (?~...) */
// #define ONIG_SYN_OP2_ESC_X_Y_GRAPHEME_CLUSTER   (1U<<26) /* obsoleted: use next */
// #define ONIG_SYN_OP2_ESC_X_Y_TEXT_SEGMENT       (1U<<26) /* \X \y \Y */
// #define ONIG_SYN_OP2_QMARK_PERL_SUBEXP_CALL     (1U<<27) /* (?R), (?&name)... */
// #define ONIG_SYN_OP2_QMARK_BRACE_CALLOUT_CONTENTS (1U<<28) /* (?{...}) (?{{...}}) */
// #define ONIG_SYN_OP2_ASTERISK_CALLOUT_NAME      (1U<<29) /* (*name) (*name{a,..}) */
// #define ONIG_SYN_OP2_OPTION_ONIGURUMA           (1U<<30) /* (?imxWDSPy) */
// #define ONIG_SYN_OP2_QMARK_CAPITAL_P_NAME       (1U<<31) /* (?P<name>...) (?P=name) */

// /* syntax (behavior) */
// #define ONIG_SYN_CONTEXT_INDEP_ANCHORS           (1U<<31) /* not implemented */
// #define ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS        (1U<<0)  /* ?, *, +, {n,m} */
// #define ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS      (1U<<1)  /* error or ignore */
// #define ONIG_SYN_ALLOW_UNMATCHED_CLOSE_SUBEXP    (1U<<2)  /* ...)... */
// #define ONIG_SYN_ALLOW_INVALID_INTERVAL          (1U<<3)  /* {??? */
// #define ONIG_SYN_ALLOW_INTERVAL_LOW_ABBREV       (1U<<4)  /* {,n} => {0,n} */
// #define ONIG_SYN_STRICT_CHECK_BACKREF            (1U<<5)  /* /(\1)/,/\1()/ ..*/
// #define ONIG_SYN_DIFFERENT_LEN_ALT_LOOK_BEHIND   (1U<<6)  /* (?<=a|bc) */
// #define ONIG_SYN_CAPTURE_ONLY_NAMED_GROUP        (1U<<7)  /* see doc/RE */
// #define ONIG_SYN_ALLOW_MULTIPLEX_DEFINITION_NAME (1U<<8)  /* (?<x>)(?<x>) */
// #define ONIG_SYN_FIXED_INTERVAL_IS_GREEDY_ONLY   (1U<<9)  /* a{n}?=(?:a{n})? */
// #define ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH (1U<<10) /* ..(?i)...|... */
// #define ONIG_SYN_VARIABLE_LEN_LOOK_BEHIND        (1U<<11)  /* (?<=a+|..) */
// #define ONIG_SYN_PYTHON                          (1U<<12)  /* \UHHHHHHHH */

// /* syntax (behavior) in char class [...] */
// #define ONIG_SYN_NOT_NEWLINE_IN_NEGATIVE_CC      (1U<<20) /* [^...] */
// #define ONIG_SYN_BACKSLASH_ESCAPE_IN_CC          (1U<<21) /* [..\w..] etc.. */
// #define ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC         (1U<<22)
// #define ONIG_SYN_ALLOW_DOUBLE_RANGE_OP_IN_CC     (1U<<23) /* [0-9-a]=[0-9\-a] */
// #define ONIG_SYN_ALLOW_INVALID_CODE_END_OF_RANGE_IN_CC (1U<<26)
// /* syntax (behavior) warning */
// #define ONIG_SYN_WARN_CC_OP_NOT_ESCAPED          (1U<<24) /* [,-,] */
// #define ONIG_SYN_WARN_REDUNDANT_NESTED_REPEAT    (1U<<25) /* (?:a*)+ */

// OnigSyntaxType OnigSyntaxASIS = {
//     0
//   , ONIG_SYN_OP2_INEFFECTIVE_ESCAPE
//   , 0
//   , ONIG_OPTION_NONE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// OnigSyntaxType OnigSyntaxPosixBasic = {
//   ( SYN_POSIX_COMMON_OP | ONIG_SYN_OP_ESC_LPAREN_SUBEXP |
//     ONIG_SYN_OP_ESC_BRACE_INTERVAL )
//   , 0
//   , 0
//   , ( ONIG_OPTION_SINGLELINE | ONIG_OPTION_MULTILINE )
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// OnigSyntaxType OnigSyntaxPosixExtended = {
//   ( SYN_POSIX_COMMON_OP | ONIG_SYN_OP_LPAREN_SUBEXP |
//     ONIG_SYN_OP_BRACE_INTERVAL |
//     ONIG_SYN_OP_PLUS_ONE_INF | ONIG_SYN_OP_QMARK_ZERO_ONE | ONIG_SYN_OP_VBAR_ALT )
//   , 0
//   , ( ONIG_SYN_CONTEXT_INDEP_ANCHORS |
//       ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS | ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS |
//       ONIG_SYN_ALLOW_UNMATCHED_CLOSE_SUBEXP |
//       ONIG_SYN_ALLOW_DOUBLE_RANGE_OP_IN_CC )
//   , ( ONIG_OPTION_SINGLELINE | ONIG_OPTION_MULTILINE )
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// OnigSyntaxType OnigSyntaxEmacs = {
//   ( ONIG_SYN_OP_DOT_ANYCHAR | ONIG_SYN_OP_BRACKET_CC |
//     ONIG_SYN_OP_ESC_BRACE_INTERVAL |
//     ONIG_SYN_OP_ESC_LPAREN_SUBEXP | ONIG_SYN_OP_ESC_VBAR_ALT |
//     ONIG_SYN_OP_ASTERISK_ZERO_INF | ONIG_SYN_OP_PLUS_ONE_INF |
//     ONIG_SYN_OP_QMARK_ZERO_ONE | ONIG_SYN_OP_DECIMAL_BACKREF |
//     ONIG_SYN_OP_LINE_ANCHOR | ONIG_SYN_OP_ESC_CONTROL_CHARS )
//   , ONIG_SYN_OP2_ESC_GNU_BUF_ANCHOR
//   , ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC
//   , ONIG_OPTION_NONE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

const SyntaxGrep = &Syntax{
    .op = ONIG_SYN_OP_DOT_ANYCHAR
        | ONIG_SYN_OP_BRACKET_CC
        | ONIG_SYN_OP_POSIX_BRACKET
        | ONIG_SYN_OP_ESC_BRACE_INTERVAL
        | ONIG_SYN_OP_ESC_LPAREN_SUBEXP
        | ONIG_SYN_OP_ESC_VBAR_ALT
        | ONIG_SYN_OP_ASTERISK_ZERO_INF
        | ONIG_SYN_OP_ESC_PLUS_ONE_INF
        | ONIG_SYN_OP_ESC_QMARK_ZERO_ONE
        | ONIG_SYN_OP_LINE_ANCHOR
        | ONIG_SYN_OP_ESC_W_WORD
        | ONIG_SYN_OP_ESC_B_WORD_BOUND
        | ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END
        | ONIG_SYN_OP_DECIMAL_BACKREF,
    .op2 = 0,
    .behavior = ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC | ONIG_SYN_NOT_NEWLINE_IN_NEGATIVE_CC,
    .options = Option.None,
    .meta_char_table = MetaCharTable{
        .esc = '\\',
        .anyChar = INEFFECTIVE_META_CHAR, // anychar '.'
        .anyTime = INEFFECTIVE_META_CHAR, // anytime '*'
        .zeroOrOneTime = INEFFECTIVE_META_CHAR, // zero or one time '?'
        .oneOrMoreTime = INEFFECTIVE_META_CHAR, // one or more time '+'
        .anyCharAnyTime = INEFFECTIVE_META_CHAR, // anychar anytime
    },
};

// OnigSyntaxType OnigSyntaxGnuRegex = {
//   SYN_GNU_REGEX_OP
//   , 0
//   , SYN_GNU_REGEX_BV
//   , ONIG_OPTION_NONE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// OnigSyntaxType OnigSyntaxJava = {
//   (( SYN_GNU_REGEX_OP | ONIG_SYN_OP_QMARK_NON_GREEDY |
//      ONIG_SYN_OP_ESC_CONTROL_CHARS | ONIG_SYN_OP_ESC_C_CONTROL |
//      ONIG_SYN_OP_ESC_OCTAL3 | ONIG_SYN_OP_ESC_X_HEX2 )
//    & ~ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END )
//   , ( ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE | ONIG_SYN_OP2_QMARK_GROUP_EFFECT |
//       ONIG_SYN_OP2_OPTION_PERL | ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT |
//       ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL | ONIG_SYN_OP2_CCLASS_SET_OP |
//       ONIG_SYN_OP2_ESC_V_VTAB | ONIG_SYN_OP2_ESC_U_HEX4 |
//       ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY )
//   , ( SYN_GNU_REGEX_BV | ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH |
//       ONIG_SYN_DIFFERENT_LEN_ALT_LOOK_BEHIND |
//       ONIG_SYN_VARIABLE_LEN_LOOK_BEHIND )
//   , ONIG_OPTION_SINGLELINE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// OnigSyntaxType OnigSyntaxPerl = {
//   (( SYN_GNU_REGEX_OP | ONIG_SYN_OP_QMARK_NON_GREEDY |
//      ONIG_SYN_OP_ESC_OCTAL3 | ONIG_SYN_OP_ESC_X_HEX2 |
//      ONIG_SYN_OP_ESC_X_BRACE_HEX8 | ONIG_SYN_OP_ESC_O_BRACE_OCTAL |
//      ONIG_SYN_OP_ESC_CONTROL_CHARS |
//      ONIG_SYN_OP_ESC_C_CONTROL )
//    & ~ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END )
//   , ( ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE |
//       ONIG_SYN_OP2_QMARK_GROUP_EFFECT | ONIG_SYN_OP2_OPTION_PERL |
//       ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT | ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL |
//       ONIG_SYN_OP2_QMARK_LPAREN_IF_ELSE |
//       ONIG_SYN_OP2_QMARK_TILDE_ABSENT_GROUP |
//       ONIG_SYN_OP2_QMARK_BRACE_CALLOUT_CONTENTS |
//       ONIG_SYN_OP2_ASTERISK_CALLOUT_NAME    |
//       ONIG_SYN_OP2_ESC_X_Y_TEXT_SEGMENT |
//       ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY |
//       ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT |
//       ONIG_SYN_OP2_ESC_CAPITAL_K_KEEP |
//       ONIG_SYN_OP2_ESC_CAPITAL_R_GENERAL_NEWLINE |
//       ONIG_SYN_OP2_ESC_CAPITAL_N_O_SUPER_DOT )
//   , SYN_GNU_REGEX_BV | ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH
//   , ONIG_OPTION_SINGLELINE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// /* Perl + named group */
// OnigSyntaxType OnigSyntaxPerl_NG = {
//   (( SYN_GNU_REGEX_OP | ONIG_SYN_OP_QMARK_NON_GREEDY |
//      ONIG_SYN_OP_ESC_OCTAL3 | ONIG_SYN_OP_ESC_X_HEX2 |
//      ONIG_SYN_OP_ESC_X_BRACE_HEX8 | ONIG_SYN_OP_ESC_O_BRACE_OCTAL |
//      ONIG_SYN_OP_ESC_CONTROL_CHARS |
//      ONIG_SYN_OP_ESC_C_CONTROL )
//    & ~ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END )
//   , ( ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE |
//       ONIG_SYN_OP2_QMARK_GROUP_EFFECT | ONIG_SYN_OP2_OPTION_PERL |
//       ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT | ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL |
//       ONIG_SYN_OP2_QMARK_LPAREN_IF_ELSE |
//       ONIG_SYN_OP2_QMARK_TILDE_ABSENT_GROUP |
//       ONIG_SYN_OP2_QMARK_BRACE_CALLOUT_CONTENTS |
//       ONIG_SYN_OP2_ASTERISK_CALLOUT_NAME    |
//       ONIG_SYN_OP2_ESC_X_Y_TEXT_SEGMENT |
//       ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY  |
//       ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT |
//       ONIG_SYN_OP2_QMARK_LT_NAMED_GROUP       |
//       ONIG_SYN_OP2_ESC_K_NAMED_BACKREF        |
//       ONIG_SYN_OP2_ESC_G_SUBEXP_CALL |
//       ONIG_SYN_OP2_ESC_CAPITAL_K_KEEP |
//       ONIG_SYN_OP2_ESC_CAPITAL_R_GENERAL_NEWLINE |
//       ONIG_SYN_OP2_ESC_CAPITAL_N_O_SUPER_DOT |
//       ONIG_SYN_OP2_QMARK_PERL_SUBEXP_CALL )
//   , ( SYN_GNU_REGEX_BV | ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH |
//       ONIG_SYN_CAPTURE_ONLY_NAMED_GROUP |
//       ONIG_SYN_ALLOW_MULTIPLEX_DEFINITION_NAME )
//   , ONIG_OPTION_SINGLELINE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };

// /* Python 3.9 */
// OnigSyntaxType OnigSyntaxPython = {
//   (( SYN_GNU_REGEX_OP | ONIG_SYN_OP_QMARK_NON_GREEDY |
//      ONIG_SYN_OP_ESC_OCTAL3 | ONIG_SYN_OP_ESC_X_HEX2 |
//      ONIG_SYN_OP_ESC_CONTROL_CHARS |
//      ONIG_SYN_OP_ESC_C_CONTROL )
//    & ~ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END )
//   , ( ONIG_SYN_OP2_QMARK_GROUP_EFFECT | ONIG_SYN_OP2_OPTION_PERL |
//       ONIG_SYN_OP2_QMARK_LPAREN_IF_ELSE |
//       ONIG_SYN_OP2_ASTERISK_CALLOUT_NAME    |
//       ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY  |
//       ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT |
//       ONIG_SYN_OP2_QMARK_CAPITAL_P_NAME       |
//       ONIG_SYN_OP2_ESC_CAPITAL_K_KEEP |
//       ONIG_SYN_OP2_ESC_V_VTAB | ONIG_SYN_OP2_ESC_U_HEX4 )
//   , ( SYN_GNU_REGEX_BV | ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH |
//       ONIG_SYN_ALLOW_INTERVAL_LOW_ABBREV | ONIG_SYN_PYTHON )
//   , ONIG_OPTION_SINGLELINE
//   ,
//   {
//       (OnigCodePoint )'\\'                       /* esc */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar '.'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anytime '*'  */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* zero or one time '?' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* one or more time '+' */
//     , (OnigCodePoint )ONIG_INEFFECTIVE_META_CHAR /* anychar anytime */
//   }
// };



// extern int
// onig_set_default_syntax(OnigSyntaxType* syntax)
// {
//   if (IS_NULL(syntax))
//     syntax = ONIG_SYNTAX_ONIGURUMA;

//   OnigDefaultSyntax = syntax;
//   return 0;
// }

// extern void
// onig_copy_syntax(OnigSyntaxType* to, OnigSyntaxType* from)
// {
//   *to = *from;
// }

// extern void
// onig_set_syntax_op(OnigSyntaxType* syntax, unsigned int op)
// {
//   syntax->op = op;
// }

// extern void
// onig_set_syntax_op2(OnigSyntaxType* syntax, unsigned int op2)
// {
//   syntax->op2 = op2;
// }

// extern void
// onig_set_syntax_behavior(OnigSyntaxType* syntax, unsigned int behavior)
// {
//   syntax->behavior = behavior;
// }

// extern void
// onig_set_syntax_options(OnigSyntaxType* syntax, OnigOptionType options)
// {
//   syntax->options = options;
// }

// extern unsigned int
// onig_get_syntax_op(OnigSyntaxType* syntax)
// {
//   return syntax->op;
// }

// extern unsigned int
// onig_get_syntax_op2(OnigSyntaxType* syntax)
// {
//   return syntax->op2;
// }

// extern unsigned int
// onig_get_syntax_behavior(OnigSyntaxType* syntax)
// {
//   return syntax->behavior;
// }

// extern OnigOptionType
// onig_get_syntax_options(OnigSyntaxType* syntax)
// {
//   return syntax->options;
// }

// #ifdef USE_VARIABLE_META_CHARS
    // extern int onig_set_meta_char(OnigSyntaxType* enc,
    //                               unsigned int what, OnigCodePoint code)
    // {
    //   switch (what) {
    //   case ONIG_META_CHAR_ESCAPE:
    //     enc->meta_char_table.esc = code;
    //     break;
    //   case ONIG_META_CHAR_ANYCHAR:
    //     enc->meta_char_table.anychar = code;
    //     break;
    //   case ONIG_META_CHAR_ANYTIME:
    //     enc->meta_char_table.anytime = code;
    //     break;
    //   case ONIG_META_CHAR_ZERO_OR_ONE_TIME:
    //     enc->meta_char_table.zero_or_one_time = code;
    //     break;
    //   case ONIG_META_CHAR_ONE_OR_MORE_TIME:
    //     enc->meta_char_table.one_or_more_time = code;
    //     break;
    //   case ONIG_META_CHAR_ANYCHAR_ANYTIME:
    //     enc->meta_char_table.anychar_anytime = code;
    //     break;
    //   default:
    //     return ONIGERR_INVALID_ARGUMENT;
    //     break;
    //   }
    //   return 0;
    // }
// #endif /* USE_VARIABLE_META_CHARS */
