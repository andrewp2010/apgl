@echo off

cd %~dp0..
call cmd /C bin\windows\debug\apgl_sandbox\apgl_sandbox.exe
if not exist bin\ echo     - Run .\scripts\build.bat to build executable