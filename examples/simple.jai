//
// Very simple test just calling the sin function and printing out.
//


main :: () {
    print("Yo\n");

    precision := 256; // precision in bits

    mpfr_set_default_prec(precision);

    x, result: __mpfr_struct;

    // NOTE(Charles): There are varargs versions of these init/deinit procs. Not tested the bindings to them.
    mpfr_init2(*x, precision);
    mpfr_init2(*result, precision);
    defer {
        mpfr_clear(*x);
        mpfr_clear(*result);
    }

    mpfr_set_d(*x, 1.23456789, .RNDN);  // Set x = 1.23456789
    mpfr_sin(*result, *x, .RNDN);        // Compute sin(x)

    // Print result with 50 digits
    mpfr_printf("sin(x) = %.50Rf\n", *result);

    x_f64      := mpfr_get_d(*x, .RNDN);
    result_f64 := mpfr_get_d(*result, .RNDN);
    print("sin(%) == %\n", x_f64, result_f64);
}

#import "Basic";
#import "MPFR";