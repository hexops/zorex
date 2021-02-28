/// bitset
pub const BITS_PER_BYTE    =  8;
pub const SINGLE_BYTE_SIZE =  (1 << BITS_PER_BYTE);
pub const BITS_IN_ROOM     =  32;   /// 4 * BITS_PER_BYTE
pub const BITSET_REAL_SIZE =  (SINGLE_BYTE_SIZE / BITS_IN_ROOM);

// typedef Bits*     BitSetRef;
pub const Bits = u32;
pub const BitSet = [BITSET_REAL_SIZE]Bits;

pub const SIZE_BITSET = @sizeOf(Bitset);

// #define BITSET_CLEAR(bs) do {\
//   int i;\
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) { (bs)[i] = 0; } \
// } while (0)

// #define BS_ROOM(bs,pos)            (bs)[(unsigned int )(pos) >> 5]
// #define BS_BIT(pos)                (1u << ((unsigned int )(pos) & 0x1f))

// #define BITSET_AT(bs, pos)         (BS_ROOM(bs,pos) & BS_BIT(pos))
// #define BITSET_SET_BIT(bs, pos)     BS_ROOM(bs,pos) |= BS_BIT(pos)
// #define BITSET_CLEAR_BIT(bs, pos)   BS_ROOM(bs,pos) &= ~(BS_BIT(pos))
// #define BITSET_INVERT_BIT(bs, pos)  BS_ROOM(bs,pos) ^= BS_BIT(pos)

// #define BITSET_IS_EMPTY(bs,empty) do {\
//   int i;\
//   empty = 1;\
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) {\
//     if ((bs)[i] != 0) {\
//       empty = 0; break;\
//     }\
//   }\
// } while (0)

// static void
// bitset_set_range(BitSetRef bs, int from, int to)
// {
//   int i;
//   for (i = from; i <= to && i < SINGLE_BYTE_SIZE; i++) {
//     BITSET_SET_BIT(bs, i);
//   }
// }

// static void
// bitset_invert(BitSetRef bs)
// {
//   int i;
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) { bs[i] = ~(bs[i]); }
// }

// static void
// bitset_invert_to(BitSetRef from, BitSetRef to)
// {
//   int i;
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) { to[i] = ~(from[i]); }
// }

// static void
// bitset_and(BitSetRef dest, BitSetRef bs)
// {
//   int i;
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) { dest[i] &= bs[i]; }
// }

// static void
// bitset_or(BitSetRef dest, BitSetRef bs)
// {
//   int i;
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) { dest[i] |= bs[i]; }
// }

// static void
// bitset_copy(BitSetRef dest, BitSetRef bs)
// {
//   int i;
//   for (i = 0; i < (int )BITSET_REAL_SIZE; i++) { dest[i] = bs[i]; }
// }

// static int
// bitset_on_num(BitSetRef bs)
// {
//   int i, n;

//   n = 0;
//   for (i = 0; i < SINGLE_BYTE_SIZE; i++) {
//     if (BITSET_AT(bs, i)) n++;
//   }

//   return n;
// }
