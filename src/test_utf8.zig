pub usingnamespace @import("std").c.builtins;
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
const union_unnamed_1 = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __mbstate_t = union_unnamed_1;
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
pub const va_list = __darwin_va_list;
pub extern fn renameat(c_int, [*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn renamex_np([*c]const u8, [*c]const u8, c_uint) c_int;
pub extern fn renameatx_np(c_int, [*c]const u8, c_int, [*c]const u8, c_uint) c_int;
pub const fpos_t = __darwin_off_t;
pub const struct___sbuf = extern struct {
    _base: [*c]u8,
    _size: c_int,
};
pub const struct___sFILEX = opaque {};
pub const struct___sFILE = extern struct {
    _p: [*c]u8,
    _r: c_int,
    _w: c_int,
    _flags: c_short,
    _file: c_short,
    _bf: struct___sbuf,
    _lbfsize: c_int,
    _cookie: ?*c_void,
    _close: ?fn (?*c_void) callconv(.C) c_int,
    _read: ?fn (?*c_void, [*c]u8, c_int) callconv(.C) c_int,
    _seek: ?fn (?*c_void, fpos_t, c_int) callconv(.C) fpos_t,
    _write: ?fn (?*c_void, [*c]const u8, c_int) callconv(.C) c_int,
    _ub: struct___sbuf,
    _extra: ?*struct___sFILEX,
    _ur: c_int,
    _ubuf: [3]u8,
    _nbuf: [1]u8,
    _lb: struct___sbuf,
    _blksize: c_int,
    _offset: fpos_t,
};
pub const FILE = struct___sFILE;
pub extern var __stdinp: [*c]FILE;
pub extern var __stdoutp: [*c]FILE;
pub extern var __stderrp: [*c]FILE;
pub extern fn clearerr([*c]FILE) void;
pub extern fn fclose([*c]FILE) c_int;
pub extern fn feof([*c]FILE) c_int;
pub extern fn ferror([*c]FILE) c_int;
pub extern fn fflush([*c]FILE) c_int;
pub extern fn fgetc([*c]FILE) c_int;
pub extern fn fgetpos(noalias [*c]FILE, [*c]fpos_t) c_int;
pub extern fn fgets(noalias [*c]u8, c_int, [*c]FILE) [*c]u8;
pub extern fn fopen(__filename: [*c]const u8, __mode: [*c]const u8) [*c]FILE;
pub extern fn fprintf([*c]FILE, [*c]const u8, ...) c_int;
pub extern fn fputc(c_int, [*c]FILE) c_int;
pub extern fn fputs(noalias [*c]const u8, noalias [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*c_void, __size: c_ulong, __nitems: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn freopen(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]FILE) [*c]FILE;
pub extern fn fscanf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn fseek([*c]FILE, c_long, c_int) c_int;
pub extern fn fsetpos([*c]FILE, [*c]const fpos_t) c_int;
pub extern fn ftell([*c]FILE) c_long;
pub extern fn fwrite(__ptr: ?*const c_void, __size: c_ulong, __nitems: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn getc([*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn gets([*c]u8) [*c]u8;
pub extern fn perror([*c]const u8) void;
pub extern fn printf([*c]const u8, ...) c_int;
pub extern fn putc(c_int, [*c]FILE) c_int;
pub extern fn putchar(c_int) c_int;
pub extern fn puts([*c]const u8) c_int;
pub extern fn remove([*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn rewind([*c]FILE) void;
pub extern fn scanf(noalias [*c]const u8, ...) c_int;
pub extern fn setbuf(noalias [*c]FILE, noalias [*c]u8) void;
pub extern fn setvbuf(noalias [*c]FILE, noalias [*c]u8, c_int, usize) c_int;
pub extern fn sprintf([*c]u8, [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias [*c]const u8, noalias [*c]const u8, ...) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn ungetc(c_int, [*c]FILE) c_int;
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*c_void,
    reg_save_area: ?*c_void,
};
pub extern fn vfprintf([*c]FILE, [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vprintf([*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vsprintf([*c]u8, [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn ctermid([*c]u8) [*c]u8;
pub extern fn fdopen(c_int, [*c]const u8) [*c]FILE;
pub extern fn fileno([*c]FILE) c_int;
pub extern fn pclose([*c]FILE) c_int;
pub extern fn popen([*c]const u8, [*c]const u8) [*c]FILE;
pub extern fn __srget([*c]FILE) c_int;
pub extern fn __svfscanf([*c]FILE, [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn __swbuf(c_int, [*c]FILE) c_int;
pub fn __sputc(arg__c: c_int, arg__p: [*c]FILE) callconv(.C) c_int {
    var _c = arg__c;
    var _p = arg__p;
    if (((blk: {
        const ref = &_p.*._w;
        ref.* -= 1;
        break :blk ref.*;
    }) >= @as(c_int, 0)) or ((_p.*._w >= _p.*._lbfsize) and (@bitCast(c_int, @as(c_uint, @bitCast(u8, @truncate(i8, _c)))) != @as(c_int, '\n')))) return @bitCast(c_int, @as(c_uint, (blk: {
        const tmp = @bitCast(u8, @truncate(i8, _c));
        (blk_1: {
            const ref = &_p.*._p;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).?.* = tmp;
        break :blk tmp;
    }))) else return (__swbuf(_c, _p));
    return 0;
}
pub extern fn flockfile([*c]FILE) void;
pub extern fn ftrylockfile([*c]FILE) c_int;
pub extern fn funlockfile([*c]FILE) void;
pub extern fn getc_unlocked([*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn putc_unlocked(c_int, [*c]FILE) c_int;
pub extern fn putchar_unlocked(c_int) c_int;
pub extern fn getw([*c]FILE) c_int;
pub extern fn putw(c_int, [*c]FILE) c_int;
pub extern fn tempnam(__dir: [*c]const u8, __prefix: [*c]const u8) [*c]u8;
pub const off_t = __darwin_off_t;
pub extern fn fseeko(__stream: [*c]FILE, __offset: off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) off_t;
pub extern fn snprintf(__str: [*c]u8, __size: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vsnprintf(__str: [*c]u8, __size: c_ulong, __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vsscanf(noalias __str: [*c]const u8, noalias __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn dprintf(c_int, noalias [*c]const u8, ...) c_int;
pub extern fn vdprintf(c_int, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn getdelim(noalias __linep: [*c][*c]u8, noalias __linecapp: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) isize;
pub extern fn getline(noalias __linep: [*c][*c]u8, noalias __linecapp: [*c]usize, noalias __stream: [*c]FILE) isize;
pub extern fn fmemopen(noalias __buf: ?*c_void, __size: usize, noalias __mode: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufp: [*c][*c]u8, __sizep: [*c]usize) [*c]FILE;
pub extern const sys_nerr: c_int;
pub extern const sys_errlist: [*c]const [*c]const u8;
pub extern fn asprintf(noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn ctermid_r([*c]u8) [*c]u8;
pub extern fn fgetln([*c]FILE, [*c]usize) [*c]u8;
pub extern fn fmtcheck([*c]const u8, [*c]const u8) [*c]const u8;
pub extern fn fpurge([*c]FILE) c_int;
pub extern fn setbuffer([*c]FILE, [*c]u8, c_int) void;
pub extern fn setlinebuf([*c]FILE) c_int;
pub extern fn vasprintf(noalias [*c][*c]u8, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn zopen([*c]const u8, [*c]const u8, c_int) [*c]FILE;
pub extern fn funopen(?*const c_void, ?fn (?*c_void, [*c]u8, c_int) callconv(.C) c_int, ?fn (?*c_void, [*c]const u8, c_int) callconv(.C) c_int, ?fn (?*c_void, fpos_t, c_int) callconv(.C) fpos_t, ?fn (?*c_void) callconv(.C) c_int) [*c]FILE;
pub extern fn __sprintf_chk(noalias [*c]u8, c_int, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __snprintf_chk(noalias [*c]u8, usize, c_int, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __vsprintf_chk(noalias [*c]u8, c_int, usize, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn __vsnprintf_chk(noalias [*c]u8, usize, c_int, usize, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub const OnigCodePoint = c_uint;
pub const OnigUChar = u8;
pub const OnigCtype = c_uint;
pub const OnigLen = c_uint;
pub const OnigCaseFoldType = c_uint;
pub extern var OnigDefaultCaseFoldFlag: OnigCaseFoldType;
const struct_unnamed_2 = extern struct {
    byte_len: c_int,
    code_len: c_int,
    code: [3]OnigCodePoint,
};
pub const OnigCaseFoldCodeItem = struct_unnamed_2;
const struct_unnamed_3 = extern struct {
    esc: OnigCodePoint,
    anychar: OnigCodePoint,
    anytime: OnigCodePoint,
    zero_or_one_time: OnigCodePoint,
    one_or_more_time: OnigCodePoint,
    anychar_anytime: OnigCodePoint,
};
pub const OnigMetaCharTableType = struct_unnamed_3;
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
pub const ONIGENC_CTYPE_NEWLINE = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_NEWLINE);
pub const ONIGENC_CTYPE_ALPHA = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_ALPHA);
pub const ONIGENC_CTYPE_BLANK = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_BLANK);
pub const ONIGENC_CTYPE_CNTRL = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_CNTRL);
pub const ONIGENC_CTYPE_DIGIT = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_DIGIT);
pub const ONIGENC_CTYPE_GRAPH = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_GRAPH);
pub const ONIGENC_CTYPE_LOWER = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_LOWER);
pub const ONIGENC_CTYPE_PRINT = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_PRINT);
pub const ONIGENC_CTYPE_PUNCT = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_PUNCT);
pub const ONIGENC_CTYPE_SPACE = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_SPACE);
pub const ONIGENC_CTYPE_UPPER = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_UPPER);
pub const ONIGENC_CTYPE_XDIGIT = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_XDIGIT);
pub const ONIGENC_CTYPE_WORD = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_WORD);
pub const ONIGENC_CTYPE_ALNUM = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_ALNUM);
pub const ONIGENC_CTYPE_ASCII = @enumToInt(enum_unnamed_4.ONIGENC_CTYPE_ASCII);
const enum_unnamed_4 = extern enum(c_int) {
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
pub const OnigEncCtype = enum_unnamed_4;
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
const struct_unnamed_5 = extern struct {
    op: c_uint,
    op2: c_uint,
    behavior: c_uint,
    options: OnigOptionType,
    meta_char_table: OnigMetaCharTableType,
};
pub const OnigSyntaxType = struct_unnamed_5;
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
const struct_unnamed_6 = extern struct {
    enc: OnigEncoding,
    par: [*c]OnigUChar,
    par_end: [*c]OnigUChar,
};
pub const OnigErrorInfo = struct_unnamed_6;
const struct_unnamed_7 = extern struct {
    lower: c_int,
    upper: c_int,
};
pub const OnigRepeatRange = struct_unnamed_7;
pub const OnigWarnFunc = ?fn ([*c]const u8) callconv(.C) void;
pub extern fn onig_null_warn(s: [*c]const u8) void;
pub const struct_re_pattern_buffer = opaque {};
pub const OnigRegexType = struct_re_pattern_buffer;
pub const OnigRegex = ?*OnigRegexType;
pub const regex_t = OnigRegexType;
pub const struct_OnigRegSetStruct = opaque {};
pub const OnigRegSet = struct_OnigRegSetStruct;
pub const ONIG_REGSET_POSITION_LEAD = @enumToInt(enum_unnamed_8.ONIG_REGSET_POSITION_LEAD);
pub const ONIG_REGSET_REGEX_LEAD = @enumToInt(enum_unnamed_8.ONIG_REGSET_REGEX_LEAD);
pub const ONIG_REGSET_PRIORITY_TO_REGEX_ORDER = @enumToInt(enum_unnamed_8.ONIG_REGSET_PRIORITY_TO_REGEX_ORDER);
const enum_unnamed_8 = extern enum(c_int) {
    ONIG_REGSET_POSITION_LEAD = 0,
    ONIG_REGSET_REGEX_LEAD = 1,
    ONIG_REGSET_PRIORITY_TO_REGEX_ORDER = 2,
    _,
};
pub const OnigRegSetLead = enum_unnamed_8;
const struct_unnamed_9 = extern struct {
    num_of_elements: c_int,
    pattern_enc: OnigEncoding,
    target_enc: OnigEncoding,
    syntax: [*c]OnigSyntaxType,
    option: OnigOptionType,
    case_fold_flag: OnigCaseFoldType,
};
pub const OnigCompileInfo = struct_unnamed_9;
pub const ONIG_CALLOUT_IN_PROGRESS = @enumToInt(enum_unnamed_10.ONIG_CALLOUT_IN_PROGRESS);
pub const ONIG_CALLOUT_IN_RETRACTION = @enumToInt(enum_unnamed_10.ONIG_CALLOUT_IN_RETRACTION);
const enum_unnamed_10 = extern enum(c_int) {
    ONIG_CALLOUT_IN_PROGRESS = 1,
    ONIG_CALLOUT_IN_RETRACTION = 2,
    _,
};
pub const OnigCalloutIn = enum_unnamed_10;
pub const ONIG_CALLOUT_OF_CONTENTS = @enumToInt(enum_unnamed_11.ONIG_CALLOUT_OF_CONTENTS);
pub const ONIG_CALLOUT_OF_NAME = @enumToInt(enum_unnamed_11.ONIG_CALLOUT_OF_NAME);
const enum_unnamed_11 = extern enum(c_int) {
    ONIG_CALLOUT_OF_CONTENTS = 0,
    ONIG_CALLOUT_OF_NAME = 1,
    _,
};
pub const OnigCalloutOf = enum_unnamed_11;
pub const ONIG_CALLOUT_TYPE_SINGLE = @enumToInt(enum_unnamed_12.ONIG_CALLOUT_TYPE_SINGLE);
pub const ONIG_CALLOUT_TYPE_START_CALL = @enumToInt(enum_unnamed_12.ONIG_CALLOUT_TYPE_START_CALL);
pub const ONIG_CALLOUT_TYPE_BOTH_CALL = @enumToInt(enum_unnamed_12.ONIG_CALLOUT_TYPE_BOTH_CALL);
pub const ONIG_CALLOUT_TYPE_START_MARK_END_CALL = @enumToInt(enum_unnamed_12.ONIG_CALLOUT_TYPE_START_MARK_END_CALL);
const enum_unnamed_12 = extern enum(c_int) {
    ONIG_CALLOUT_TYPE_SINGLE = 0,
    ONIG_CALLOUT_TYPE_START_CALL = 1,
    ONIG_CALLOUT_TYPE_BOTH_CALL = 2,
    ONIG_CALLOUT_TYPE_START_MARK_END_CALL = 3,
    _,
};
pub const OnigCalloutType = enum_unnamed_12;
pub const struct_OnigCalloutArgsStruct = opaque {};
pub const OnigCalloutArgs = struct_OnigCalloutArgsStruct;
pub const OnigCalloutFunc = ?fn (?*OnigCalloutArgs, ?*c_void) callconv(.C) c_int;
pub const ONIG_CALLOUT_FAIL = @enumToInt(enum_unnamed_13.ONIG_CALLOUT_FAIL);
pub const ONIG_CALLOUT_SUCCESS = @enumToInt(enum_unnamed_13.ONIG_CALLOUT_SUCCESS);
const enum_unnamed_13 = extern enum(c_int) {
    ONIG_CALLOUT_FAIL = 1,
    ONIG_CALLOUT_SUCCESS = 0,
    _,
};
pub const OnigCalloutResult = enum_unnamed_13;
pub const ONIG_TYPE_VOID = @enumToInt(enum_unnamed_14.ONIG_TYPE_VOID);
pub const ONIG_TYPE_LONG = @enumToInt(enum_unnamed_14.ONIG_TYPE_LONG);
pub const ONIG_TYPE_CHAR = @enumToInt(enum_unnamed_14.ONIG_TYPE_CHAR);
pub const ONIG_TYPE_STRING = @enumToInt(enum_unnamed_14.ONIG_TYPE_STRING);
pub const ONIG_TYPE_POINTER = @enumToInt(enum_unnamed_14.ONIG_TYPE_POINTER);
pub const ONIG_TYPE_TAG = @enumToInt(enum_unnamed_14.ONIG_TYPE_TAG);
const enum_unnamed_14 = extern enum(c_int) {
    ONIG_TYPE_VOID = 0,
    ONIG_TYPE_LONG = 1,
    ONIG_TYPE_CHAR = 2,
    ONIG_TYPE_STRING = 4,
    ONIG_TYPE_POINTER = 8,
    ONIG_TYPE_TAG = 16,
    _,
};
pub const OnigType = enum_unnamed_14;
const struct_unnamed_16 = extern struct {
    start: [*c]OnigUChar,
    end: [*c]OnigUChar,
};
const union_unnamed_15 = extern union {
    l: c_long,
    c: OnigCodePoint,
    s: struct_unnamed_16,
    p: ?*c_void,
    tag: c_int,
};
pub const OnigValue = union_unnamed_15;
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
pub var nsucc: c_int = 0;
pub var nfail: c_int = 0;
pub var nerror: c_int = 0;
pub var err_file: [*c]FILE = @import("std").mem.zeroes([*c]FILE);
pub var region: [*c]OnigRegion = @import("std").mem.zeroes([*c]OnigRegion);
pub fn xx(arg_pattern: [*c]u8, arg_str: [*c]u8, arg_from: c_int, arg_to: c_int, arg_mem: c_int, arg_not: c_int, arg_error_no: c_int, arg_line_no: c_int) callconv(.C) void {
    var pattern = arg_pattern;
    var str = arg_str;
    var from = arg_from;
    var to = arg_to;
    var mem = arg_mem;
    var not = arg_not;
    var error_no = arg_error_no;
    var line_no = arg_line_no;
    var r: c_int = undefined;
    var reg: ?*regex_t = undefined;
    var einfo: OnigErrorInfo = undefined;
    r = onig_new(&reg, @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), pattern)), @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (pattern + strlen(pattern)))), @as(c_uint, 0), (&OnigEncodingUTF8), OnigDefaultSyntax, &einfo);
    if (r != 0) {
        var s: [90]u8 = undefined;
        if (error_no == @as(c_int, 0)) {
            _ = onig_error_code_to_str(@ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), &s)), r, &einfo);
            _ = fprintf(err_file, "ERROR: %s  /%s/  #%d\n", &s, pattern, line_no);
            nerror += 1;
        } else {
            if (r == error_no) {
                _ = fprintf(__stdoutp, "OK(ERROR): /%s/ %d  #%d\n", pattern, r, line_no);
                nsucc += 1;
            } else {
                _ = fprintf(__stdoutp, "FAIL(ERROR): /%s/ \'%s\', %d, %d  #%d\n", pattern, str, error_no, r, line_no);
                nfail += 1;
            }
        }
        return;
    }
    r = onig_search(reg, @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), str)), @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (str + strlen(str)))), @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), str)), @ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), (str + strlen(str)))), region, @as(c_uint, 0));
    if (r < -@as(c_int, 1)) {
        var s: [90]u8 = undefined;
        if (error_no == @as(c_int, 0)) {
            _ = onig_error_code_to_str(@ptrCast([*c]OnigUChar, @alignCast(@alignOf(OnigUChar), &s)), r);
            _ = fprintf(err_file, "ERROR: %s  /%s/  #%d\n", &s, pattern, line_no);
            nerror += 1;
        } else {
            if (r == error_no) {
                _ = fprintf(__stdoutp, "OK(ERROR): /%s/ \'%s\', %d  #%d\n", pattern, str, r, line_no);
                nsucc += 1;
            } else {
                _ = fprintf(__stdoutp, "FAIL ERROR NO: /%s/ \'%s\', %d, %d  #%d\n", pattern, str, error_no, r, line_no);
                nfail += 1;
            }
        }
        return;
    }
    if (r == -@as(c_int, 1)) {
        if (not != 0) {
            _ = fprintf(__stdoutp, "OK(N): /%s/ \'%s\'  #%d\n", pattern, str, line_no);
            nsucc += 1;
        } else {
            _ = fprintf(__stdoutp, "FAIL: /%s/ \'%s\'  #%d\n", pattern, str, line_no);
            nfail += 1;
        }
    } else {
        if (not != 0) {
            _ = fprintf(__stdoutp, "FAIL(N): /%s/ \'%s\'  #%d\n", pattern, str, line_no);
            nfail += 1;
        } else {
            if ((region.*.beg[@intCast(c_uint, mem)] == from) and (region.*.end[@intCast(c_uint, mem)] == to)) {
                _ = fprintf(__stdoutp, "OK: /%s/ \'%s\'  #%d\n", pattern, str, line_no);
                nsucc += 1;
            } else {
                _ = fprintf(__stdoutp, "FAIL: /%s/ \'%s\' %d-%d : %d-%d  #%d\n", pattern, str, from, to, region.*.beg[@intCast(c_uint, mem)], region.*.end[@intCast(c_uint, mem)], line_no);
                nfail += 1;
            }
        }
    }
    onig_free(reg);
}
pub fn xx2(arg_pattern: [*c]u8, arg_str: [*c]u8, arg_from: c_int, arg_to: c_int, arg_line_no: c_int) callconv(.C) void {
    var pattern = arg_pattern;
    var str = arg_str;
    var from = arg_from;
    var to = arg_to;
    var line_no = arg_line_no;
    xx(pattern, str, from, to, @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), line_no);
}
pub fn xx3(arg_pattern: [*c]u8, arg_str: [*c]u8, arg_from: c_int, arg_to: c_int, arg_mem: c_int, arg_line_no: c_int) callconv(.C) void {
    var pattern = arg_pattern;
    var str = arg_str;
    var from = arg_from;
    var to = arg_to;
    var mem = arg_mem;
    var line_no = arg_line_no;
    xx(pattern, str, from, to, mem, @as(c_int, 0), @as(c_int, 0), line_no);
}
pub fn xn(arg_pattern: [*c]u8, arg_str: [*c]u8, arg_line_no: c_int) callconv(.C) void {
    var pattern = arg_pattern;
    var str = arg_str;
    var line_no = arg_line_no;
    xx(pattern, str, @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 1), @as(c_int, 0), line_no);
}
pub fn xe(arg_pattern: [*c]u8, arg_str: [*c]u8, arg_error_no: c_int, arg_line_no: c_int) callconv(.C) void {
    var pattern = arg_pattern;
    var str = arg_str;
    var error_no = arg_error_no;
    var line_no = arg_line_no;
    xx(pattern, str, @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), error_no, line_no);
}
pub fn main(arg_argc: c_int, arg_argv: [*c][*c]u8) callconv(.C) c_int {
    var argc = arg_argc;
    var argv = arg_argv;
    var use_encs: [1]OnigEncoding = undefined;
    use_encs[@intCast(c_uint, @as(c_int, 0))] = (&OnigEncodingUTF8);
    _ = onig_initialize(&use_encs, @bitCast(c_int, @truncate(c_uint, (@sizeOf([1]OnigEncoding) / @sizeOf(OnigEncoding)))));
    err_file = __stdoutp;
    region = onig_region_new();
    xx2("", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 158));
    xx2("^", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 159));
    xx2("^a", "\na", @as(c_int, 1), @as(c_int, 2), @as(c_int, 160));
    xx2("$", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 161));
    xx2("$\\O", "bb\n", @as(c_int, 2), @as(c_int, 3), @as(c_int, 162));
    xx2("\\G", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 163));
    xx2("\\A", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 164));
    xx2("\\Z", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 165));
    xx2("\\z", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 166));
    xx2("^$", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 167));
    xx2("\\ca", "\x01", @as(c_int, 0), @as(c_int, 1), @as(c_int, 168));
    xx2("\\C-b", "\x02", @as(c_int, 0), @as(c_int, 1), @as(c_int, 169));
    xx2("\\c\\\\", "\x1c", @as(c_int, 0), @as(c_int, 1), @as(c_int, 170));
    xx2("q[\\c\\\\]", "q\x1c", @as(c_int, 0), @as(c_int, 2), @as(c_int, 171));
    xx2("", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 172));
    xx2("a", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 173));
    xx2("\\x61", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 174));
    xx2("aa", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 175));
    xx2("aaa", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 176));
    xx2("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", @as(c_int, 0), @as(c_int, 35), @as(c_int, 177));
    xx2("ab", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 178));
    xx2("b", "ab", @as(c_int, 1), @as(c_int, 2), @as(c_int, 179));
    xx2("bc", "abc", @as(c_int, 1), @as(c_int, 3), @as(c_int, 180));
    xx2("(?i:#RET#)", "#INS##RET#", @as(c_int, 5), @as(c_int, 10), @as(c_int, 181));
    xx2("\\17", "\x0f", @as(c_int, 0), @as(c_int, 1), @as(c_int, 182));
    xx2("\\x1f", "\x1f", @as(c_int, 0), @as(c_int, 1), @as(c_int, 183));
    xx2("a(?#....\\\\JJJJ)b", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 184));
    xx2("(?x)  G (o O(?-x)oO) g L", "GoOoOgLe", @as(c_int, 0), @as(c_int, 7), @as(c_int, 185));
    xx2(".", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 186));
    xn(".", "", @as(c_int, 187));
    xx2("..", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 188));
    xx2("\\w", "e", @as(c_int, 0), @as(c_int, 1), @as(c_int, 189));
    xn("\\W", "e", @as(c_int, 190));
    xx2("\\s", " ", @as(c_int, 0), @as(c_int, 1), @as(c_int, 191));
    xx2("\\S", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 192));
    xx2("\\d", "4", @as(c_int, 0), @as(c_int, 1), @as(c_int, 193));
    xn("\\D", "4", @as(c_int, 194));
    xx2("\\b", "z ", @as(c_int, 0), @as(c_int, 0), @as(c_int, 195));
    xx2("\\b", " z", @as(c_int, 1), @as(c_int, 1), @as(c_int, 196));
    xx2("\\b", "  z ", @as(c_int, 2), @as(c_int, 2), @as(c_int, 197));
    xx2("\\B", "zz ", @as(c_int, 1), @as(c_int, 1), @as(c_int, 198));
    xx2("\\B", "z ", @as(c_int, 2), @as(c_int, 2), @as(c_int, 199));
    xx2("\\B", " z", @as(c_int, 0), @as(c_int, 0), @as(c_int, 200));
    xx2("[ab]", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 201));
    xn("[ab]", "c", @as(c_int, 202));
    xx2("[a-z]", "t", @as(c_int, 0), @as(c_int, 1), @as(c_int, 203));
    xn("[^a]", "a", @as(c_int, 204));
    xx2("[^a]", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 205));
    xx2("[]]", "]", @as(c_int, 0), @as(c_int, 1), @as(c_int, 206));
    xn("[^]]", "]", @as(c_int, 207));
    xx2("[\\^]+", "0^^1", @as(c_int, 1), @as(c_int, 3), @as(c_int, 208));
    xx2("[b-]", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 209));
    xx2("[b-]", "-", @as(c_int, 0), @as(c_int, 1), @as(c_int, 210));
    xx2("[\\w]", "z", @as(c_int, 0), @as(c_int, 1), @as(c_int, 211));
    xn("[\\w]", " ", @as(c_int, 212));
    xx2("[\\W]", "b$", @as(c_int, 1), @as(c_int, 2), @as(c_int, 213));
    xx2("[\\d]", "5", @as(c_int, 0), @as(c_int, 1), @as(c_int, 214));
    xn("[\\d]", "e", @as(c_int, 215));
    xx2("[\\D]", "t", @as(c_int, 0), @as(c_int, 1), @as(c_int, 216));
    xn("[\\D]", "3", @as(c_int, 217));
    xx2("[\\s]", " ", @as(c_int, 0), @as(c_int, 1), @as(c_int, 218));
    xn("[\\s]", "a", @as(c_int, 219));
    xx2("[\\S]", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 220));
    xn("[\\S]", " ", @as(c_int, 221));
    xx2("[\\w\\d]", "2", @as(c_int, 0), @as(c_int, 1), @as(c_int, 222));
    xn("[\\w\\d]", " ", @as(c_int, 223));
    xx2("[[:upper:]]", "B", @as(c_int, 0), @as(c_int, 1), @as(c_int, 224));
    xx2("[*[:xdigit:]+]", "+", @as(c_int, 0), @as(c_int, 1), @as(c_int, 225));
    xx2("[*[:xdigit:]+]", "GHIKK-9+*", @as(c_int, 6), @as(c_int, 7), @as(c_int, 226));
    xx2("[*[:xdigit:]+]", "-@^+", @as(c_int, 3), @as(c_int, 4), @as(c_int, 227));
    xn("[[:upper]]", "A", @as(c_int, 228));
    xx2("[[:upper]]", ":", @as(c_int, 0), @as(c_int, 1), @as(c_int, 229));
    xx2("[\\044-\\047]", "&", @as(c_int, 0), @as(c_int, 1), @as(c_int, 230));
    xx2("[\\x5a-\\x5c]", "[", @as(c_int, 0), @as(c_int, 1), @as(c_int, 231));
    xx2("[\\x6A-\\x6D]", "l", @as(c_int, 0), @as(c_int, 1), @as(c_int, 232));
    xn("[\\x6A-\\x6D]", "n", @as(c_int, 233));
    xn("^[0-9A-F]+ 0+ UNDEF ", "75F 00000000 SECT14A notype ()    External    | _rb_apply", @as(c_int, 234));
    xx2("[\\[]", "[", @as(c_int, 0), @as(c_int, 1), @as(c_int, 235));
    xx2("[\\]]", "]", @as(c_int, 0), @as(c_int, 1), @as(c_int, 236));
    xx2("[&]", "&", @as(c_int, 0), @as(c_int, 1), @as(c_int, 237));
    xx2("[[ab]]", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 238));
    xx2("[[ab]c]", "c", @as(c_int, 0), @as(c_int, 1), @as(c_int, 239));
    xn("[[^a]]", "a", @as(c_int, 240));
    xn("[^[a]]", "a", @as(c_int, 241));
    xx2("[[ab]&&bc]", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 242));
    xn("[[ab]&&bc]", "a", @as(c_int, 243));
    xn("[[ab]&&bc]", "c", @as(c_int, 244));
    xx2("[a-z&&b-y&&c-x]", "w", @as(c_int, 0), @as(c_int, 1), @as(c_int, 245));
    xn("[^a-z&&b-y&&c-x]", "w", @as(c_int, 246));
    xx2("[[^a&&a]&&a-z]", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 247));
    xn("[[^a&&a]&&a-z]", "a", @as(c_int, 248));
    xx2("[[^a-z&&bcdef]&&[^c-g]]", "h", @as(c_int, 0), @as(c_int, 1), @as(c_int, 249));
    xn("[[^a-z&&bcdef]&&[^c-g]]", "c", @as(c_int, 250));
    xx2("[^[^abc]&&[^cde]]", "c", @as(c_int, 0), @as(c_int, 1), @as(c_int, 251));
    xx2("[^[^abc]&&[^cde]]", "e", @as(c_int, 0), @as(c_int, 1), @as(c_int, 252));
    xn("[^[^abc]&&[^cde]]", "f", @as(c_int, 253));
    xx2("[a-&&-a]", "-", @as(c_int, 0), @as(c_int, 1), @as(c_int, 254));
    xn("[a\\-&&\\-a]", "&", @as(c_int, 255));
    xn("\\wabc", " abc", @as(c_int, 256));
    xx2("a\\Wbc", "a bc", @as(c_int, 0), @as(c_int, 4), @as(c_int, 257));
    xx2("a.b.c", "aabbc", @as(c_int, 0), @as(c_int, 5), @as(c_int, 258));
    xx2(".\\wb\\W..c", "abb bcc", @as(c_int, 0), @as(c_int, 7), @as(c_int, 259));
    xx2("\\s\\wzzz", " zzzz", @as(c_int, 0), @as(c_int, 5), @as(c_int, 260));
    xx2("aa.b", "aabb", @as(c_int, 0), @as(c_int, 4), @as(c_int, 261));
    xn(".a", "ab", @as(c_int, 262));
    xx2(".a", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 263));
    xx2("^a", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 264));
    xx2("^a$", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 265));
    xx2("^\\w$", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 266));
    xn("^\\w$", " ", @as(c_int, 267));
    xx2("^\\wab$", "zab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 268));
    xx2("^\\wabcdef$", "zabcdef", @as(c_int, 0), @as(c_int, 7), @as(c_int, 269));
    xx2("^\\w...def$", "zabcdef", @as(c_int, 0), @as(c_int, 7), @as(c_int, 270));
    xx2("\\w\\w\\s\\Waaa\\d", "aa  aaa4", @as(c_int, 0), @as(c_int, 8), @as(c_int, 271));
    xx2("\\A\\Z", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 272));
    xx2("\\Axyz", "xyz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 273));
    xx2("xyz\\Z", "xyz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 274));
    xx2("xyz\\z", "xyz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 275));
    xx2("a\\Z", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 276));
    xx2("\\Gaz", "az", @as(c_int, 0), @as(c_int, 2), @as(c_int, 277));
    xn("\\Gz", "bza", @as(c_int, 278));
    xn("az\\G", "az", @as(c_int, 279));
    xn("az\\A", "az", @as(c_int, 280));
    xn("a\\Az", "az", @as(c_int, 281));
    xx2("\\^\\$", "^$", @as(c_int, 0), @as(c_int, 2), @as(c_int, 282));
    xx2("^x?y", "xy", @as(c_int, 0), @as(c_int, 2), @as(c_int, 283));
    xx2("^(x?y)", "xy", @as(c_int, 0), @as(c_int, 2), @as(c_int, 284));
    xx2("\\w", "_", @as(c_int, 0), @as(c_int, 1), @as(c_int, 285));
    xn("\\W", "_", @as(c_int, 286));
    xx2("(?=z)z", "z", @as(c_int, 0), @as(c_int, 1), @as(c_int, 287));
    xn("(?=z).", "a", @as(c_int, 288));
    xx2("(?!z)a", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 289));
    xn("(?!z)a", "z", @as(c_int, 290));
    xx2("(?i:a)", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 291));
    xx2("(?i:a)", "A", @as(c_int, 0), @as(c_int, 1), @as(c_int, 292));
    xx2("(?i:A)", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 293));
    xx2("(?i:i)", "I", @as(c_int, 0), @as(c_int, 1), @as(c_int, 294));
    xx2("(?i:I)", "i", @as(c_int, 0), @as(c_int, 1), @as(c_int, 295));
    xx2("(?i:[A-Z])", "i", @as(c_int, 0), @as(c_int, 1), @as(c_int, 296));
    xx2("(?i:[a-z])", "I", @as(c_int, 0), @as(c_int, 1), @as(c_int, 297));
    xn("(?i:A)", "b", @as(c_int, 298));
    xx2("(?i:ss)", "ss", @as(c_int, 0), @as(c_int, 2), @as(c_int, 299));
    xx2("(?i:ss)", "Ss", @as(c_int, 0), @as(c_int, 2), @as(c_int, 300));
    xx2("(?i:ss)", "SS", @as(c_int, 0), @as(c_int, 2), @as(c_int, 301));
    xx2("(?i:ss)", "\xc5\xbfS", @as(c_int, 0), @as(c_int, 3), @as(c_int, 303));
    xx2("(?i:ss)", "s\xc5\xbf", @as(c_int, 0), @as(c_int, 3), @as(c_int, 304));
    xx2("(?i:ss)", "\xc3\x9f", @as(c_int, 0), @as(c_int, 2), @as(c_int, 306));
    xx2("(?i:ss)", "\xe1\xba\x9e", @as(c_int, 0), @as(c_int, 3), @as(c_int, 308));
    xx2("(?i:xssy)", "xssy", @as(c_int, 0), @as(c_int, 4), @as(c_int, 309));
    xx2("(?i:xssy)", "xSsy", @as(c_int, 0), @as(c_int, 4), @as(c_int, 310));
    xx2("(?i:xssy)", "xSSy", @as(c_int, 0), @as(c_int, 4), @as(c_int, 311));
    xx2("(?i:xssy)", "x\xc5\xbfSy", @as(c_int, 0), @as(c_int, 5), @as(c_int, 312));
    xx2("(?i:xssy)", "xs\xc5\xbfy", @as(c_int, 0), @as(c_int, 5), @as(c_int, 313));
    xx2("(?i:xssy)", "x\xc3\x9fy", @as(c_int, 0), @as(c_int, 4), @as(c_int, 314));
    xx2("(?i:xssy)", "x\xe1\xba\x9ey", @as(c_int, 0), @as(c_int, 5), @as(c_int, 315));
    xx2("(?i:x\xc3\x9fy)", "xssy", @as(c_int, 0), @as(c_int, 4), @as(c_int, 316));
    xx2("(?i:x\xc3\x9fy)", "xSSy", @as(c_int, 0), @as(c_int, 4), @as(c_int, 317));
    xx2("(?i:\xc3\x9f)", "ss", @as(c_int, 0), @as(c_int, 2), @as(c_int, 318));
    xx2("(?i:\xc3\x9f)", "SS", @as(c_int, 0), @as(c_int, 2), @as(c_int, 319));
    xx2("(?i:[\xc3\x9f])", "ss", @as(c_int, 0), @as(c_int, 2), @as(c_int, 320));
    xx2("(?i:[\xc3\x9f])", "SS", @as(c_int, 0), @as(c_int, 2), @as(c_int, 321));
    xx2("(?i)(?<!ss)z", "qqz", @as(c_int, 2), @as(c_int, 3), @as(c_int, 322));
    xx2("(?i:[A-Z])", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 323));
    xx2("(?i:[f-m])", "H", @as(c_int, 0), @as(c_int, 1), @as(c_int, 324));
    xx2("(?i:[f-m])", "h", @as(c_int, 0), @as(c_int, 1), @as(c_int, 325));
    xn("(?i:[f-m])", "e", @as(c_int, 326));
    xx2("(?i:[A-c])", "D", @as(c_int, 0), @as(c_int, 1), @as(c_int, 327));
    xn("(?i:[^a-z])", "A", @as(c_int, 328));
    xn("(?i:[^a-z])", "a", @as(c_int, 329));
    xx2("(?i:[!-k])", "Z", @as(c_int, 0), @as(c_int, 1), @as(c_int, 330));
    xx2("(?i:[!-k])", "7", @as(c_int, 0), @as(c_int, 1), @as(c_int, 331));
    xx2("(?i:[T-}])", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 332));
    xx2("(?i:[T-}])", "{", @as(c_int, 0), @as(c_int, 1), @as(c_int, 333));
    xx2("(?i:\\?a)", "?A", @as(c_int, 0), @as(c_int, 2), @as(c_int, 334));
    xx2("(?i:\\*A)", "*a", @as(c_int, 0), @as(c_int, 2), @as(c_int, 335));
    xn(".", "\n", @as(c_int, 336));
    xx2("(?m:.)", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 337));
    xx2("(?m:a.)", "a\n", @as(c_int, 0), @as(c_int, 2), @as(c_int, 338));
    xx2("(?m:.b)", "a\nb", @as(c_int, 1), @as(c_int, 3), @as(c_int, 339));
    xx2(".*abc", "dddabdd\nddabc", @as(c_int, 8), @as(c_int, 13), @as(c_int, 340));
    xx2(".+abc", "dddabdd\nddabcaa\naaaabc", @as(c_int, 8), @as(c_int, 13), @as(c_int, 341));
    xx2("(?m:.*abc)", "dddabddabc", @as(c_int, 0), @as(c_int, 10), @as(c_int, 342));
    xn("(?i)(?-i)a", "A", @as(c_int, 343));
    xn("(?i)(?-i:a)", "A", @as(c_int, 344));
    xx2("a?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 345));
    xx2("a?", "b", @as(c_int, 0), @as(c_int, 0), @as(c_int, 346));
    xx2("a?", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 347));
    xx2("a*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 348));
    xx2("a*", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 349));
    xx2("a*", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 350));
    xx2("a*", "baaaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 351));
    xn("a+", "", @as(c_int, 352));
    xx2("a+", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 353));
    xx2("a+", "aaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 354));
    xx2("a+", "aabbb", @as(c_int, 0), @as(c_int, 2), @as(c_int, 355));
    xx2("a+", "baaaa", @as(c_int, 1), @as(c_int, 5), @as(c_int, 356));
    xx2(".?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 357));
    xx2(".?", "f", @as(c_int, 0), @as(c_int, 1), @as(c_int, 358));
    xx2(".?", "\n", @as(c_int, 0), @as(c_int, 0), @as(c_int, 359));
    xx2(".*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 360));
    xx2(".*", "abcde", @as(c_int, 0), @as(c_int, 5), @as(c_int, 361));
    xx2(".+", "z", @as(c_int, 0), @as(c_int, 1), @as(c_int, 362));
    xx2(".+", "zdswer\n", @as(c_int, 0), @as(c_int, 6), @as(c_int, 363));
    xx2("(.*)a\\1f", "babfbac", @as(c_int, 0), @as(c_int, 4), @as(c_int, 364));
    xx2("(.*)a\\1f", "bacbabf", @as(c_int, 3), @as(c_int, 7), @as(c_int, 365));
    xx2("((.*)a\\2f)", "bacbabf", @as(c_int, 3), @as(c_int, 7), @as(c_int, 366));
    xx2("(.*)a\\1f", "baczzzzzz\nbazz\nzzzzbabf", @as(c_int, 19), @as(c_int, 23), @as(c_int, 367));
    xx2("(?:x?)?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 368));
    xx2("(?:x?)?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 369));
    xx2("(?:x?)?", "xx", @as(c_int, 0), @as(c_int, 1), @as(c_int, 370));
    xx2("(?:x?)*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 371));
    xx2("(?:x?)*", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 372));
    xx2("(?:x?)*", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 373));
    xx2("(?:x?)+", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 374));
    xx2("(?:x?)+", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 375));
    xx2("(?:x?)+", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 376));
    xx2("(?:x?)??", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 377));
    xx2("(?:x?)??", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 378));
    xx2("(?:x?)??", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 379));
    xx2("(?:x?)*?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 380));
    xx2("(?:x?)*?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 381));
    xx2("(?:x?)*?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 382));
    xx2("(?:x?)+?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 383));
    xx2("(?:x?)+?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 384));
    xx2("(?:x?)+?", "xx", @as(c_int, 0), @as(c_int, 1), @as(c_int, 385));
    xx2("(?:x*)?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 386));
    xx2("(?:x*)?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 387));
    xx2("(?:x*)?", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 388));
    xx2("(?:x*)*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 389));
    xx2("(?:x*)*", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 390));
    xx2("(?:x*)*", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 391));
    xx2("(?:x*)+", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 392));
    xx2("(?:x*)+", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 393));
    xx2("(?:x*)+", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 394));
    xx2("(?:x*)??", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 395));
    xx2("(?:x*)??", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 396));
    xx2("(?:x*)??", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 397));
    xx2("(?:x*)*?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 398));
    xx2("(?:x*)*?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 399));
    xx2("(?:x*)*?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 400));
    xx2("(?:x*)+?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 401));
    xx2("(?:x*)+?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 402));
    xx2("(?:x*)+?", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 403));
    xx2("(?:x+)?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 404));
    xx2("(?:x+)?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 405));
    xx2("(?:x+)?", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 406));
    xx2("(?:x+)*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 407));
    xx2("(?:x+)*", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 408));
    xx2("(?:x+)*", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 409));
    xn("(?:x+)+", "", @as(c_int, 410));
    xx2("(?:x+)+", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 411));
    xx2("(?:x+)+", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 412));
    xx2("(?:x+)??", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 413));
    xx2("(?:x+)??", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 414));
    xx2("(?:x+)??", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 415));
    xx2("(?:x+)*?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 416));
    xx2("(?:x+)*?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 417));
    xx2("(?:x+)*?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 418));
    xn("(?:x+)+?", "", @as(c_int, 419));
    xx2("(?:x+)+?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 420));
    xx2("(?:x+)+?", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 421));
    xx2("(?:x??)?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 422));
    xx2("(?:x??)?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 423));
    xx2("(?:x??)?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 424));
    xx2("(?:x??)*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 425));
    xx2("(?:x??)*", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 426));
    xx2("(?:x??)*", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 427));
    xx2("(?:x??)+", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 428));
    xx2("(?:x??)+", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 429));
    xx2("(?:x??)+", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 430));
    xx2("(?:x??)??", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 431));
    xx2("(?:x??)??", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 432));
    xx2("(?:x??)??", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 433));
    xx2("(?:x??)*?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 434));
    xx2("(?:x??)*?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 435));
    xx2("(?:x??)*?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 436));
    xx2("(?:x??)+?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 437));
    xx2("(?:x??)+?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 438));
    xx2("(?:x??)+?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 439));
    xx2("(?:x*?)?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 440));
    xx2("(?:x*?)?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 441));
    xx2("(?:x*?)?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 442));
    xx2("(?:x*?)*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 443));
    xx2("(?:x*?)*", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 444));
    xx2("(?:x*?)*", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 445));
    xx2("(?:x*?)+", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 446));
    xx2("(?:x*?)+", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 447));
    xx2("(?:x*?)+", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 448));
    xx2("(?:x*?)??", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 449));
    xx2("(?:x*?)??", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 450));
    xx2("(?:x*?)??", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 451));
    xx2("(?:x*?)*?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 452));
    xx2("(?:x*?)*?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 453));
    xx2("(?:x*?)*?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 454));
    xx2("(?:x*?)+?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 455));
    xx2("(?:x*?)+?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 456));
    xx2("(?:x*?)+?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 457));
    xx2("(?:x+?)?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 458));
    xx2("(?:x+?)?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 459));
    xx2("(?:x+?)?", "xx", @as(c_int, 0), @as(c_int, 1), @as(c_int, 460));
    xx2("(?:x+?)*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 461));
    xx2("(?:x+?)*", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 462));
    xx2("(?:x+?)*", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 463));
    xn("(?:x+?)+", "", @as(c_int, 464));
    xx2("(?:x+?)+", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 465));
    xx2("(?:x+?)+", "xx", @as(c_int, 0), @as(c_int, 2), @as(c_int, 466));
    xx2("(?:x+?)??", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 467));
    xx2("(?:x+?)??", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 468));
    xx2("(?:x+?)??", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 469));
    xx2("(?:x+?)*?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 470));
    xx2("(?:x+?)*?", "x", @as(c_int, 0), @as(c_int, 0), @as(c_int, 471));
    xx2("(?:x+?)*?", "xx", @as(c_int, 0), @as(c_int, 0), @as(c_int, 472));
    xn("(?:x+?)+?", "", @as(c_int, 473));
    xx2("(?:x+?)+?", "x", @as(c_int, 0), @as(c_int, 1), @as(c_int, 474));
    xx2("(?:x+?)+?", "xx", @as(c_int, 0), @as(c_int, 1), @as(c_int, 475));
    xx2("a|b", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 476));
    xx2("a|b", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 477));
    xx2("|a", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 478));
    xx2("(|a)", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 479));
    xx2("ab|bc", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 480));
    xx2("ab|bc", "bc", @as(c_int, 0), @as(c_int, 2), @as(c_int, 481));
    xx2("z(?:ab|bc)", "zbc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 482));
    xx2("a(?:ab|bc)c", "aabc", @as(c_int, 0), @as(c_int, 4), @as(c_int, 483));
    xx2("ab|(?:ac|az)", "az", @as(c_int, 0), @as(c_int, 2), @as(c_int, 484));
    xx2("a|b|c", "dc", @as(c_int, 1), @as(c_int, 2), @as(c_int, 485));
    xx2("a|b|cd|efg|h|ijk|lmn|o|pq|rstuvwx|yz", "pqr", @as(c_int, 0), @as(c_int, 2), @as(c_int, 486));
    xn("a|b|cd|efg|h|ijk|lmn|o|pq|rstuvwx|yz", "mn", @as(c_int, 487));
    xx2("a|^z", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 488));
    xx2("a|^z", "za", @as(c_int, 0), @as(c_int, 1), @as(c_int, 489));
    xx2("a|\\Gz", "bza", @as(c_int, 2), @as(c_int, 3), @as(c_int, 490));
    xx2("a|\\Gz", "za", @as(c_int, 0), @as(c_int, 1), @as(c_int, 491));
    xx2("a|\\Az", "bza", @as(c_int, 2), @as(c_int, 3), @as(c_int, 492));
    xx2("a|\\Az", "za", @as(c_int, 0), @as(c_int, 1), @as(c_int, 493));
    xx2("a|b\\Z", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 494));
    xx2("a|b\\Z", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 495));
    xx2("a|b\\z", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 496));
    xx2("a|b\\z", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 497));
    xx2("\\w|\\s", " ", @as(c_int, 0), @as(c_int, 1), @as(c_int, 498));
    xn("\\w|\\w", " ", @as(c_int, 499));
    xx2("\\w|%", "%", @as(c_int, 0), @as(c_int, 1), @as(c_int, 500));
    xx2("\\w|[&$]", "&", @as(c_int, 0), @as(c_int, 1), @as(c_int, 501));
    xx2("[b-d]|[^e-z]", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 502));
    xx2("(?:a|[c-f])|bz", "dz", @as(c_int, 0), @as(c_int, 1), @as(c_int, 503));
    xx2("(?:a|[c-f])|bz", "bz", @as(c_int, 0), @as(c_int, 2), @as(c_int, 504));
    xx2("abc|(?=zz)..f", "zzf", @as(c_int, 0), @as(c_int, 3), @as(c_int, 505));
    xx2("abc|(?!zz)..f", "abf", @as(c_int, 0), @as(c_int, 3), @as(c_int, 506));
    xx2("(?=za)..a|(?=zz)..a", "zza", @as(c_int, 0), @as(c_int, 3), @as(c_int, 507));
    xn("(?>a|abd)c", "abdc", @as(c_int, 508));
    xx2("(?>abd|a)c", "abdc", @as(c_int, 0), @as(c_int, 4), @as(c_int, 509));
    xx2("a?|b", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 510));
    xx2("a?|b", "b", @as(c_int, 0), @as(c_int, 0), @as(c_int, 511));
    xx2("a?|b", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 512));
    xx2("a*|b", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 513));
    xx2("a*|b*", "ba", @as(c_int, 0), @as(c_int, 0), @as(c_int, 514));
    xx2("a*|b*", "ab", @as(c_int, 0), @as(c_int, 1), @as(c_int, 515));
    xx2("a+|b*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 516));
    xx2("a+|b*", "bbb", @as(c_int, 0), @as(c_int, 3), @as(c_int, 517));
    xx2("a+|b*", "abbb", @as(c_int, 0), @as(c_int, 1), @as(c_int, 518));
    xn("a+|b+", "", @as(c_int, 519));
    xx2("(a|b)?", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 520));
    xx2("(a|b)*", "ba", @as(c_int, 0), @as(c_int, 2), @as(c_int, 521));
    xx2("(a|b)+", "bab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 522));
    xx2("(ab|ca)+", "caabbc", @as(c_int, 0), @as(c_int, 4), @as(c_int, 523));
    xx2("(ab|ca)+", "aabca", @as(c_int, 1), @as(c_int, 5), @as(c_int, 524));
    xx2("(ab|ca)+", "abzca", @as(c_int, 0), @as(c_int, 2), @as(c_int, 525));
    xx2("(a|bab)+", "ababa", @as(c_int, 0), @as(c_int, 5), @as(c_int, 526));
    xx2("(a|bab)+", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 527));
    xx2("(a|bab)+", "baaaba", @as(c_int, 1), @as(c_int, 4), @as(c_int, 528));
    xx2("(?:a|b)(?:a|b)", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 529));
    xx2("(?:a*|b*)(?:a*|b*)", "aaabbb", @as(c_int, 0), @as(c_int, 3), @as(c_int, 530));
    xx2("(?:a*|b*)(?:a+|b+)", "aaabbb", @as(c_int, 0), @as(c_int, 6), @as(c_int, 531));
    xx2("(?:a+|b+){2}", "aaabbb", @as(c_int, 0), @as(c_int, 6), @as(c_int, 532));
    xx2("h{0,}", "hhhh", @as(c_int, 0), @as(c_int, 4), @as(c_int, 533));
    xx2("(?:a+|b+){1,2}", "aaabbb", @as(c_int, 0), @as(c_int, 6), @as(c_int, 534));
    xn("ax{2}*a", "0axxxa1", @as(c_int, 535));
    xn("a.{0,2}a", "0aXXXa0", @as(c_int, 536));
    xn("a.{0,2}?a", "0aXXXa0", @as(c_int, 537));
    xn("a.{0,2}?a", "0aXXXXa0", @as(c_int, 538));
    xx2("^a{2,}?a$", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 539));
    xx2("^[a-z]{2,}?$", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 540));
    xx2("(?:a+|\\Ab*)cc", "cc", @as(c_int, 0), @as(c_int, 2), @as(c_int, 541));
    xn("(?:a+|\\Ab*)cc", "abcc", @as(c_int, 542));
    xx2("(?:^a+|b+)*c", "aabbbabc", @as(c_int, 6), @as(c_int, 8), @as(c_int, 543));
    xx2("(?:^a+|b+)*c", "aabbbbc", @as(c_int, 0), @as(c_int, 7), @as(c_int, 544));
    xx2("a|(?i)c", "C", @as(c_int, 0), @as(c_int, 1), @as(c_int, 545));
    xx2("(?i)c|a", "C", @as(c_int, 0), @as(c_int, 1), @as(c_int, 546));
    xx2("(?i)c|a", "A", @as(c_int, 0), @as(c_int, 1), @as(c_int, 547));
    xx2("a(?i)b|c", "aB", @as(c_int, 0), @as(c_int, 2), @as(c_int, 548));
    xx2("a(?i)b|c", "aC", @as(c_int, 0), @as(c_int, 2), @as(c_int, 549));
    xn("a(?i)b|c", "AC", @as(c_int, 550));
    xn("a(?:(?i)b)|c", "aC", @as(c_int, 551));
    xx2("(?i:c)|a", "C", @as(c_int, 0), @as(c_int, 1), @as(c_int, 552));
    xn("(?i:c)|a", "A", @as(c_int, 553));
    xx2("[abc]?", "abc", @as(c_int, 0), @as(c_int, 1), @as(c_int, 554));
    xx2("[abc]*", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 555));
    xx2("[^abc]*", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 556));
    xn("[^abc]+", "abc", @as(c_int, 557));
    xx2("a??", "aaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 558));
    xx2("ba??b", "bab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 559));
    xx2("a*?", "aaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 560));
    xx2("ba*?", "baa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 561));
    xx2("ba*?b", "baab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 562));
    xx2("a+?", "aaa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 563));
    xx2("ba+?", "baa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 564));
    xx2("ba+?b", "baab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 565));
    xx2("(?:a?)??", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 566));
    xx2("(?:a??)?", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 567));
    xx2("(?:a?)+?", "aaa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 568));
    xx2("(?:a+)??", "aaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 569));
    xx2("(?:a+)??b", "aaab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 570));
    xx2("(?:ab)?{2}", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 571));
    xx2("(?:ab)?{2}", "ababa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 572));
    xx2("(?:ab)*{0}", "ababa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 573));
    xx2("(?:ab){3,}", "abababab", @as(c_int, 0), @as(c_int, 8), @as(c_int, 574));
    xn("(?:ab){3,}", "abab", @as(c_int, 575));
    xx2("(?:ab){2,4}", "ababab", @as(c_int, 0), @as(c_int, 6), @as(c_int, 576));
    xx2("(?:ab){2,4}", "ababababab", @as(c_int, 0), @as(c_int, 8), @as(c_int, 577));
    xx2("(?:ab){2,4}?", "ababababab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 578));
    xx2("(?:ab){,}", "ab{,}", @as(c_int, 0), @as(c_int, 5), @as(c_int, 579));
    xx2("(?:abc)+?{2}", "abcabcabc", @as(c_int, 0), @as(c_int, 6), @as(c_int, 580));
    xx2("(?:X*)(?i:xa)", "XXXa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 581));
    xx2("(d+)([^abc]z)", "dddz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 582));
    xx2("([^abc]*)([^abc]z)", "dddz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 583));
    xx2("(\\w+)(\\wz)", "dddz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 584));
    xx3("(a)", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 585));
    xx3("(ab)", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1), @as(c_int, 586));
    xx2("((ab))", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 587));
    xx3("((ab))", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1), @as(c_int, 588));
    xx3("((ab))", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 2), @as(c_int, 589));
    xx3("((((((((((((((((((((ab))))))))))))))))))))", "ab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 20), @as(c_int, 590));
    xx3("(ab)(cd)", "abcd", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1), @as(c_int, 591));
    xx3("(ab)(cd)", "abcd", @as(c_int, 2), @as(c_int, 4), @as(c_int, 2), @as(c_int, 592));
    xx3("()(a)bc(def)ghijk", "abcdefghijk", @as(c_int, 3), @as(c_int, 6), @as(c_int, 3), @as(c_int, 593));
    xx3("(()(a)bc(def)ghijk)", "abcdefghijk", @as(c_int, 3), @as(c_int, 6), @as(c_int, 4), @as(c_int, 594));
    xx2("(^a)", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 595));
    xx3("(a)|(a)", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 1), @as(c_int, 596));
    xx3("(^a)|(a)", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 2), @as(c_int, 597));
    xx3("(a?)", "aaa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 598));
    xx3("(a*)", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 599));
    xx3("(a*)", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1), @as(c_int, 600));
    xx3("(a+)", "aaaaaaa", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1), @as(c_int, 601));
    xx3("(a+|b*)", "bbbaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 602));
    xx3("(a+|b?)", "bbbaa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 603));
    xx3("(abc)?", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 604));
    xx3("(abc)*", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 605));
    xx3("(abc)+", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 606));
    xx3("(xyz|abc)+", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 607));
    xx3("([xyz][abc]|abc)+", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 608));
    xx3("((?i:abc))", "AbC", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 609));
    xx2("(abc)(?i:\\1)", "abcABC", @as(c_int, 0), @as(c_int, 6), @as(c_int, 610));
    xx3("((?m:a.c))", "a\nc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 611));
    xx3("((?=az)a)", "azb", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 612));
    xx3("abc|(.abd)", "zabd", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1), @as(c_int, 613));
    xx2("(?:abc)|(ABC)", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 614));
    xx3("(?i:(abc))|(zzz)", "ABC", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 615));
    xx3("a*(.)", "aaaaz", @as(c_int, 4), @as(c_int, 5), @as(c_int, 1), @as(c_int, 616));
    xx3("a*?(.)", "aaaaz", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 617));
    xx3("a*?(c)", "aaaac", @as(c_int, 4), @as(c_int, 5), @as(c_int, 1), @as(c_int, 618));
    xx3("[bcd]a*(.)", "caaaaz", @as(c_int, 5), @as(c_int, 6), @as(c_int, 1), @as(c_int, 619));
    xx3("(\\Abb)cc", "bbcc", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1), @as(c_int, 620));
    xn("(\\Abb)cc", "zbbcc", @as(c_int, 621));
    xx3("(^bb)cc", "bbcc", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1), @as(c_int, 622));
    xn("(^bb)cc", "zbbcc", @as(c_int, 623));
    xx3("cc(bb$)", "ccbb", @as(c_int, 2), @as(c_int, 4), @as(c_int, 1), @as(c_int, 624));
    xn("cc(bb$)", "ccbbb", @as(c_int, 625));
    xn("(\\1)", "", @as(c_int, 626));
    xn("\\1(a)", "aa", @as(c_int, 627));
    xn("(a(b)\\1)\\2+", "ababb", @as(c_int, 628));
    xn("(?:(?:\\1|z)(a))+$", "zaa", @as(c_int, 629));
    xx2("(?:(?:\\1|z)(a))+$", "zaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 630));
    xx2("(a)(?=\\1)", "aa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 631));
    xn("(a)$|\\1", "az", @as(c_int, 632));
    xx2("(a)\\1", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 633));
    xn("(a)\\1", "ab", @as(c_int, 634));
    xx2("(a?)\\1", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 635));
    xx2("(a??)\\1", "aa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 636));
    xx2("(a*)\\1", "aaaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 637));
    xx3("(a*)\\1", "aaaaa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1), @as(c_int, 638));
    xx2("a(b*)\\1", "abbbb", @as(c_int, 0), @as(c_int, 5), @as(c_int, 639));
    xx2("a(b*)\\1", "ab", @as(c_int, 0), @as(c_int, 1), @as(c_int, 640));
    xx2("(a*)(b*)\\1\\2", "aaabbaaabb", @as(c_int, 0), @as(c_int, 10), @as(c_int, 641));
    xx2("(a*)(b*)\\2", "aaabbbb", @as(c_int, 0), @as(c_int, 7), @as(c_int, 642));
    xx2("(((((((a*)b))))))c\\7", "aaabcaaa", @as(c_int, 0), @as(c_int, 8), @as(c_int, 643));
    xx3("(((((((a*)b))))))c\\7", "aaabcaaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 7), @as(c_int, 644));
    xx2("(a)(b)(c)\\2\\1\\3", "abcbac", @as(c_int, 0), @as(c_int, 6), @as(c_int, 645));
    xx2("([a-d])\\1", "cc", @as(c_int, 0), @as(c_int, 2), @as(c_int, 646));
    xx2("(\\w\\d\\s)\\1", "f5 f5 ", @as(c_int, 0), @as(c_int, 6), @as(c_int, 647));
    xn("(\\w\\d\\s)\\1", "f5 f5", @as(c_int, 648));
    xx2("(who|[a-c]{3})\\1", "whowho", @as(c_int, 0), @as(c_int, 6), @as(c_int, 649));
    xx2("...(who|[a-c]{3})\\1", "abcwhowho", @as(c_int, 0), @as(c_int, 9), @as(c_int, 650));
    xx2("(who|[a-c]{3})\\1", "cbccbc", @as(c_int, 0), @as(c_int, 6), @as(c_int, 651));
    xx2("(^a)\\1", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 652));
    xn("(^a)\\1", "baa", @as(c_int, 653));
    xn("(a$)\\1", "aa", @as(c_int, 654));
    xn("(ab\\Z)\\1", "ab", @as(c_int, 655));
    xx2("(a*\\Z)\\1", "a", @as(c_int, 1), @as(c_int, 1), @as(c_int, 656));
    xx2(".(a*\\Z)\\1", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 657));
    xx3("(.(abc)\\2)", "zabcabc", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1), @as(c_int, 658));
    xx3("(.(..\\d.)\\2)", "z12341234", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 659));
    xx2("((?i:az))\\1", "AzAz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 660));
    xn("((?i:az))\\1", "Azaz", @as(c_int, 661));
    xx2("(?<=a)b", "ab", @as(c_int, 1), @as(c_int, 2), @as(c_int, 662));
    xn("(?<=a)b", "bb", @as(c_int, 663));
    xx2("(?<=a|b)b", "bb", @as(c_int, 1), @as(c_int, 2), @as(c_int, 664));
    xx2("(?<=a|bc)b", "bcb", @as(c_int, 2), @as(c_int, 3), @as(c_int, 665));
    xx2("(?<=a|bc)b", "ab", @as(c_int, 1), @as(c_int, 2), @as(c_int, 666));
    xx2("(?<=a|bc||defghij|klmnopq|r)z", "rz", @as(c_int, 1), @as(c_int, 2), @as(c_int, 667));
    xx3("(?<=(abc))d", "abcd", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 668));
    xx2("(?<=(?i:abc))d", "ABCd", @as(c_int, 3), @as(c_int, 4), @as(c_int, 669));
    xx2("(?<=^|b)c", " cbc", @as(c_int, 3), @as(c_int, 4), @as(c_int, 670));
    xx2("(?<=a|^|b)c", " cbc", @as(c_int, 3), @as(c_int, 4), @as(c_int, 671));
    xx2("(?<=a|(^)|b)c", " cbc", @as(c_int, 3), @as(c_int, 4), @as(c_int, 672));
    xx2("(?<=a|(^)|b)c", "cbc", @as(c_int, 0), @as(c_int, 1), @as(c_int, 673));
    xn("(Q)|(?<=a|(?(1))|b)c", "czc", @as(c_int, 674));
    xx2("(Q)(?<=a|(?(1))|b)c", "cQc", @as(c_int, 1), @as(c_int, 3), @as(c_int, 675));
    xx2("(?<=a|(?~END)|b)c", "ENDc", @as(c_int, 3), @as(c_int, 4), @as(c_int, 676));
    xn("(?<!^|b)c", "cbc", @as(c_int, 677));
    xn("(?<!a|^|b)c", "cbc", @as(c_int, 678));
    xn("(?<!a|(?:^)|b)c", "cbc", @as(c_int, 679));
    xx2("(?<!a|(?:^)|b)c", " cbc", @as(c_int, 1), @as(c_int, 2), @as(c_int, 680));
    xx2("(a)\\g<1>", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 681));
    xx2("(?<!a)b", "cb", @as(c_int, 1), @as(c_int, 2), @as(c_int, 682));
    xn("(?<!a)b", "ab", @as(c_int, 683));
    xx2("(?<!a|bc)b", "bbb", @as(c_int, 0), @as(c_int, 1), @as(c_int, 684));
    xn("(?<!a|bc)z", "bcz", @as(c_int, 685));
    xx2("(?<name1>a)", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 686));
    xx2("(?<name_2>ab)\\g<name_2>", "abab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 687));
    xx2("(?<name_3>.zv.)\\k<name_3>", "azvbazvb", @as(c_int, 0), @as(c_int, 8), @as(c_int, 688));
    xx2("(?<=\\g<ab>)|-\\zEND (?<ab>XyZ)", "XyZ", @as(c_int, 3), @as(c_int, 3), @as(c_int, 689));
    xx2("(?<n>|a\\g<n>)+", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 690));
    xx2("(?<n>|\\(\\g<n>\\))+$", "()(())", @as(c_int, 0), @as(c_int, 6), @as(c_int, 691));
    xx3("\\g<n>(?<n>.){0}", "X", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 692));
    xx2("\\g<n>(abc|df(?<n>.YZ){2,8}){0}", "XYZ", @as(c_int, 0), @as(c_int, 3), @as(c_int, 693));
    xx2("\\A(?<n>(a\\g<n>)|)\\z", "aaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 694));
    xx2("(?<n>|\\g<m>\\g<n>)\\z|\\zEND (?<m>a|(b)\\g<m>)", "bbbbabba", @as(c_int, 0), @as(c_int, 8), @as(c_int, 695));
    xx2("(?<name1240>\\w+\\sx)a+\\k<name1240>", "  fg xaaaaaaaafg x", @as(c_int, 2), @as(c_int, 18), @as(c_int, 696));
    xx3("(z)()()(?<_9>a)\\g<_9>", "zaa", @as(c_int, 2), @as(c_int, 3), @as(c_int, 1), @as(c_int, 697));
    xx2("(.)(((?<_>a)))\\k<_>", "zaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 698));
    xx2("((?<name1>\\d)|(?<name2>\\w))(\\k<name1>|\\k<name2>)", "ff", @as(c_int, 0), @as(c_int, 2), @as(c_int, 699));
    xx2("(?:(?<x>)|(?<x>efg))\\k<x>", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 700));
    xx2("(?:(?<x>abc)|(?<x>efg))\\k<x>", "abcefgefg", @as(c_int, 3), @as(c_int, 9), @as(c_int, 701));
    xn("(?:(?<x>abc)|(?<x>efg))\\k<x>", "abcefg", @as(c_int, 702));
    xx2("(?:(?<n1>.)|(?<n1>..)|(?<n1>...)|(?<n1>....)|(?<n1>.....)|(?<n1>......)|(?<n1>.......)|(?<n1>........)|(?<n1>.........)|(?<n1>..........)|(?<n1>...........)|(?<n1>............)|(?<n1>.............)|(?<n1>..............))\\k<n1>$", "a-pyumpyum", @as(c_int, 2), @as(c_int, 10), @as(c_int, 703));
    xx3("(?:(?<n1>.)|(?<n1>..)|(?<n1>...)|(?<n1>....)|(?<n1>.....)|(?<n1>......)|(?<n1>.......)|(?<n1>........)|(?<n1>.........)|(?<n1>..........)|(?<n1>...........)|(?<n1>............)|(?<n1>.............)|(?<n1>..............))\\k<n1>$", "xxxxabcdefghijklmnabcdefghijklmn", @as(c_int, 4), @as(c_int, 18), @as(c_int, 14), @as(c_int, 704));
    xx3("(?<name1>)(?<name2>)(?<name3>)(?<name4>)(?<name5>)(?<name6>)(?<name7>)(?<name8>)(?<name9>)(?<name10>)(?<name11>)(?<name12>)(?<name13>)(?<name14>)(?<name15>)(?<name16>aaa)(?<name17>)$", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 16), @as(c_int, 705));
    xx2("(?<foo>a|\\(\\g<foo>\\))", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 706));
    xx2("(?<foo>a|\\(\\g<foo>\\))", "((((((a))))))", @as(c_int, 0), @as(c_int, 13), @as(c_int, 707));
    xx3("(?<foo>a|\\(\\g<foo>\\))", "((((((((a))))))))", @as(c_int, 0), @as(c_int, 17), @as(c_int, 1), @as(c_int, 708));
    xx2("\\g<bar>|\\zEND(?<bar>.*abc$)", "abcxxxabc", @as(c_int, 0), @as(c_int, 9), @as(c_int, 709));
    xx2("\\g<1>|\\zEND(.a.)", "bac", @as(c_int, 0), @as(c_int, 3), @as(c_int, 710));
    xx3("\\g<_A>\\g<_A>|\\zEND(.a.)(?<_A>.b.)", "xbxyby", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1), @as(c_int, 711));
    xx2("\\A(?:\\g<pon>|\\g<pan>|\\zEND  (?<pan>a|c\\g<pon>c)(?<pon>b|d\\g<pan>d))$", "cdcbcdc", @as(c_int, 0), @as(c_int, 7), @as(c_int, 712));
    xx2("\\A(?<n>|a\\g<m>)\\z|\\zEND (?<m>\\g<n>)", "aaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 713));
    xx2("(?<n>(a|b\\g<n>c){3,5})", "baaaaca", @as(c_int, 1), @as(c_int, 5), @as(c_int, 714));
    xx2("(?<n>(a|b\\g<n>c){3,5})", "baaaacaaaaa", @as(c_int, 0), @as(c_int, 10), @as(c_int, 715));
    xx2("(?<pare>\\(([^\\(\\)]++|\\g<pare>)*+\\))", "((a))", @as(c_int, 0), @as(c_int, 5), @as(c_int, 716));
    xx2("()*\\1", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 717));
    xx2("(?:()|())*\\1\\2", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 718));
    xx2("(?:a*|b*)*c", "abadc", @as(c_int, 4), @as(c_int, 5), @as(c_int, 719));
    xx3("(?:\\1a|())*", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1), @as(c_int, 720));
    xx2("x((.)*)*x", "0x1x2x3", @as(c_int, 1), @as(c_int, 6), @as(c_int, 721));
    xx2("x((.)*)*x(?i:\\1)\\Z", "0x1x2x1X2", @as(c_int, 1), @as(c_int, 9), @as(c_int, 722));
    xx2("(?:()|()|()|()|()|())*\\2\\5", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 723));
    xx2("(?:()|()|()|(x)|()|())*\\2b\\5", "b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 724));
    xx2("[0-9-a]", "-", @as(c_int, 0), @as(c_int, 1), @as(c_int, 725));
    xn("[0-9-a]", ":", @as(c_int, 726));
    xx3("(\\(((?:[^(]|\\g<1>)*)\\))", "(abc)(abc)", @as(c_int, 1), @as(c_int, 4), @as(c_int, 2), @as(c_int, 727));
    xx2("\\o{101}", "A", @as(c_int, 0), @as(c_int, 1), @as(c_int, 728));
    xx2("\\A(a|b\\g<1>c)\\k<1+3>\\z", "bbacca", @as(c_int, 0), @as(c_int, 6), @as(c_int, 729));
    xn("\\A(a|b\\g<1>c)\\k<1+3>\\z", "bbaccb", @as(c_int, 730));
    xx2("(?i)\\A(a|b\\g<1>c)\\k<1+2>\\z", "bBACcbac", @as(c_int, 0), @as(c_int, 8), @as(c_int, 731));
    xx2("(?i)(?<X>aa)|(?<X>bb)\\k<X>", "BBbb", @as(c_int, 0), @as(c_int, 4), @as(c_int, 732));
    xx2("(?:\\k\'+1\'B|(A)C)*", "ACAB", @as(c_int, 0), @as(c_int, 4), @as(c_int, 733));
    xx2("\\g<+2>(abc)(ABC){0}", "ABCabc", @as(c_int, 0), @as(c_int, 6), @as(c_int, 734));
    xx2("A\\g\'0\'|B()", "AAAAB", @as(c_int, 0), @as(c_int, 5), @as(c_int, 735));
    xx3("(A\\g\'0\')|B", "AAAAB", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1), @as(c_int, 736));
    xx2("(a*)(?(1))aa", "aaaaa", @as(c_int, 0), @as(c_int, 5), @as(c_int, 737));
    xx2("(a*)(?(-1))aa", "aaaaa", @as(c_int, 0), @as(c_int, 5), @as(c_int, 738));
    xx2("(?<name>aaa)(?(\'name\'))aa", "aaaaa", @as(c_int, 0), @as(c_int, 5), @as(c_int, 739));
    xx2("(a)(?(1)aa|bb)a", "aaaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 740));
    xx2("(?:aa|())(?(<1>)aa|bb)a", "aabba", @as(c_int, 0), @as(c_int, 5), @as(c_int, 741));
    xx2("(?:aa|())(?(\'1\')aa|bb|cc)a", "aacca", @as(c_int, 0), @as(c_int, 5), @as(c_int, 742));
    xx3("(a*)(?(1)aa|a)b", "aaab", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 743));
    xn("(a)(?(1)a|b)c", "abc", @as(c_int, 744));
    xx2("(a)(?(1)|)c", "ac", @as(c_int, 0), @as(c_int, 2), @as(c_int, 745));
    xn("(?()aaa|bbb)", "bbb", @as(c_int, 746));
    xx2("(a)(?(1+0)b|c)d", "abd", @as(c_int, 0), @as(c_int, 3), @as(c_int, 747));
    xx2("(?:(?\'name\'a)|(?\'name\'b))(?(\'name\')c|d)e", "ace", @as(c_int, 0), @as(c_int, 3), @as(c_int, 748));
    xx2("(?:(?\'name\'a)|(?\'name\'b))(?(\'name\')c|d)e", "bce", @as(c_int, 0), @as(c_int, 3), @as(c_int, 749));
    xx2("\\R", "\r\n", @as(c_int, 0), @as(c_int, 2), @as(c_int, 750));
    xx2("\\R", "\r", @as(c_int, 0), @as(c_int, 1), @as(c_int, 751));
    xx2("\\R", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 752));
    xx2("\\R", "\x0b", @as(c_int, 0), @as(c_int, 1), @as(c_int, 753));
    xn("\\R\\n", "\r\n", @as(c_int, 754));
    xx2("\\R", "\xc2\x85", @as(c_int, 0), @as(c_int, 2), @as(c_int, 755));
    xx2("\\N", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 756));
    xn("\\N", "\n", @as(c_int, 757));
    xn("(?m:\\N)", "\n", @as(c_int, 758));
    xn("(?-m:\\N)", "\n", @as(c_int, 759));
    xx2("\\O", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 760));
    xx2("\\O", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 761));
    xx2("(?m:\\O)", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 762));
    xx2("(?-m:\\O)", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 763));
    xx2("\\K", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 764));
    xx2("a\\K", "a", @as(c_int, 1), @as(c_int, 1), @as(c_int, 765));
    xx2("a\\Kb", "ab", @as(c_int, 1), @as(c_int, 2), @as(c_int, 766));
    xx2("(a\\Kb|ac\\Kd)", "acd", @as(c_int, 2), @as(c_int, 3), @as(c_int, 767));
    xx2("(a\\Kb|\\Kac\\K)*", "acababacab", @as(c_int, 9), @as(c_int, 10), @as(c_int, 768));
    xx2("(?:()|())*\\1", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 769));
    xx2("(?:()|())*\\2", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 770));
    xx2("(?:()|()|())*\\3\\1", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 771));
    xx2("(|(?:a(?:\\g\'1\')*))b|", "abc", @as(c_int, 0), @as(c_int, 2), @as(c_int, 772));
    xx2("^(\"|)(.*)\\1$", "XX", @as(c_int, 0), @as(c_int, 2), @as(c_int, 773));
    xx2("(abc|def|ghi|jkl|mno|pqr|stu){0,10}?\\z", "admno", @as(c_int, 2), @as(c_int, 5), @as(c_int, 774));
    xx2("(abc|(def|ghi|jkl|mno|pqr){0,7}?){5}\\z", "adpqrpqrpqr", @as(c_int, 2), @as(c_int, 11), @as(c_int, 775));
    xx2("(?!abc).*\\z", "abcde", @as(c_int, 1), @as(c_int, 5), @as(c_int, 776));
    xx2("(.{2,})?", "abcde", @as(c_int, 0), @as(c_int, 5), @as(c_int, 777));
    xx2("((a|b|c|d|e|f|g|h|i|j|k|l|m|n)+)?", "abcde", @as(c_int, 0), @as(c_int, 5), @as(c_int, 778));
    xx2("((a|b|c|d|e|f|g|h|i|j|k|l|m|n){3,})?", "abcde", @as(c_int, 0), @as(c_int, 5), @as(c_int, 779));
    xx2("((?:a(?:b|c|d|e|f|g|h|i|j|k|l|m|n))+)?", "abacadae", @as(c_int, 0), @as(c_int, 8), @as(c_int, 780));
    xx2("((?:a(?:b|c|d|e|f|g|h|i|j|k|l|m|n))+?)?z", "abacadaez", @as(c_int, 0), @as(c_int, 9), @as(c_int, 781));
    xx2("\\A((a|b)??)?z", "bz", @as(c_int, 0), @as(c_int, 2), @as(c_int, 782));
    xx2("((?<x>abc){0}a\\g<x>d)+", "aabcd", @as(c_int, 0), @as(c_int, 5), @as(c_int, 783));
    xx2("((?(abc)true|false))+", "false", @as(c_int, 0), @as(c_int, 5), @as(c_int, 784));
    xx2("((?i:abc)d)+", "abcdABCd", @as(c_int, 0), @as(c_int, 8), @as(c_int, 785));
    xx2("((?<!abc)def)+", "bcdef", @as(c_int, 2), @as(c_int, 5), @as(c_int, 786));
    xx2("(\\ba)+", "aaa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 787));
    xx2("()(?<x>ab)(?(<x>)a|b)", "aba", @as(c_int, 0), @as(c_int, 3), @as(c_int, 788));
    xx2("(?<=a.b)c", "azbc", @as(c_int, 3), @as(c_int, 4), @as(c_int, 789));
    xn("(?<=(?:abcde){30})z", "abc", @as(c_int, 790));
    xx2("(?<=(?(a)a|bb))z", "aaz", @as(c_int, 2), @as(c_int, 3), @as(c_int, 791));
    xx2("[a]*\\W", "aa@", @as(c_int, 0), @as(c_int, 3), @as(c_int, 792));
    xx2("[a]*[b]", "aab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 793));
    xn("a*\\W", "aaa", @as(c_int, 794));
    xn("(?W)a*\\W", "aaa", @as(c_int, 795));
    xx2("(?<=ab(?<=ab))", "ab", @as(c_int, 2), @as(c_int, 2), @as(c_int, 796));
    xx2("(?<x>a)(?<x>b)(\\k<x>)+", "abbaab", @as(c_int, 0), @as(c_int, 6), @as(c_int, 797));
    xx2("()(\\1)(\\2)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 798));
    xx2("((?(a)b|c))(\\1)", "abab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 799));
    xx2("(?<x>$|b\\g<x>)", "bbb", @as(c_int, 0), @as(c_int, 3), @as(c_int, 800));
    xx2("(?<x>(?(a)a|b)|c\\g<x>)", "cccb", @as(c_int, 0), @as(c_int, 4), @as(c_int, 801));
    xx2("(a)(?(1)a*|b*)+", "aaaa", @as(c_int, 0), @as(c_int, 4), @as(c_int, 802));
    xx2("[[^abc]&&cde]*", "de", @as(c_int, 0), @as(c_int, 2), @as(c_int, 803));
    xn("(a){10}{10}", "aa", @as(c_int, 804));
    xx2("(?:a?)+", "aa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 805));
    xx2("(?:a?)*?", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 806));
    xx2("(?:a*)*?", "a", @as(c_int, 0), @as(c_int, 0), @as(c_int, 807));
    xx2("(?:a+?)*", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 808));
    xx2("\\h", "5", @as(c_int, 0), @as(c_int, 1), @as(c_int, 809));
    xx2("\\H", "z", @as(c_int, 0), @as(c_int, 1), @as(c_int, 810));
    xx2("[\\h]", "5", @as(c_int, 0), @as(c_int, 1), @as(c_int, 811));
    xx2("[\\H]", "z", @as(c_int, 0), @as(c_int, 1), @as(c_int, 812));
    xx2("[\\o{101}]", "A", @as(c_int, 0), @as(c_int, 1), @as(c_int, 813));
    xx2("[\\u0041]", "A", @as(c_int, 0), @as(c_int, 1), @as(c_int, 814));
    xx2("(?~)", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 816));
    xx2("(?~)", "A", @as(c_int, 0), @as(c_int, 0), @as(c_int, 817));
    xx2("(?~ab)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 818));
    xx2("(?~abc)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 819));
    xx2("(?~abc|ab)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 820));
    xx2("(?~ab|abc)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 821));
    xx2("(?~a.c)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 822));
    xx2("(?~a.c|ab)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 823));
    xx2("(?~ab|a.c)", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 824));
    xx2("aaaaa(?~)", "aaaaaaaaaa", @as(c_int, 0), @as(c_int, 5), @as(c_int, 825));
    xx2("(?~(?:|aaa))", "aaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 826));
    xx2("(?~aaa|)", "aaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 827));
    xx2("a(?~(?~)).", "abcdefghijklmnopqrstuvwxyz", @as(c_int, 0), @as(c_int, 26), @as(c_int, 828));
    xx2("/\\*(?~\\*/)\\*/", "/* */ */", @as(c_int, 0), @as(c_int, 5), @as(c_int, 829));
    xx2("(?~\\w+)zzzzz", "zzzzz", @as(c_int, 0), @as(c_int, 5), @as(c_int, 830));
    xx2("(?~\\w*)zzzzz", "zzzzz", @as(c_int, 0), @as(c_int, 5), @as(c_int, 831));
    xx2("(?~A.C|B)", "ABC", @as(c_int, 0), @as(c_int, 0), @as(c_int, 832));
    xx2("(?~XYZ|ABC)a", "ABCa", @as(c_int, 1), @as(c_int, 4), @as(c_int, 833));
    xx2("(?~XYZ|ABC)a", "aABCa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 834));
    xx2("<[^>]*>(?~[<>])</[^>]*>", "<a>vvv</a>   <b>  </b>", @as(c_int, 0), @as(c_int, 10), @as(c_int, 835));
    xx2("(?~ab)", "ccc\ndab", @as(c_int, 0), @as(c_int, 5), @as(c_int, 836));
    xx2("(?m:(?~ab))", "ccc\ndab", @as(c_int, 0), @as(c_int, 5), @as(c_int, 837));
    xx2("(?-m:(?~ab))", "ccc\ndab", @as(c_int, 0), @as(c_int, 5), @as(c_int, 838));
    xx2("(?~abc)xyz", "xyz012345678901234567890123456789abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 839));
    xx2("(?~|78|\\d*)", "123456789", @as(c_int, 0), @as(c_int, 6), @as(c_int, 842));
    xx2("(?~|def|(?:abc|de|f){0,100})", "abcdedeabcfdefabc", @as(c_int, 0), @as(c_int, 11), @as(c_int, 843));
    xx2("(?~|ab|.*)", "ccc\nddd", @as(c_int, 0), @as(c_int, 3), @as(c_int, 844));
    xx2("(?~|ab|\\O*)", "ccc\ndab", @as(c_int, 0), @as(c_int, 5), @as(c_int, 845));
    xx2("(?~|ab|\\O{2,10})", "ccc\ndab", @as(c_int, 0), @as(c_int, 5), @as(c_int, 846));
    xx2("(?~|ab|\\O{1,10})", "ab", @as(c_int, 1), @as(c_int, 2), @as(c_int, 847));
    xn("(?~|ab|\\O{2,10})", "ab", @as(c_int, 848));
    xx2("(?~|abc|\\O{1,10})", "abc", @as(c_int, 1), @as(c_int, 3), @as(c_int, 849));
    xx2("(?~|ab|\\O{5,10})|abc", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 850));
    xx2("(?~|ab|\\O{1,10})", "cccccccccccab", @as(c_int, 0), @as(c_int, 10), @as(c_int, 851));
    xx2("(?~|aaa|)", "aaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 852));
    xx2("(?~||a*)", "aaaaaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 853));
    xx2("(?~||a*?)", "aaaaaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 854));
    xx2("(a)(?~|b|\\1)", "aaaaaa", @as(c_int, 0), @as(c_int, 2), @as(c_int, 855));
    xx2("(a)(?~|bb|(?:a\\1)*)", "aaaaaa", @as(c_int, 0), @as(c_int, 5), @as(c_int, 856));
    xx2("(b|c)(?~|abac|(?:a\\1)*)", "abababacabab", @as(c_int, 1), @as(c_int, 4), @as(c_int, 857));
    xn("(?~|c|a*+)a", "aaaaa", @as(c_int, 858));
    xx2("(?~|aaaaa|a*+)", "aaaaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 859));
    xx2("(?~|aaaaaa|a*+)b", "aaaaaab", @as(c_int, 1), @as(c_int, 7), @as(c_int, 860));
    xx2("(?~|abcd|(?>))", "zzzabcd", @as(c_int, 0), @as(c_int, 0), @as(c_int, 861));
    xx2("(?~|abc|a*?)", "aaaabc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 862));
    xx2("(?~|abc)a*", "aaaaaabc", @as(c_int, 0), @as(c_int, 5), @as(c_int, 865));
    xx2("(?~|abc)a*z|aaaaaabc", "aaaaaabc", @as(c_int, 0), @as(c_int, 8), @as(c_int, 866));
    xx2("(?~|aaaaaa)a*", "aaaaaa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 867));
    xx2("(?~|abc)aaaa|aaaabc", "aaaabc", @as(c_int, 0), @as(c_int, 6), @as(c_int, 868));
    xx2("(?>(?~|abc))aaaa|aaaabc", "aaaabc", @as(c_int, 0), @as(c_int, 6), @as(c_int, 869));
    xx2("(?~|)a", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 870));
    xn("(?~|a)a", "a", @as(c_int, 871));
    xx2("(?~|a)(?~|)a", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 872));
    xx2("(?~|a).*(?~|)a", "bbbbbbbbbbbbbbbbbbbba", @as(c_int, 0), @as(c_int, 21), @as(c_int, 873));
    xx2("(?~|abc).*(xyz|pqr)(?~|)abc", "aaaaxyzaaapqrabc", @as(c_int, 0), @as(c_int, 16), @as(c_int, 874));
    xx2("(?~|abc).*(xyz|pqr)(?~|)abc", "aaaaxyzaaaabcpqrabc", @as(c_int, 11), @as(c_int, 19), @as(c_int, 875));
    xn("\\A(?~|abc).*(xyz|pqrabc)(?~|)abc", "aaaaxyzaaaabcpqrabcabc", @as(c_int, 876));
    xx2("", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 0), @as(c_int, 878));
    xx2("\xe3\x81\x82", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 879));
    xn("\xe3\x81\x84", "\xe3\x81\x82", @as(c_int, 880));
    xx2("\xe3\x81\x86\xe3\x81\x86", "\xe3\x81\x86\xe3\x81\x86", @as(c_int, 0), @as(c_int, 6), @as(c_int, 881));
    xx2("\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 882));
    xx2("\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93", "\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93", @as(c_int, 0), @as(c_int, 105), @as(c_int, 883));
    xx2("\xe3\x81\x82", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 3), @as(c_int, 6), @as(c_int, 884));
    xx2("\xe3\x81\x84\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 3), @as(c_int, 9), @as(c_int, 885));
    xx2("\\xca\\xb8", "\xca\xb8", @as(c_int, 0), @as(c_int, 2), @as(c_int, 886));
    xx2(".", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 887));
    xx2("..", "\xe3\x81\x8b\xe3\x81\x8d", @as(c_int, 0), @as(c_int, 6), @as(c_int, 888));
    xx2("\\w", "\xe3\x81\x8a", @as(c_int, 0), @as(c_int, 3), @as(c_int, 889));
    xn("\\W", "\xe3\x81\x82", @as(c_int, 890));
    xx2("[\\W]", "\xe3\x81\x86$", @as(c_int, 3), @as(c_int, 4), @as(c_int, 891));
    xx2("\\S", "\xe3\x81\x9d", @as(c_int, 0), @as(c_int, 3), @as(c_int, 892));
    xx2("\\S", "\xe6\xbc\xa2", @as(c_int, 0), @as(c_int, 3), @as(c_int, 893));
    xx2("\\b", "\xe6\xb0\x97 ", @as(c_int, 0), @as(c_int, 0), @as(c_int, 894));
    xx2("\\b", " \xe3\x81\xbb", @as(c_int, 1), @as(c_int, 1), @as(c_int, 895));
    xx2("\\B", "\xe3\x81\x9b\xe3\x81\x9d ", @as(c_int, 3), @as(c_int, 3), @as(c_int, 896));
    xx2("\\B", "\xe3\x81\x86 ", @as(c_int, 4), @as(c_int, 4), @as(c_int, 897));
    xx2("\\B", " \xe3\x81\x84", @as(c_int, 0), @as(c_int, 0), @as(c_int, 898));
    xx2("[\xe3\x81\x9f\xe3\x81\xa1]", "\xe3\x81\xa1", @as(c_int, 0), @as(c_int, 3), @as(c_int, 899));
    xn("[\xe3\x81\xaa\xe3\x81\xab]", "\xe3\x81\xac", @as(c_int, 900));
    xx2("[\xe3\x81\x86-\xe3\x81\x8a]", "\xe3\x81\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 901));
    xn("[^\xe3\x81\x91]", "\xe3\x81\x91", @as(c_int, 902));
    xx2("[\\w]", "\xe3\x81\xad", @as(c_int, 0), @as(c_int, 3), @as(c_int, 903));
    xn("[\\d]", "\xe3\x81\xb5", @as(c_int, 904));
    xx2("[\\D]", "\xe3\x81\xaf", @as(c_int, 0), @as(c_int, 3), @as(c_int, 905));
    xn("[\\s]", "\xe3\x81\x8f", @as(c_int, 906));
    xx2("[\\S]", "\xe3\x81\xb8", @as(c_int, 0), @as(c_int, 3), @as(c_int, 907));
    xx2("[\\w\\d]", "\xe3\x82\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 908));
    xx2("[\\w\\d]", "   \xe3\x82\x88", @as(c_int, 3), @as(c_int, 6), @as(c_int, 909));
    xn("\\w\xe9\xac\xbc\xe8\xbb\x8a", " \xe9\xac\xbc\xe8\xbb\x8a", @as(c_int, 910));
    xx2("\xe9\xac\xbc\\W\xe8\xbb\x8a", "\xe9\xac\xbc \xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 7), @as(c_int, 911));
    xx2("\xe3\x81\x82.\xe3\x81\x84.\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 15), @as(c_int, 912));
    xx2(".\\w\xe3\x81\x86\\W..\xe3\x81\x9e", "\xe3\x81\x88\xe3\x81\x86\xe3\x81\x86 \xe3\x81\x86\xe3\x81\x9e\xe3\x81\x9e", @as(c_int, 0), @as(c_int, 19), @as(c_int, 913));
    xx2("\\s\\w\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93", " \xe3\x81\x93\xe3\x81\x93\xe3\x81\x93\xe3\x81\x93", @as(c_int, 0), @as(c_int, 13), @as(c_int, 914));
    xx2("\xe3\x81\x82\xe3\x81\x82.\xe3\x81\x91", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x91\xe3\x81\x91", @as(c_int, 0), @as(c_int, 12), @as(c_int, 915));
    xn(".\xe3\x81\x84", "\xe3\x81\x84\xe3\x81\x88", @as(c_int, 916));
    xx2(".\xe3\x81\x8a", "\xe3\x81\x8a\xe3\x81\x8a", @as(c_int, 0), @as(c_int, 6), @as(c_int, 917));
    xx2("^\xe3\x81\x82", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 918));
    xx2("^\xe3\x82\x80$", "\xe3\x82\x80", @as(c_int, 0), @as(c_int, 3), @as(c_int, 919));
    xx2("^\\w$", "\xe3\x81\xab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 920));
    xx2("^\\w\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91\xe3\x81\x93$", "z\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91\xe3\x81\x93", @as(c_int, 0), @as(c_int, 16), @as(c_int, 921));
    xx2("^\\w...\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a$", "z\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a", @as(c_int, 0), @as(c_int, 19), @as(c_int, 922));
    xx2("\\w\\w\\s\\W\xe3\x81\x8a\xe3\x81\x8a\xe3\x81\x8a\\d", "a\xe3\x81\x8a  \xe3\x81\x8a\xe3\x81\x8a\xe3\x81\x8a4", @as(c_int, 0), @as(c_int, 16), @as(c_int, 923));
    xx2("\\A\xe3\x81\x9f\xe3\x81\xa1\xe3\x81\xa4", "\xe3\x81\x9f\xe3\x81\xa1\xe3\x81\xa4", @as(c_int, 0), @as(c_int, 9), @as(c_int, 924));
    xx2("\xe3\x82\x80\xe3\x82\x81\xe3\x82\x82\\Z", "\xe3\x82\x80\xe3\x82\x81\xe3\x82\x82", @as(c_int, 0), @as(c_int, 9), @as(c_int, 925));
    xx2("\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\\z", "\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f", @as(c_int, 0), @as(c_int, 9), @as(c_int, 926));
    xx2("\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\\Z", "\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\n", @as(c_int, 0), @as(c_int, 9), @as(c_int, 927));
    xx2("\\G\xe3\x81\xbd\xe3\x81\xb4", "\xe3\x81\xbd\xe3\x81\xb4", @as(c_int, 0), @as(c_int, 6), @as(c_int, 928));
    xn("\\G\xe3\x81\x88", "\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a", @as(c_int, 929));
    xn("\xe3\x81\xa8\xe3\x81\xa6\\G", "\xe3\x81\xa8\xe3\x81\xa6", @as(c_int, 930));
    xn("\xe3\x81\xbe\xe3\x81\xbf\\A", "\xe3\x81\xbe\xe3\x81\xbf", @as(c_int, 931));
    xn("\xe3\x81\xbe\\A\xe3\x81\xbf", "\xe3\x81\xbe\xe3\x81\xbf", @as(c_int, 932));
    xx2("(?=\xe3\x81\x9b)\xe3\x81\x9b", "\xe3\x81\x9b", @as(c_int, 0), @as(c_int, 3), @as(c_int, 933));
    xn("(?=\xe3\x81\x86).", "\xe3\x81\x84", @as(c_int, 934));
    xx2("(?!\xe3\x81\x86)\xe3\x81\x8b", "\xe3\x81\x8b", @as(c_int, 0), @as(c_int, 3), @as(c_int, 935));
    xn("(?!\xe3\x81\xa8)\xe3\x81\x82", "\xe3\x81\xa8", @as(c_int, 936));
    xx2("(?i:\xe3\x81\x82)", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 937));
    xx2("(?i:\xe3\x81\xb6\xe3\x81\xb9)", "\xe3\x81\xb6\xe3\x81\xb9", @as(c_int, 0), @as(c_int, 6), @as(c_int, 938));
    xn("(?i:\xe3\x81\x84)", "\xe3\x81\x86", @as(c_int, 939));
    xx2("(?m:\xe3\x82\x88.)", "\xe3\x82\x88\n", @as(c_int, 0), @as(c_int, 4), @as(c_int, 940));
    xx2("(?m:.\xe3\x82\x81)", "\xe3\x81\xbe\n\xe3\x82\x81", @as(c_int, 3), @as(c_int, 7), @as(c_int, 941));
    xx2("\xe3\x81\x82?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 942));
    xx2("\xe5\xa4\x89?", "\xe5\x8c\x96", @as(c_int, 0), @as(c_int, 0), @as(c_int, 943));
    xx2("\xe5\xa4\x89?", "\xe5\xa4\x89", @as(c_int, 0), @as(c_int, 3), @as(c_int, 944));
    xx2("\xe9\x87\x8f*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 945));
    xx2("\xe9\x87\x8f*", "\xe9\x87\x8f", @as(c_int, 0), @as(c_int, 3), @as(c_int, 946));
    xx2("\xe5\xad\x90*", "\xe5\xad\x90\xe5\xad\x90\xe5\xad\x90", @as(c_int, 0), @as(c_int, 9), @as(c_int, 947));
    xx2("\xe9\xa6\xac*", "\xe9\xb9\xbf\xe9\xa6\xac\xe9\xa6\xac\xe9\xa6\xac\xe9\xa6\xac", @as(c_int, 0), @as(c_int, 0), @as(c_int, 948));
    xn("\xe5\xb1\xb1+", "", @as(c_int, 949));
    xx2("\xe6\xb2\xb3+", "\xe6\xb2\xb3", @as(c_int, 0), @as(c_int, 3), @as(c_int, 950));
    xx2("\xe6\x99\x82+", "\xe6\x99\x82\xe6\x99\x82\xe6\x99\x82\xe6\x99\x82", @as(c_int, 0), @as(c_int, 12), @as(c_int, 951));
    xx2("\xe3\x81\x88+", "\xe3\x81\x88\xe3\x81\x88\xe3\x81\x86\xe3\x81\x86\xe3\x81\x86", @as(c_int, 0), @as(c_int, 6), @as(c_int, 952));
    xx2("\xe3\x81\x86+", "\xe3\x81\x8a\xe3\x81\x86\xe3\x81\x86\xe3\x81\x86\xe3\x81\x86", @as(c_int, 3), @as(c_int, 15), @as(c_int, 953));
    xx2(".?", "\xe3\x81\x9f", @as(c_int, 0), @as(c_int, 3), @as(c_int, 954));
    xx2(".*", "\xe3\x81\xb1\xe3\x81\xb4\xe3\x81\xb7\xe3\x81\xba", @as(c_int, 0), @as(c_int, 12), @as(c_int, 955));
    xx2(".+", "\xe3\x82\x8d", @as(c_int, 0), @as(c_int, 3), @as(c_int, 956));
    xx2(".+", "\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8b\n", @as(c_int, 0), @as(c_int, 12), @as(c_int, 957));
    xx2("\xe3\x81\x82|\xe3\x81\x84", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 958));
    xx2("\xe3\x81\x82|\xe3\x81\x84", "\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 959));
    xx2("\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x84\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 6), @as(c_int, 960));
    xx2("\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x84\xe3\x81\x86", "\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 6), @as(c_int, 961));
    xx2("\xe3\x82\x92(?:\xe3\x81\x8b\xe3\x81\x8d|\xe3\x81\x8d\xe3\x81\x8f)", "\xe3\x82\x92\xe3\x81\x8b\xe3\x81\x8d", @as(c_int, 0), @as(c_int, 9), @as(c_int, 962));
    xx2("\xe3\x82\x92(?:\xe3\x81\x8b\xe3\x81\x8d|\xe3\x81\x8d\xe3\x81\x8f)\xe3\x81\x91", "\xe3\x82\x92\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91", @as(c_int, 0), @as(c_int, 12), @as(c_int, 963));
    xx2("\xe3\x81\x82\xe3\x81\x84|(?:\xe3\x81\x82\xe3\x81\x86|\xe3\x81\x82\xe3\x82\x92)", "\xe3\x81\x82\xe3\x82\x92", @as(c_int, 0), @as(c_int, 6), @as(c_int, 964));
    xx2("\xe3\x81\x82|\xe3\x81\x84|\xe3\x81\x86", "\xe3\x81\x88\xe3\x81\x86", @as(c_int, 3), @as(c_int, 6), @as(c_int, 965));
    xx2("\xe3\x81\x82|\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x88|\xe3\x81\x8a\xe3\x81\x8b\xe3\x81\x8d|\xe3\x81\x8f|\xe3\x81\x91\xe3\x81\x93\xe3\x81\x95|\xe3\x81\x97\xe3\x81\x99\xe3\x81\x9b|\xe3\x81\x9d|\xe3\x81\x9f\xe3\x81\xa1|\xe3\x81\xa4\xe3\x81\xa6\xe3\x81\xa8\xe3\x81\xaa\xe3\x81\xab|\xe3\x81\xac\xe3\x81\xad", "\xe3\x81\x97\xe3\x81\x99\xe3\x81\x9b", @as(c_int, 0), @as(c_int, 9), @as(c_int, 966));
    xn("\xe3\x81\x82|\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x88|\xe3\x81\x8a\xe3\x81\x8b\xe3\x81\x8d|\xe3\x81\x8f|\xe3\x81\x91\xe3\x81\x93\xe3\x81\x95|\xe3\x81\x97\xe3\x81\x99\xe3\x81\x9b|\xe3\x81\x9d|\xe3\x81\x9f\xe3\x81\xa1|\xe3\x81\xa4\xe3\x81\xa6\xe3\x81\xa8\xe3\x81\xaa\xe3\x81\xab|\xe3\x81\xac\xe3\x81\xad", "\xe3\x81\x99\xe3\x81\x9b", @as(c_int, 967));
    xx2("\xe3\x81\x82|^\xe3\x82\x8f", "\xe3\x81\xb6\xe3\x81\x82", @as(c_int, 3), @as(c_int, 6), @as(c_int, 968));
    xx2("\xe3\x81\x82|^\xe3\x82\x92", "\xe3\x82\x92\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 969));
    xx2("\xe9\xac\xbc|\\G\xe8\xbb\x8a", "\xe3\x81\x91\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 6), @as(c_int, 9), @as(c_int, 970));
    xx2("\xe9\xac\xbc|\\G\xe8\xbb\x8a", "\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 971));
    xx2("\xe9\xac\xbc|\\A\xe8\xbb\x8a", "b\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 4), @as(c_int, 7), @as(c_int, 972));
    xx2("\xe9\xac\xbc|\\A\xe8\xbb\x8a", "\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 3), @as(c_int, 973));
    xx2("\xe9\xac\xbc|\xe8\xbb\x8a\\Z", "\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 3), @as(c_int, 6), @as(c_int, 974));
    xx2("\xe9\xac\xbc|\xe8\xbb\x8a\\Z", "\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 3), @as(c_int, 975));
    xx2("\xe9\xac\xbc|\xe8\xbb\x8a\\Z", "\xe8\xbb\x8a\n", @as(c_int, 0), @as(c_int, 3), @as(c_int, 976));
    xx2("\xe9\xac\xbc|\xe8\xbb\x8a\\z", "\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 3), @as(c_int, 6), @as(c_int, 977));
    xx2("\xe9\xac\xbc|\xe8\xbb\x8a\\z", "\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 3), @as(c_int, 978));
    xx2("\\w|\\s", "\xe3\x81\x8a", @as(c_int, 0), @as(c_int, 3), @as(c_int, 979));
    xx2("\\w|%", "%\xe3\x81\x8a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 980));
    xx2("\\w|[&$]", "\xe3\x81\x86&", @as(c_int, 0), @as(c_int, 3), @as(c_int, 981));
    xx2("[\xe3\x81\x84-\xe3\x81\x91]", "\xe3\x81\x86", @as(c_int, 0), @as(c_int, 3), @as(c_int, 982));
    xx2("[\xe3\x81\x84-\xe3\x81\x91]|[^\xe3\x81\x8b-\xe3\x81\x93]", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 983));
    xx2("[\xe3\x81\x84-\xe3\x81\x91]|[^\xe3\x81\x8b-\xe3\x81\x93]", "\xe3\x81\x8b", @as(c_int, 0), @as(c_int, 3), @as(c_int, 984));
    xx2("[^\xe3\x81\x82]", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 985));
    xx2("(?:\xe3\x81\x82|[\xe3\x81\x86-\xe3\x81\x8d])|\xe3\x81\x84\xe3\x82\x92", "\xe3\x81\x86\xe3\x82\x92", @as(c_int, 0), @as(c_int, 3), @as(c_int, 986));
    xx2("(?:\xe3\x81\x82|[\xe3\x81\x86-\xe3\x81\x8d])|\xe3\x81\x84\xe3\x82\x92", "\xe3\x81\x84\xe3\x82\x92", @as(c_int, 0), @as(c_int, 6), @as(c_int, 987));
    xx2("\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86|(?=\xe3\x81\x91\xe3\x81\x91)..\xe3\x81\xbb", "\xe3\x81\x91\xe3\x81\x91\xe3\x81\xbb", @as(c_int, 0), @as(c_int, 9), @as(c_int, 988));
    xx2("\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86|(?!\xe3\x81\x91\xe3\x81\x91)..\xe3\x81\xbb", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\xbb", @as(c_int, 0), @as(c_int, 9), @as(c_int, 989));
    xx2("(?=\xe3\x82\x92\xe3\x81\x82)..\xe3\x81\x82|(?=\xe3\x82\x92\xe3\x82\x92)..\xe3\x81\x82", "\xe3\x82\x92\xe3\x82\x92\xe3\x81\x82", @as(c_int, 0), @as(c_int, 9), @as(c_int, 990));
    xx2("(?<=\xe3\x81\x82|\xe3\x81\x84\xe3\x81\x86)\xe3\x81\x84", "\xe3\x81\x84\xe3\x81\x86\xe3\x81\x84", @as(c_int, 6), @as(c_int, 9), @as(c_int, 991));
    xn("(?>\xe3\x81\x82|\xe3\x81\x82\xe3\x81\x84\xe3\x81\x88)\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x88\xe3\x81\x86", @as(c_int, 992));
    xx2("(?>\xe3\x81\x82\xe3\x81\x84\xe3\x81\x88|\xe3\x81\x82)\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x88\xe3\x81\x86", @as(c_int, 0), @as(c_int, 12), @as(c_int, 993));
    xx2("\xe3\x81\x82?|\xe3\x81\x84", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 994));
    xx2("\xe3\x81\x82?|\xe3\x81\x84", "\xe3\x81\x84", @as(c_int, 0), @as(c_int, 0), @as(c_int, 995));
    xx2("\xe3\x81\x82?|\xe3\x81\x84", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 996));
    xx2("\xe3\x81\x82*|\xe3\x81\x84", "\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 6), @as(c_int, 997));
    xx2("\xe3\x81\x82*|\xe3\x81\x84*", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 0), @as(c_int, 0), @as(c_int, 998));
    xx2("\xe3\x81\x82*|\xe3\x81\x84*", "\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 999));
    xx2("[a\xe3\x81\x82]*|\xe3\x81\x84*", "a\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1000));
    xx2("\xe3\x81\x82+|\xe3\x81\x84*", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1001));
    xx2("\xe3\x81\x82+|\xe3\x81\x84*", "\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1002));
    xx2("\xe3\x81\x82+|\xe3\x81\x84*", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1003));
    xx2("\xe3\x81\x82+|\xe3\x81\x84*", "a\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1004));
    xn("\xe3\x81\x82+|\xe3\x81\x84+", "", @as(c_int, 1005));
    xx2("(\xe3\x81\x82|\xe3\x81\x84)?", "\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1006));
    xx2("(\xe3\x81\x82|\xe3\x81\x84)*", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1007));
    xx2("(\xe3\x81\x82|\xe3\x81\x84)+", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1008));
    xx2("(\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x82)+", "\xe3\x81\x86\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1009));
    xx2("(\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x88)+", "\xe3\x81\x86\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88", @as(c_int, 6), @as(c_int, 18), @as(c_int, 1010));
    xx2("(\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x82)+", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x82", @as(c_int, 3), @as(c_int, 15), @as(c_int, 1011));
    xx2("(\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x82)+", "\xe3\x81\x82\xe3\x81\x84\xe3\x82\x92\xe3\x81\x86\xe3\x81\x82", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1012));
    xx2("(\xe3\x81\x82\xe3\x81\x84|\xe3\x81\x86\xe3\x81\x82)+", "$$zzzz\xe3\x81\x82\xe3\x81\x84\xe3\x82\x92\xe3\x81\x86\xe3\x81\x82", @as(c_int, 6), @as(c_int, 12), @as(c_int, 1013));
    xx2("(\xe3\x81\x82|\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84)+", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84\xe3\x81\x82", @as(c_int, 0), @as(c_int, 15), @as(c_int, 1014));
    xx2("(\xe3\x81\x82|\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84)+", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1015));
    xx2("(\xe3\x81\x82|\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84)+", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x82", @as(c_int, 3), @as(c_int, 12), @as(c_int, 1016));
    xx2("(?:\xe3\x81\x82|\xe3\x81\x84)(?:\xe3\x81\x82|\xe3\x81\x84)", "\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1017));
    xx2("(?:\xe3\x81\x82*|\xe3\x81\x84*)(?:\xe3\x81\x82*|\xe3\x81\x84*)", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1018));
    xx2("(?:\xe3\x81\x82*|\xe3\x81\x84*)(?:\xe3\x81\x82+|\xe3\x81\x84+)", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1019));
    xx2("(?:\xe3\x81\x82+|\xe3\x81\x84+){2}", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1020));
    xx2("(?:\xe3\x81\x82+|\xe3\x81\x84+){1,2}", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1021));
    xx2("(?:\xe3\x81\x82+|\\A\xe3\x81\x84*)\xe3\x81\x86\xe3\x81\x86", "\xe3\x81\x86\xe3\x81\x86", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1022));
    xn("(?:\xe3\x81\x82+|\\A\xe3\x81\x84*)\xe3\x81\x86\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86", @as(c_int, 1023));
    xx2("(?:^\xe3\x81\x82+|\xe3\x81\x84+)*\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 18), @as(c_int, 24), @as(c_int, 1024));
    xx2("(?:^\xe3\x81\x82+|\xe3\x81\x84+)*\xe3\x81\x86", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 21), @as(c_int, 1025));
    xx2("\xe3\x81\x86{0,}", "\xe3\x81\x86\xe3\x81\x86\xe3\x81\x86\xe3\x81\x86", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1026));
    xx2("\xe3\x81\x82|(?i)c", "C", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1027));
    xx2("(?i)c|\xe3\x81\x82", "C", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1028));
    xx2("(?i:\xe3\x81\x82)|a", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1029));
    xn("(?i:\xe3\x81\x82)|a", "A", @as(c_int, 1030));
    xx2("[\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]?", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1031));
    xx2("[\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]*", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1032));
    xx2("[^\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]*", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1033));
    xn("[^\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]+", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 1034));
    xx2("\xe3\x81\x82??", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1035));
    xx2("\xe3\x81\x84\xe3\x81\x82??\xe3\x81\x84", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1036));
    xx2("\xe3\x81\x82*?", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1037));
    xx2("\xe3\x81\x84\xe3\x81\x82*?", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1038));
    xx2("\xe3\x81\x84\xe3\x81\x82*?\xe3\x81\x84", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1039));
    xx2("\xe3\x81\x82+?", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1040));
    xx2("\xe3\x81\x84\xe3\x81\x82+?", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1041));
    xx2("\xe3\x81\x84\xe3\x81\x82+?\xe3\x81\x84", "\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1042));
    xx2("(?:\xe5\xa4\xa9?)??", "\xe5\xa4\xa9", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1043));
    xx2("(?:\xe5\xa4\xa9??)?", "\xe5\xa4\xa9", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1044));
    xx2("(?:\xe5\xa4\xa2?)+?", "\xe5\xa4\xa2\xe5\xa4\xa2\xe5\xa4\xa2", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1045));
    xx2("(?:\xe9\xa2\xa8+)??", "\xe9\xa2\xa8\xe9\xa2\xa8\xe9\xa2\xa8", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1046));
    xx2("(?:\xe9\x9b\xaa+)??\xe9\x9c\x9c", "\xe9\x9b\xaa\xe9\x9b\xaa\xe9\x9b\xaa\xe9\x9c\x9c", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1047));
    xx2("(?:\xe3\x81\x82\xe3\x81\x84)?{2}", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1048));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a)?{2}", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1049));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a)*{0}", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1050));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a){3,}", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 24), @as(c_int, 1051));
    xn("(?:\xe9\xac\xbc\xe8\xbb\x8a){3,}", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a", @as(c_int, 1052));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a){2,4}", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1053));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a){2,4}", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 24), @as(c_int, 1054));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a){2,4}?", "\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a\xe9\xac\xbc\xe8\xbb\x8a", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1055));
    xx2("(?:\xe9\xac\xbc\xe8\xbb\x8a){,}", "\xe9\xac\xbc\xe8\xbb\x8a{,}", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1056));
    xx2("(?:\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f)+?{2}", "\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1057));
    xx3("(\xe7\x81\xab)", "\xe7\x81\xab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 1058));
    xx3("(\xe7\x81\xab\xe6\xb0\xb4)", "\xe7\x81\xab\xe6\xb0\xb4", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1059));
    xx2("((\xe6\x99\x82\xe9\x96\x93))", "\xe6\x99\x82\xe9\x96\x93", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1060));
    xx3("((\xe9\xa2\xa8\xe6\xb0\xb4))", "\xe9\xa2\xa8\xe6\xb0\xb4", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1061));
    xx3("((\xe6\x98\xa8\xe6\x97\xa5))", "\xe6\x98\xa8\xe6\x97\xa5", @as(c_int, 0), @as(c_int, 6), @as(c_int, 2), @as(c_int, 1062));
    xx3("((((((((((((((((((((\xe9\x87\x8f\xe5\xad\x90))))))))))))))))))))", "\xe9\x87\x8f\xe5\xad\x90", @as(c_int, 0), @as(c_int, 6), @as(c_int, 20), @as(c_int, 1063));
    xx3("(\xe3\x81\x82\xe3\x81\x84)(\xe3\x81\x86\xe3\x81\x88)", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1064));
    xx3("(\xe3\x81\x82\xe3\x81\x84)(\xe3\x81\x86\xe3\x81\x88)", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88", @as(c_int, 6), @as(c_int, 12), @as(c_int, 2), @as(c_int, 1065));
    xx3("()(\xe3\x81\x82)\xe3\x81\x84\xe3\x81\x86(\xe3\x81\x88\xe3\x81\x8a\xe3\x81\x8b)\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91\xe3\x81\x93", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91\xe3\x81\x93", @as(c_int, 9), @as(c_int, 18), @as(c_int, 3), @as(c_int, 1066));
    xx3("(()(\xe3\x81\x82)\xe3\x81\x84\xe3\x81\x86(\xe3\x81\x88\xe3\x81\x8a\xe3\x81\x8b)\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91\xe3\x81\x93)", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f\xe3\x81\x91\xe3\x81\x93", @as(c_int, 9), @as(c_int, 18), @as(c_int, 4), @as(c_int, 1067));
    xx3(".*(\xe3\x83\x95\xe3\x82\xa9)\xe3\x83\xb3\xe3\x83\xbb\xe3\x83\x9e(\xe3\x83\xb3()\xe3\x82\xb7\xe3\x83\xa5\xe3\x82\xbf)\xe3\x82\xa4\xe3\x83\xb3", "\xe3\x83\x95\xe3\x82\xa9\xe3\x83\xb3\xe3\x83\xbb\xe3\x83\x9e\xe3\x83\xb3\xe3\x82\xb7\xe3\x83\xa5\xe3\x82\xbf\xe3\x82\xa4\xe3\x83\xb3", @as(c_int, 15), @as(c_int, 27), @as(c_int, 2), @as(c_int, 1068));
    xx2("(^\xe3\x81\x82)", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1069));
    xx3("(\xe3\x81\x82)|(\xe3\x81\x82)", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1070));
    xx3("(^\xe3\x81\x82)|(\xe3\x81\x82)", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 3), @as(c_int, 6), @as(c_int, 2), @as(c_int, 1071));
    xx3("(\xe3\x81\x82?)", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 1072));
    xx3("(\xe3\x81\xbe*)", "\xe3\x81\xbe\xe3\x81\xbe\xe3\x81\xbe", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1073));
    xx3("(\xe3\x81\xa8*)", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1), @as(c_int, 1074));
    xx3("(\xe3\x82\x8b+)", "\xe3\x82\x8b\xe3\x82\x8b\xe3\x82\x8b\xe3\x82\x8b\xe3\x82\x8b\xe3\x82\x8b\xe3\x82\x8b", @as(c_int, 0), @as(c_int, 21), @as(c_int, 1), @as(c_int, 1075));
    xx3("(\xe3\x81\xb5+|\xe3\x81\xb8*)", "\xe3\x81\xb5\xe3\x81\xb5\xe3\x81\xb5\xe3\x81\xb8\xe3\x81\xb8", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1076));
    xx3("(\xe3\x81\x82+|\xe3\x81\x84?)", "\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 1077));
    xx3("(\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86)?", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1078));
    xx3("(\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86)*", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1079));
    xx3("(\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86)+", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1080));
    xx3("(\xe3\x81\x95\xe3\x81\x97\xe3\x81\x99|\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86)+", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1081));
    xx3("([\xe3\x81\xaa\xe3\x81\xab\xe3\x81\xac][\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f]|\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f)+", "\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1082));
    xx3("((?i:\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86))", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1), @as(c_int, 1083));
    xx3("((?m:\xe3\x81\x82.\xe3\x81\x86))", "\xe3\x81\x82\n\xe3\x81\x86", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1), @as(c_int, 1084));
    xx3("((?=\xe3\x81\x82\xe3\x82\x93)\xe3\x81\x82)", "\xe3\x81\x82\xe3\x82\x93\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 1085));
    xx3("\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86|(.\xe3\x81\x82\xe3\x81\x84\xe3\x81\x88)", "\xe3\x82\x93\xe3\x81\x82\xe3\x81\x84\xe3\x81\x88", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1), @as(c_int, 1086));
    xx3("\xe3\x81\x82*(.)", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x82\x93", @as(c_int, 12), @as(c_int, 15), @as(c_int, 1), @as(c_int, 1087));
    xx3("\xe3\x81\x82*?(.)", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x82\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1), @as(c_int, 1088));
    xx3("\xe3\x81\x82*?(\xe3\x82\x93)", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x82\x93", @as(c_int, 12), @as(c_int, 15), @as(c_int, 1), @as(c_int, 1089));
    xx3("[\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88]\xe3\x81\x82*(.)", "\xe3\x81\x88\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x82\x93", @as(c_int, 15), @as(c_int, 18), @as(c_int, 1), @as(c_int, 1090));
    xx3("(\\A\xe3\x81\x84\xe3\x81\x84)\xe3\x81\x86\xe3\x81\x86", "\xe3\x81\x84\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1091));
    xn("(\\A\xe3\x81\x84\xe3\x81\x84)\xe3\x81\x86\xe3\x81\x86", "\xe3\x82\x93\xe3\x81\x84\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86", @as(c_int, 1092));
    xx3("(^\xe3\x81\x84\xe3\x81\x84)\xe3\x81\x86\xe3\x81\x86", "\xe3\x81\x84\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1093));
    xn("(^\xe3\x81\x84\xe3\x81\x84)\xe3\x81\x86\xe3\x81\x86", "\xe3\x82\x93\xe3\x81\x84\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86", @as(c_int, 1094));
    xx3("\xe3\x82\x8d\xe3\x82\x8d(\xe3\x82\x8b\xe3\x82\x8b$)", "\xe3\x82\x8d\xe3\x82\x8d\xe3\x82\x8b\xe3\x82\x8b", @as(c_int, 6), @as(c_int, 12), @as(c_int, 1), @as(c_int, 1095));
    xn("\xe3\x82\x8d\xe3\x82\x8d(\xe3\x82\x8b\xe3\x82\x8b$)", "\xe3\x82\x8d\xe3\x82\x8d\xe3\x82\x8b\xe3\x82\x8b\xe3\x82\x8b", @as(c_int, 1096));
    xx2("(\xe7\x84\xa1)\\1", "\xe7\x84\xa1\xe7\x84\xa1", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1097));
    xn("(\xe7\x84\xa1)\\1", "\xe7\x84\xa1\xe6\xad\xa6", @as(c_int, 1098));
    xx2("(\xe7\xa9\xba?)\\1", "\xe7\xa9\xba\xe7\xa9\xba", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1099));
    xx2("(\xe7\xa9\xba??)\\1", "\xe7\xa9\xba\xe7\xa9\xba", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1100));
    xx2("(\xe7\xa9\xba*)\\1", "\xe7\xa9\xba\xe7\xa9\xba\xe7\xa9\xba\xe7\xa9\xba\xe7\xa9\xba", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1101));
    xx3("(\xe7\xa9\xba*)\\1", "\xe7\xa9\xba\xe7\xa9\xba\xe7\xa9\xba\xe7\xa9\xba\xe7\xa9\xba", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1), @as(c_int, 1102));
    xx2("\xe3\x81\x82(\xe3\x81\x84*)\\1", "\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 15), @as(c_int, 1103));
    xx2("\xe3\x81\x82(\xe3\x81\x84*)\\1", "\xe3\x81\x82\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1104));
    xx2("(\xe3\x81\x82*)(\xe3\x81\x84*)\\1\\2", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 30), @as(c_int, 1105));
    xx2("(\xe3\x81\x82*)(\xe3\x81\x84*)\\2", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 0), @as(c_int, 21), @as(c_int, 1106));
    xx3("(\xe3\x81\x82*)(\xe3\x81\x84*)\\2", "\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84\xe3\x81\x84", @as(c_int, 9), @as(c_int, 15), @as(c_int, 2), @as(c_int, 1107));
    xx2("(((((((\xe3\x81\xbd*)\xe3\x81\xba))))))\xe3\x81\xb4\\7", "\xe3\x81\xbd\xe3\x81\xbd\xe3\x81\xbd\xe3\x81\xba\xe3\x81\xb4\xe3\x81\xbd\xe3\x81\xbd\xe3\x81\xbd", @as(c_int, 0), @as(c_int, 24), @as(c_int, 1108));
    xx3("(((((((\xe3\x81\xbd*)\xe3\x81\xba))))))\xe3\x81\xb4\\7", "\xe3\x81\xbd\xe3\x81\xbd\xe3\x81\xbd\xe3\x81\xba\xe3\x81\xb4\xe3\x81\xbd\xe3\x81\xbd\xe3\x81\xbd", @as(c_int, 0), @as(c_int, 9), @as(c_int, 7), @as(c_int, 1109));
    xx2("(\xe3\x81\xaf)(\xe3\x81\xb2)(\xe3\x81\xb5)\\2\\1\\3", "\xe3\x81\xaf\xe3\x81\xb2\xe3\x81\xb5\xe3\x81\xb2\xe3\x81\xaf\xe3\x81\xb5", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1110));
    xx2("([\xe3\x81\x8d-\xe3\x81\x91])\\1", "\xe3\x81\x8f\xe3\x81\x8f", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1111));
    xx2("(\\w\\d\\s)\\1", "\xe3\x81\x825 \xe3\x81\x825 ", @as(c_int, 0), @as(c_int, 10), @as(c_int, 1112));
    xn("(\\w\\d\\s)\\1", "\xe3\x81\x825 \xe3\x81\x825", @as(c_int, 1113));
    xx2("(\xe8\xaa\xb0\xef\xbc\x9f|[\xe3\x81\x82-\xe3\x81\x86]{3})\\1", "\xe8\xaa\xb0\xef\xbc\x9f\xe8\xaa\xb0\xef\xbc\x9f", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1114));
    xx2("...(\xe8\xaa\xb0\xef\xbc\x9f|[\xe3\x81\x82-\xe3\x81\x86]{3})\\1", "\xe3\x81\x82a\xe3\x81\x82\xe8\xaa\xb0\xef\xbc\x9f\xe8\xaa\xb0\xef\xbc\x9f", @as(c_int, 0), @as(c_int, 19), @as(c_int, 1115));
    xx2("(\xe8\xaa\xb0\xef\xbc\x9f|[\xe3\x81\x82-\xe3\x81\x86]{3})\\1", "\xe3\x81\x86\xe3\x81\x84\xe3\x81\x86\xe3\x81\x86\xe3\x81\x84\xe3\x81\x86", @as(c_int, 0), @as(c_int, 18), @as(c_int, 1116));
    xx2("(^\xe3\x81\x93)\\1", "\xe3\x81\x93\xe3\x81\x93", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1117));
    xn("(^\xe3\x82\x80)\\1", "\xe3\x82\x81\xe3\x82\x80\xe3\x82\x80", @as(c_int, 1118));
    xn("(\xe3\x81\x82$)\\1", "\xe3\x81\x82\xe3\x81\x82", @as(c_int, 1119));
    xn("(\xe3\x81\x82\xe3\x81\x84\\Z)\\1", "\xe3\x81\x82\xe3\x81\x84", @as(c_int, 1120));
    xx2("(\xe3\x81\x82*\\Z)\\1", "\xe3\x81\x82", @as(c_int, 3), @as(c_int, 3), @as(c_int, 1121));
    xx2(".(\xe3\x81\x82*\\Z)\\1", "\xe3\x81\x84\xe3\x81\x82", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1122));
    xx3("(.(\xe3\x82\x84\xe3\x81\x84\xe3\x82\x86)\\2)", "z\xe3\x82\x84\xe3\x81\x84\xe3\x82\x86\xe3\x82\x84\xe3\x81\x84\xe3\x82\x86", @as(c_int, 0), @as(c_int, 19), @as(c_int, 1), @as(c_int, 1123));
    xx3("(.(..\\d.)\\2)", "\xe3\x81\x8212341234", @as(c_int, 0), @as(c_int, 11), @as(c_int, 1), @as(c_int, 1124));
    xx2("((?i:\xe3\x81\x82v\xe3\x81\x9a))\\1", "\xe3\x81\x82v\xe3\x81\x9a\xe3\x81\x82v\xe3\x81\x9a", @as(c_int, 0), @as(c_int, 14), @as(c_int, 1125));
    xx2("(?<\xe6\x84\x9a\xe3\x81\x8b>\xe5\xa4\x89|\\(\\g<\xe6\x84\x9a\xe3\x81\x8b>\\))", "((((((\xe5\xa4\x89))))))", @as(c_int, 0), @as(c_int, 15), @as(c_int, 1126));
    xx2("\\A(?:\\g<\xe9\x98\xbf_1>|\\g<\xe4\xba\x91_2>|\\z\xe7\xb5\x82\xe4\xba\x86  (?<\xe9\x98\xbf_1>\xe8\xa6\xb3|\xe8\x87\xaa\\g<\xe4\xba\x91_2>\xe8\x87\xaa)(?<\xe4\xba\x91_2>\xe5\x9c\xa8|\xe8\x8f\xa9\xe8\x96\xa9\\g<\xe9\x98\xbf_1>\xe8\x8f\xa9\xe8\x96\xa9))$", "\xe8\x8f\xa9\xe8\x96\xa9\xe8\x87\xaa\xe8\x8f\xa9\xe8\x96\xa9\xe8\x87\xaa\xe5\x9c\xa8\xe8\x87\xaa\xe8\x8f\xa9\xe8\x96\xa9\xe8\x87\xaa\xe8\x8f\xa9\xe8\x96\xa9", @as(c_int, 0), @as(c_int, 39), @as(c_int, 1127));
    xx2("[[\xe3\x81\xb2\xe3\x81\xb5]]", "\xe3\x81\xb5", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1128));
    xx2("[[\xe3\x81\x84\xe3\x81\x8a\xe3\x81\x86]\xe3\x81\x8b]", "\xe3\x81\x8b", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1129));
    xn("[[^\xe3\x81\x82]]", "\xe3\x81\x82", @as(c_int, 1130));
    xn("[^[\xe3\x81\x82]]", "\xe3\x81\x82", @as(c_int, 1131));
    xx2("[^[^\xe3\x81\x82]]", "\xe3\x81\x82", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1132));
    xx2("[[\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f]&&\xe3\x81\x8d\xe3\x81\x8f]", "\xe3\x81\x8f", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1133));
    xn("[[\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f]&&\xe3\x81\x8d\xe3\x81\x8f]", "\xe3\x81\x8b", @as(c_int, 1134));
    xn("[[\xe3\x81\x8b\xe3\x81\x8d\xe3\x81\x8f]&&\xe3\x81\x8d\xe3\x81\x8f]", "\xe3\x81\x91", @as(c_int, 1135));
    xx2("[\xe3\x81\x82-\xe3\x82\x93&&\xe3\x81\x84-\xe3\x82\x92&&\xe3\x81\x86-\xe3\x82\x91]", "\xe3\x82\x91", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1136));
    xn("[^\xe3\x81\x82-\xe3\x82\x93&&\xe3\x81\x84-\xe3\x82\x92&&\xe3\x81\x86-\xe3\x82\x91]", "\xe3\x82\x91", @as(c_int, 1137));
    xx2("[[^\xe3\x81\x82&&\xe3\x81\x82]&&\xe3\x81\x82-\xe3\x82\x93]", "\xe3\x81\x84", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1138));
    xn("[[^\xe3\x81\x82&&\xe3\x81\x82]&&\xe3\x81\x82-\xe3\x82\x93]", "\xe3\x81\x82", @as(c_int, 1139));
    xx2("[[^\xe3\x81\x82-\xe3\x82\x93&&\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]&&[^\xe3\x81\x86-\xe3\x81\x8b]]", "\xe3\x81\x8d", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1140));
    xn("[[^\xe3\x81\x82-\xe3\x82\x93&&\xe3\x81\x84\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]&&[^\xe3\x81\x86-\xe3\x81\x8b]]", "\xe3\x81\x84", @as(c_int, 1141));
    xx2("[^[^\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]]", "\xe3\x81\x86", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1142));
    xx2("[^[^\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]]", "\xe3\x81\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1143));
    xn("[^[^\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]]", "\xe3\x81\x8b", @as(c_int, 1144));
    xx2("[\xe3\x81\x82-&&-\xe3\x81\x82]", "-", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1145));
    xx2("[^[^a-z\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^bcdefg\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]q-w]", "\xe3\x81\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1146));
    xx2("[^[^a-z\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^bcdefg\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]g-w]", "f", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1147));
    xx2("[^[^a-z\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^bcdefg\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]g-w]", "g", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1148));
    xn("[^[^a-z\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86]&&[^bcdefg\xe3\x81\x86\xe3\x81\x88\xe3\x81\x8a]g-w]", "2", @as(c_int, 1149));
    xx2("a<b>\xe3\x83\x90\xe3\x83\xbc\xe3\x82\xb8\xe3\x83\xa7\xe3\x83\xb3\xe3\x81\xae\xe3\x83\x80\xe3\x82\xa6\xe3\x83\xb3\xe3\x83\xad\xe3\x83\xbc\xe3\x83\x89<\\/b>", "a<b>\xe3\x83\x90\xe3\x83\xbc\xe3\x82\xb8\xe3\x83\xa7\xe3\x83\xb3\xe3\x81\xae\xe3\x83\x80\xe3\x82\xa6\xe3\x83\xb3\xe3\x83\xad\xe3\x83\xbc\xe3\x83\x89</b>", @as(c_int, 0), @as(c_int, 44), @as(c_int, 1150));
    xx2(".<b>\xe3\x83\x90\xe3\x83\xbc\xe3\x82\xb8\xe3\x83\xa7\xe3\x83\xb3\xe3\x81\xae\xe3\x83\x80\xe3\x82\xa6\xe3\x83\xb3\xe3\x83\xad\xe3\x83\xbc\xe3\x83\x89<\\/b>", "a<b>\xe3\x83\x90\xe3\x83\xbc\xe3\x82\xb8\xe3\x83\xa7\xe3\x83\xb3\xe3\x81\xae\xe3\x83\x80\xe3\x82\xa6\xe3\x83\xb3\xe3\x83\xad\xe3\x83\xbc\xe3\x83\x89</b>", @as(c_int, 0), @as(c_int, 44), @as(c_int, 1151));
    xx2("\\n?\\z", "\xe3\x81\x93\xe3\x82\x93\xe3\x81\xab\xe3\x81\xa1\xe3\x81\xaf", @as(c_int, 15), @as(c_int, 15), @as(c_int, 1152));
    xx2("(?m).*", "\xe9\x9d\x92\xe8\xb5\xa4\xe9\xbb\x84", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1153));
    xx2("(?m).*a", "\xe9\x9d\x92\xe8\xb5\xa4\xe9\xbb\x84a", @as(c_int, 0), @as(c_int, 10), @as(c_int, 1154));
    xx2("\\p{Hiragana}", "\xe3\x81\xb4", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1156));
    xn("\\P{Hiragana}", "\xe3\x81\xb4", @as(c_int, 1157));
    xx2("\\p{Emoji}", "\xe2\xad\x90", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1158));
    xx2("\\p{^Emoji}", "\xef\xbc\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1159));
    xx2("\\p{Extended_Pictographic}", "\xe2\x9a\xa1", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1160));
    xn("\\p{Extended_Pictographic}", "\xe3\x81\x82", @as(c_int, 1161));
    xx2("\\p{Word}", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1163));
    xn("\\p{^Word}", "\xe3\x81\x93", @as(c_int, 1164));
    xx2("[\\p{Word}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1165));
    xn("[\\p{^Word}]", "\xe3\x81\x93", @as(c_int, 1166));
    xn("[^\\p{Word}]", "\xe3\x81\x93", @as(c_int, 1167));
    xx2("[^\\p{^Word}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1168));
    xx2("[^\\p{^Word}&&\\p{ASCII}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1169));
    xx2("[^\\p{^Word}&&\\p{ASCII}]", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1170));
    xn("[^\\p{^Word}&&\\p{ASCII}]", "#", @as(c_int, 1171));
    xx2("[^[\\p{^Word}]&&[\\p{ASCII}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1172));
    xx2("[^[\\p{ASCII}]&&[^\\p{Word}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1173));
    xn("[[\\p{ASCII}]&&[^\\p{Word}]]", "\xe3\x81\x93", @as(c_int, 1174));
    xx2("[^[\\p{^Word}]&&[^\\p{ASCII}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1175));
    xx2("[^\\x{104a}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1176));
    xx2("[^\\p{^Word}&&[^\\x{104a}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1177));
    xx2("[^[\\p{^Word}]&&[^\\x{104a}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1178));
    xn("[^\\p{Word}||[^\\x{104a}]]", "\xe3\x81\x93", @as(c_int, 1179));
    xx2("\\p{^Cntrl}", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1181));
    xn("\\p{Cntrl}", "\xe3\x81\x93", @as(c_int, 1182));
    xx2("[\\p{^Cntrl}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1183));
    xn("[\\p{Cntrl}]", "\xe3\x81\x93", @as(c_int, 1184));
    xn("[^\\p{^Cntrl}]", "\xe3\x81\x93", @as(c_int, 1185));
    xx2("[^\\p{Cntrl}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1186));
    xx2("[^\\p{Cntrl}&&\\p{ASCII}]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1187));
    xx2("[^\\p{Cntrl}&&\\p{ASCII}]", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1188));
    xn("[^\\p{^Cntrl}&&\\p{ASCII}]", "#", @as(c_int, 1189));
    xx2("[^[\\p{^Cntrl}]&&[\\p{ASCII}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1190));
    xx2("[^[\\p{ASCII}]&&[^\\p{Cntrl}]]", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1191));
    xn("[[\\p{ASCII}]&&[^\\p{Cntrl}]]", "\xe3\x81\x93", @as(c_int, 1192));
    xn("[^[\\p{^Cntrl}]&&[^\\p{ASCII}]]", "\xe3\x81\x93", @as(c_int, 1193));
    xn("[^\\p{^Cntrl}&&[^\\x{104a}]]", "\xe3\x81\x93", @as(c_int, 1194));
    xn("[^[\\p{^Cntrl}]&&[^\\x{104a}]]", "\xe3\x81\x93", @as(c_int, 1195));
    xn("[^\\p{Cntrl}||[^\\x{104a}]]", "\xe3\x81\x93", @as(c_int, 1196));
    xx2("(?-W:\\p{Word})", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1198));
    xn("(?W:\\p{Word})", "\xe3\x81\x93", @as(c_int, 1199));
    xx2("(?W:\\p{Word})", "k", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1200));
    xx2("(?-W:[[:word:]])", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1201));
    xn("(?W:[[:word:]])", "\xe3\x81\x93", @as(c_int, 1202));
    xx2("(?-D:\\p{Digit})", "\xef\xbc\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1203));
    xn("(?D:\\p{Digit})", "\xef\xbc\x93", @as(c_int, 1204));
    xx2("(?-S:\\p{Space})", "\xc2\x85", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1205));
    xn("(?S:\\p{Space})", "\xc2\x85", @as(c_int, 1206));
    xx2("(?-P:\\p{Word})", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1207));
    xn("(?P:\\p{Word})", "\xe3\x81\x93", @as(c_int, 1208));
    xx2("(?-W:\\w)", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1209));
    xn("(?W:\\w)", "\xe3\x81\x93", @as(c_int, 1210));
    xx2("(?-W:\\w)", "k", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1211));
    xx2("(?W:\\w)", "k", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1212));
    xn("(?-W:\\W)", "\xe3\x81\x93", @as(c_int, 1213));
    xx2("(?W:\\W)", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1214));
    xn("(?-W:\\W)", "k", @as(c_int, 1215));
    xn("(?W:\\W)", "k", @as(c_int, 1216));
    xx2("(?-W:\\b)", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1218));
    xn("(?W:\\b)", "\xe3\x81\x93", @as(c_int, 1219));
    xx2("(?-W:\\b)", "h", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1220));
    xx2("(?W:\\b)", "h", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1221));
    xn("(?-W:\\B)", "\xe3\x81\x93", @as(c_int, 1222));
    xx2("(?W:\\B)", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1223));
    xn("(?-W:\\B)", "h", @as(c_int, 1224));
    xn("(?W:\\B)", "h", @as(c_int, 1225));
    xx2("(?-P:\\b)", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1226));
    xn("(?P:\\b)", "\xe3\x81\x93", @as(c_int, 1227));
    xx2("(?-P:\\b)", "h", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1228));
    xx2("(?P:\\b)", "h", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1229));
    xn("(?-P:\\B)", "\xe3\x81\x93", @as(c_int, 1230));
    xx2("(?P:\\B)", "\xe3\x81\x93", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1231));
    xn("(?-P:\\B)", "h", @as(c_int, 1232));
    xn("(?P:\\B)", "h", @as(c_int, 1233));
    xx2("\\p{InBasicLatin}", "A", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1235));
    xn(".\\y\\O", "\r\n", @as(c_int, 1242));
    xx2(".\\Y\\O", "\r\n", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1243));
    xn("^.\\y.$", "g\xcc\x88", @as(c_int, 1246));
    xx2(".\\Y.", "g\xcc\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1247));
    xx2("\\y.\\Y.\\y", "g\xcc\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1248));
    xx2("\\y.\\y", "\xea\xb0\x81", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1250));
    xx2("^.\\Y.\\Y.$", "\xe1\x84\x80\xe1\x85\xa1\xe1\x86\xa8", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1252));
    xn("^.\\y.\\Y.$", "\xe1\x84\x80\xe1\x85\xa1\xe1\x86\xa8", @as(c_int, 1253));
    xx2(".\\Y.", "\xe0\xae\xa8\xe0\xae\xbf", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1255));
    xn(".\\y.", "\xe0\xae\xa8\xe0\xae\xbf", @as(c_int, 1256));
    xx2(".\\Y.", "\xe0\xb8\x81\xe0\xb8\xb3", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1258));
    xn(".\\y.", "\xe0\xb8\x81\xe0\xb8\xb3", @as(c_int, 1259));
    xx2(".\\Y.", "\xe0\xa4\xb7\xe0\xa4\xbf", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1261));
    xn(".\\y.", "\xe0\xa4\xb7\xe0\xa4\xbf", @as(c_int, 1262));
    xx2("..\\Y.", "\xe3\x80\xb0\xe2\x80\x8d\xe2\xad\x95", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1265));
    xx2("...\\Y.", "\xe3\x80\xb0\xcc\x82\xe2\x80\x8d\xe2\xad\x95", @as(c_int, 0), @as(c_int, 11), @as(c_int, 1266));
    xn("...\\Y.", "\xe3\x80\xb0\xcd\xb0\xe2\x80\x8d\xe2\xad\x95", @as(c_int, 1267));
    xn("^\\X\\X$", "\r\n", @as(c_int, 1270));
    xx2("^\\X$", "\r\n", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1271));
    xn("^\\X\\X.$", "g\xcc\x88", @as(c_int, 1273));
    xx2("^\\X$", "g\xcc\x88", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1274));
    xx2("^\\X$", "\xe1\x84\x80\xe1\x85\xa1\xe1\x86\xa8", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1276));
    xn("^\\X\\X\\X$", "\xe1\x84\x80\xe1\x85\xa1\xe1\x86\xa8", @as(c_int, 1277));
    xx2("^\\X$", "\xe0\xae\xa8\xe0\xae\xbf", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1279));
    xn("\\X\\X", "\xe0\xae\xa8\xe0\xae\xbf", @as(c_int, 1280));
    xx2("^\\X$", "\xe0\xb8\x81\xe0\xb8\xb3", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1282));
    xn("\\X\\X", "\xe0\xb8\x81\xe0\xb8\xb3", @as(c_int, 1283));
    xx2("^\\X$", "\xe0\xa4\xb7\xe0\xa4\xbf", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1285));
    xn("\\X\\X", "\xe0\xa4\xb7\xe0\xa4\xbf", @as(c_int, 1286));
    xn("^\\X.$", "\xe0\xae\xa8\xe0\xae\xbf", @as(c_int, 1288));
    xx2("h\\Xllo", "ha\xcc\x80llo", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1291));
    xx2("(?y{g})\\yabc\\y", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1294));
    xx2("(?y{g})\\y\\X\\y", "abc", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1295));
    xx2("(?y{w})\\yabc\\y", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1296));
    xx2("(?y{w})\\X", "\r\n", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1297));
    xx2("(?y{w})\\X", "\x0cz", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1298));
    xx2("(?y{w})\\X", "q\x0c", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1299));
    xx2("(?y{w})\\X", "\xe2\x80\x8d\xe2\x9d\x87", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1300));
    xx2("(?y{w})\\X", "  ", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1301));
    xx2("(?y{w})\\X", "a\xe2\x80\x8d", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1302));
    xx2("(?y{w})\\y\\X\\y", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1303));
    xx2("(?y{w})\\y\\X\\y", "v\xce\x87w", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1304));
    xx2("(?y{w})\\y\\X\\y", "\xd7\x93\'", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1305));
    xx2("(?y{w})\\y\\X\\y", "\xd7\x93\"\xd7\x93", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1306));
    xx2("(?y{w})\\X", "14 45", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1307));
    xx2("(?y{w})\\X", "a14", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1308));
    xx2("(?y{w})\\X", "832e", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1309));
    xx2("(?y{w})\\X", "8\xef\xbc\x8c\xdb\xb0", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1310));
    xx2("(?y{w})\\y\\X\\y", "\xe3\x82\xb1\xe3\x83\xb3", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1311));
    xx2("(?y{w})\\y\\X\\y", "\xe3\x82\xb1\xe3\x83\xb3\xe2\x80\xaf\xe3\x82\xbf", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1312));
    xx2("(?y{w})\\y\\X\\y", "!#", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1313));
    xx2("(?y{w})\\y\\X\\y", "\xe5\xb1\xb1\xe3\x82\xa2", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1314));
    xx2("(?y{w})\\X", "3.14", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1315));
    xx2("(?y{w})\\X", "3 14", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1316));
    xx2("\\x40", "@", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1318));
    xx2("\\x1", "\x01", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1319));
    xx2("\\x{1}", "\x01", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1320));
    xx2("\\x{4E38}", "\xe4\xb8\xb8", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1321));
    xx2("\\u4E38", "\xe4\xb8\xb8", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1322));
    xx2("\\u0040", "@", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1323));
    xx2("c.*\\b", "abc", @as(c_int, 2), @as(c_int, 3), @as(c_int, 1325));
    xx2("\\b.*abc.*\\b", "abc", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1326));
    xx2("((?()0+)+++(((0\\g<0>)0)|())++++((?(1)(0\\g<0>))++++++0*())++++((?(1)(0\\g<1>)+)++++++++++*())++++((?(1)((0)\\g<0>)+)++())+0++*+++(((0\\g<0>))*())++++((?(1)(0\\g<0>)+)++++++++++*|)++++*+++((?(1)((0)\\g<0>)+)+++++++++())++*|)++++((?()0))|", "abcde", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1327));
    xn("(*FAIL)", "abcdefg", @as(c_int, 1329));
    xn("abcd(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)(*FAIL)", "abcdefg", @as(c_int, 1330));
    xx2("(?:[ab]|(*MAX{2}).)*", "abcbaaccaaa", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1331));
    xx2("(?:(*COUNT[AB]{X})[ab]|(*COUNT[CD]{X})[cd])*(*CMP{AB,<,CD})", "abababcdab", @as(c_int, 5), @as(c_int, 8), @as(c_int, 1333));
    xx2("(?(?{....})123|456)", "123", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1334));
    xx2("(?(*FAIL)123|456)", "456", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1335));
    xx2("\\g\'0\'++{,0}", "abcdefgh", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1337));
    xx2("\\g\'0\'++{,0}?", "abcdefgh", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1338));
    xx2("\\g\'0\'++{,0}b", "abcdefgh", @as(c_int, 1), @as(c_int, 2), @as(c_int, 1339));
    xx2("\\g\'0\'++{,0}?def", "abcdefgh", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1340));
    xx2("a{1,3}?", "aaa", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1341));
    xx2("a{3}", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1342));
    xx2("a{3}?", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1343));
    xx2("a{3}?", "aa", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1344));
    xx2("a{3,3}?", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1345));
    xn("a{3,3}?", "aa", @as(c_int, 1346));
    xx2("a{1,3}+", "aaaaaa", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1347));
    xx2("a{3}+", "aaaaaa", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1348));
    xx2("a{3,3}+", "aaaaaa", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1349));
    xn("a{2,3}?", "a", @as(c_int, 1350));
    xn("a{3,2}a", "aaa", @as(c_int, 1351));
    xx2("a{3,2}b", "aaab", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1352));
    xx2("a{3,2}b", "aaaab", @as(c_int, 1), @as(c_int, 5), @as(c_int, 1353));
    xx2("a{3,2}b", "aab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1354));
    xx2("a{3,2}?", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1355));
    xx2("a{2,3}+a", "aaa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1356));
    xx2("[\\x{0}-\\x{7fffffff}]", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1357));
    xx2("[\\x{7f}-\\x{7fffffff}]", "\xe5\xae\xb6", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1358));
    xx2("[a[cdef]]", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1359));
    xn("[a[xyz]-c]", "b", @as(c_int, 1360));
    xx2("[a[xyz]-c]", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1361));
    xx2("[a[xyz]-c]", "-", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1362));
    xx2("[a[xyz]-c]", "c", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1363));
    xx2("(a.c|def)(.{4})(?<=\\1)", "abcdabc", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1364));
    xx2("(a.c|de)(.{4})(?<=\\1)", "abcdabc", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1365));
    xx2("(a.c|def)(.{5})(?<=d\\1e)", "abcdabce", @as(c_int, 0), @as(c_int, 8), @as(c_int, 1366));
    xx2("(a.c|.)d(?<=\\k<1>d)", "zzzzzabcdabc", @as(c_int, 5), @as(c_int, 9), @as(c_int, 1367));
    xx2("(?<=az*)abc", "azzzzzzzzzzabcdabcabc", @as(c_int, 11), @as(c_int, 14), @as(c_int, 1368));
    xx2("(?<=ab|abc|abcd)ef", "abcdef", @as(c_int, 4), @as(c_int, 6), @as(c_int, 1369));
    xx2("(?<=ta+|tb+|tc+|td+)zz", "tcccccccccczz", @as(c_int, 11), @as(c_int, 13), @as(c_int, 1370));
    xx2("(?<=t.{7}|t.{5}|t.{2}|t.)zz", "tczz", @as(c_int, 2), @as(c_int, 4), @as(c_int, 1371));
    xx2("(?<=t.{7}|t.{5}|t.{2})zz", "tczzzz", @as(c_int, 3), @as(c_int, 5), @as(c_int, 1372));
    xx2("(?<=t.{7}|t.{5}|t.{3})zz", "tczzazzbzz", @as(c_int, 8), @as(c_int, 10), @as(c_int, 1373));
    xn("(?<=t.{7}|t.{5}|t.{3})zz", "tczzazzbczz", @as(c_int, 1374));
    xx2("(?<=(ab|abc|abcd))ef", "abcdef", @as(c_int, 4), @as(c_int, 6), @as(c_int, 1375));
    xx2("(?<=(ta+|tb+|tc+|td+))zz", "tcccccccccczz", @as(c_int, 11), @as(c_int, 13), @as(c_int, 1376));
    xx2("(?<=(t.{7}|t.{5}|t.{2}|t.))zz", "tczz", @as(c_int, 2), @as(c_int, 4), @as(c_int, 1377));
    xx2("(?<=(t.{7}|t.{5}|t.{2}))zz", "tczzzz", @as(c_int, 3), @as(c_int, 5), @as(c_int, 1378));
    xx2("(?<=(t.{7}|t.{5}|t.{3}))zz", "tczzazzbzz", @as(c_int, 8), @as(c_int, 10), @as(c_int, 1379));
    xn("(?<=(t.{7}|t.{5}|t.{3}))zz", "tczzazzbczz", @as(c_int, 1380));
    xx2("(.{1,4})(.{1,4})(?<=\\2\\1)", "abaaba", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1381));
    xx2("(.{1,4})(.{1,4})(?<=\\2\\1)", "ababab", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1382));
    xn("(.{1,4})(.{1,4})(?<=\\2\\1)", "abcdabce", @as(c_int, 1383));
    xx2("(.{1,4})(.{1,4})(?<=\\2\\1)", "abcdabceabce", @as(c_int, 4), @as(c_int, 12), @as(c_int, 1384));
    xx2("(?<=a)", "a", @as(c_int, 1), @as(c_int, 1), @as(c_int, 1385));
    xx2("(?<=a.*\\w)z", "abbbz", @as(c_int, 4), @as(c_int, 5), @as(c_int, 1386));
    xn("(?<=a.*\\w)z", "abb z", @as(c_int, 1387));
    xx2("(?<=a.*\\W)z", "abb z", @as(c_int, 4), @as(c_int, 5), @as(c_int, 1388));
    xx2("(?<=a.*\\b)z", "abb z", @as(c_int, 4), @as(c_int, 5), @as(c_int, 1389));
    xx2("(?<=(?>abc))", "abc", @as(c_int, 3), @as(c_int, 3), @as(c_int, 1390));
    xx2("(?<=a\\Xz)", "abz", @as(c_int, 3), @as(c_int, 3), @as(c_int, 1391));
    xn("(?<=^a*)bc", "zabc", @as(c_int, 1392));
    xn("(?<=a*\\b)b", "abc", @as(c_int, 1393));
    xx2("(?<=a+.*[efg])z", "abcdfz", @as(c_int, 5), @as(c_int, 6), @as(c_int, 1394));
    xx2("(?<=a+.*[efg])z", "abcdfgz", @as(c_int, 6), @as(c_int, 7), @as(c_int, 1395));
    xn("(?<=a+.*[efg])z", "bcdfz", @as(c_int, 1396));
    xx2("(?<=a*.*[efg])z", "bcdfz", @as(c_int, 4), @as(c_int, 5), @as(c_int, 1397));
    xn("(?<=a+.*[efg])z", "abcdz", @as(c_int, 1398));
    xx2("(?<=v|t|a+.*[efg])z", "abcdfz", @as(c_int, 5), @as(c_int, 6), @as(c_int, 1399));
    xx2("(?<=v|t|^a+.*[efg])z", "abcdfz", @as(c_int, 5), @as(c_int, 6), @as(c_int, 1400));
    xx2("(?<=^(?:v|t|a+.*[efg]))z", "abcdfz", @as(c_int, 5), @as(c_int, 6), @as(c_int, 1401));
    xx2("(?<=v|^t|a+.*[efg])z", "uabcdfz", @as(c_int, 6), @as(c_int, 7), @as(c_int, 1402));
    xn("^..(?<=(a{,2}))\\1z", "aaaaz", @as(c_int, 1403));
    xx2("^..(?<=(a{,2}))\\1z", "aaz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1404));
    xe("(?<=(?~|zoo)a.*z)", "abcdefz", -@as(c_int, 122), @as(c_int, 1405));
    xe("(?<=(?~|)a.*z)", "abcdefz", -@as(c_int, 122), @as(c_int, 1406));
    xe("(a(?~|boo)z){0}(?<=\\g<1>)", "abcdefz", -@as(c_int, 122), @as(c_int, 1407));
    xx2("(?<=(?<= )| )", "abcde fg", @as(c_int, 6), @as(c_int, 6), @as(c_int, 1408));
    xx2("(?<=D|)(?<=@!nnnnnnnnnIIIIn;{1}D?()|<x@x*xxxD|)(?<=@xxx|xxxxx\\g<1>;{1}x)", "(?<=D|)(?<=@!nnnnnnnnnIIIIn;{1}D?()|<x@x*xxxD|)(?<=@xxx|xxxxx\\g<1>;{1}x)", @as(c_int, 55), @as(c_int, 55), @as(c_int, 1409));
    xx2("(?<=;()|)\\g<1>", "", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1410));
    xx2("(?<=;()|)\\k<1>", ";", @as(c_int, 1), @as(c_int, 1), @as(c_int, 1411));
    xx2("(())\\g<3>{0}(?<=|())", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1412));
    xx2("(?<=()|)\\1{0}", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1413));
    xe("(?<!xxxxxxxxxxxxxxxxxxxxxxx{32774}{65521}xxxxxxxx{65521}xxxxxxxxxxxxxx{32774}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx)", "", -@as(c_int, 122), @as(c_int, 1414));
    xx2("(?<=(?<=abc))def", "abcdef", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1415));
    xx2("(?<=ab(?<=.+b)c)def", "abcdef", @as(c_int, 3), @as(c_int, 6), @as(c_int, 1416));
    xn("(?<=ab(?<=a+)c)def", "abcdef", @as(c_int, 1417));
    xn("(?<=abc)(?<!abc)def", "abcdef", @as(c_int, 1418));
    xn("(?<!ab.)(?<=.bc)def", "abcdef", @as(c_int, 1419));
    xx2("(?<!ab.)(?<=.bc)def", "abcdefcbcdef", @as(c_int, 9), @as(c_int, 12), @as(c_int, 1420));
    xn("(?<!abc)def", "abcdef", @as(c_int, 1421));
    xn("(?<!xxx|abc)def", "abcdef", @as(c_int, 1422));
    xn("(?<!xxxxx|abc)def", "abcdef", @as(c_int, 1423));
    xn("(?<!xxxxx|abc)def", "xxxxxxdef", @as(c_int, 1424));
    xn("(?<!x+|abc)def", "abcdef", @as(c_int, 1425));
    xn("(?<!x+|abc)def", "xxxxxxxxxdef", @as(c_int, 1426));
    xx2("(?<!x+|abc)def", "xxxxxxxxzdef", @as(c_int, 9), @as(c_int, 12), @as(c_int, 1427));
    xn("(?<!a.*z|a)def", "axxxxxxxzdef", @as(c_int, 1428));
    xn("(?<!a.*z|a)def", "bxxxxxxxadef", @as(c_int, 1429));
    xx2("(?<!a.*z|a)def", "axxxxxxxzdefxxdef", @as(c_int, 14), @as(c_int, 17), @as(c_int, 1430));
    xx2("(?<!a.*z|a)def", "bxxxxxxxadefxxdef", @as(c_int, 14), @as(c_int, 17), @as(c_int, 1431));
    xx2("(?<!a.*z|a)def", "bxxxxxxxzdef", @as(c_int, 9), @as(c_int, 12), @as(c_int, 1432));
    xx2("(?<!x+|y+)\\d+", "xxx572", @as(c_int, 4), @as(c_int, 6), @as(c_int, 1433));
    xx2("(?<!3+|4+)\\d+", "33334444", @as(c_int, 0), @as(c_int, 8), @as(c_int, 1434));
    xn(".(?<!3+|4+)\\d+", "33334444", @as(c_int, 1435));
    xn("(.{,3})..(?<!\\1)", "aaaaa", @as(c_int, 1436));
    xx2("(.{,3})..(?<!\\1)", "abcde", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1437));
    xx2("(.{,3})...(?<!\\1)", "abcde", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1438));
    xx2("(a.c)(.{3,}?)(?<!\\1)", "abcabcd", @as(c_int, 0), @as(c_int, 7), @as(c_int, 1439));
    xx2("(a*)(.{3,}?)(?<!\\1)", "abcabcd", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1440));
    xx2("(?:(a.*b)|c.*d)(?<!(?(1))azzzb)", "azzzzb", @as(c_int, 0), @as(c_int, 6), @as(c_int, 1441));
    xn("(?:(a.*b)|c.*d)(?<!(?(1))azzzb)", "azzzb", @as(c_int, 1442));
    xx2("<(?<!NT{+}abcd)", "<(?<!NT{+}abcd)", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1443));
    xx2("(?<!a.*c)def", "abbbbdef", @as(c_int, 5), @as(c_int, 8), @as(c_int, 1444));
    xn("(?<!a.*c)def", "abbbcdef", @as(c_int, 1445));
    xx2("(?<!a.*X\\b)def", "abbbbbXdef", @as(c_int, 7), @as(c_int, 10), @as(c_int, 1446));
    xn("(?<!a.*X\\B)def", "abbbbbXdef", @as(c_int, 1447));
    xx2("(?<!a.*[uvw])def", "abbbbbXdef", @as(c_int, 7), @as(c_int, 10), @as(c_int, 1448));
    xn("(?<!a.*[uvw])def", "abbbbbwdef", @as(c_int, 1449));
    xx2("(?<!ab*\\S+)def", "abbbbb   def", @as(c_int, 9), @as(c_int, 12), @as(c_int, 1450));
    xx2("(?<!a.*\\S)def", "abbbbb def", @as(c_int, 7), @as(c_int, 10), @as(c_int, 1451));
    xn("(?<!ab*\\s+)def", "abbbbb   def", @as(c_int, 1452));
    xx2("(?<!ab*\\s+\\B)def", "abbbbb   def", @as(c_int, 9), @as(c_int, 12), @as(c_int, 1453));
    xn("(?<!v|t|a+.*[efg])z", "abcdfz", @as(c_int, 1454));
    xx2("(?<!v|t|a+.*[efg])z", "abcdfzavzuz", @as(c_int, 10), @as(c_int, 11), @as(c_int, 1455));
    xn("(?<!v|t|^a+.*[efg])z", "abcdfz", @as(c_int, 1456));
    xn("(?<!^(?:v|t|a+.*[efg]))z", "abcdfz", @as(c_int, 1457));
    xx2("(?<!v|^t|^a+.*[efg])z", "uabcdfz", @as(c_int, 6), @as(c_int, 7), @as(c_int, 1458));
    xn("(\\k<2>)|(?<=(\\k<1>))", "", @as(c_int, 1459));
    xx2("(a|\\k<2>)|(?<=(\\k<1>))", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1460));
    xx2("(a|\\k<2>)|(?<=b(\\k<1>))", "ba", @as(c_int, 1), @as(c_int, 2), @as(c_int, 1461));
    xx2("((?(a)\\g<1>|b))", "aab", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1463));
    xx2("((?(a)\\g<1>))", "aab", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1464));
    xx2("(b(?(a)|\\g<1>))", "bba", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1465));
    xe("(()(?(2)\\g<1>))", "", -@as(c_int, 221), @as(c_int, 1466));
    xx2("(?(a)(?:b|c))", "ac", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1467));
    xn("^(?(a)b|c)", "ac", @as(c_int, 1468));
    xx2("(?i)a|b", "B", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1469));
    xn("((?i)a|b.)|c", "C", @as(c_int, 1470));
    xn("c(?i)a.|b.", "Caz", @as(c_int, 1471));
    xx2("c(?i)a|b", "cB", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1472));
    xx2("c(?i)a.|b.", "cBb", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1473));
    xx2("(?i)st", "st", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1475));
    xx2("(?i)st", "St", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1476));
    xx2("(?i)st", "sT", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1477));
    xx2("(?i)st", "\xc5\xbft", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1478));
    xx2("(?i)st", "\xef\xac\x85", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1479));
    xx2("(?i)st", "\xef\xac\x86", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1480));
    xx2("(?i)ast", "Ast", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1481));
    xx2("(?i)ast", "ASt", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1482));
    xx2("(?i)ast", "AsT", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1483));
    xx2("(?i)ast", "A\xc5\xbft", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1484));
    xx2("(?i)ast", "A\xef\xac\x85", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1485));
    xx2("(?i)ast", "A\xef\xac\x86", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1486));
    xx2("(?i)stZ", "stz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1487));
    xx2("(?i)stZ", "Stz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1488));
    xx2("(?i)stZ", "sTz", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1489));
    xx2("(?i)stZ", "\xc5\xbftz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1490));
    xx2("(?i)stZ", "\xef\xac\x85z", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1491));
    xx2("(?i)stZ", "\xef\xac\x86z", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1492));
    xx2("(?i)BstZ", "bstz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1493));
    xx2("(?i)BstZ", "bStz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1494));
    xx2("(?i)BstZ", "bsTz", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1495));
    xx2("(?i)BstZ", "b\xc5\xbftz", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1496));
    xx2("(?i)BstZ", "b\xef\xac\x85z", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1497));
    xx2("(?i)BstZ", "b\xef\xac\x86z", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1498));
    xx2("(?i).*st\\z", "tttssss\xc5\xbft", @as(c_int, 0), @as(c_int, 10), @as(c_int, 1499));
    xx2("(?i).*st\\z", "tttssss\xef\xac\x85", @as(c_int, 0), @as(c_int, 10), @as(c_int, 1500));
    xx2("(?i).*st\\z", "tttssss\xef\xac\x86", @as(c_int, 0), @as(c_int, 10), @as(c_int, 1501));
    xx2("(?i).*\xe3\x81\x82st\xe3\x81\x84\\z", "tttssss\xe3\x81\x82\xc5\xbft\xe3\x81\x84", @as(c_int, 0), @as(c_int, 16), @as(c_int, 1502));
    xx2("(?i).*\xe3\x81\x82st\xe3\x81\x84\\z", "tttssss\xe3\x81\x82\xef\xac\x85\xe3\x81\x84", @as(c_int, 0), @as(c_int, 16), @as(c_int, 1503));
    xx2("(?i).*\xe3\x81\x82st\xe3\x81\x84\\z", "tttssss\xe3\x81\x82\xef\xac\x86\xe3\x81\x84", @as(c_int, 0), @as(c_int, 16), @as(c_int, 1504));
    xx2("(?i).*\xc5\xbft\\z", "tttssssst", @as(c_int, 0), @as(c_int, 9), @as(c_int, 1505));
    xx2("(?i).*\xef\xac\x85\\z", "tttssss\xe3\x81\x82st", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1506));
    xx2("(?i).*\xef\xac\x86\xe3\x81\x84\\z", "tttssssst\xe3\x81\x84", @as(c_int, 0), @as(c_int, 12), @as(c_int, 1507));
    xx2("(?i).*\xef\xac\x85\\z", "tttssss\xe3\x81\x82\xef\xac\x85", @as(c_int, 0), @as(c_int, 13), @as(c_int, 1508));
    xx2("(?i).*ss", "abcdefghijklmnopqrstuvwxyz\xc3\x9f", @as(c_int, 0), @as(c_int, 28), @as(c_int, 1510));
    xx2("(?i).*ss.*", "abcdefghijklmnopqrstuvwxyz\xc3\x9fxyz", @as(c_int, 0), @as(c_int, 31), @as(c_int, 1511));
    xx2("(?i).*\xc3\x9f", "abcdefghijklmnopqrstuvwxyzss", @as(c_int, 0), @as(c_int, 28), @as(c_int, 1512));
    xx2("(?i).*ss.*", "abcdefghijklmnopqrstuvwxyzSSxyz", @as(c_int, 0), @as(c_int, 31), @as(c_int, 1513));
    xx2("(?i)ssv", "\xc3\x9fv", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1515));
    xx2("(?i)(?<=ss)v", "SSv", @as(c_int, 2), @as(c_int, 3), @as(c_int, 1516));
    xx2("(?i)(?<=\xc3\x9f)v", "\xc3\x9fv", @as(c_int, 2), @as(c_int, 3), @as(c_int, 1517));
    xx2("(?i).+Isss\xc7\xb0", ".+Isss\xc7\xb0", @as(c_int, 0), @as(c_int, 8), @as(c_int, 1522));
    xx2(".+Isss\xc7\xb0", ".+Isss\xc7\xb0", @as(c_int, 0), @as(c_int, 8), @as(c_int, 1523));
    xx2("(?i)\xc7\xb0", "\xc7\xb0", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1524));
    xx2("(?i)\xc7\xb0", "j\xcc\x8c", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1525));
    xx2("(?i)j\xcc\x8c", "\xc7\xb0", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1526));
    xx2("(?i)5\xc7\xb0", "5\xc7\xb0", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1527));
    xx2("(?i)5\xc7\xb0", "5j\xcc\x8c", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1528));
    xx2("(?i)5j\xcc\x8c", "5\xc7\xb0", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1529));
    xx2("(?i)\xc7\xb0v", "\xc7\xb0V", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1530));
    xx2("(?i)\xc7\xb0v", "j\xcc\x8cV", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1531));
    xx2("(?i)j\xcc\x8cv", "\xc7\xb0V", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1532));
    xx2("(?i)[\xc7\xb0]", "\xc7\xb0", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1533));
    xx2("(?i)[\xc7\xb0]", "j\xcc\x8c", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1534));
    xx2("(?i)\xef\xac\x80a", "ffa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1536));
    xx2("(?i)ffz", "\xef\xac\x80z", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1537));
    xx2("(?i)\xe2\x84\xa6", "\xcf\x89", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1538));
    xx2("a(?i)\xe2\x84\xa6", "a\xcf\x89", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1539));
    xx2("(?i)A\xe2\x84\xa6", "a\xcf\x89", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1540));
    xx2("(?i)A\xe2\x84\xa6=", "a\xcf\x89=", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1541));
    xx2("(?i:ss)=1234567890", "\xc5\xbf\xc5\xbf=1234567890", @as(c_int, 0), @as(c_int, 15), @as(c_int, 1542));
    xx2("\\x{000A}", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1544));
    xx2("\\x{000A 002f}", "\n/", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1545));
    xx2("\\x{000A 002f }", "\n/", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1546));
    xx2("\\x{007C     001b}", "|\x1b", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1547));
    xx2("\\x{1 2 3 4 5 6 7 8 9 a b c d e f}", "\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f", @as(c_int, 0), @as(c_int, 15), @as(c_int, 1548));
    xx2("a\\x{000A 002f}@", "a\n/@", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1549));
    xx2("a\\x{0060\n0063}@", "a`c@", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1550));
    xe("\\x{00000001 000000012}", "", -@as(c_int, 212), @as(c_int, 1551));
    xe("\\x{000A 00000002f}", "", -@as(c_int, 212), @as(c_int, 1552));
    xe("\\x{000A 002f/", "", -@as(c_int, 400), @as(c_int, 1553));
    xe("\\x{000A 002f /", "", -@as(c_int, 400), @as(c_int, 1554));
    xe("\\x{000A", "", -@as(c_int, 400), @as(c_int, 1555));
    xe("\\x{000A ", "", -@as(c_int, 400), @as(c_int, 1556));
    xe("\\x{000A 002f ", "", -@as(c_int, 400), @as(c_int, 1557));
    xx2("\\o{102}", "B", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1558));
    xx2("\\o{102 103}", "BC", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1559));
    xx2("\\o{0160 0000161}", "pq", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1560));
    xx2("\\o{1 2 3 4 5 6 7 10 11 12 13 14 15 16 17}", "\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f", @as(c_int, 0), @as(c_int, 15), @as(c_int, 1561));
    xx2("\\o{0007 0010 }", "\x07\x08", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1562));
    xe("\\o{0000 0015/", "", -@as(c_int, 400), @as(c_int, 1563));
    xe("\\o{0000 0015 /", "", -@as(c_int, 400), @as(c_int, 1564));
    xe("\\o{0015", "", -@as(c_int, 400), @as(c_int, 1565));
    xe("\\o{0015 ", "", -@as(c_int, 400), @as(c_int, 1566));
    xe("\\o{0007 002f}", "", -@as(c_int, 400), @as(c_int, 1567));
    xx2("[\\x{000A}]", "\n", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1568));
    xx2("[\\x{000A 002f}]+", "\n/.", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1569));
    xx2("[\\x{01 0F 1A 2c 4B}]+", " \x01\x0f\x1a,K\x1b", @as(c_int, 1), @as(c_int, 6), @as(c_int, 1570));
    xx2("[\\x{0020 0024}-\\x{0026}]+", "%$&#", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1571));
    xx2("[\\x{0030}-\\x{0033 005a}]+", "0123Z\x1c", @as(c_int, 0), @as(c_int, 5), @as(c_int, 1572));
    xe("[\\x{000A]", "", -@as(c_int, 400), @as(c_int, 1573));
    xe("[\\x{000A ]", "", -@as(c_int, 400), @as(c_int, 1574));
    xe("[\\x{000A }]", "", -@as(c_int, 400), @as(c_int, 1575));
    xx2("[\\o{102}]", "B", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1576));
    xx2("[\\o{102 103}]*", "BC", @as(c_int, 0), @as(c_int, 2), @as(c_int, 1577));
    xe("[a\\o{002  003]bcde|zzz", "", -@as(c_int, 400), @as(c_int, 1578));
    xx2("[\\x{0030-0039}]+", "abc0123456789def", @as(c_int, 3), @as(c_int, 13), @as(c_int, 1579));
    xx2("[\\x{0030 - 0039 }]+", "abc0123456789def", @as(c_int, 3), @as(c_int, 13), @as(c_int, 1580));
    xx2("[\\x{0030 - 0039 0063 0064}]+", "abc0123456789def", @as(c_int, 2), @as(c_int, 14), @as(c_int, 1581));
    xx2("[\\x{0030 - 0039 0063-0065}]+", "acde019b", @as(c_int, 1), @as(c_int, 7), @as(c_int, 1582));
    xe("[\\x{0030 - 0039-0063 0064}]+", "", -@as(c_int, 400), @as(c_int, 1583));
    xe("[\\x{0030 - }]+", "", -@as(c_int, 400), @as(c_int, 1584));
    xe("[\\x{0030 -- 0040}]+", "", -@as(c_int, 400), @as(c_int, 1585));
    xe("[\\x{0030--0040}]+", "", -@as(c_int, 400), @as(c_int, 1586));
    xe("[\\x{0030 - - 0040}]+", "", -@as(c_int, 400), @as(c_int, 1587));
    xe("[\\x{0030 0044 - }]+", "", -@as(c_int, 400), @as(c_int, 1588));
    xe("[a-\\x{0070 - 0039}]+", "", -@as(c_int, 400), @as(c_int, 1589));
    xx2("[a-\\x{0063 0071}]+", "dabcqz", @as(c_int, 1), @as(c_int, 5), @as(c_int, 1590));
    xx2("[-\\x{0063-0065}]+", "ace-df", @as(c_int, 1), @as(c_int, 5), @as(c_int, 1591));
    xx2("[\\x61-\\x{0063 0065}]+", "abced", @as(c_int, 0), @as(c_int, 4), @as(c_int, 1592));
    xe("[\\x61-\\x{0063-0065}]+", "", -@as(c_int, 400), @as(c_int, 1593));
    xx2("[t\\x{0063 0071}]+", "tcqb", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1594));
    xx2("[\\W\\x{0063 0071}]+", "*cqa", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1595));
    xx2("(\\O|(?=z\\g<2>*))(\\g<0>){0}", "a", @as(c_int, 0), @as(c_int, 1), @as(c_int, 1596));
    xn("a(b|)+d", "abbbbbbbbbbbbbbbbbbbbbbbbbbbbbbcd", @as(c_int, 1598));
    xn("   \xfd", "", @as(c_int, 1599));
    xn("()0\\xfc00000\\xfc00000\\xfc00000\xfc", "", @as(c_int, 1601));
    xx2("000||0\xfa", "0", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1602));
    xe("(?i)000000000000000000000\xf0", "", -@as(c_int, 400), @as(c_int, 1603));
    xn("0000\\\xf5", "0", @as(c_int, 1604));
    xn("(?i)FFF00000000000000000\xfd", "", @as(c_int, 1605));
    xn("(?x)\n  (?<!\\+\\+|--)(?<=[({\\[,?=>:*]|&&|\\|\\||\\?|\\*\\/|^await|[^\\._$[:alnum:]]await|^return|[^\\._$[:alnum:]]return|^default|[^\\._$[:alnum:]]default|^yield|[^\\._$[:alnum:]]yield|^)\\s*\n  (?!<\\s*[_$[:alpha:]][_$[:alnum:]]*((\\s+extends\\s+[^=>])|,)) # look ahead is not type parameter of arrow\n  (?=(<)\\s*(?:([_$[:alpha:]][-_$[:alnum:].]*)(?<!\\.|-)(:))?((?:[a-z][a-z0-9]*|([_$[:alpha:]][-_$[:alnum:].]*))(?<!\\.|-))(?=((<\\s*)|(\\s+))(?!\\?)|\\/?>))", "    while (i < len && f(array[i]))", @as(c_int, 1606));
    xx2("aaaaaaaaaaaaaaaaaaaaaaa\xe3\x81\x82b", "aaaaaaaaaaaaaaaaaaaaaaa\xe3\x81\x82b", @as(c_int, 0), @as(c_int, 27), @as(c_int, 1608));
    xe("x{55380}{77590}", "", -@as(c_int, 201), @as(c_int, 1610));
    xe("(xyz){40000}{99999}(?<name>vv)", "", -@as(c_int, 201), @as(c_int, 1611));
    xe("f{90000,90000}{80000,80000}", "", -@as(c_int, 201), @as(c_int, 1612));
    xn("f{90000,90000}{80000,80001}", "", @as(c_int, 1613));
    xx2("\\p{Common}", "\xe3\x8b\xbf", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1615));
    xx2("\\p{In_Enclosed_CJK_Letters_and_Months}", "\xe3\x8b\xbf", @as(c_int, 0), @as(c_int, 3), @as(c_int, 1616));
    xe("\\x{7fffffff}", "", -@as(c_int, 400), @as(c_int, 1618));
    xe("[\\x{7fffffff}]", "", -@as(c_int, 400), @as(c_int, 1619));
    xe("\\u040", "@", -@as(c_int, 400), @as(c_int, 1620));
    xe("(?<abc>\\g<abc>)", "zzzz", -@as(c_int, 221), @as(c_int, 1621));
    xe("(*FOO)", "abcdefg", -@as(c_int, 229), @as(c_int, 1622));
    xe("*", "abc", -@as(c_int, 113), @as(c_int, 1623));
    xe("|*", "abc", -@as(c_int, 113), @as(c_int, 1624));
    xe("(?i)*", "abc", -@as(c_int, 113), @as(c_int, 1625));
    xe("(?:*)", "abc", -@as(c_int, 113), @as(c_int, 1626));
    xe("(?m:*)", "abc", -@as(c_int, 113), @as(c_int, 1627));
    xx2("(?:)*", "abc", @as(c_int, 0), @as(c_int, 0), @as(c_int, 1628));
    xe("^*", "abc", -@as(c_int, 114), @as(c_int, 1629));
    _ = fprintf(__stdoutp, "\nRESULT   SUCC: %4d,  FAIL: %d,  ERROR: %d      (by Oniguruma %s)\n", nsucc, nfail, nerror, onig_version());
    onig_region_free(region, @as(c_int, 1));
    _ = onig_end();
    return (if ((nfail == @as(c_int, 0)) and (nerror == @as(c_int, 0))) @as(c_int, 0) else -@as(c_int, 1));
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
pub const __sgetc = @compileError("TODO unary inc/dec expr"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdio.h:258:9
pub const __sclearerr = @compileError("unable to translate C expr: expected ')'"); // /usr/local/bin/lib/zig/libc/include/x86_64-macos-gnu/stdio.h:282:9
pub const ONIG_EXTERN = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // ../oniguruma/src/oniguruma.h:67:9
pub const ONIGENC_MBC_CASE_FOLD = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // ../oniguruma/src/oniguruma.h:264:9
pub const ONIG_OPTION_ON = @compileError("unable to translate C expr: expected ')' instead got: PipeEqual"); // ../oniguruma/src/oniguruma.h:406:9
pub const ONIG_OPTION_OFF = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // ../oniguruma/src/oniguruma.h:407:9
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
pub const USER_ADDR_NULL = (@import("std").meta.cast(user_addr_t, 0));
pub fn CAST_USER_ADDR_T(a_ptr: anytype) callconv(.Inline) @TypeOf((@import("std").meta.cast(user_addr_t, (@import("std").meta.cast(usize, a_ptr))))) {
    return (@import("std").meta.cast(user_addr_t, (@import("std").meta.cast(usize, a_ptr))));
}
pub const NULL = __DARWIN_NULL;
pub const RENAME_SECLUDE = 0x00000001;
pub const RENAME_SWAP = 0x00000002;
pub const RENAME_EXCL = 0x00000004;
pub const __SLBF = 0x0001;
pub const __SNBF = 0x0002;
pub const __SRD = 0x0004;
pub const __SWR = 0x0008;
pub const __SRW = 0x0010;
pub const __SEOF = 0x0020;
pub const __SERR = 0x0040;
pub const __SMBF = 0x0080;
pub const __SAPP = 0x0100;
pub const __SSTR = 0x0200;
pub const __SOPT = 0x0400;
pub const __SNPT = 0x0800;
pub const __SOFF = 0x1000;
pub const __SMOD = 0x2000;
pub const __SALC = 0x4000;
pub const __SIGN = 0x8000;
pub const _IOFBF = 0;
pub const _IOLBF = 1;
pub const _IONBF = 2;
pub const BUFSIZ = 1024;
pub const EOF = -1;
pub const FOPEN_MAX = 20;
pub const FILENAME_MAX = 1024;
pub const P_tmpdir = "/var/tmp/";
pub const L_tmpnam = 1024;
pub const TMP_MAX = 308915776;
pub const SEEK_SET = 0;
pub const SEEK_CUR = 1;
pub const SEEK_END = 2;
pub const stdin = __stdinp;
pub const stdout = __stdoutp;
pub const stderr = __stderrp;
pub const L_ctermid = 1024;
pub fn __swift_unavailable_on(osx_msg: anytype, ios_msg: anytype) callconv(.Inline) @TypeOf(__swift_unavailable(osx_msg)) {
    return __swift_unavailable(osx_msg);
}
pub fn __sfeof(p: anytype) callconv(.Inline) @TypeOf(((p.*._flags) & __SEOF) != 0) {
    return ((p.*._flags) & __SEOF) != 0;
}
pub fn __sferror(p: anytype) callconv(.Inline) @TypeOf(((p.*._flags) & __SERR) != 0) {
    return ((p.*._flags) & __SERR) != 0;
}
pub fn __sfileno(p: anytype) callconv(.Inline) @TypeOf(p.*._file) {
    return p.*._file;
}
pub fn fropen(cookie: anytype, @"fn": anytype) callconv(.Inline) @TypeOf(funopen(cookie, @"fn", 0, 0, 0)) {
    return funopen(cookie, @"fn", 0, 0, 0);
}
pub fn fwopen(cookie: anytype, @"fn": anytype) callconv(.Inline) @TypeOf(funopen(cookie, 0, @"fn", 0, 0)) {
    return funopen(cookie, 0, @"fn", 0, 0);
}
pub fn feof_unlocked(p: anytype) callconv(.Inline) @TypeOf(__sfeof(p)) {
    return __sfeof(p);
}
pub fn ferror_unlocked(p: anytype) callconv(.Inline) @TypeOf(__sferror(p)) {
    return __sferror(p);
}
pub fn clearerr_unlocked(p: anytype) callconv(.Inline) @TypeOf(__sclearerr(p)) {
    return __sclearerr(p);
}
pub fn fileno_unlocked(p: anytype) callconv(.Inline) @TypeOf(__sfileno(p)) {
    return __sfileno(p);
}
pub const _USE_FORTIFY_LEVEL = 2;
pub fn __darwin_obsz0(object: anytype) callconv(.Inline) @TypeOf(__builtin_object_size(object, 0)) {
    return __builtin_object_size(object, 0);
}
pub fn __darwin_obsz(object: anytype) callconv(.Inline) @TypeOf(__builtin_object_size(object, if (_USE_FORTIFY_LEVEL > 1) 1 else 0)) {
    return __builtin_object_size(object, if (_USE_FORTIFY_LEVEL > 1) 1 else 0);
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
pub fn ONIGENC_STEP_BACK(enc: anytype, start: anytype, s: anytype, n_1: anytype) callconv(.Inline) @TypeOf(onigenc_step_back(enc, start, s, n_1)) {
    return onigenc_step_back(enc, start, s, n_1);
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
pub const __HAS_FIXED_CHK_PROTOTYPES = 1;
pub fn SLEN(s: anytype) callconv(.Inline) @TypeOf(strlen(s)) {
    return strlen(s);
}
pub fn x2(p: anytype, s: anytype, f: anytype, t: anytype) callconv(.Inline) @TypeOf(xx2(p, s, f, t, __LINE__)) {
    return xx2(p, s, f, t, __LINE__);
}
pub fn x3(p: anytype, s: anytype, f: anytype, t: anytype, m: anytype) callconv(.Inline) @TypeOf(xx3(p, s, f, t, m, __LINE__)) {
    return xx3(p, s, f, t, m, __LINE__);
}
pub fn n(p: anytype, s: anytype) callconv(.Inline) @TypeOf(xn(p, s, __LINE__)) {
    return xn(p, s, __LINE__);
}
pub fn e(p: anytype, s: anytype, en: anytype) callconv(.Inline) @TypeOf(xe(p, s, en, __LINE__)) {
    return xe(p, s, en, __LINE__);
}
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
pub const __sbuf = struct___sbuf;
pub const __sFILEX = struct___sFILEX;
pub const __sFILE = struct___sFILE;
pub const __va_list_tag = struct___va_list_tag;
pub const OnigEncodingTypeST = struct_OnigEncodingTypeST;
pub const OnigCaptureTreeNodeStruct = struct_OnigCaptureTreeNodeStruct;
pub const re_registers = struct_re_registers;
pub const re_pattern_buffer = struct_re_pattern_buffer;
pub const OnigRegSetStruct = struct_OnigRegSetStruct;
pub const OnigCalloutArgsStruct = struct_OnigCalloutArgsStruct;
pub const OnigMatchParamStruct = struct_OnigMatchParamStruct;
