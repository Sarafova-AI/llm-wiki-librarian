@echo off
setlocal

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\new-intake.ps1"

echo.
echo Intake packet created. Paste the raw text, save, then ask your agent:
echo   Librarian, process the inbox.
pause > nul
