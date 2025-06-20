#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "lib_a::lib_a" for configuration ""
set_property(TARGET lib_a::lib_a APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(lib_a::lib_a PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/liblib_a.so"
  IMPORTED_SONAME_NOCONFIG "liblib_a.so"
  )

list(APPEND _cmake_import_check_targets lib_a::lib_a )
list(APPEND _cmake_import_check_files_for_lib_a::lib_a "${_IMPORT_PREFIX}/lib/liblib_a.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
