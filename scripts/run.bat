@echo off

pushd ..\
if not exist bin\ echo "No executbale exists"
call cmd /C bin\Debug\openGLCore.exe
popd
PAUSE