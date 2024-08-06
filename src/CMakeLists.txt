# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(ldd_tsclib_library VERSION 0.0.1 LANGUAGES C)

add_library(ldd_tsclib SHARED
  "ldd_tsclib.c"
)

set_target_properties(ldd_tsclib PROPERTIES
  PUBLIC_HEADER ldd_tsclib.h
  OUTPUT_NAME "ldd_tsclib"
)

target_compile_definitions(ldd_tsclib PUBLIC DART_SHARED_LIB)


set(ldd_tsclib_bundled_libraries "${CMAKE_CURRENT_SOURCE_DIR}/TSCLIB.dll" PARENT_SCOPE)