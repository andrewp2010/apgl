@echo off

pushd ..\
if not exist build\ echo "Build folder does not exist"
call cmake --build build\
popd
PAUSE