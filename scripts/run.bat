@echo off

cd %~dp0..
call cmd /C bin\Debug\openGLCore.exe
if not exist bin\ echo     - Run .\scripts\build.bat to build executable

PAUSE