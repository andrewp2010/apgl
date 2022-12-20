cmake_minimum_required(VERSION 3.11.4)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)

set(SOURCES src/main.cpp)
add_executable(openGLCore ${SOURCES})

# DOWNLOAD ALL THE SUBMODULES
find_package(Git QUIET)
if(GIT_FOUND AND EXPISTS "${PROJECT_SOURCE_DIR}/.git")
# update submodules as needed
    option(GIT_SUBMODULE "Check submodules during build" ON)
    if (GIT_SUBMODULE)
        message(STATUS "Submodule update")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                        RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if (NOT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "git submodule upadte --init failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
        endif()
    endif()
endif()

# check all the submodules
if (NOT EXISTS "${PROJECT_SOURCE_DIR}/openGLCore/vendor/glfw/CMakeLists.txt")
    message(FATAL_ERROR "The glfw submodules was not downloaded! GIT_SUBMODULE was turned off or failed. Please update submodules")
endif()

add_subdirectory(vendor/glfw)

target_include_directories(openGLCore
    PUBLIC vendor/glfw/include
)

target_link_directories(openGLCore
    PRIVATE ${CMAKE_SOURCE_DIR}/build/openGLCore/vendor/glfw/src
)

target_link_libraries(openGLCore glfw3)

