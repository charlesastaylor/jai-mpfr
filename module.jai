//
// Bindings to https://www.mpfr.org/
//
// Docs: https://www.mpfr.org/mpfr-current/mpfr.html

// Uses system installed packages atm - `sudo apt install libmpfr-dev`
#assert OS == .LINUX "Only linux supported atm!";


// @Incomplete: Unix only. And only using system installed libs.
// @Incomplete: The varargs versions of mpfr_inits, mpfr_clears, etc, don't seem to work?
// @Incomplete: The mpfr_t gets generated incorrectly, you can just use __mpfr_struct for now. This is due to some way it is defined in c: "The C data type for such objects is mpfr_t, internally defined as a one-element array of a structure (so that when passed as an argument to a function, it is the pointer that is actually passed), and mpfr_ptr is the C data type representing a pointer to this structure; mpfr_srcptr is like mpfr_ptr, but the structure is read-only (i.e., const qualified)."

#load "bindings_unix.jai";

#scope_file

libgmp :: #library,system,link_always "libgmp";
