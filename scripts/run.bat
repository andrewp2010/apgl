@echo off

cd %~dp0..
call cmd /C bin\Debug\sandbox.exe
if not exist bin\ echo     - Run .\scripts\build.bat to build executable