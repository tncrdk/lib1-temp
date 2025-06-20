# lib_a/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(lib_a VERSION 1.0.0 LANGUAGES CXX)

# Create the shared library
add_library(lib_a SHARED
    lib_a.cpp
    lib_a2.cpp
)

# Specify include directories for the library itself
target_include_directories(lib_a PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

# Install rules for the library
install(TARGETS lib_a
    EXPORT lib_a_targets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin # For Windows DLLs
)

# Install headers
install(FILES
    lib_a.h
    lib_a2.h
    DESTINATION include
)

# Generate and install the package configuration file
# This is crucial for find_package to work correctly
install(EXPORT lib_a_targets
    FILE lib_aConfig.cmake
    NAMESPACE lib_a::
    DESTINATION lib/cmake/lib_a
)

# Create a package configuration file for find_package(lib_a)
# This content will be written to lib_aConfigVersion.cmake and lib_aConfig.cmake during install
# For simple cases, lib_aConfig.cmake might just contain include(lib_aTargets.cmake)
# For more complex cases, you might generate it with configure_file
# Example simplified content for find_package(lib_a CONFIG)
set(lib_a_VERSION ${PROJECT_VERSION})
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/lib_aConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/lib_aConfig.cmake @ONLY
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/lib_aConfig.cmake
    DESTINATION lib/cmake/lib_a
)
