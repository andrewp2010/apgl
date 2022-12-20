# Disable in-source builds to prevent source tree corruption.
if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "FATAL: In-source builds are not allowed.
        You should create a separate directory for build files.")
endif()

cmake_minimum_required(VERSION 3.11.4)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

set(CMAKE_SUPPRESS_REGENERATION true)

project(openGLSandbox)
add_subdirectory(openGLCore)