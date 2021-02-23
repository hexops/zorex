const std = @import("std");
const Option = @import("oniguruma2.zig").Option;
const Regex = @import("regcomp2.zig").Regex;
const PToken = @import("regparse2.zig").PToken;
const TokenSym = @import("regparse2.zig").TokenSym;
const fetchToken = @import("regparse2.zig").fetchToken;

// #ifndef REGPARSE_H
// #define REGPARSE_H
// /**********************************************************************
//   regparse.h -  Oniguruma (regular expression library)
// **********************************************************************/
// /*-
//  * Copyright (c) 2002-2021  K.Kosako
//  * All rights reserved.
//  *
//  * Redistribution and use in source and binary forms, with or without
//  * modification, are permitted provided that the following conditions
//  * are met:
//  * 1. Redistributions of source code must retain the above copyright
//  *    notice, this list of conditions and the following disclaimer.
//  * 2. Redistributions in binary form must reproduce the above copyright
//  *    notice, this list of conditions and the following disclaimer in the
//  *    documentation and/or other materials provided with the distribution.
//  *
//  * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
//  * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
//  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
//  * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
//  * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
//  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
//  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
//  * SUCH DAMAGE.
//  */

// #include "regint.h"

// #define NODE_STRING_MARGIN     16
// #define NODE_STRING_BUF_SIZE   24  /* sizeof(CClassNode) - sizeof(int)*4 */
// #define NODE_BACKREFS_SIZE      6

/// node type
pub const NodeType = enum {
    String,
    CClass,
    CType,
    BackRef,
    Quant,
    Bag,
    Anchor,
    List,
    Alt,
    Call,
    Gimmick,
};

// enum BagType {
//   BAG_MEMORY         = 0,
//   BAG_OPTION         = 1,
//   BAG_STOP_BACKTRACK = 2,
//   BAG_IF_ELSE        = 3,
// };

// enum GimmickType {
//   GIMMICK_FAIL       = 0,
//   GIMMICK_SAVE       = 1,
//   GIMMICK_UPDATE_VAR = 2,
// #ifdef USE_CALLOUT
//   GIMMICK_CALLOUT    = 3,
// #endif
// };

// enum BodyEmptyType {
//   BODY_IS_NOT_EMPTY     = 0,
//   BODY_MAY_BE_EMPTY     = 1,
//   BODY_MAY_BE_EMPTY_MEM = 2,
//   BODY_MAY_BE_EMPTY_REC = 3
// };

// struct _Node;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;

//   UChar* s;
//   UChar* end;
//   unsigned int flag;
//   UChar  buf[NODE_STRING_BUF_SIZE];
//   int    capacity;  /* (allocated size - 1) or 0: use buf[] */
// } StrNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;

//   unsigned int flags;
//   BitSet bs;
//   BBuf*  mbuf;   /* multi-byte info or NULL */
// } CClassNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;
//   struct _Node* body;

//   int lower;
//   int upper;
//   int greedy;
//   enum BodyEmptyType emptiness;
//   struct _Node* head_exact;
//   struct _Node* next_head_exact;
//   int include_referred;  /* include called node. don't eliminate even if {0} */
//   MemStatusType empty_status_mem;
// } QuantNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;
//   struct _Node* body;

//   enum BagType type;
//   union {
//     struct {
//       int regnum;
//       AbsAddrType called_addr;
//       int entry_count;
//       int called_state;
//     } m;
//     struct {
//       OnigOptionType options;
//     } o;
//     struct {
//       /* body is condition */
//       struct _Node* Then;
//       struct _Node* Else;
//     } te;
//   };
//   /* for multiple call reference */
//   OnigLen min_len;   /* min length (byte) */
//   OnigLen max_len;   /* max length (byte) */
//   OnigLen min_char_len;
//   OnigLen max_char_len;
//   int opt_count;     /* referenced count in optimize_nodes() */
// } BagNode;

// #ifdef USE_CALL

// typedef struct {
//   int           offset;
//   struct _Node* target;
// } UnsetAddr;

// typedef struct {
//   int        num;
//   int        alloc;
//   UnsetAddr* us;
// } UnsetAddrList;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;
//   struct _Node* body; /* to BagNode : BAG_MEMORY */

//   int     by_number;
//   int     called_gnum;
//   UChar*  name;
//   UChar*  name_end;
//   int     entry_count;
// } CallNode;

// #endif

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;

//   int  back_num;
//   int  back_static[NODE_BACKREFS_SIZE];
//   int* back_dynamic;
//   int  nest_level;
// } BackRefNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;
//   struct _Node* body;

//   int type;
//   OnigLen char_min_len;
//   OnigLen char_max_len;
//   int ascii_mode;
//   struct _Node* lead_node;
// } AnchorNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;

//   struct _Node* car;
//   struct _Node* cdr;
// } ConsAltNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;

//   int ctype;
//   int not;
//   int ascii_mode;
// } CtypeNode;

// typedef struct {
//   NodeType node_type;
//   int status;
//   struct _Node* parent;

//   enum GimmickType type;
//   int  detail_type;
//   int  num;
//   int  id;
// } GimmickNode;

pub const NodeBase = union {
    base: struct {
        node_type: NodeType,
        status: isize,
        parent: *Node,
        body: *Node,
    },
    //     StrNode       str;
    //     CClassNode    cclass;
    //     QuantNode     quant;
    //     BagNode       bag;
    //     BackRefNode   backref;
    //     AnchorNode    anchor;
    //     ConsAltNode   cons;
    //     CtypeNode     ctype;
    // #ifdef USE_CALL
    //     CallNode      call;
    // #endif
    //     GimmickNode   gimmick;
};

pub const Node = struct {
    u: ?NodeBase,

    pub fn parseTree(self: *Node, pattern: []const u8, reg: *Regex, env: *ParseEnv) !void {
        // TODO(slimsag):
        // #ifdef USE_CALLOUT
        //   RegexExt* ext;
        // #endif

        // TODO(slimsag):
        //reg.re_pattern_buffer.string_pool = 0;
        //reg.re_pattern_buffer.string_pool_end = 0;
        reg.re_pattern_buffer.num_mem = 0;
        reg.re_pattern_buffer.num_repeat = 0;
        reg.re_pattern_buffer.num_empty_check = 0;
        // TODO(slimsag):
        //reg.re_pattern_buffer.repeat_range_alloc = 0;
        //reg.re_pattern_buffer.repeat_range = null;

        if (reg.re_pattern_buffer.name_table) | name_table | {
            name_table.deinit();
            reg.re_pattern_buffer.name_table = null;
        }

        // TODO(slimsag):
        //   scan_env_clear(env);
        //   env->options        = reg->options;
        //   env->case_fold_flag = reg->case_fold_flag;
        //   env->enc            = reg->enc;
        //   env->syntax         = reg->syntax;
        //   env->pattern        = (UChar* )pattern;
        //   env->pattern_end    = (UChar* )end;
        //   env->reg            = reg;

        self.* = std.mem.zeroes(Node);

        //   if (! ONIGENC_IS_VALID_MBC_STRING(env->enc, pattern, end))
        //     return ONIGERR_INVALID_WIDE_CHAR_VALUE;

        // TODO(slimsag): Why does this take &pattern? Should it?
        var p = pattern;
        var root = self;
        _ = try Node.prs_regexp(&root, &p, env);
        // TODO(slimsag): root needs to be returned somewhere

        // #ifdef USE_CALL
        //   if (env->has_call_zero != 0) {
        //     Node* zero_node;
        //     r = make_call_zero_body(*root, env, &zero_node);
        //     if (r != 0) return r;

        //     *root = zero_node;
        //   }
        // #endif

        //   reg->num_mem = env->num_mem;

        // #ifdef USE_CALLOUT
        //   ext = reg->extp;
        //   if (IS_NOT_NULL(ext) && ext->callout_num > 0) {
        //     r = setup_ext_callout_list_values(reg);
        //   }
        // #endif
        return;
    }

    pub fn getType(self: *Node) callconv(.Inline) NodeType {
        if (self.u) |u| {
            return u.base.node_type;
        }
        unreachable;
    }

    pub fn setType(self: *Node, newType: NodeType) callconv(.Inline) void {
        if (self.u) |u| {
            u.base.node_type = newType;
        }
        unreachable;
    }

    pub fn prs_regexp(top: **Node, src: *[]const u8, env: *ParseEnv) !TokenSym {
        var tok = PToken.init();
        try fetchToken(&tok, src, env);
        return try Node.prs_alts(top, &tok, TokenSym.EOT, src, env, false);
    }

    /// term_tok: TokenSym.EOT or TokenSym.SubExpClose
    pub fn prs_alts(top: **Node, tok: *PToken, term: TokenSym, src: *[]const u8, env: *ParseEnv, group_head: bool) !TokenSym {
        //   int r;
        //   Node *node, **headp;
        //   OnigOptionType save_options;

        top.* = undefined;
        //   INC_PARSE_DEPTH(env->parse_depth);
        const save_options = env.options;

        var node: *Node = undefined;
        errdefer node.deinit(); // TODO(slimsag): this is awkward/sketchy
        const r = try Node.prs_branch(&node, tok, term, src, env, group_head);
        if (r == term) {
            top.* = node; // TODO(slimsag): this style of returns is nasty
        } else if (r == TokenSym.Alt) {
        //     *top  = onig_node_new_alt(node, NULL);
        //     if (IS_NULL(*top)) {
        //       onig_node_free(node);
        //       return ONIGERR_MEMORY;
        //     }

        //     headp = &(NODE_CDR(*top));
        //     while (r == TK_ALT) {
        //       r = fetch_token(tok, src, end, env);
        //       if (r < 0) return r;
        //       r = prs_branch(&node, tok, term, src, end, env, FALSE);
        //       if (r < 0) {
        //         onig_node_free(node);
        //         return r;
        //       }
        //       *headp = onig_node_new_alt(node, NULL);
        //       if (IS_NULL(*headp)) {
        //         onig_node_free(node);
        //         onig_node_free(*top);
        //         return ONIGERR_MEMORY;
        //       }

        //       headp = &(NODE_CDR(*headp));
        //     }

        //     if (tok->type != (enum TokenSyms )term)
        //       goto err;
        } else {
        //     onig_node_free(node);
        //   err:
        //     if (term == TK_SUBEXP_CLOSE)
        //       return ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS;
        //     else
        //       return ONIGERR_PARSER_BUG;
        }

        env.options = save_options;
        //   DEC_PARSE_DEPTH(env->parse_depth);
        return r;
    }

    pub fn prs_branch(top: **Node, tok: *PToken, term: TokenSym, src: *[]const u8, env: *ParseEnv, group_head: bool) !TokenSym {
        //   int r;
        //   Node *node, **headp;

        top.* = undefined;
        //   INC_PARSE_DEPTH(env->parse_depth);

        var node: *Node = undefined;
        errdefer node.deinit(); // TODO(slimsag): this is awkward/sketchy
        const r = try Node.prs_exp(&node, tok, term, src, env, group_head);
        if (r == TokenSym.EOT or r == term or r == TokenSym.Alt) {
            top.* = node;
        } else {
            //     *top = node_new_list(node, NULL);
            //     if (IS_NULL(*top)) {
            //       onig_node_free(node);
            //       return ONIGERR_MEMORY;
            //     }

            //     headp = &(NODE_CDR(*top));
            //     while (r != TK_EOT && r != term && r != TK_ALT) {
            //       r = prs_exp(&node, tok, term, src, end, env, FALSE);
            //       if (r < 0) {
            //         onig_node_free(node);
            //         return r;
            //       }

            //       if (NODE_TYPE(node) == NODE_LIST) {
            //         *headp = node;
            //         while (IS_NOT_NULL(NODE_CDR(node))) node = NODE_CDR(node);
            //         headp = &(NODE_CDR(node));
            //       }
            //       else {
            //         *headp = node_new_list(node, NULL);
            //         headp = &(NODE_CDR(*headp));
            //       }
            //     }
        }
        //   DEC_PARSE_DEPTH(env->parse_depth);
        return r;
    }

    pub fn prs_exp(np: **Node, tok: *PToken, term: TokenSym, src: *[]const u8, env: *ParseEnv, group_head: bool) !TokenSym {
        //   int r, len, group;
        //   Node* qn;
        //   Node** tp;
        var r: TokenSym = TokenSym.EOT;
        var group: isize = 0;
        var parse_depth: usize = 0;
        retry: while (true) {
            group = 0;
            np.* = undefined;
            if (tok.type == term) { // end of token
            }

            //parse_depth = env.parse_depth;

            if (tok.type == TokenSym.Alt or tok.type == TokenSym.EOT or tok.type == term) {
                // end of token
                //     *np = node_new_empty();
                //     CHECK_NULL_RETURN_MEMERR(*np);
                //     return tok->type;
            }

            switch (tok.type) {
            TokenSym.SubExpOpen => {
                //     r = prs_bag(np, tok, TK_SUBEXP_CLOSE, src, end, env);
                //     if (r < 0) return r;
                //     if (r == 1) { /* group */
                //       if (group_head == 0)
                //         group = 1;
                //       else {
                //         Node* target = *np;
                //         *np = node_new_group(target);
                //         if (IS_NULL(*np)) {
                //           onig_node_free(target);
                //           return ONIGERR_MEMORY;
                //         }
                //         group = 2;
                //       }
                //     }
                //     else if (r == 2) { /* option only */
                //       if (IS_SYNTAX_BV(env->syntax, ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH)) {
                //         env->options = BAG_(*np)->o.options;
                //         r = fetch_token(tok, src, end, env);
                //         if (r < 0) return r;
                //         onig_node_free(*np);
                         continue :retry;
                //       }
                //       else {
                //         Node* target;
                //         OnigOptionType prev = env->options;

                //         env->options = BAG_(*np)->o.options;
                //         r = fetch_token(tok, src, end, env);
                //         if (r < 0) return r;
                //         r = prs_alts(&target, tok, term, src, end, env, FALSE);
                //         env->options = prev;
                //         if (r < 0) {
                //           onig_node_free(target);
                //           return r;
                //         }
                //         NODE_BODY(*np) = target;
                //       }
                //       return tok->type;
                //     }
                //     break;
            },
            TokenSym.SubExpClose => {
                //     if (! IS_SYNTAX_BV(env->syntax, ONIG_SYN_ALLOW_UNMATCHED_CLOSE_SUBEXP))
                //       return ONIGERR_UNMATCHED_CLOSE_PARENTHESIS;

                //     if (tok->escaped) goto tk_crude_byte;
                //     else goto tk_byte;
                //     break;
            },
            TokenSym.String => {
                //   tk_byte:
                //     {
                //       *np = node_new_str_with_options(tok->backp, *src, env->options);
                //       CHECK_NULL_RETURN_MEMERR(*np);

                //       while (1) {
                //         r = fetch_token(tok, src, end, env);
                //         if (r < 0) return r;
                //         if (r != TK_STRING) break;

                //         r = onig_node_str_cat(*np, tok->backp, *src);
                //         if (r < 0) return r;
                //       }

                //     string_end:
                //       tp = np;
                //       goto repeat;
                //     }
                //     break;
            },
            TokenSym.CrudeByte => {
            //   tk_crude_byte:
            //     {
            //       *np = node_new_str_crude_char(tok->u.byte, env->options);
            //       CHECK_NULL_RETURN_MEMERR(*np);
            //       len = 1;
            //       while (1) {
            //         if (len >= ONIGENC_MBC_MINLEN(env->enc)) {
            //           if (len == enclen(env->enc, STR_(*np)->s)) {
            //             r = fetch_token(tok, src, end, env);
            //             goto tk_crude_byte_end;
            //           }
            //         }

            //         r = fetch_token(tok, src, end, env);
            //         if (r < 0) return r;
            //         if (r != TK_CRUDE_BYTE)
            //           return ONIGERR_TOO_SHORT_MULTI_BYTE_STRING;

            //         r = node_str_cat_char(*np, tok->u.byte);
            //         if (r < 0) return r;

            //         len++;
            //       }

            //     tk_crude_byte_end:
            //       if (! ONIGENC_IS_VALID_MBC_STRING(env->enc, STR_(*np)->s, STR_(*np)->end))
            //         return ONIGERR_INVALID_WIDE_CHAR_VALUE;

            //       NODE_STRING_CLEAR_CRUDE(*np);
            //       goto string_end;
            //     }
            //     break;
            },
            TokenSym.CodePoint => {
            //     {
            //       UChar buf[ONIGENC_CODE_TO_MBC_MAXLEN];
            //       len = ONIGENC_CODE_TO_MBCLEN(env->enc, tok->u.code);
            //       if (len < 0) return len;
            //       len = ONIGENC_CODE_TO_MBC(env->enc, tok->u.code, buf);
            // #ifdef NUMBERED_CHAR_IS_NOT_CASE_AMBIG
            //       *np = node_new_str_crude(buf, buf + len, env->options);
            // #else
            //       *np = node_new_str_with_options(buf, buf + len, env->options);
            // #endif
            //       CHECK_NULL_RETURN_MEMERR(*np);
            //     }
            //     break;
            },
            TokenSym.QuoteOpen => {
            //     {
            //       OnigCodePoint end_op[2];
            //       UChar *qstart, *qend, *nextp;

            //       end_op[0] = (OnigCodePoint )MC_ESC(env->syntax);
            //       end_op[1] = (OnigCodePoint )'E';
            //       qstart = *src;
            //       qend = find_str_position(end_op, 2, qstart, end, &nextp, env->enc);
            //       if (IS_NULL(qend)) {
            //         nextp = qend = end;
            //       }
            //       *np = node_new_str_with_options(qstart, qend, env->options);
            //       CHECK_NULL_RETURN_MEMERR(*np);
            //       *src = nextp;
            //     }
            //     break;
            },
            TokenSym.CharType => {
            //     {
            //       switch (tok->u.prop.ctype) {
            //       case ONIGENC_CTYPE_WORD:
            //         *np = node_new_ctype(tok->u.prop.ctype, tok->u.prop.not, env->options);
            //         CHECK_NULL_RETURN_MEMERR(*np);
            //         break;

            //       case ONIGENC_CTYPE_SPACE:
            //       case ONIGENC_CTYPE_DIGIT:
            //       case ONIGENC_CTYPE_XDIGIT:
            //         {
            //           CClassNode* cc;

            //           *np = node_new_cclass();
            //           CHECK_NULL_RETURN_MEMERR(*np);
            //           cc = CCLASS_(*np);
            //           r = add_ctype_to_cc(cc, tok->u.prop.ctype, FALSE, env);
            //           if (r != 0) {
            //             onig_node_free(*np);
            //             *np = NULL_NODE;
            //             return r;
            //           }
            //           if (tok->u.prop.not != 0) NCCLASS_SET_NOT(cc);
            //         }
            //         break;

            //       default:
            //         return ONIGERR_PARSER_BUG;
            //         break;
            //       }
            //     }
            //     break;
            },
            TokenSym.CharProperty => {
            //     r = prs_char_property(np, tok, src, end, env);
            //     if (r != 0) return r;
            //     break;
            },
            TokenSym.OpenCC => {
            //     {
            //       CClassNode* cc;

            //       r = prs_cc(np, tok, src, end, env);
            //       if (r != 0) return r;

            //       cc = CCLASS_(*np);
            //       if (OPTON_IGNORECASE(env->options)) {
            //         IApplyCaseFoldArg iarg;

            //         iarg.env      = env;
            //         iarg.cc       = cc;
            //         iarg.alt_root = NULL_NODE;
            //         iarg.ptail    = &(iarg.alt_root);

            //         r = ONIGENC_APPLY_ALL_CASE_FOLD(env->enc, env->case_fold_flag,
            //                                         i_apply_case_fold, &iarg);
            //         if (r != 0) {
            //           onig_node_free(iarg.alt_root);
            //           return r;
            //         }
            //         if (IS_NOT_NULL(iarg.alt_root)) {
            //           Node* work = onig_node_new_alt(*np, iarg.alt_root);
            //           if (IS_NULL(work)) {
            //             onig_node_free(iarg.alt_root);
            //             return ONIGERR_MEMORY;
            //           }
            //           *np = work;
            //         }
            //       }
            //     }
            //     break;
            },
            TokenSym.AnyChar => {
            //     *np = node_new_anychar(env->options);
            //     CHECK_NULL_RETURN_MEMERR(*np);
            //     break;
            },
            TokenSym.AnyCharAnyTime => {
            //     *np = node_new_anychar(env->options);
            //     CHECK_NULL_RETURN_MEMERR(*np);
            //     qn = node_new_quantifier(0, INFINITE_REPEAT, FALSE);
            //     CHECK_NULL_RETURN_MEMERR(qn);
            //     NODE_BODY(qn) = *np;
            //     *np = qn;
            //     break;
            },
            TokenSym.BackRef => {
            //     len = tok->u.backref.num;
            //     *np = node_new_backref(len,
            //                   (len > 1 ? tok->u.backref.refs : &(tok->u.backref.ref1)),
            //                   tok->u.backref.by_name,
            // #ifdef USE_BACKREF_WITH_LEVEL
            //                            tok->u.backref.exist_level,
            //                            tok->u.backref.level,
            // #endif
            //                            env);
            //     CHECK_NULL_RETURN_MEMERR(*np);
            //     break;
            },
            TokenSym.Call => {
            // #ifdef USE_CALL
            //   case TK_CALL:
            //     {
            //       int gnum = tok->u.call.gnum;

            //       *np = node_new_call(tok->u.call.name, tok->u.call.name_end,
            //                           gnum, tok->u.call.by_number);
            //       CHECK_NULL_RETURN_MEMERR(*np);
            //       env->num_call++;
            //       if (tok->u.call.by_number != 0 && gnum == 0) {
            //         env->has_call_zero = 1;
            //       }
            //     }
            //     break;
            // #endif
            },
            TokenSym.Anchor => {
            //     *np = node_new_anchor_with_options(tok->u.anchor, env->options);
            //     CHECK_NULL_RETURN_MEMERR(*np);
            //     break;
            },
            TokenSym.Repeat, TokenSym.Interval => {
            //     if (IS_SYNTAX_BV(env->syntax, ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS)) {
            //       if (IS_SYNTAX_BV(env->syntax, ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS))
            //         return ONIGERR_TARGET_OF_REPEAT_OPERATOR_NOT_SPECIFIED;
            //       else {
            //         *np = node_new_empty();
            //         CHECK_NULL_RETURN_MEMERR(*np);
            //       }
            //     }
            //     else {
            //       goto tk_byte;
            //     }
            //     break;
            },
            TokenSym.Keep => {
            //     r = node_new_keep(np, env);
            //     if (r < 0) return r;
            //     break;
            },
            TokenSym.GeneralNewLine => {
            //     r = node_new_general_newline(np, env);
            //     if (r < 0) return r;
            //     break;
            },
            TokenSym.NoNewLine => {
            //     r = node_new_no_newline(np, env);
            //     if (r < 0) return r;
            //     break;
            },
            TokenSym.TrueAnyChar => {
            //     r = node_new_true_anychar(np);
            //     if (r < 0) return r;
            //     break;
            },
            TokenSym.TextSegment => {
            //     r = make_text_segment(np, env);
            //     if (r < 0) return r;
            //     break;
            },
            else => {
            //     return ONIGERR_PARSER_BUG;
            //     break;
            }
            }

            //   {
            //     tp = np;

            //   re_entry:
            //     r = fetch_token(tok, src, end, env);
            //     if (r < 0) return r;

            //   repeat:
            //     if (r == TK_REPEAT || r == TK_INTERVAL) {
            //       Node* target;

            //       if (is_invalid_quantifier_target(*tp))
            //         return ONIGERR_TARGET_OF_REPEAT_OPERATOR_INVALID;

            //       INC_PARSE_DEPTH(parse_depth);

            //       qn = node_new_quantifier(tok->u.repeat.lower, tok->u.repeat.upper,
            //                                r == TK_INTERVAL);
            //       CHECK_NULL_RETURN_MEMERR(qn);
            //       QUANT_(qn)->greedy = tok->u.repeat.greedy;
            //       if (group == 2) {
            //         target = node_drop_group(*tp);
            //         *tp = NULL_NODE;
            //       }
            //       else {
            //         target = *tp;
            //       }
            //       r = assign_quantifier_body(qn, target, group, env);
            //       if (r < 0) {
            //         onig_node_free(qn);
            //         *tp = NULL_NODE;
            //         return r;
            //       }

            //       if (tok->u.repeat.possessive != 0) {
            //         Node* en;
            //         en = node_new_bag(BAG_STOP_BACKTRACK);
            //         if (IS_NULL(en)) {
            //           onig_node_free(qn);
            //           return ONIGERR_MEMORY;
            //         }
            //         NODE_BODY(en) = qn;
            //         qn = en;
            //       }

            //       if (r == 0) {
            //         *tp = qn;
            //       }
            //       else if (r == 1) { /* x{1,1} ==> x */
            //         onig_node_free(qn);
            //         *tp = target;
            //       }
            //       else if (r == 2) { /* split case: /abc+/ */
            //         Node *tmp;

            //         *tp = node_new_list(*tp, NULL);
            //         if (IS_NULL(*tp)) {
            //           onig_node_free(qn);
            //           return ONIGERR_MEMORY;
            //         }
            //         tmp = NODE_CDR(*tp) = node_new_list(qn, NULL);
            //         if (IS_NULL(tmp)) {
            //           onig_node_free(qn);
            //           return ONIGERR_MEMORY;
            //         }
            //         tp = &(NODE_CAR(tmp));
            //       }
            //       group = 0;
            //       goto re_entry;
            //     }
            //   }

            return r;
        }
    }
};

// typedef struct {
//   int new_val;
// } GroupNumMap;


// #define NULL_NODE  ((Node* )0)


// /* node type bit */
// #define NODE_TYPE2BIT(type)      (1<<(type))

// #define NODE_BIT_STRING     NODE_TYPE2BIT(NODE_STRING)
// #define NODE_BIT_CCLASS     NODE_TYPE2BIT(NODE_CCLASS)
// #define NODE_BIT_CTYPE      NODE_TYPE2BIT(NODE_CTYPE)
// #define NODE_BIT_BACKREF    NODE_TYPE2BIT(NODE_BACKREF)
// #define NODE_BIT_QUANT      NODE_TYPE2BIT(NODE_QUANT)
// #define NODE_BIT_BAG        NODE_TYPE2BIT(NODE_BAG)
// #define NODE_BIT_ANCHOR     NODE_TYPE2BIT(NODE_ANCHOR)
// #define NODE_BIT_LIST       NODE_TYPE2BIT(NODE_LIST)
// #define NODE_BIT_ALT        NODE_TYPE2BIT(NODE_ALT)
// #define NODE_BIT_CALL       NODE_TYPE2BIT(NODE_CALL)
// #define NODE_BIT_GIMMICK    NODE_TYPE2BIT(NODE_GIMMICK)

// #define STR_(node)         (&((node)->u.str))
// #define CCLASS_(node)      (&((node)->u.cclass))
// #define CTYPE_(node)       (&((node)->u.ctype))
// #define BACKREF_(node)     (&((node)->u.backref))
// #define QUANT_(node)       (&((node)->u.quant))
// #define BAG_(node)         (&((node)->u.bag))
// #define ANCHOR_(node)      (&((node)->u.anchor))
// #define CONS_(node)        (&((node)->u.cons))
// #define CALL_(node)        (&((node)->u.call))
// #define GIMMICK_(node)     (&((node)->u.gimmick))

// #define NODE_CAR(node)     (CONS_(node)->car)
// #define NODE_CDR(node)     (CONS_(node)->cdr)

// #define CTYPE_ANYCHAR      -1
// #define NODE_IS_ANYCHAR(node) \
//   (NODE_TYPE(node) == NODE_CTYPE && CTYPE_(node)->ctype == CTYPE_ANYCHAR)


// #define ANCR_ANYCHAR_INF_MASK  (ANCR_ANYCHAR_INF | ANCR_ANYCHAR_INF_ML)
// #define ANCR_END_BUF_MASK      (ANCR_END_BUF | ANCR_SEMI_END_BUF)

// #define NODE_STRING_CRUDE           (1<<0)
// #define NODE_STRING_CASE_EXPANDED   (1<<1)

// #define NODE_STRING_LEN(node)            (int )((node)->u.str.end - (node)->u.str.s)
// #define NODE_STRING_SET_CRUDE(node)         (node)->u.str.flag |= NODE_STRING_CRUDE
// #define NODE_STRING_CLEAR_CRUDE(node)       (node)->u.str.flag &= ~NODE_STRING_CRUDE
// #define NODE_STRING_SET_CASE_EXPANDED(node) (node)->u.str.flag |= NODE_STRING_CASE_EXPANDED
// #define NODE_STRING_IS_CRUDE(node) \
//   (((node)->u.str.flag & NODE_STRING_CRUDE) != 0)
// #define NODE_STRING_IS_CASE_EXPANDED(node) \
//   (((node)->u.str.flag & NODE_STRING_CASE_EXPANDED) != 0)

// #define BACKREFS_P(br) \
//   (IS_NOT_NULL((br)->back_dynamic) ? (br)->back_dynamic : (br)->back_static)

// /* node status bits */
// #define NODE_ST_FIXED_MIN           (1<<0)
// #define NODE_ST_FIXED_MAX           (1<<1)
// #define NODE_ST_FIXED_CLEN          (1<<2)
// #define NODE_ST_MARK1               (1<<3)
// #define NODE_ST_MARK2               (1<<4)
// #define NODE_ST_STRICT_REAL_REPEAT  (1<<5)
// #define NODE_ST_RECURSION           (1<<6)
// #define NODE_ST_CALLED              (1<<7)
// #define NODE_ST_FIXED_ADDR          (1<<8)
// #define NODE_ST_NAMED_GROUP         (1<<9)
// #define NODE_ST_IN_REAL_REPEAT      (1<<10) /* STK_REPEAT is nested in stack. */
// #define NODE_ST_IN_ZERO_REPEAT      (1<<11) /* (....){0} */
// #define NODE_ST_IN_MULTI_ENTRY      (1<<12)
// #define NODE_ST_NEST_LEVEL          (1<<13)
// #define NODE_ST_BY_NUMBER           (1<<14) /* {n,m} */
// #define NODE_ST_BY_NAME             (1<<15) /* backref by name */
// #define NODE_ST_BACKREF             (1<<16)
// #define NODE_ST_CHECKER             (1<<17)
// #define NODE_ST_PROHIBIT_RECURSION  (1<<18)
// #define NODE_ST_SUPER               (1<<19)
// #define NODE_ST_EMPTY_STATUS_CHECK  (1<<20)
// #define NODE_ST_IGNORECASE          (1<<21)
// #define NODE_ST_MULTILINE           (1<<22)
// #define NODE_ST_TEXT_SEGMENT_WORD   (1<<23)
// #define NODE_ST_ABSENT_WITH_SIDE_EFFECTS (1<<24)  /* stopper or clear */
// #define NODE_ST_FIXED_CLEN_MIN_SURE (1<<25)
// #define NODE_ST_REFERENCED          (1<<26)
// #define NODE_ST_INPEEK              (1<<27)


// #define NODE_STATUS(node)           (((Node* )node)->u.base.status)
// #define NODE_STATUS_ADD(node,f)     (NODE_STATUS(node) |= (NODE_ST_ ## f))
// #define NODE_STATUS_REMOVE(node,f)  (NODE_STATUS(node) &= ~(NODE_ST_ ## f))

// #define NODE_IS_BY_NUMBER(node)       ((NODE_STATUS(node) & NODE_ST_BY_NUMBER)      != 0)
// #define NODE_IS_IN_REAL_REPEAT(node)  ((NODE_STATUS(node) & NODE_ST_IN_REAL_REPEAT) != 0)
// #define NODE_IS_CALLED(node)          ((NODE_STATUS(node) & NODE_ST_CALLED)         != 0)
// #define NODE_IS_IN_MULTI_ENTRY(node)  ((NODE_STATUS(node) & NODE_ST_IN_MULTI_ENTRY) != 0)
// #define NODE_IS_RECURSION(node)       ((NODE_STATUS(node) & NODE_ST_RECURSION)      != 0)
// #define NODE_IS_IN_ZERO_REPEAT(node)  ((NODE_STATUS(node) & NODE_ST_IN_ZERO_REPEAT) != 0)
// #define NODE_IS_NAMED_GROUP(node)     ((NODE_STATUS(node) & NODE_ST_NAMED_GROUP)  != 0)
// #define NODE_IS_FIXED_ADDR(node)      ((NODE_STATUS(node) & NODE_ST_FIXED_ADDR)   != 0)
// #define NODE_IS_FIXED_CLEN(node)      ((NODE_STATUS(node) & NODE_ST_FIXED_CLEN)   != 0)
// #define NODE_IS_FIXED_MIN(node)       ((NODE_STATUS(node) & NODE_ST_FIXED_MIN)    != 0)
// #define NODE_IS_FIXED_MAX(node)       ((NODE_STATUS(node) & NODE_ST_FIXED_MAX)    != 0)
// #define NODE_IS_MARK1(node)           ((NODE_STATUS(node) & NODE_ST_MARK1)        != 0)
// #define NODE_IS_MARK2(node)           ((NODE_STATUS(node) & NODE_ST_MARK2)        != 0)
// #define NODE_IS_NEST_LEVEL(node)      ((NODE_STATUS(node) & NODE_ST_NEST_LEVEL)   != 0)
// #define NODE_IS_BY_NAME(node)         ((NODE_STATUS(node) & NODE_ST_BY_NAME)      != 0)
// #define NODE_IS_BACKREF(node)         ((NODE_STATUS(node) & NODE_ST_BACKREF)      != 0)
// #define NODE_IS_CHECKER(node)         ((NODE_STATUS(node) & NODE_ST_CHECKER)      != 0)
// #define NODE_IS_SUPER(node)           ((NODE_STATUS(node) & NODE_ST_SUPER)        != 0)
// #define NODE_IS_PROHIBIT_RECURSION(node) \
//     ((NODE_STATUS(node) & NODE_ST_PROHIBIT_RECURSION) != 0)
// #define NODE_IS_STRICT_REAL_REPEAT(node) \
//     ((NODE_STATUS(node) & NODE_ST_STRICT_REAL_REPEAT) != 0)
// #define NODE_IS_EMPTY_STATUS_CHECK(node) \
//     ((NODE_STATUS(node) & NODE_ST_EMPTY_STATUS_CHECK) != 0)
// #define NODE_IS_IGNORECASE(node)      ((NODE_STATUS(node) & NODE_ST_IGNORECASE) != 0)
// #define NODE_IS_MULTILINE(node)       ((NODE_STATUS(node) & NODE_ST_MULTILINE) != 0)
// #define NODE_IS_TEXT_SEGMENT_WORD(node)  ((NODE_STATUS(node) & NODE_ST_TEXT_SEGMENT_WORD) != 0)
// #define NODE_IS_ABSENT_WITH_SIDE_EFFECTS(node)  ((NODE_STATUS(node) & NODE_ST_ABSENT_WITH_SIDE_EFFECTS) != 0)
// #define NODE_IS_FIXED_CLEN_MIN_SURE(node)  ((NODE_STATUS(node) & NODE_ST_FIXED_CLEN_MIN_SURE) != 0)
// #define NODE_IS_REFERENCED(node)      ((NODE_STATUS(node) & NODE_ST_REFERENCED) != 0)
// #define NODE_IS_INPEEK(node)          ((NODE_STATUS(node) & NODE_ST_INPEEK) != 0)

// #define NODE_PARENT(node)         ((node)->u.base.parent)
// #define NODE_BODY(node)           ((node)->u.base.body)
// #define NODE_QUANT_BODY(node)     ((node)->body)
// #define NODE_BAG_BODY(node)       ((node)->body)
// #define NODE_CALL_BODY(node)      ((node)->body)
// #define NODE_ANCHOR_BODY(node)    ((node)->body)

// #define PARSEENV_MEMENV_SIZE  8
// #define PARSEENV_MEMENV(senv) \
//  (IS_NOT_NULL((senv)->mem_env_dynamic) ? \
//     (senv)->mem_env_dynamic : (senv)->mem_env_static)

// #define IS_SYNTAX_OP(syn, opm)    (((syn)->op  & (opm)) != 0)
// #define IS_SYNTAX_OP2(syn, opm)   (((syn)->op2 & (opm)) != 0)
// #define IS_SYNTAX_BV(syn, bvm)    (((syn)->behavior & (bvm)) != 0)

// #define ID_ENTRY(env, id) do {\
//   id = (env)->id_num++;\
// } while(0)


// typedef struct {
//   Node* mem_node;
//   Node* empty_repeat_node;
// } MemEnv;

// typedef struct {
//   enum SaveType type;
// } SaveItem;

pub const ParseEnv = struct {
    options: Option,
//   OnigCaseFoldType case_fold_flag;
//   OnigEncoding     enc;
//   OnigSyntaxType*  syntax;
//   MemStatusType    cap_history;
//   MemStatusType    backtrack_mem; /* backtrack/recursion */
//   MemStatusType    backrefed_mem;
//   UChar*           pattern;
//   UChar*           pattern_end;
//   UChar*           error;
//   UChar*           error_end;
//   regex_t*         reg;       /* for reg->names only */
//   int              num_call;
//   int              num_mem;
//   int              num_named;
//   int              mem_alloc;
//   MemEnv           mem_env_static[PARSEENV_MEMENV_SIZE];
//   MemEnv*          mem_env_dynamic;
//   int              backref_num;
//   int              keep_num;
//   int              id_num;
//   int              save_alloc_num;
//   SaveItem*        saves;
// #ifdef USE_CALL
//   UnsetAddrList*   unset_addr_list;
//   int              has_call_zero;
// #endif
//   unsigned int     parse_depth;
// #ifdef ONIG_DEBUG_PARSE
//   unsigned int     max_parse_depth;
// #endif
};

// extern int    onig_renumber_name_table P_((regex_t* reg, GroupNumMap* map));

// extern int    onig_strncmp P_((const UChar* s1, const UChar* s2, int n));
// extern void   onig_strcpy P_((UChar* dest, const UChar* src, const UChar* end));
// extern void   onig_scan_env_set_error_string P_((ParseEnv* env, int ecode, UChar* arg, UChar* arg_end));
// extern int    onig_reduce_nested_quantifier P_((Node* pnode));
// extern int    onig_node_copy(Node** rcopy, Node* from);
// extern int    onig_node_str_cat P_((Node* node, const UChar* s, const UChar* end));
// extern int    onig_node_str_set P_((Node* node, const UChar* s, const UChar* end, int need_free));
// extern void   onig_node_str_clear P_((Node* node, int need_free));
// extern void   onig_node_free P_((Node* node));
// extern int    onig_node_reset_empty P_((Node* node));
// extern int    onig_node_reset_fail P_((Node* node));
// extern Node*  onig_node_new_bag P_((enum BagType type));
// extern Node*  onig_node_new_str P_((const UChar* s, const UChar* end));
// extern Node*  onig_node_new_list P_((Node* left, Node* right));
// extern Node*  onig_node_new_alt P_((Node* left, Node* right));
// extern int    onig_names_free P_((regex_t* reg));
// extern int    onig_parse_tree P_((Node** root, const UChar* pattern, const UChar* end, regex_t* reg, ParseEnv* env));
// extern int    onig_free_shared_cclass_table P_((void));
// extern int    onig_is_code_in_cc P_((OnigEncoding enc, OnigCodePoint code, CClassNode* cc));
// extern int    onig_new_cclass_with_code_list(Node** rnode, OnigEncoding enc, int n, OnigCodePoint codes[]);
// extern OnigLen onig_get_tiny_min_len(Node* node, unsigned int inhibit_node_types, int* invalid_node);

// #ifdef USE_CALLOUT
// extern int onig_global_callout_names_free(void);
// #endif

// #ifdef ONIG_DEBUG
// extern int onig_print_names(FILE*, regex_t*);
// #endif

// #endif /* REGPARSE_H */
