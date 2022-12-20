@echo off

pushd ..\
if not exist build\ mkdir build\
call cmake -S . -B build\
popd
PAUSE