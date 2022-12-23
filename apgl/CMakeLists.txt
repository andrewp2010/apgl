##################################################
#############  CMake Initialization  #############
##################################################
cmake_minimum_required(VERSION 3.11.4)

set(SOURCES 
    src/test.h
    src/test.cpp)
    
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY $<1:${BIN_DIR}/apgl>)
add_library(apgl STATIC ${SOURCES})

##################################################
###############  Check Submodules  ###############
##################################################
find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
    # update submodules as needed
    option(GIT_SUBMODULE "Check submodules during build" ON)
    if(GIT_SUBMODULE)
        message(STATUS "Submodule update")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                        RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "git submodule update --init --recursive failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
        endif()
    endif()
endif()

# GLFW
if (NOT EXISTS "${APGL_DIR}/vendor/glfw/CMakeLists.txt")
    message(FATAL_ERROR "The GLFW submodule was not downloaded! GIT_SUBMODULE was turned off or failed. Please update submodules and try again.")
endif()

##################################################
##########  Subdirectories and Linking  ##########
##################################################
# GLFW
add_subdirectory(vendor/glfw)
include_directories(vendor/glfw/include)
target_link_libraries(apgl glfw)
