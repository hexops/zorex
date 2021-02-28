
// TODO(slimsag): replace with std.ArrayBuffer?
pub const BBuf = struct {};
// /* bytes buffer */
// typedef struct _BBuf {
//   UChar* p;
//   unsigned int used;
//   unsigned int alloc;
// } BBuf;

// #define BB_INIT(buf,size)    bbuf_init((BBuf* )(buf), (size))

// #define BB_EXPAND(buf,low) do{\
//   do { (buf)->alloc *= 2; } while ((buf)->alloc < (unsigned int )low);\
//   (buf)->p = (UChar* )xrealloc((buf)->p, (buf)->alloc);\
//   if (IS_NULL((buf)->p)) return(ONIGERR_MEMORY);\
// } while (0)

// #define BB_ENSURE_SIZE(buf,size) do{\
//   unsigned int new_alloc = (buf)->alloc;\
//   while (new_alloc < (unsigned int )(size)) { new_alloc *= 2; }\
//   if ((buf)->alloc != new_alloc) {\
//     (buf)->p = (UChar* )xrealloc((buf)->p, new_alloc);\
//     if (IS_NULL((buf)->p)) return(ONIGERR_MEMORY);\
//     (buf)->alloc = new_alloc;\
//   }\
// } while (0)

// #define BB_WRITE(buf,pos,bytes,n) do{\
//   int used = (pos) + (n);\
//   if ((buf)->alloc < (unsigned int )used) BB_EXPAND((buf),used);\
//   xmemcpy((buf)->p + (pos), (bytes), (n));\
//   if ((buf)->used < (unsigned int )used) (buf)->used = used;\
// } while (0)

// #define BB_WRITE1(buf,pos,byte) do{\
//   int used = (pos) + 1;\
//   if ((buf)->alloc < (unsigned int )used) BB_EXPAND((buf),used);\
//   (buf)->p[(pos)] = (byte);\
//   if ((buf)->used < (unsigned int )used) (buf)->used = used;\
// } while (0)

// #define BB_ADD(buf,bytes,n)       BB_WRITE((buf),(buf)->used,(bytes),(n))
// #define BB_ADD1(buf,byte)         BB_WRITE1((buf),(buf)->used,(byte))
// #define BB_GET_ADD_ADDRESS(buf)   ((buf)->p + (buf)->used)
// #define BB_GET_OFFSET_POS(buf)    ((buf)->used)

// /* from < to */
// #define BB_MOVE_RIGHT(buf,from,to,n) do {\
//   if ((unsigned int )((to)+(n)) > (buf)->alloc) BB_EXPAND((buf),(to) + (n));\
//   xmemmove((buf)->p + (to), (buf)->p + (from), (n));\
//   if ((unsigned int )((to)+(n)) > (buf)->used) (buf)->used = (to) + (n);\
// } while (0)

// /* from > to */
// #define BB_MOVE_LEFT(buf,from,to,n) do {\
//   xmemmove((buf)->p + (to), (buf)->p + (from), (n));\
// } while (0)

// /* from > to */
// #define BB_MOVE_LEFT_REDUCE(buf,from,to) do {\
//   xmemmove((buf)->p + (to), (buf)->p + (from), (buf)->used - (from));\
//   (buf)->used -= (from - to);\
// } while (0)

// #define BB_INSERT(buf,pos,bytes,n) do {\
//   if (pos >= (buf)->used) {\
//     BB_WRITE(buf,pos,bytes,n);\
//   }\
//   else {\
//     BB_MOVE_RIGHT((buf),(pos),(pos) + (n),((buf)->used - (pos)));\
//     xmemcpy((buf)->p + (pos), (bytes), (n));\
//   }\
// } while (0)

// #define BB_GET_BYTE(buf, pos) (buf)->p[(pos)]

// static int
// bbuf_init(BBuf* buf, int size)
// {
//   if (size <= 0) {
//     size   = 0;
//     buf->p = NULL;
//   }
//   else {
//     buf->p = (UChar* )xmalloc(size);
//     if (IS_NULL(buf->p)) return(ONIGERR_MEMORY);
//   }

//   buf->alloc = size;
//   buf->used  = 0;
//   return 0;
// }

// static void
// bbuf_free(BBuf* bbuf)
// {
//   if (IS_NOT_NULL(bbuf)) {
//     if (IS_NOT_NULL(bbuf->p)) xfree(bbuf->p);
//     xfree(bbuf);
//   }
// }

// static int
// bbuf_clone(BBuf** rto, BBuf* from)
// {
//   int r;
//   BBuf *to;

//   *rto = to = (BBuf* )xmalloc(sizeof(BBuf));
//   CHECK_NULL_RETURN_MEMERR(to);
//   r = BB_INIT(to, from->alloc);
//   if (r != 0) {
//     bbuf_free(to);
//     *rto = 0;
//     return r;
//   }
//   to->used = from->used;
//   xmemcpy(to->p, from->p, from->used);
//   return 0;
// }

// #define BB_WRITE_CODE_POINT(bbuf,pos,code) \
//     BB_WRITE(bbuf, pos, &(code), SIZE_CODE_POINT)

// /* data format:
//      [n][from-1][to-1][from-2][to-2] ... [from-n][to-n]
//      (all data size is OnigCodePoint)
//  */
// static int
// new_code_range(BBuf** pbuf)
// {
// #define INIT_MULTI_BYTE_RANGE_SIZE  (SIZE_CODE_POINT * 5)
//   int r;
//   OnigCodePoint n;
//   BBuf* bbuf;

//   bbuf = *pbuf = (BBuf* )xmalloc(sizeof(BBuf));
//   CHECK_NULL_RETURN_MEMERR(bbuf);
//   r = BB_INIT(bbuf, INIT_MULTI_BYTE_RANGE_SIZE);
//   if (r != 0) {
//     xfree(bbuf);
//     *pbuf = 0;
//     return r;
//   }

//   n = 0;
//   BB_WRITE_CODE_POINT(bbuf, 0, n);
//   return 0;
// }

// static int
// add_code_range_to_buf(BBuf** pbuf, OnigCodePoint from, OnigCodePoint to)
// {
//   int r, inc_n, pos;
//   int low, high, bound, x;
//   OnigCodePoint n, *data;
//   BBuf* bbuf;

//   if (from > to) {
//     n = from; from = to; to = n;
//   }

//   if (IS_NULL(*pbuf)) {
//     r = new_code_range(pbuf);
//     if (r != 0) return r;
//     bbuf = *pbuf;
//     n = 0;
//   }
//   else {
//     bbuf = *pbuf;
//     GET_CODE_POINT(n, bbuf->p);
//   }
//   data = (OnigCodePoint* )(bbuf->p);
//   data++;

//   for (low = 0, bound = n; low < bound; ) {
//     x = (low + bound) >> 1;
//     if (from > data[x*2 + 1])
//       low = x + 1;
//     else
//       bound = x;
//   }

//   high = (to == ~((OnigCodePoint )0)) ? n : low;
//   for (bound = n; high < bound; ) {
//     x = (high + bound) >> 1;
//     if (to + 1 >= data[x*2])
//       high = x + 1;
//     else
//       bound = x;
//   }

//   inc_n = low + 1 - high;
//   if (n + inc_n > ONIG_MAX_MULTI_BYTE_RANGES_NUM)
//     return ONIGERR_TOO_MANY_MULTI_BYTE_RANGES;

//   if (inc_n != 1) {
//     if (from > data[low*2])
//       from = data[low*2];
//     if (to < data[(high - 1)*2 + 1])
//       to = data[(high - 1)*2 + 1];
//   }

//   if (inc_n != 0 && (OnigCodePoint )high < n) {
//     int from_pos = SIZE_CODE_POINT * (1 + high * 2);
//     int to_pos   = SIZE_CODE_POINT * (1 + (low + 1) * 2);
//     int size = (n - high) * 2 * SIZE_CODE_POINT;

//     if (inc_n > 0) {
//       BB_MOVE_RIGHT(bbuf, from_pos, to_pos, size);
//     }
//     else {
//       BB_MOVE_LEFT_REDUCE(bbuf, from_pos, to_pos);
//     }
//   }

//   pos = SIZE_CODE_POINT * (1 + low * 2);
//   BB_ENSURE_SIZE(bbuf, pos + SIZE_CODE_POINT * 2);
//   BB_WRITE_CODE_POINT(bbuf, pos, from);
//   BB_WRITE_CODE_POINT(bbuf, pos + SIZE_CODE_POINT, to);
//   n += inc_n;
//   BB_WRITE_CODE_POINT(bbuf, 0, n);

//   return 0;
// }

// static int
// add_code_range(BBuf** pbuf, ParseEnv* env, OnigCodePoint from, OnigCodePoint to)
// {
//   if (from > to) {
//     if (IS_SYNTAX_BV(env->syntax, ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC))
//       return 0;
//     else
//       return ONIGERR_EMPTY_RANGE_IN_CHAR_CLASS;
//   }

//   return add_code_range_to_buf(pbuf, from, to);
// }

// static int
// not_code_range_buf(OnigEncoding enc, BBuf* bbuf, BBuf** pbuf)
// {
//   int r, i, n;
//   OnigCodePoint pre, from, *data, to = 0;

//   *pbuf = (BBuf* )NULL;
//   if (IS_NULL(bbuf)) {
//   set_all:
//     return SET_ALL_MULTI_BYTE_RANGE(enc, pbuf);
//   }

//   data = (OnigCodePoint* )(bbuf->p);
//   GET_CODE_POINT(n, data);
//   data++;
//   if (n <= 0) goto set_all;

//   r = 0;
//   pre = MBCODE_START_POS(enc);
//   for (i = 0; i < n; i++) {
//     from = data[i*2];
//     to   = data[i*2+1];
//     if (pre <= from - 1) {
//       r = add_code_range_to_buf(pbuf, pre, from - 1);
//       if (r != 0) {
//         bbuf_free(*pbuf);
//         return r;
//       }
//     }
//     if (to == ~((OnigCodePoint )0)) break;
//     pre = to + 1;
//   }
//   if (to < ~((OnigCodePoint )0)) {
//     r = add_code_range_to_buf(pbuf, to + 1, ~((OnigCodePoint )0));
//     if (r != 0) bbuf_free(*pbuf);
//   }
//   return r;
// }

// #define SWAP_BB_NOT(bbuf1, not1, bbuf2, not2) do {\
//   BBuf *tbuf; \
//   int  tnot; \
//   tnot = not1;  not1  = not2;  not2  = tnot; \
//   tbuf = bbuf1; bbuf1 = bbuf2; bbuf2 = tbuf; \
// } while (0)

// static int
// or_code_range_buf(OnigEncoding enc, BBuf* bbuf1, int not1,
//                   BBuf* bbuf2, int not2, BBuf** pbuf)
// {
//   int r;
//   OnigCodePoint i, n1, *data1;
//   OnigCodePoint from, to;

//   *pbuf = (BBuf* )NULL;
//   if (IS_NULL(bbuf1) && IS_NULL(bbuf2)) {
//     if (not1 != 0 || not2 != 0)
//       return SET_ALL_MULTI_BYTE_RANGE(enc, pbuf);
//     return 0;
//   }

//   r = 0;
//   if (IS_NULL(bbuf2))
//     SWAP_BB_NOT(bbuf1, not1, bbuf2, not2);

//   if (IS_NULL(bbuf1)) {
//     if (not1 != 0) {
//       return SET_ALL_MULTI_BYTE_RANGE(enc, pbuf);
//     }
//     else {
//       if (not2 == 0) {
//         return bbuf_clone(pbuf, bbuf2);
//       }
//       else {
//         return not_code_range_buf(enc, bbuf2, pbuf);
//       }
//     }
//   }

//   if (not1 != 0)
//     SWAP_BB_NOT(bbuf1, not1, bbuf2, not2);

//   data1 = (OnigCodePoint* )(bbuf1->p);
//   GET_CODE_POINT(n1, data1);
//   data1++;

//   if (not2 == 0 && not1 == 0) { /* 1 OR 2 */
//     r = bbuf_clone(pbuf, bbuf2);
//   }
//   else if (not1 == 0) { /* 1 OR (not 2) */
//     r = not_code_range_buf(enc, bbuf2, pbuf);
//   }
//   if (r != 0) return r;

//   for (i = 0; i < n1; i++) {
//     from = data1[i*2];
//     to   = data1[i*2+1];
//     r = add_code_range_to_buf(pbuf, from, to);
//     if (r != 0) return r;
//   }
//   return 0;
// }

// static int
// and_code_range1(BBuf** pbuf, OnigCodePoint from1, OnigCodePoint to1,
//                 OnigCodePoint* data, int n)
// {
//   int i, r;
//   OnigCodePoint from2, to2;

//   for (i = 0; i < n; i++) {
//     from2 = data[i*2];
//     to2   = data[i*2+1];
//     if (from2 < from1) {
//       if (to2 < from1) continue;
//       else {
//         from1 = to2 + 1;
//       }
//     }
//     else if (from2 <= to1) {
//       if (to2 < to1) {
//         if (from1 <= from2 - 1) {
//           r = add_code_range_to_buf(pbuf, from1, from2-1);
//           if (r != 0) return r;
//         }
//         from1 = to2 + 1;
//       }
//       else {
//         to1 = from2 - 1;
//       }
//     }
//     else {
//       from1 = from2;
//     }
//     if (from1 > to1) break;
//   }
//   if (from1 <= to1) {
//     r = add_code_range_to_buf(pbuf, from1, to1);
//     if (r != 0) return r;
//   }
//   return 0;
// }

// static int
// and_code_range_buf(BBuf* bbuf1, int not1, BBuf* bbuf2, int not2, BBuf** pbuf)
// {
//   int r;
//   OnigCodePoint i, j, n1, n2, *data1, *data2;
//   OnigCodePoint from, to, from1, to1, from2, to2;

//   *pbuf = (BBuf* )NULL;
//   if (IS_NULL(bbuf1)) {
//     if (not1 != 0 && IS_NOT_NULL(bbuf2)) /* not1 != 0 -> not2 == 0 */
//       return bbuf_clone(pbuf, bbuf2);
//     return 0;
//   }
//   else if (IS_NULL(bbuf2)) {
//     if (not2 != 0)
//       return bbuf_clone(pbuf, bbuf1);
//     return 0;
//   }

//   if (not1 != 0)
//     SWAP_BB_NOT(bbuf1, not1, bbuf2, not2);

//   data1 = (OnigCodePoint* )(bbuf1->p);
//   data2 = (OnigCodePoint* )(bbuf2->p);
//   GET_CODE_POINT(n1, data1);
//   GET_CODE_POINT(n2, data2);
//   data1++;
//   data2++;

//   if (not2 == 0 && not1 == 0) { /* 1 AND 2 */
//     for (i = 0; i < n1; i++) {
//       from1 = data1[i*2];
//       to1   = data1[i*2+1];
//       for (j = 0; j < n2; j++) {
//         from2 = data2[j*2];
//         to2   = data2[j*2+1];
//         if (from2 > to1) break;
//         if (to2 < from1) continue;
//         from = MAX(from1, from2);
//         to   = MIN(to1, to2);
//         r = add_code_range_to_buf(pbuf, from, to);
//         if (r != 0) return r;
//       }
//     }
//   }
//   else if (not1 == 0) { /* 1 AND (not 2) */
//     for (i = 0; i < n1; i++) {
//       from1 = data1[i*2];
//       to1   = data1[i*2+1];
//       r = and_code_range1(pbuf, from1, to1, data2, n2);
//       if (r != 0) return r;
//     }
//   }

//   return 0;
// }
