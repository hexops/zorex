const Encoding = @import("oniguruma.zig").Encoding;

export fn init() {
    // #ifdef USE_CALLOUT

        //     int id;
        //     OnigEncoding enc;
        //     char* name;
        //     unsigned int args[4];
        //     OnigValue    opts[4];

        //     enc = ONIG_ENCODING_ASCII;

        //     name = "FAIL";        BC0_P(name, fail);
        //     name = "MISMATCH";    BC0_P(name, mismatch);

        //     name = "MAX";
        //     args[0] = ONIG_TYPE_TAG | ONIG_TYPE_LONG;
        //     args[1] = ONIG_TYPE_CHAR;
        //     opts[0].c = 'X';
        //     BC_B_O(name, max, 2, args, 1, opts);

        //     name = "ERROR";
        //     args[0] = ONIG_TYPE_LONG; opts[0].l = ONIG_ABORT;
        //     BC_P_O(name, error, 1, args, 1, opts);

        //     name = "COUNT";
        //     args[0] = ONIG_TYPE_CHAR; opts[0].c = '>';
        //     BC_B_O(name, count, 1, args, 1, opts);

        //     name = "TOTAL_COUNT";
        //     args[0] = ONIG_TYPE_CHAR; opts[0].c = '>';
        //     BC_B_O(name, total_count, 1, args, 1, opts);

        //     name = "CMP";
        //     args[0] = ONIG_TYPE_TAG | ONIG_TYPE_LONG;
        //     args[1] = ONIG_TYPE_STRING;
        //     args[2] = ONIG_TYPE_TAG | ONIG_TYPE_LONG;
        //     BC_P(name, cmp, 3, args);

    // #endif /* USE_CALLOUT */
}

fn asciiIsCodeCType(code: CodePoint, ctype: usize) {
    if (code < 128) {
        // TODO(slimsag)
        //     return ONIGENC_IS_ASCII_CODE_CTYPE(code, ctype);
    } else {
        return false;
    }
}

const EncodingASCII = Encoding{
    .mbc_enc_len = onigenc_single_byte_mbc_enc_len,
    .name = "US-ASCII",
    . max_enc_len = 1,
    . min_enc_len = 1,
    .is_mbc_newline = onigenc_is_mbc_newline_0x0a,
    .mbc_to_code = onigenc_single_byte_mbc_to_code,
    .code_to_mbclen = onigenc_single_byte_code_to_mbclen,
    .code_to_mbc = onigenc_single_byte_code_to_mbc,
    .mbc_case_fold = onigenc_ascii_mbc_case_fold,
    .apply_all_case_fold = onigenc_ascii_apply_all_case_fold,
    .get_case_fold_codes_by_str = onigenc_ascii_get_case_fold_codes_by_str,
    .property_name_to_ctype = onigenc_minimum_property_name_to_ctype,
    .is_code_ctype = ascii_is_code_ctype,
    .get_ctype_code_range = onigenc_not_support_get_ctype_code_range,
    .left_adjust_char_head = onigenc_single_byte_left_adjust_char_head,
    .is_allowed_reverse_match = onigenc_always_true_is_allowed_reverse_match,
    .init = init,
    .is_initialized = 0,
    .is_valid_mbc_string = onigenc_always_true_is_valid_mbc_string,
    .flag = ENC_FLAG_ASCII_COMPATIBLE|ENC_FLAG_SKIP_OFFSET_1,
    .sb_range = 0,
    .index = 0,
};
