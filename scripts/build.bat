@echo off

cd %~dp0..
call cmake --build build\
if not exist build\ echo     - Run .\scripts\configure.bat to make and configure build\ directory