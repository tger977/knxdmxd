# - Try to find libjson-c3
# Once done, this will define
#
#  libjson-c3_FOUND - system has libjson-c3
#  libjson-c3_INCLUDE_DIRS - the libjson-c3 include directories
#  libjson-c3_LIBRARIES - link these to use libjson-c3

include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(libjson-c3_PKGCONF libjson-c3)

# Include dir
find_path(libjson-c3_INCLUDE_DIR
  NAMES 
    json/json.h
  PATHS 
    ${libjson-c3_PKGCONF_INCLUDE_DIRS}
    /usr/local/include
)

# Finally the library itself
find_library(libjson-c3_LIBRARY
  NAMES json
  PATHS ${libjson-c3_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(libjson-c3_PROCESS_INCLUDE json_c_INCLUDE_DIR)
set(libjson-c3_PROCESS_LIB json_c_LIBRARY)
libfind_process(libjson-c3)
