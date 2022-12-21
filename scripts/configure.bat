@echo off

cd %~dp0..
if not exist build\ mkdir build\ & echo LOG: build\ directory made
call cmake -S . -B build\

PAUSE