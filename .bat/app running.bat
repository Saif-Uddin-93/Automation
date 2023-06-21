@echo off
set "application=YourApplication.exe"

tasklist | findstr /i "%application%" > nul

:CHECK

if %errorlevel% equ 0 (
    echo %application% is already running.
) else (
    echo %application% is not running. Starting %application%...
    start "" "%application%"
)

GOTO CHECK