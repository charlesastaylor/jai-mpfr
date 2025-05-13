//
// Generate bindings https://www.mpfr.org/ using apt installed package, ie `sudo apt install libmpfr-dev`
// 

AT_COMPILE_TIME :: true;

DECLARATIONS_TO_OMIT :: string.[
];

generate :: (args: [] string) -> bool {

    os_target := OS;

    print("Generating bindings...\n");
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        os = os_target;
        alias_original_enum_names           = false;
        log_stripped_declarations           = true;
        generate_compile_time_struct_checks = false;
        try_to_preserve_comments            = true;
        visitor = mpfr_visitor;

        generate_printf_wrappers = false; // The generated wrappers look whack? Eg for mpfr_printf

        generate_library_declarations = true;

        if os_target == {
            case .LINUX;
                output_filename = "bindings_unix.jai";

                array_add(*path_fragments_to_treat_as_non_system_paths, "mpfr");

                // Sigh, mpfr is dependant on gmp, and gmp bindings are being a pain in the arse. Just adding gmp to filter 
                // causes tons of issues, just manually adding the ones that seem to be required for now.
                // array_add(*path_fragments_to_treat_as_non_system_paths, "gmp");
                GMP_TYPES_TO_INCLUDE :: string.[
                    "mpq_ptr",
                    "mp_limb_t",
                    "gmp_randstate_t",
                    "mpq_srcptr",
                    "mpz_ptr",
                    "mpz_srcptr",
                    "__gmp_randstate_struct",
                    "__mpq_struct",
                    "__mpz_struct",
                    "gmp_randalg_t",
                    "mpz_t",
                ];
                array_add(*system_types_to_include, ..GMP_TYPES_TO_INCLUDE);

                system_include_path := get_libc_paths();
                // Add all headers included with pacakge, using `dpkg -L libmpfr-dev` to obtain this list.
                array_add(*source_files, tprint("%/mpfr.h", system_include_path));
                array_add(*source_files, tprint("%/mpf2mpfr.h", system_include_path));
                // We also depend on libgmp-dev,libgmpxx4ldbl which have their own headers.

                array_add(*system_library_names, "libmpfr");

            case;
                assert(false, "@Incomplete: os_target == % is currently unsupported.", os_target);
        }
    }

    return generate_bindings(opts, output_filename);
}

mpfr_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl && array_find(DECLARATIONS_TO_OMIT, decl.name) {
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }
    return .RECURSE;
}


#if AT_COMPILE_TIME {
    #run,stallable {
        set_build_options_dc(.{do_output=false});
        root_options := get_build_options();
        args := root_options.compile_time_command_line;
        if !generate(args) {
            compiler_set_workspace_status(.FAILED);
        }
    }
} else {
    #import "System";

    main :: () {
        set_working_directory(path_strip_filename(get_path_of_running_executable()));
        args := get_command_line_arguments();
        if !generate(args) {
            exit(1);
        }
    }
}

#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "File";
#import "File_Utilities";
#import "String";
#import "Process";
