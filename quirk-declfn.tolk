@inlineRef
fun mod(): int {
    return 998242353;
}

fun declfn(value: int): cell asm
    "// Replace CALLREF with PUSHREF"
    "b> <s              // old_code"
    "dup sbits 8 / 2 -  // old_code keep_bytes"
    "B@+                // prev_code_bytes must_callref_refs"
    "16 u@+ swap        // prev_code_bytes refs last_opcode_16bit"
    """56124 - abort"CALLREF expected, got unknown opcode"    // prev_code_bytes refs"""
    "<b swap            // prev_code_bytes new_code refs"
    "s, swap B,         // new_code"
    "x{88} @addop";

// Usage:  declfn(mod()) returns code of `mod` function
// Doesn't drop arguments which should've been passed to the function, though.
// --------------------------------------------------------------------------- //

// pyAndr3w's solution
@inline
fun imod(): int {
    return 998244353;
}

fun cellOfImod(): cell asm
    "<{ imod INLINECALLDICT }>c PUSHREF";
