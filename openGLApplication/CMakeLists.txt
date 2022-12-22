##################################################
#############  CMake Initialization  #############
##################################################
cmake_minimum_required(VERSION 3.11.4)

set(SOURCES 
    src/main.cpp)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
add_executable(openGLApplication ${SOURCES})

##################################################
##########  Subdirectories and Linking  ##########
##################################################

# APGL
target_include_directories(openGLApplication PUBLIC ${CMAKE_SOURCE_DIR}/apgl/src)
target_link_libraries(openGLApplication apgl)                       