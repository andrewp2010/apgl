cmake_minimum_required(VERSION 3.11.4)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
set(SOURCES src/main.cpp)

add_executable(openGLCore ${SOURCES})