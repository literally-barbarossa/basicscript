@echo off
pushd %CD%
lua "%~dp0\src\main.lua" %*
popd
