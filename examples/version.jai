//
// Basic test linking to library, prints version info.
//

#import,dir "../../MPFR";

main :: () {
    print("MPFR library: %\n", to_string(mpfr_get_version()));
    print("MPFR header:  % (based on %.%.%)\n", MPFR_VERSION_STRING, MPFR_VERSION_MAJOR, MPFR_VERSION_MINOR, MPFR_VERSION_PATCHLEVEL);
}

#import "Basic";
