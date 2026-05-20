@echo off
setlocal

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\build-source-register.ps1"

echo.
echo Source register updated. You can close this window.
pause > nul
