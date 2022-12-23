##################################################
###########  Disable In-Source Builds  ###########
##################################################
if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "FATAL: In-source builds are not allowed.
        You should create a separate directory for build files.")
endif()

##################################################
#############  CMake Initialization  #############
##################################################
cmake_minimum_required(VERSION 3.11.4)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

set(CMAKE_BUILD_TYPE Debug)

project(apgl)

##################################################
##################  Variables  ###################           
##################################################
string(TOLOWER ${CMAKE_SYSTEM_NAME} CMAKE_SYSTEM_NAME_LOWER)
string(TOLOWER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE_LOWER)

set(BIN_DIR ${CMAKE_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME_LOWER}/${CMAKE_BUILD_TYPE_LOWER})
set(APGL_DIR ${CMAKE_SOURCE_DIR}/apgl)

##################################################
################  Subdirectories  ################
##################################################
add_subdirectory(apgl)
add_subdirectory(apgl_sandbox)