@echo off

set USER=%USERNAME%
set PULSE=C:\Program Files (x86)\Common Files\Pulse Secure\Integration\pulselauncher.exe
set PULSE_SERVER=https://secure.example.domain.com
set /a ATTEMPTS=0

:ATTEMPT
if %ATTEMPTS% gtr 0 (goto:PASSWORD) else (goto:VPN)

:PASSWORD
set /p newpass="Enter Password: "
echo %newpass%>"%userprofile%\documents\pwd.txt"

:VPN
set /a ATTEMPTS+=1
echo Attempt %ATTEMPTS%
echo Pulse Secure Login
set /p PASS=<%userprofile%\documents\pwd.txt
"%PULSE%" -u %USER% -p %PASS% -url %PULSE_SERVER% -r User
if %errorlevel% neq 0 (goto:ATTEMPT)

pause