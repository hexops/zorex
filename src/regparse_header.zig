const std = @import("std");
const Allocator = std.mem.Allocator;
const Option = @import("oniguruma.zig").Option;
const CaseFoldType = @import("oniguruma.zig").CaseFoldType;
const EncCType = @import("oniguruma.zig").EncCType;
const Syntax = @import("regsyntax.zig").Syntax;
const Regex = @import("regcomp.zig").Regex;
const PToken = @import("regparse.zig").PToken;
const TokenSym = @import("regparse.zig").TokenSym;
const fetchToken = @import("regparse.zig").fetchToken;
const ParseDepthLimit = @import("regparse.zig").ParseDepthLimit;
const BitSet = @import("regint.zig").BitSet;
const BBuf = @import("regint.zig").BBuf;
const MemStatusType = @import("regint.zig").MemStatusType;
const AbsAddrType = @import("regint.zig").AbsAddrType;
const SaveType = @import("regint.zig").SaveType;
const config = @import("config.zig");

const NODE_STRING_MARGIN = 16;
const NODE_STRING_BUF_SIZE = 24;  /// sizeof(CClassNode) - sizeof(int)*4
const NODE_BACKREFS_SIZE = 6;

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

pub const BagType = enum {
    memory,
    option,
    stopBacktrack,
    ifElse,
};

pub const GimmickType = enum {
    fail,
    save,
    updateVar,
    // #ifdef USE_CALLOUT
        //   GIMMICK_CALLOUT    = 3,
    // #endif
};

pub const BodyEmptyType = enum {
    isNotEmpty,
    mayBeEmpty,
    mayBeEmptyMem,
    mayBeEmptyRec,
};

const StrNode = struct {
    node_type: NodeType,
    status: isize,
    parent: ?*Node,
    s: ?[]u8,
    flag: usize,
    buf: [NODE_STRING_BUF_SIZE]u8,
    capacity: isize, /// (allocated size - 1) or 0: use buf[]
};

const CClassNode = struct {
    node_type: NodeType,
    status: isize,
    parent: ?*Node,
    flags: usize,
    bs: BitSet,
    mbuf: ?*BBuf, /// multi-byte info or NULL
};

const QuantNode = struct {
    node_type: NodeType,
    status: isize,
    parent: *Node,
    body: *Node,
    lower: isize,
    upper: isize,
    greedy: isize,
    emptiness: BodyEmptyType,
    head_exact: *Node,
    next_head_exact: *Node,
    // TODO(slimsag): may be boolean?
    include_referred: isize, /// include called node. don't eliminate even if {0}
    empty_status_mem: MemStatusType,
};

const BagNode = struct{
    node_type: NodeType,
    status: isize,
    parent: *Node,
    body: *Node,
    u: union {
        m: struct {
            regnum: isize,
            called_addr: AbsAddrType,
            entry_count: isize,
            called_state: isize,
        },
        o: struct {
            options: Option,
        },
        te: struct {
            /// body is condition
            then: *Node,
            els: *Node,
        },
    },
    /// for multiple call reference
    min_len: usize, /// max length (byte)
    max_len: usize, /// max length (byte)
    min_char_len: usize,
    max_char_len: usize,
    opt_count: isize, /// reference count in optimize_nodes()
};

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

const BackRefNode = struct {
    node_type: NodeType,
    status: isize,
    parent: *Node,
    back_static: [NODE_BACKREFS_SIZE]isize,
    back_dynamic: []isize,
    nest_level: isize,
};

const AnchorNode = struct {
    node_type: NodeType,
    status: isize,
    parent: *Node,
    body: *Node,
    type: isize,
    char_min_len: usize,
    char_max_len: usize,
    ascii_mode: Option,
    lead_node: ?*Node,
};

const ConsAltNode = struct {
    node_type: NodeType,
    status: isize,
    parent: ?*Node,
    car: *Node,
    cdr: ?*Node,
};

const CTypeNode = struct {
    node_type: NodeType,
    status: isize,
    parent: ?*Node,
    ctype: EncCType,
    not: bool,
    ascii_mode: Option,
};

const GimmickNode = struct {
    node_type: NodeType,
    status: isize,
    parent: ?*Node,
    type: GimmickType,
    detail_type: isize,
    num: isize,
    id: isize,
};

pub const NodeBaseTag = enum {
    str,
    cclass,
    quant,
    bag,
    backRefNode,
    anchor,
    cons,
    ctype,
    // #ifdef USE_CALL
        //call,
    // #endif
    gimmick,
};

pub const NodeBase = union(NodeBaseTag) {
    str: StrNode,
    cclass: CClassNode,
    quant: QuantNode,
    bag: BagNode,
    backRefNode: BackRefNode,
    anchor: AnchorNode,
    cons: ConsAltNode,
    ctype: CTypeNode,
    // #ifdef USE_CALL
        //     CallNode      call;
    // #endif
    gimmick: GimmickNode,
};

pub const Node = struct {
    u: ?NodeBase,

    pub fn new(allocator: *Allocator) !*Node {
        const node = try allocator.create(Node);
        node.* = std.mem.zeroes(Node);
        if (config.DebugNodeFree) {
            //   fprintf(stderr, "node_new: %p\n", node);
        }
        return node;
    }

    pub fn newString(allocator: *Allocator, s: []const u8) !*Node {
        const node = try Node.new(allocator);
        errdefer node.deinit(allocator);
        try node.setString(s);
        return node;
    }

    pub fn newEmpty(allocator: *Allocator) !*Node {
        return Node.newString(allocator, ""); // TODO(slimsag): is an empty string right?
    }

    pub fn newAlt(allocator: *Allocator, left: *Node, right: ?*Node) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .cons = ConsAltNode{
                .node_type = NodeType.Alt,
                .status = 0,
                .parent = null,
                .car = left,
                .cdr = right,
            },
        };
        return node;
    }

    pub fn newCClass(allocator: *Allocator) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .cclass = CClassNode{
                .node_type = NodeType.CClass,
                .status = 0,
                .parent = null,
                .flags = 0,
                .bs = 0,
                .mbuf = null,
            },
        };
        return node;
    }

    pub fn newCType(allocator: *Allocator, ctype_value: EncCType, not: bool, options: Option) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .ctype = CTypeNode{
                .node_type = NodeType.Alt,
                .status = 0,
                .parent = null,
                .ctype = ctype_value,
                .not = not,
                .ascii_mode = options.withIsASCIIModeCType(ctype_value),
            }
        };
        return node;
    }

    pub fn newAnyChar(allocator: *Allocator, options: Option) !*Node {
        const node = try Node.newCType(allocator, EncCType.AnyChar, false, options);
        if (options.isEnabled(Option.MultiLine)) {
            //     NODE_STATUS_ADD(node, MULTILINE);
        }
        return node;
    }

    pub fn newNoNewLine(allocator: *Allocator, env: *ParseEnv) !*Node {
        return try Node.newAnyChar(allocator, Option.Default);
    }

    pub fn newTrueAnyChar(allocator: *Allocator) !*Node {
        return try Node.newAnyChar(allocator, Option.MultiLine);
    }

    pub fn newList(allocator: *Allocator, left: *Node, right: ?*Node) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .cons = ConsAltNode{
                .node_type = NodeType.List,
                .status = 0,
                .parent = null,
                .car = left,
                .cdr = right,
            },
        };
        return node;
    }

    pub fn setString(self: *Node, s: []const u8) !void {
        var strNode = StrNode{
                .node_type = NodeType.String,
                .status =  0,
                .parent = null,
                .s = null,
                .buf = std.mem.zeroes([24]u8),
                .flag = 0,
                .capacity = 0, // TODO(slimsag): not needed? slice indicates this
        };
        strNode.s = &strNode.buf;
        self.u = NodeBase{.str = strNode};
        // TODO(slimsag): simple string concatenation?
        //   try = onig_node_str_cat(node, s, end);
    }

    pub fn newAnchor(allocator: *Allocator, type: isize) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .anchor = AnchorNode{
                .node_type = NodeType.Anchor,
                .status = 0,
                .parent = null,
                .body = null,
                .type = type,
                .char_min_len = 0,
                .char_max_len = INFINITE_LEN,
                .ascii_mode = 0,
                .lead_node = null,
            },
        };
        return node;
    }

    pub fn newAnchorWithOptions(allocator: *Allocator, type: isize, options: Option) !*Node {
        const node = try Node.newAnchor(allocator);
        const wordIsASCII = options.isEnabled(Option.WordIsASCII) or options.isEnabled(Option.POSIXIsASCII);
        node.anchor().ascii_mode = wordIsASCII and type.isWordAnchorType();
        if (type == Ancr.TextSegmentBoundary or type == Ancr.NoTextSegmentBoundary) {
            if (options.isEnabled(Option.TextSegmentWord)) {
                //       NODE_STATUS_ADD(node, TEXT_SEGMENT_WORD);
            }
        }
        return node;
    }

    // static Node*
    // node_new_backref(int back_num, int* backrefs, int by_name,
    // #ifdef USE_BACKREF_WITH_LEVEL
        //                  int exist_level, int nest_level,
    // #endif
    //                  ParseEnv* env)
    // {
    //   int i;
    //   Node* node;
    //   node = node_new();
    //   CHECK_NULL_RETURN(node);
    //   NODE_SET_TYPE(node, NODE_BACKREF);
    //   BACKREF_(node)->back_num = back_num;
    //   BACKREF_(node)->back_dynamic = (int* )NULL;
    //   if (by_name != 0)
    //     NODE_STATUS_ADD(node, BY_NAME);
    //   if (OPTON_IGNORECASE(env->options))
    //     NODE_STATUS_ADD(node, IGNORECASE);
    // #ifdef USE_BACKREF_WITH_LEVEL
        //   if (exist_level != 0) {
        //     NODE_STATUS_ADD(node, NEST_LEVEL);
        //     BACKREF_(node)->nest_level  = nest_level;
        //   }
    // #endif
    //   for (i = 0; i < back_num; i++) {
    //     if (backrefs[i] <= env->num_mem &&
    //         IS_NULL(PARSEENV_MEMENV(env)[backrefs[i]].mem_node)) {
    //       NODE_STATUS_ADD(node, RECURSION);   /* /...(\1).../ */
    //       break;
    //     }
    //   }
    //   if (back_num <= NODE_BACKREFS_SIZE) {
    //     for (i = 0; i < back_num; i++)
    //       BACKREF_(node)->back_static[i] = backrefs[i];
    //   }
    //   else {
    //     int* p = (int* )xmalloc(sizeof(int) * back_num);
    //     if (IS_NULL(p)) {
    //       onig_node_free(node);
    //       return NULL;
    //     }
    //     BACKREF_(node)->back_dynamic = p;
    //     for (i = 0; i < back_num; i++)
    //       p[i] = backrefs[i];
    //   }
    //   env->backref_num++;
    //   return node;
    // }

    // static Node*
    // node_new_backref_checker(int back_num, int* backrefs, int by_name,
    // #ifdef USE_BACKREF_WITH_LEVEL
        //                          int exist_level, int nest_level,
    // #endif
    //                          ParseEnv* env)
    // {
    //   Node* node;
    //   node = node_new_backref(back_num, backrefs, by_name,
    // #ifdef USE_BACKREF_WITH_LEVEL
        //                           exist_level, nest_level,
    // #endif
    //                           env);
    //   CHECK_NULL_RETURN(node);
    //   NODE_STATUS_ADD(node, CHECKER);
    //   return node;
    // }

    // #ifdef USE_CALL
        // static Node*
        // node_new_call(UChar* name, UChar* name_end, int gnum, int by_number)
        // {
        //   Node* node = node_new();
        //   CHECK_NULL_RETURN(node);
        //   NODE_SET_TYPE(node, NODE_CALL);
        //   CALL_(node)->by_number   = by_number;
        //   CALL_(node)->name        = name;
        //   CALL_(node)->name_end    = name_end;
        //   CALL_(node)->called_gnum = gnum;
        //   CALL_(node)->entry_count = 1;
        //   return node;
        // }
    // #endif

    pub fn newQuantifier(allocator: *Allocator, lower: isize, upper: isize, by_number: bool) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .quant = QuantNode{
                .node_type = NodeType.Quant,
                .status = 0,
                .parent = null,
                .body = null,
                .lower = lower,
                .upper = upper,
                .greedy = 1,
                .emptiness = BODY_IS_NOT_EMPTY,
                .head_exact = null,
                .next_head_exact = null,
                .include_referred = 0,
                .empty_status_mem = 0,
            },
        };
        if (by_number) {
            //     NODE_STATUS_ADD(node, BY_NUMBER);
        }
        return node;
    }

    pub fn newBag(allocator: *Allocator, type: Bag) !*Node {
        const node = try Node.new(allocator);
        node.u = NodeBase{
            .bag = BagNode{
                .node_type = NodeType.Quant,
                .type = type,
                .status = 0,
                .parent = null,
                .body = null,
                .u = null,
                .min_len = 0,
                .max_len = 0,
                .min_char_len = 0,
                .max_char_len = 0,
                .opt_count = 0,
            },
        };
        switch (type) {
        BagType.memory => {
            node.bag().u.?.regnum = 0;
            node.bag().u.?.called_addr = -1;
            node.bag().u.?.entry_count = 0;
            node.bag().u.?.called_state = 0;
        },
        BagType.option => node.bag().u.?.options = 0,
        BagType.stopBacktrack => {},
        BagType.ifElse => {
            node.bag().u.?.te.then = 0;
            node.bag().u.?.te.els = 0;
        },
        }
        return node;
    }

    // TODO(slimsag): presumably condition is optional?
    pub fn newBagIfElse(allocator: *Allocator, cond: *Node, then: *Node, els: *Node) !*Node {
        const node = try Node.newBag(allocator);
        //   NODE_BODY(n) = cond;
        node.bag().u.?.te.then = then;
        node.bag().u.?.te.els = els;
        return node;
    }

    pub fn newGeneralNewLine(allocator: *Allocator, env: *ParseEnv) !*Node {
        return Node.new(allocator); // TODO(slimsag): remove this line
        //   int r;
        //   int dlen, alen;
        //   UChar buf[ONIGENC_CODE_TO_MBC_MAXLEN * 2];
        //   Node* crnl;
        //   Node* ncc;
        //   Node* x;
        //   CClassNode* cc;

        //   dlen = ONIGENC_CODE_TO_MBC(env->enc, 0x0d, buf);
        //   if (dlen < 0) return dlen;
        //   alen = ONIGENC_CODE_TO_MBC(env->enc, NEWLINE_CODE, buf + dlen);
        //   if (alen < 0) return alen;

        //   crnl = node_new_str_crude(buf, buf + dlen + alen, ONIG_OPTION_NONE);
        //   CHECK_NULL_RETURN_MEMERR(crnl);

        //   ncc = node_new_cclass();
        //   if (IS_NULL(ncc)) goto err2;

        //   cc = CCLASS_(ncc);
        //   if (dlen == 1) {
        //     bitset_set_range(cc->bs, NEWLINE_CODE, 0x0d);
        //   }
        //   else {
        //     r = add_code_range(&(cc->mbuf), env, NEWLINE_CODE, 0x0d);
        //     if (r != 0) {
        //     err1:
        //       onig_node_free(ncc);
        //     err2:
        //       onig_node_free(crnl);
        //       return ONIGERR_MEMORY;
        //     }
        //   }

        //   if (ONIGENC_IS_UNICODE_ENCODING(env->enc)) {
        //     r = add_code_range(&(cc->mbuf), env, 0x85, 0x85);
        //     if (r != 0) goto err1;
        //     r = add_code_range(&(cc->mbuf), env, 0x2028, 0x2029);
        //     if (r != 0) goto err1;
        //   }

        //   x = node_new_bag_if_else(crnl, NULL_NODE, ncc);
        //   if (IS_NULL(x)) goto err1;

        //   *node = x;
        //   return 0;
    }

    pub fn newMemory(allocator: *Allocator, is_named: bool) !*Node {
        const node = try Node.newBag(allocator, BagType.memory);
        if (is_named) {
            //     NODE_STATUS_ADD(node, NAMED_GROUP);
        }
        return node;
    }

    pub fn newOption(allocator: *Allocator, option: Option) !*Node {
        const node = try Node.newBag(allocator, BagType.option);
        node.bag().u.?.o.options = option;
        return node;
    }

    pub fn newGroup(allocator: *Allocator, content: *Node) !*Node {
        const node = try Node.new(allocator);
        node.setType(NodeType.List);
        node.car().* = content;
        node.cdr().* = null;
        return node;
    }

    pub fn deinit(self: *Node, allocator: *Allocator) void {
        // #ifdef DEBUG_NODE_FREE
            //   fprintf(stderr, "onig_node_free: %p\n", node);
        // #endif
        self.deinit_body(allocator);
        allocator.destroy(self);
    }

    fn deinit_body(self: *Node, allocator: *Allocator) void {
        switch (self.getType()) {
        NodeType.String => {
            if (self.str().capacity != 0
                and self.str().s != null
                and std.mem.eql(u8, self.str().s.?, &self.str().buf)) {
                    allocator.free(self.str().s.?);
            }
        },
        NodeType.List, NodeType.Alt => {
            var node = self;
            node.car().*.deinit(allocator);
            //node = node.cdr().*;
            //while (node != null) {
                //       Node* next = NODE_CDR(node);
                //       onig_node_free(NODE_CAR(node));
                //       xfree(node);
                //       node = next;
            //}
        },
        NodeType.CClass => {
            //     {
            //       CClassNode* cc = CCLASS_(node);

            //       if (cc->mbuf)
            //         bbuf_free(cc->mbuf);
            //     }
            //     break;
        },
        NodeType.BackRef => {
            //     if (IS_NOT_NULL(BACKREF_(node)->back_dynamic))
            //       xfree(BACKREF_(node)->back_dynamic);
            //     break;
        },
        NodeType.Bag => {
            //     if (NODE_BODY(node))
            //       onig_node_free(NODE_BODY(node));

            //     {
            //       BagNode* en = BAG_(node);
            //       if (en->type == BAG_IF_ELSE) {
            //         onig_node_free(en->te.Then);
            //         onig_node_free(en->te.Else);
            //       }
            //     }
            //     break;
        },
        NodeType.Quant => {
            //     if (NODE_BODY(node))
            //       onig_node_free(NODE_BODY(node));
            //     break;
        },
        NodeType.Anchor => {
            //     if (NODE_BODY(node))
            //       onig_node_free(NODE_BODY(node));
            //     if (IS_NOT_NULL(ANCHOR_(node)->lead_node))
            //       onig_node_free(ANCHOR_(node)->lead_node);
            //     break;
        },
        NodeType.CType, NodeType.Call, NodeType.Gimmick => {},
        }
    }

    pub fn str(self: *Node) callconv(.Inline) *StrNode { return &self.u.?.str; }
    pub fn cclass(self: *Node) callconv(.Inline) *CClassNode { return &self.u.?.cclass; }
    pub fn ctype(self: *Node) callconv(.Inline) *CTypeNode { return &self.u.?.ctype; }
    pub fn backRef(self: *Node) callconv(.Inline) *BackRefNode { return &self.u.?.backRefNode; }
    pub fn quant(self: *Node) callconv(.Inline) *QuantNode { return &self.u.?.quant; }
    pub fn bag(self: *Node) callconv(.Inline) *BagNode { return &self.u.?.bag; }
    pub fn anchor(self: *Node) callconv(.Inline) *AnchorNode { return &self.u.?.anchor; }
    pub fn cons(self: *Node) callconv(.Inline) *ConsAltNode { return &self.u.?.cons; }
    pub fn call(self: *Node) callconv(.Inline) *CallNode { return &self.u.?.call; }
    pub fn gimmick(self: *Node) callconv(.Inline) *GimmickNode { return &self.u.?.gimmick; }

    pub fn car(self: *Node) callconv(.Inline) **Node { return &self.u.?.cons.car; }
    pub fn cdr(self: *Node) callconv(.Inline) *?*Node { return &self.u.?.cons.cdr; }

    pub fn parseTree(allocator: *Allocator, self: *Node, pattern: []const u8, reg: *Regex, env: *ParseEnv) !void {
        // #ifdef USE_CALLOUT
            //   RegexExt* ext;
        // #endif

        reg.re_pattern_buffer.string_pool = "";
        reg.re_pattern_buffer.num_mem = 0;
        reg.re_pattern_buffer.num_repeat = 0;
        reg.re_pattern_buffer.num_empty_check = 0;
        reg.re_pattern_buffer.repeat_range_alloc = 0;
        reg.re_pattern_buffer.repeat_range = null;

        if (reg.re_pattern_buffer.name_table) | name_table | {
            name_table.deinit(allocator);
            reg.re_pattern_buffer.name_table = null;
        }

        // TODO(slimsag):
        //   scan_env_clear(env);
        env.options = reg.re_pattern_buffer.options;
        env.case_fold_flag = reg.re_pattern_buffer.case_fold_flag;
        env.syntax = reg.re_pattern_buffer.syntax;
        env.pattern = pattern;
        env.reg = reg;

        self.* = std.mem.zeroes(Node);

        //   if (! ONIGENC_IS_VALID_MBC_STRING(env->enc, pattern, end))
        //     return ONIGERR_INVALID_WIDE_CHAR_VALUE;

        // TODO(slimsag): Why does this take &pattern? Should it?
        var p = pattern;
        var root = self;
        _ = try Node.prs_regexp(allocator, &root, &p, env);
        self.* = root.*; // "return" root node

        // #ifdef USE_CALL
            //   if (env->has_call_zero != 0) {
            //     Node* zero_node;
            //     r = make_call_zero_body(*root, env, &zero_node);
            //     if (r != 0) return r;
            //     *root = zero_node;
            //   }
        // #endif

        reg.re_pattern_buffer.num_mem = env.num_mem;

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
            switch (u) {
            NodeBaseTag.str => return u.str.node_type,
            NodeBaseTag.cclass => return u.cclass.node_type,
            NodeBaseTag.quant => return u.quant.node_type,
            NodeBaseTag.bag => return u.bag.node_type,
            NodeBaseTag.backRefNode => return u.backRefNode.node_type,
            NodeBaseTag.anchor => return u.anchor.node_type,
            NodeBaseTag.cons => return u.cons.node_type,
            NodeBaseTag.ctype => return u.ctype.node_type,
            NodeBaseTag.gimmick => return u.gimmick.node_type,
            }
        }
        unreachable;
    }

    pub fn setType(self: *Node, newType: NodeType) callconv(.Inline) void {
        if (self.u) |u| {
            var uu = u;
            uu.base.node_type = newType;
            self.u = uu;
        }
        unreachable;
    }

    pub fn prs_regexp(allocator: *Allocator, top: **Node, src: *[]const u8, env: *ParseEnv) !TokenSym {
        var tok = PToken.init();
        _ = try fetchToken(&tok, src, env);
        return try Node.prs_alts(allocator, top, &tok, TokenSym.EOT, src, env, false);
    }

    /// term_tok: TokenSym.EOT or TokenSym.SubExpClose
    pub fn prs_alts(allocator: *Allocator, top: **Node, tok: *PToken, term: TokenSym, src: *[]const u8, env: *ParseEnv, group_head: bool) !TokenSym {
        //   int r;
        top.* = undefined;
        try env.incParseDepth();
        const save_options = env.options;

        var node: *Node = undefined;
        var headp: **Node = undefined;
        errdefer node.deinit(allocator); // TODO(slimsag): this is awkward/sketchy
        var r = try Node.prs_branch(allocator, &node, tok, term, src, env, group_head);
        if (r == term) {
            top.* = node; // TODO(slimsag): this style of returns is nasty
        } else if (r == TokenSym.Alt) {
            top.* = try Node.newAlt(allocator, node, null);
            errdefer top.*.deinit(allocator);
            headp = &(top.*.cdr().*.?);
            while (r == TokenSym.Alt) {
                r = try fetchToken(tok, src, env);
                r = try Node.prs_branch(allocator, &node, tok, term, src, env, false);
                headp.* = try Node.newAlt(allocator, node, null);
                headp = &headp.*.cdr().*.?;
            }
            if (tok.type != term) {
                if (term == TokenSym.SubExpClose) {
                    //       return ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS;
                } else {
                    //       return ONIGERR_PARSER_BUG;
                }
            }
        } else {
            if (term == TokenSym.SubExpClose) {
                //       return ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS;
            } else {
                //       return ONIGERR_PARSER_BUG;
            }
        }

        env.options = save_options;
        try env.decParseDepth();
        return r;
    }

    pub fn prs_branch(allocator: *Allocator, top: **Node, tok: *PToken, term: TokenSym, src: *[]const u8, env: *ParseEnv, group_head: bool) !TokenSym {
        top.* = undefined;
        try env.incParseDepth();

        var headp: **Node = undefined;
        var node: *Node = undefined;
        errdefer node.deinit(allocator); // TODO(slimsag): this is awkward/sketchy
        var r = try Node.prs_exp(allocator, &node, tok, term, src, env, group_head);
        if (r == TokenSym.EOT or r == term or r == TokenSym.Alt) {
            top.* = node;
        } else {
            top.* = try Node.newList(allocator, node, null);

            headp = &(top.*.cdr().*.?);
            while (r != TokenSym.EOT and r != term and r != TokenSym.Alt) {
                r = try Node.prs_exp(allocator, &node, tok, term, src, env, false);
                if (node.getType() == NodeType.List) {
                    headp.* = node;
                    // TODO(slimsag): *could* be wrong, needs testing.
                    //         while (IS_NOT_NULL(NODE_CDR(node))) node = NODE_CDR(node);
                    //         headp = &(NODE_CDR(node));
                    while (node.cdr().*) | cdrPtr | {
                        node = cdrPtr;
                    }
                    headp = &(node.cdr().*.?);
                } else {
                    headp.* = try Node.newList(allocator, node, null);
                    headp = &(headp.*.cdr().*.?);
                }
            }
        }
        try env.decParseDepth();
        return r;
    }

    pub fn prs_exp(allocator: *Allocator, np: **Node, tok: *PToken, term: TokenSym, src: *[]const u8, env: *ParseEnv, group_head: bool) !TokenSym {
        //   int r, len, group;
        //   Node* qn;
        //   Node** tp;
        var r: TokenSym = TokenSym.EOT;
        var group: isize = 0;
        var parse_depth: usize = 0;
        retry: while (true) {
            group = 0;
            np.* = undefined;

            parse_depth = env.parse_depth;

            if (tok.type == TokenSym.Alt or tok.type == TokenSym.EOT or tok.type == term) {
                np.* = try Node.newEmpty(allocator);
                return tok.type;
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
            TokenSym.GeneralNewLine => np.* = try Node.newGeneralNewLine(allocator, env),
            TokenSym.NoNewLine => np.* = try Node.newNoNewLine(allocator, env),
            TokenSym.TrueAnyChar => np.* = try Node.newTrueAnyChar(allocator),
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

const GroupNumMap = struct {
    new_val: isize,
};


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

const PARSEENV_MEMENV_SIZE = 8;
// #define PARSEENV_MEMENV(senv) \
//  (IS_NOT_NULL((senv)->mem_env_dynamic) ? \
//     (senv)->mem_env_dynamic : (senv)->mem_env_static)

// #define IS_SYNTAX_OP(syn, opm)    (((syn)->op  & (opm)) != 0)
// #define IS_SYNTAX_OP2(syn, opm)   (((syn)->op2 & (opm)) != 0)
// #define IS_SYNTAX_BV(syn, bvm)    (((syn)->behavior & (bvm)) != 0)

// #define ID_ENTRY(env, id) do {\
//   id = (env)->id_num++;\
// } while(0)

const MemEnv = struct {
    mem_node: *Node,
    empty_repeat_node: *Node,
};

const SaveItem = struct {
    type: SaveType,
};

pub const ParseEnv = struct {
    options: Option,
    case_fold_flag: CaseFoldType,
    syntax: ?*Syntax,
    cap_history: MemStatusType,
    backtrack_mem: MemStatusType, /// backtrack/recursion
    backrefed_mem: MemStatusType,
    pattern: []const u8,
    err: []u8,
    reg: ?*Regex, /// for reg.names only
    num_call: isize,
    num_mem: isize,
    num_named: isize,
    mem_alloc: isize,
    mem_env_static: ?[PARSEENV_MEMENV_SIZE]MemEnv,
    mem_env_dynamic: ?*MemEnv,
    backref_num: isize,
    keep_num: isize,
    id_num: isize,
    save_alloc_num: isize,
    saves: ?*SaveItem,
    // #ifdef USE_CALL
        //   UnsetAddrList*   unset_addr_list;
        //   int              has_call_zero;
    // #endif
    parse_depth: usize,
    // #ifdef ONIG_DEBUG_PARSE
        //   unsigned int     max_parse_depth;
    // #endif

    pub fn incParseDepth(self: *ParseEnv) !void {
        if (config.DebugParse) {
            self.parse_depth += 1;
            //   if (env->max_parse_depth < (d)) env->max_parse_depth = d;\
            if (self.parse_depth > ParseDepthLimit) {
                //     return ONIGERR_PARSE_DEPTH_LIMIT_OVER;\
            }
        } else {
            self.parse_depth += 1;
            if (self.parse_depth > ParseDepthLimit) {
                //     return ONIGERR_PARSE_DEPTH_LIMIT_OVER;\
            }
        }
    }

    pub fn decParseDepth(self: *ParseEnv) !void {
        self.parse_depth -= 1;
    }
};
