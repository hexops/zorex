const PairCaseFoldCodes = struct {
    from: CodePoint,
    to: CodePoint,
};

// #define ONIG_IS_NULL(p)                    (((void*)(p)) == (void*)0)
// #define ONIG_IS_NOT_NULL(p)                (((void*)(p)) != (void*)0)
// #define ONIG_CHECK_NULL_RETURN(p)          if (ONIG_IS_NULL(p)) return NULL
// #define ONIG_CHECK_NULL_RETURN_VAL(p,val)  if (ONIG_IS_NULL(p)) return (val)

// #define MAX_CODE_POINT         (~((OnigCodePoint )0))
// #define ASCII_LIMIT            127
// #define NEWLINE_CODE           0x0a

// #define enclen(enc,p)          ONIGENC_MBC_ENC_LEN(enc,p)

// /* character types bit flag */
// #define BIT_CTYPE_NEWLINE  (1<< ONIGENC_CTYPE_NEWLINE)
// #define BIT_CTYPE_ALPHA    (1<< ONIGENC_CTYPE_ALPHA)
// #define BIT_CTYPE_BLANK    (1<< ONIGENC_CTYPE_BLANK)
// #define BIT_CTYPE_CNTRL    (1<< ONIGENC_CTYPE_CNTRL)
// #define BIT_CTYPE_DIGIT    (1<< ONIGENC_CTYPE_DIGIT)
// #define BIT_CTYPE_GRAPH    (1<< ONIGENC_CTYPE_GRAPH)
// #define BIT_CTYPE_LOWER    (1<< ONIGENC_CTYPE_LOWER)
// #define BIT_CTYPE_PRINT    (1<< ONIGENC_CTYPE_PRINT)
// #define BIT_CTYPE_PUNCT    (1<< ONIGENC_CTYPE_PUNCT)
// #define BIT_CTYPE_SPACE    (1<< ONIGENC_CTYPE_SPACE)
// #define BIT_CTYPE_UPPER    (1<< ONIGENC_CTYPE_UPPER)
// #define BIT_CTYPE_XDIGIT   (1<< ONIGENC_CTYPE_XDIGIT)
// #define BIT_CTYPE_WORD     (1<< ONIGENC_CTYPE_WORD)
// #define BIT_CTYPE_ALNUM    (1<< ONIGENC_CTYPE_ALNUM)
// #define BIT_CTYPE_ASCII    (1<< ONIGENC_CTYPE_ASCII)

// #define CTYPE_TO_BIT(ctype)  (1<<(ctype))
// #define CTYPE_IS_WORD_GRAPH_PRINT(ctype) \
//   ((ctype) == ONIGENC_CTYPE_WORD || (ctype) == ONIGENC_CTYPE_GRAPH ||\
//    (ctype) == ONIGENC_CTYPE_PRINT)


const PosixBracketEntryType = struct {
    name: []const u8,
    ctype: isize,
    len: u16,
};

const PropertyNameCType = struct {
    name: []const u8,
    ctype: isize,
};

// /* #define USE_CRNL_AS_LINE_TERMINATOR */
// #define USE_UNICODE_PROPERTIES
// #define USE_UNICODE_EXTENDED_GRAPHEME_CLUSTER
// #define USE_UNICODE_WORD_BREAK
// /* #define USE_UNICODE_CASE_FOLD_TURKISH_AZERI */
// /* #define USE_UNICODE_ALL_LINE_TERMINATORS */  /* see Unicode.org UTS #18 */


// #define ONIG_ENCODING_INIT_DEFAULT           ONIG_ENCODING_ASCII


const ENC_SKIP_OFFSET_1_OR_0 = 7;

// #define ENC_FLAG_ASCII_COMPATIBLE      (1<<0)
// #define ENC_FLAG_UNICODE               (1<<1)
// #define ENC_FLAG_SKIP_OFFSET_MASK      (7<<2)
// #define ENC_FLAG_SKIP_OFFSET_0             0
// #define ENC_FLAG_SKIP_OFFSET_1         (1<<2)
// #define ENC_FLAG_SKIP_OFFSET_2         (2<<2)
// #define ENC_FLAG_SKIP_OFFSET_3         (3<<2)
// #define ENC_FLAG_SKIP_OFFSET_4         (4<<2)
// #define ENC_FLAG_SKIP_OFFSET_1_OR_0    (ENC_SKIP_OFFSET_1_OR_0<<2)

// #define ENC_GET_SKIP_OFFSET(enc) \
//   (((enc)->flag & ENC_FLAG_SKIP_OFFSET_MASK)>>2)

// #define CASE_FOLD_IS_ASCII_ONLY(flag) \
//   (((flag) & ONIGENC_CASE_FOLD_ASCII_ONLY) != 0)
// #define CASE_FOLD_IS_NOT_ASCII_ONLY(flag) \
//   (((flag) & ONIGENC_CASE_FOLD_ASCII_ONLY) == 0)

// #define UTF16_IS_SURROGATE_FIRST(c)    (((c) & 0xfc) == 0xd8)
// #define UTF16_IS_SURROGATE_SECOND(c)   (((c) & 0xfc) == 0xdc)

// /* from unicode generated codes */
// #define FOLDS1_FOLD(i)         (OnigUnicodeFolds1 + (i))
// #define FOLDS2_FOLD(i)         (OnigUnicodeFolds2 + (i))
// #define FOLDS3_FOLD(i)         (OnigUnicodeFolds3 + (i))
// #define FOLDS1_UNFOLDS_NUM(i)  (OnigUnicodeFolds1[(i)+1])
// #define FOLDS2_UNFOLDS_NUM(i)  (OnigUnicodeFolds2[(i)+2])
// #define FOLDS3_UNFOLDS_NUM(i)  (OnigUnicodeFolds3[(i)+3])
// #define FOLDS1_UNFOLDS(i)      (FOLDS1_FOLD(i) + 2)
// #define FOLDS2_UNFOLDS(i)      (FOLDS2_FOLD(i) + 3)
// #define FOLDS3_UNFOLDS(i)      (FOLDS3_FOLD(i) + 4)
// #define FOLDS1_NEXT_INDEX(i)   ((i) + 2 + FOLDS1_UNFOLDS_NUM(i))
// #define FOLDS2_NEXT_INDEX(i)   ((i) + 3 + FOLDS2_UNFOLDS_NUM(i))
// #define FOLDS3_NEXT_INDEX(i)   ((i) + 4 + FOLDS3_UNFOLDS_NUM(i))

// #define FOLDS_FOLD_ADDR_BUK(buk, addr) do {\
//   if ((buk)->fold_len == 1)\
//     addr = OnigUnicodeFolds1 + (buk)->index;\
//   else if ((buk)->fold_len == 2)\
//     addr = OnigUnicodeFolds2 + (buk)->index;\
//   else if ((buk)->fold_len == 3)\
//     addr = OnigUnicodeFolds3 + (buk)->index;\
//   else\
//     return ONIGERR_INVALID_CODE_POINT_VALUE;\
// } while (0)

// extern OnigCodePoint OnigUnicodeFolds1[];
// extern OnigCodePoint OnigUnicodeFolds2[];
// extern OnigCodePoint OnigUnicodeFolds3[];

// struct ByUnfoldKey {
//   OnigCodePoint code;
//   short int     index;
//   short int     fold_len;
// };


// #define ONIGENC_ISO_8859_1_TO_LOWER_CASE(c) \
//   OnigEncISO_8859_1_ToLowerCaseTable[c]
// #define ONIGENC_ISO_8859_1_TO_UPPER_CASE(c) \
//   OnigEncISO_8859_1_ToUpperCaseTable[c]

// extern const UChar OnigEncISO_8859_1_ToLowerCaseTable[];
// extern const UChar OnigEncISO_8859_1_ToUpperCaseTable[];

// extern OnigEncoding  OnigEncDefaultCharEncoding;
// extern const UChar  OnigEncAsciiToLowerCaseTable[];
// extern const UChar  OnigEncAsciiToUpperCaseTable[];
// extern const unsigned short OnigEncAsciiCtypeTable[];


// #define ONIGENC_IS_ASCII_CODE(code)  ((code) < 0x80)
// #define ONIGENC_ASCII_CODE_TO_LOWER_CASE(c) OnigEncAsciiToLowerCaseTable[c]
// #define ONIGENC_ASCII_CODE_TO_UPPER_CASE(c) OnigEncAsciiToUpperCaseTable[c]
// #define ONIGENC_IS_ASCII_CODE_CTYPE(code,ctype) \
//   ((OnigEncAsciiCtypeTable[code] & CTYPE_TO_BIT(ctype)) != 0)
// #define ONIGENC_IS_ASCII_CODE_WORD(code) \
//   ((OnigEncAsciiCtypeTable[code] & CTYPE_TO_BIT(ONIGENC_CTYPE_WORD)) != 0)
// #define ONIGENC_IS_ASCII_CODE_CASE_AMBIG(code) \
//  (ONIGENC_IS_ASCII_CODE_CTYPE(code, ONIGENC_CTYPE_UPPER) ||\
//   ONIGENC_IS_ASCII_CODE_CTYPE(code, ONIGENC_CTYPE_LOWER))

// #define ONIGENC_IS_UNICODE_ENCODING(enc) \
//   (((enc)->flag & ENC_FLAG_UNICODE) != 0)

// #define ONIGENC_IS_ASCII_COMPATIBLE_ENCODING(enc)  \
//   (((enc)->flag & ENC_FLAG_ASCII_COMPATIBLE) != 0)
