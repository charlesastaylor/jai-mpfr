//
// This file was auto-generated using the following command:
//
// jai modules/MPFR/generate.jai
//



MPFR_VERSION_MAJOR :: 4;
MPFR_VERSION_MINOR :: 2;
MPFR_VERSION_PATCHLEVEL :: 1;
MPFR_VERSION_STRING :: "4.2.1";

MPFR_FLAGS_UNDERFLOW :: 1;
MPFR_FLAGS_OVERFLOW :: 2;
MPFR_FLAGS_NAN :: 4;
MPFR_FLAGS_INEXACT :: 8;
MPFR_FLAGS_ERANGE :: 16;
MPFR_FLAGS_DIVBY0 :: 32;
MPFR_FLAGS_ALL :: MPFR_FLAGS_UNDERFLOW | MPFR_FLAGS_OVERFLOW | MPFR_FLAGS_NAN | MPFR_FLAGS_INEXACT | MPFR_FLAGS_ERANGE | MPFR_FLAGS_DIVBY0;

_MPFR_PREC_FORMAT :: 3;

_MPFR_EXP_FORMAT :: _MPFR_PREC_FORMAT;

MPFR_PREC_MIN :: 1;
MPFR_PREC_MAX :: cast(mpfr_prec_t) (((cast,trunc(mpfr_uprec_t) -1) >> 1) - 256);

MPFR_EMAX_DEFAULT :: cast(mpfr_exp_t) ((cast(mpfr_ulong) 1 << 30) - 1);
MPFR_EMIN_DEFAULT :: -(MPFR_EMAX_DEFAULT);

__MPFR_EXP_MAX :: cast(mpfr_exp_t) ((cast,trunc(mpfr_uexp_t) -1) >> 1);
__MPFR_EXP_NAN :: 1 - __MPFR_EXP_MAX;
__MPFR_EXP_ZERO :: 0 - __MPFR_EXP_MAX;
__MPFR_EXP_INF :: 2 - __MPFR_EXP_MAX;

mp_rnd_t :: mpfr_rnd_t;

mp_prec_t :: mpfr_prec_t;

MPFR_USE_C99_FEATURE :: 1;

mpfr_cmp_abs :: mpfr_cmpabs;

mpz_set_fr :: mpfr_get_z;

mpfr_get_z_exp :: mpfr_get_z_2exp;
mpfr_custom_get_mantissa :: mpfr_custom_get_significand;

mpf_t :: mpfr_t;
mpf_srcptr :: mpfr_srcptr;
mpf_ptr :: mpfr_ptr;

mpf_inits :: mpfr_inits;

mpf_clears :: mpfr_clears;

mpf_ceil :: mpfr_ceil;

mpf_clear :: mpfr_clear;

mpf_cmp :: mpfr_cmp;

mpf_cmp_si :: mpfr_cmp_si;

mpf_cmp_ui :: mpfr_cmp_ui;

mpf_cmp_d :: mpfr_cmp_d;

mpf_cmp_z :: mpfr_cmp_z;

mpf_eq :: mpfr_eq;

mpf_floor :: mpfr_floor;

mpf_get_prec :: mpfr_get_prec;

mpf_integer_p :: mpfr_integer_p;

mpf_set_default_prec :: mpfr_set_default_prec;

mpf_get_default_prec :: mpfr_get_default_prec;

mpf_set_prec :: mpfr_set_prec;

mpf_trunc :: mpfr_trunc;

mpf_sgn :: mpfr_sgn;

mpf_swap :: mpfr_swap;

mpf_dump :: mpfr_dump;

mp_limb_t :: u64;

__mpz_struct :: struct {
    _mp_alloc: s32;

    _mp_size:  s32;

    _mp_d:     *mp_limb_t;
}

mpz_t :: [1] __mpz_struct;

__mpq_struct :: struct {
    _mp_num: __mpz_struct;
    _mp_den: __mpz_struct;
}

gmp_randalg_t :: enum u32 {
    DEFAULT :: 0;
    LC      :: 0;
}

__gmp_randstate_struct :: struct {
    _mp_seed:    mpz_t;
    _mp_alg:     gmp_randalg_t;
    _mp_algdata: union {
        _mp_lc: *void;
    };
}

gmp_randstate_t :: [1] __gmp_randstate_struct;

mpz_srcptr :: *__mpz_struct;
mpz_ptr :: *__mpz_struct;

mpq_srcptr :: *__mpq_struct;
mpq_ptr :: *__mpq_struct;

/* Avoid some problems with macro expansion if the user defines macros
with the same name as keywords. By convention, identifiers and macro
names starting with mpfr_ are reserved by MPFR. */
mpfr_void :: void;
mpfr_int :: s32;
mpfr_uint :: u32;
mpfr_long :: s64;
mpfr_ulong :: u64;
mpfr_size_t :: u64;

/* Global (possibly TLS) flags. Might also be used in an mpfr_t in the
future (there would be room as mpfr_sign_t just needs 1 byte).
TODO: The tests currently assume that the flags fits in an unsigned int;
this should be cleaned up, e.g. by defining a function that outputs the
flags as a string or by using the flags_out function (from tests/tests.c
directly). */
mpfr_flags_t :: u32;

/* Definition of rounding modes (DON'T USE MPFR_RNDNA!).
Warning! Changing the contents of this enum should be seen as an
interface change since the old and the new types are not compatible
(the integer type compatible with the enumerated type can even change,
see ISO C99, 6.7.2.2#4), and in Makefile.am, AGE should be set to 0.

MPFR_RNDU must appear just before MPFR_RNDD (see
MPFR_IS_RNDUTEST_OR_RNDDNOTTEST in mpfr-impl.h).

If you change the order of the rounding modes, please update the routines
in texceptions.c which assume 0=RNDN, 1=RNDZ, 2=RNDU, 3=RNDD, 4=RNDA.
*/
mpfr_rnd_t :: enum s32 {
    RNDN  :: 0;
    RNDZ  :: 1;
    RNDU  :: 2;
    RNDD  :: 3;
    RNDA  :: 4;
    RNDF  :: 5;
    RNDNA :: -1;
}

mpfr_prec_t :: s64;
mpfr_uprec_t :: u64;

/* Definition of sign */
mpfr_sign_t :: s32;

mpfr_exp_t :: s64;
mpfr_uexp_t :: u64;

/* Definition of the main structure */
__mpfr_struct :: struct {
    _mpfr_prec: mpfr_prec_t;
    _mpfr_sign: mpfr_sign_t;
    _mpfr_exp:  mpfr_exp_t;
    _mpfr_d:    *mp_limb_t;
}

/*
The represented number is
_sign*(_d[k-1]/B+_d[k-2]/B^2+...+_d[0]/B^k)*2^_exp
where k=ceil(_mp_prec/GMP_NUMB_BITS) and B=2^GMP_NUMB_BITS.

For the msb (most significant bit) normalized representation, we must have
_d[k-1]>=B/2, unless the number is singular.

We must also have the last k*GMP_NUMB_BITS-_prec bits set to zero.
*/
mpfr_t :: [1] __mpfr_struct;
mpfr_ptr :: *__mpfr_struct;
mpfr_srcptr :: *__mpfr_struct;

/* Custom interface */
mpfr_kind_t :: enum u32 {
    NAN_KIND     :: 0;
    INF_KIND     :: 1;
    ZERO_KIND    :: 2;
    REGULAR_KIND :: 3;
}

/* Free cache policy */
mpfr_free_cache_t :: enum u32 {
    LOCAL_CACHE  :: 1;
    GLOBAL_CACHE :: 2;
}

mpfr_get_version :: () -> *u8 #foreign libmpfr;
mpfr_get_patches :: () -> *u8 #foreign libmpfr;

mpfr_buildopt_tls_p :: () -> s32 #foreign libmpfr;
mpfr_buildopt_float128_p :: () -> s32 #foreign libmpfr;
mpfr_buildopt_decimal_p :: () -> s32 #foreign libmpfr;
mpfr_buildopt_gmpinternals_p :: () -> s32 #foreign libmpfr;
mpfr_buildopt_sharedcache_p :: () -> s32 #foreign libmpfr;

mpfr_buildopt_tune_case :: () -> *u8 #foreign libmpfr;

mpfr_get_emin :: () -> mpfr_exp_t #foreign libmpfr;
mpfr_set_emin :: (unknown0: mpfr_exp_t) -> s32 #foreign libmpfr;
mpfr_get_emin_min :: () -> mpfr_exp_t #foreign libmpfr;
mpfr_get_emin_max :: () -> mpfr_exp_t #foreign libmpfr;
mpfr_get_emax :: () -> mpfr_exp_t #foreign libmpfr;
mpfr_set_emax :: (unknown0: mpfr_exp_t) -> s32 #foreign libmpfr;
mpfr_get_emax_min :: () -> mpfr_exp_t #foreign libmpfr;
mpfr_get_emax_max :: () -> mpfr_exp_t #foreign libmpfr;

mpfr_set_default_rounding_mode :: (unknown0: mpfr_rnd_t) -> void #foreign libmpfr;
mpfr_get_default_rounding_mode :: () -> mpfr_rnd_t #foreign libmpfr;
mpfr_print_rnd_mode :: (unknown0: mpfr_rnd_t) -> *u8 #foreign libmpfr;

mpfr_clear_flags :: () -> void #foreign libmpfr;
mpfr_clear_underflow :: () -> void #foreign libmpfr;
mpfr_clear_overflow :: () -> void #foreign libmpfr;
mpfr_clear_divby0 :: () -> void #foreign libmpfr;
mpfr_clear_nanflag :: () -> void #foreign libmpfr;
mpfr_clear_inexflag :: () -> void #foreign libmpfr;
mpfr_clear_erangeflag :: () -> void #foreign libmpfr;

mpfr_set_underflow :: () -> void #foreign libmpfr;
mpfr_set_overflow :: () -> void #foreign libmpfr;
mpfr_set_divby0 :: () -> void #foreign libmpfr;
mpfr_set_nanflag :: () -> void #foreign libmpfr;
mpfr_set_inexflag :: () -> void #foreign libmpfr;
mpfr_set_erangeflag :: () -> void #foreign libmpfr;

mpfr_underflow_p :: () -> s32 #foreign libmpfr;
mpfr_overflow_p :: () -> s32 #foreign libmpfr;
mpfr_divby0_p :: () -> s32 #foreign libmpfr;
mpfr_nanflag_p :: () -> s32 #foreign libmpfr;
mpfr_inexflag_p :: () -> s32 #foreign libmpfr;
mpfr_erangeflag_p :: () -> s32 #foreign libmpfr;

mpfr_flags_clear :: (unknown0: mpfr_flags_t) -> void #foreign libmpfr;
mpfr_flags_set :: (unknown0: mpfr_flags_t) -> void #foreign libmpfr;
mpfr_flags_test :: (unknown0: mpfr_flags_t) -> mpfr_flags_t #foreign libmpfr;
mpfr_flags_save :: () -> mpfr_flags_t #foreign libmpfr;
mpfr_flags_restore :: (unknown0: mpfr_flags_t, unknown1: mpfr_flags_t) -> void #foreign libmpfr;

mpfr_check_range :: (unknown0: mpfr_ptr, unknown1: s32, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_init2 :: (unknown0: mpfr_ptr, unknown1: mpfr_prec_t) -> void #foreign libmpfr;
mpfr_init :: (unknown0: mpfr_ptr) -> void #foreign libmpfr;
mpfr_clear :: (unknown0: mpfr_ptr) -> void #foreign libmpfr;

mpfr_inits2 :: (unknown0: mpfr_prec_t, unknown1: mpfr_ptr, __args: ..Any) -> void #foreign libmpfr;

mpfr_inits :: (unknown0: mpfr_ptr, __args: ..Any) -> void #foreign libmpfr;

mpfr_clears :: (unknown0: mpfr_ptr, __args: ..Any) -> void #foreign libmpfr;

mpfr_prec_round :: (unknown0: mpfr_ptr, unknown1: mpfr_prec_t, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_can_round :: (unknown0: mpfr_srcptr, unknown1: mpfr_exp_t, unknown2: mpfr_rnd_t, unknown3: mpfr_rnd_t, unknown4: mpfr_prec_t) -> s32 #foreign libmpfr;

mpfr_min_prec :: (unknown0: mpfr_srcptr) -> mpfr_prec_t #foreign libmpfr;

mpfr_get_exp :: (unknown0: mpfr_srcptr) -> mpfr_exp_t #foreign libmpfr;
mpfr_set_exp :: (unknown0: mpfr_ptr, unknown1: mpfr_exp_t) -> s32 #foreign libmpfr;
mpfr_get_prec :: (unknown0: mpfr_srcptr) -> mpfr_prec_t #foreign libmpfr;
mpfr_set_prec :: (unknown0: mpfr_ptr, unknown1: mpfr_prec_t) -> void #foreign libmpfr;
mpfr_set_prec_raw :: (unknown0: mpfr_ptr, unknown1: mpfr_prec_t) -> void #foreign libmpfr;
mpfr_set_default_prec :: (unknown0: mpfr_prec_t) -> void #foreign libmpfr;
mpfr_get_default_prec :: () -> mpfr_prec_t #foreign libmpfr;

mpfr_set_d :: (unknown0: mpfr_ptr, unknown1: float64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_set_flt :: (unknown0: mpfr_ptr, unknown1: float, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_set_z :: (unknown0: mpfr_ptr, unknown1: mpz_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_set_z_2exp :: (unknown0: mpfr_ptr, unknown1: mpz_srcptr, unknown2: mpfr_exp_t, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_set_nan :: (unknown0: mpfr_ptr) -> void #foreign libmpfr;
mpfr_set_inf :: (unknown0: mpfr_ptr, unknown1: s32) -> void #foreign libmpfr;
mpfr_set_zero :: (unknown0: mpfr_ptr, unknown1: s32) -> void #foreign libmpfr;

/* mini-gmp does not provide mpf_t, we disable the following functions */
mpfr_set_f :: (unknown0: mpfr_ptr, unknown1: mpf_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cmp_f :: (unknown0: mpfr_srcptr, unknown1: mpf_srcptr) -> s32 #foreign libmpfr;
mpfr_get_f :: (unknown0: mpf_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_set_si :: (unknown0: mpfr_ptr, unknown1: s64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_set_ui :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_set_si_2exp :: (unknown0: mpfr_ptr, unknown1: s64, unknown2: mpfr_exp_t, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_set_ui_2exp :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_exp_t, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

/* mini-gmp does not provide mpq_t, we disable the following functions */
mpfr_set_q :: (unknown0: mpfr_ptr, unknown1: mpq_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_mul_q :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpq_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_div_q :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpq_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_add_q :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpq_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sub_q :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpq_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cmp_q :: (unknown0: mpfr_srcptr, unknown1: mpq_srcptr) -> s32 #foreign libmpfr;
mpfr_get_q :: (q: mpq_ptr, f: mpfr_srcptr) -> void #foreign libmpfr;

mpfr_set_str :: (unknown0: mpfr_ptr, unknown1: *u8, unknown2: s32, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_init_set_str :: (unknown0: mpfr_ptr, unknown1: *u8, unknown2: s32, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_set4 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t, unknown3: s32) -> s32 #foreign libmpfr;
mpfr_abs :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_set :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_neg :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_signbit :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_setsign :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s32, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_copysign :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_get_z_2exp :: (unknown0: mpz_ptr, unknown1: mpfr_srcptr) -> mpfr_exp_t #foreign libmpfr;
mpfr_get_flt :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> float #foreign libmpfr;
mpfr_get_d :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> float64 #foreign libmpfr;

mpfr_get_d1 :: (unknown0: mpfr_srcptr) -> float64 #foreign libmpfr;
mpfr_get_d_2exp :: (unknown0: *s64, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> float64 #foreign libmpfr;

mpfr_frexp :: (unknown0: *mpfr_exp_t, unknown1: mpfr_ptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_get_si :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s64 #foreign libmpfr;
mpfr_get_ui :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> u64 #foreign libmpfr;
mpfr_get_str_ndigits :: (unknown0: s32, unknown1: mpfr_prec_t) -> u64 #foreign libmpfr;
mpfr_get_str :: (unknown0: *u8, unknown1: *mpfr_exp_t, unknown2: s32, unknown3: u64, unknown4: mpfr_srcptr, unknown5: mpfr_rnd_t) -> *u8 #foreign libmpfr;

mpfr_get_z :: (z: mpz_ptr, f: mpfr_srcptr, unknown0: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_free_str :: (unknown0: *u8) -> void #foreign libmpfr;

mpfr_urandom :: (unknown0: mpfr_ptr, unknown1: *gmp_randstate_t, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_grandom :: (unknown0: mpfr_ptr, unknown1: mpfr_ptr, unknown2: *gmp_randstate_t, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_nrandom :: (unknown0: mpfr_ptr, unknown1: *gmp_randstate_t, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_erandom :: (unknown0: mpfr_ptr, unknown1: *gmp_randstate_t, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_urandomb :: (unknown0: mpfr_ptr, unknown1: *gmp_randstate_t) -> s32 #foreign libmpfr;

mpfr_nextabove :: (unknown0: mpfr_ptr) -> void #foreign libmpfr;
mpfr_nextbelow :: (unknown0: mpfr_ptr) -> void #foreign libmpfr;
mpfr_nexttoward :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr) -> void #foreign libmpfr;

mpfr_printf :: (unknown0: *u8, __args: ..Any) -> s32 #foreign libmpfr;
mpfr_asprintf :: (unknown0: **u8, unknown1: *u8, __args: ..Any) -> s32 #foreign libmpfr;
mpfr_sprintf :: (unknown0: *u8, unknown1: *u8, __args: ..Any) -> s32 #foreign libmpfr;
mpfr_snprintf :: (unknown0: *u8, unknown1: u64, unknown2: *u8, __args: ..Any) -> s32 #foreign libmpfr;

mpfr_pow :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_powr :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_pow_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_compound_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_pow_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_ui_pow_ui :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_ui_pow :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_pow_z :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpz_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sqrt :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sqrt_ui :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_rec_sqrt :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_add :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sub :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_mul :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_div :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_add_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sub_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_ui_sub :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_mul_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_div_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_ui_div :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_add_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sub_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_si_sub :: (unknown0: mpfr_ptr, unknown1: s64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_mul_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_div_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_si_div :: (unknown0: mpfr_ptr, unknown1: s64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_add_d :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: float64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sub_d :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: float64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_d_sub :: (unknown0: mpfr_ptr, unknown1: float64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_mul_d :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: float64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_div_d :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: float64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_d_div :: (unknown0: mpfr_ptr, unknown1: float64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sqr :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_const_pi :: (unknown0: mpfr_ptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_const_log2 :: (unknown0: mpfr_ptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_const_euler :: (unknown0: mpfr_ptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_const_catalan :: (unknown0: mpfr_ptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_agm :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_log :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_log2 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_log10 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_log1p :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_log2p1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_log10p1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_log_ui :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_exp :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_exp2 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_exp10 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_expm1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_exp2m1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_exp10m1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_eint :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_li2 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_cmp :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_cmp3 :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr, unknown2: s32) -> s32 #foreign libmpfr;
mpfr_cmp_d :: (unknown0: mpfr_srcptr, unknown1: float64) -> s32 #foreign libmpfr;

mpfr_cmp_ui :: (unknown0: mpfr_srcptr, unknown1: u64) -> s32 #foreign libmpfr;
mpfr_cmp_si :: (unknown0: mpfr_srcptr, unknown1: s64) -> s32 #foreign libmpfr;
mpfr_cmp_ui_2exp :: (unknown0: mpfr_srcptr, unknown1: u64, unknown2: mpfr_exp_t) -> s32 #foreign libmpfr;
mpfr_cmp_si_2exp :: (unknown0: mpfr_srcptr, unknown1: s64, unknown2: mpfr_exp_t) -> s32 #foreign libmpfr;
mpfr_cmpabs :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_cmpabs_ui :: (unknown0: mpfr_srcptr, unknown1: u64) -> s32 #foreign libmpfr;
mpfr_reldiff :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> void #foreign libmpfr;

mpfr_eq :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr, unknown2: u64) -> s32 #foreign libmpfr;
mpfr_sgn :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;

mpfr_mul_2exp :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_div_2exp :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_mul_2ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_div_2ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_mul_2si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_div_2si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_rint :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_roundeven :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_round :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_trunc :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_ceil :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_floor :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_rint_roundeven :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_rint_round :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_rint_trunc :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_rint_ceil :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_rint_floor :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_frac :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_modf :: (unknown0: mpfr_ptr, unknown1: mpfr_ptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_remquo :: (unknown0: mpfr_ptr, unknown1: *s64, unknown2: mpfr_srcptr, unknown3: mpfr_srcptr, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_remainder :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_fmod :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fmod_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_fmodquo :: (unknown0: mpfr_ptr, unknown1: *s64, unknown2: mpfr_srcptr, unknown3: mpfr_srcptr, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_fits_ulong_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_slong_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_uint_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_sint_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_ushort_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_sshort_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_uintmax_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fits_intmax_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_extract :: (unknown0: mpz_ptr, unknown1: mpfr_srcptr, unknown2: u32) -> void #foreign libmpfr;
mpfr_swap :: (unknown0: mpfr_ptr, unknown1: mpfr_ptr) -> void #foreign libmpfr;
mpfr_dump :: (unknown0: mpfr_srcptr) -> void #foreign libmpfr;

mpfr_nan_p :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_inf_p :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_number_p :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_integer_p :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_zero_p :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_regular_p :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;

mpfr_greater_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_greaterequal_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_less_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_lessequal_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_lessgreater_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_equal_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;
mpfr_unordered_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;

mpfr_atanh :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_acosh :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_asinh :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cosh :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sinh :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_tanh :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sinh_cosh :: (unknown0: mpfr_ptr, unknown1: mpfr_ptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sech :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_csch :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_coth :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_acos :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_asin :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_atan :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sin :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sin_cos :: (unknown0: mpfr_ptr, unknown1: mpfr_ptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cos :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_tan :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_atan2 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sec :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_csc :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cot :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sinu :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cosu :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_tanu :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_acosu :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_asinu :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_atanu :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_atan2u :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: u64, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_acospi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_asinpi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_atanpi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_atan2pi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sinpi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cospi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_tanpi :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_hypot :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_erf :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_erfc :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cbrt :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_root :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_rootn_ui :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_rootn_si :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: s64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_gamma :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_gamma_inc :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_beta :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_lngamma :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_lgamma :: (unknown0: mpfr_ptr, unknown1: *s32, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_digamma :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_zeta :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_zeta_ui :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_fac_ui :: (unknown0: mpfr_ptr, unknown1: u64, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_j0 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_j1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_jn :: (unknown0: mpfr_ptr, unknown1: s64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_y0 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_y1 :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_yn :: (unknown0: mpfr_ptr, unknown1: s64, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_ai :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_min :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_max :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_dim :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_mul_z :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpz_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_div_z :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpz_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_add_z :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpz_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_sub_z :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpz_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_z_sub :: (unknown0: mpfr_ptr, unknown1: mpz_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;
mpfr_cmp_z :: (unknown0: mpfr_srcptr, unknown1: mpz_srcptr) -> s32 #foreign libmpfr;

mpfr_fma :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_srcptr, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_fms :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_srcptr, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_fmma :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_srcptr, unknown4: mpfr_srcptr, unknown5: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_fmms :: (unknown0: mpfr_ptr, unknown1: mpfr_srcptr, unknown2: mpfr_srcptr, unknown3: mpfr_srcptr, unknown4: mpfr_srcptr, unknown5: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_sum :: (unknown0: mpfr_ptr, unknown1: *mpfr_ptr, unknown2: u64, unknown3: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_dot :: (unknown0: mpfr_ptr, unknown1: *mpfr_ptr, unknown2: *mpfr_ptr, unknown3: u64, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_free_cache :: () -> void #foreign libmpfr;
mpfr_free_cache2 :: (unknown0: mpfr_free_cache_t) -> void #foreign libmpfr;
mpfr_free_pool :: () -> void #foreign libmpfr;
mpfr_mp_memory_cleanup :: () -> s32 #foreign libmpfr;

mpfr_subnormalize :: (unknown0: mpfr_ptr, unknown1: s32, unknown2: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_strtofr :: (unknown0: mpfr_ptr, unknown1: *u8, unknown2: **u8, unknown3: s32, unknown4: mpfr_rnd_t) -> s32 #foreign libmpfr;

mpfr_round_nearest_away_begin :: (unknown0: mpfr_ptr) -> void #foreign libmpfr;
mpfr_round_nearest_away_end :: (unknown0: mpfr_ptr, unknown1: s32) -> s32 #foreign libmpfr;

mpfr_custom_get_size :: (unknown0: mpfr_prec_t) -> u64 #foreign libmpfr;
mpfr_custom_init :: (unknown0: *void, unknown1: mpfr_prec_t) -> void #foreign libmpfr;

mpfr_custom_get_significand :: (unknown0: mpfr_srcptr) -> *void #foreign libmpfr;
mpfr_custom_get_exp :: (unknown0: mpfr_srcptr) -> mpfr_exp_t #foreign libmpfr;
mpfr_custom_move :: (unknown0: mpfr_ptr, unknown1: *void) -> void #foreign libmpfr;
mpfr_custom_init_set :: (unknown0: mpfr_ptr, unknown1: s32, unknown2: mpfr_exp_t, unknown3: mpfr_prec_t, unknown4: *void) -> void #foreign libmpfr;

mpfr_custom_get_kind :: (unknown0: mpfr_srcptr) -> s32 #foreign libmpfr;

mpfr_total_order_p :: (unknown0: mpfr_srcptr, unknown1: mpfr_srcptr) -> s32 #foreign libmpfr;

#scope_file

libmpfr :: #library,system "libmpfr";
