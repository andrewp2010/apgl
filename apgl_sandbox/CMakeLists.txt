##################################################
#############  CMake Initialization  #############
##################################################
cmake_minimum_required(VERSION 3.11.4)

set(SOURCES 
    src/main.cpp)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY $<1:${BIN_DIR}/apgl_sandbox>)
add_executable(apgl_sandbox ${SOURCES})

##################################################
##########  Subdirectories and Linking  ##########
##################################################
# APGL
target_include_directories(apgl_sandbox PUBLIC ${APGL_DIR}/src)
target_link_libraries(apgl_sandbox apgl)                       