@echo off

SET USER=%USERNAME%
SET PULSE=C:\Program Files (x86)\Common Files\Pulse Secure\Integration\pulselauncher.exe
SET PULSE_SERVER=https://secure.example.domain.com

:RETRY
ping -n 1 File-Server | find "TTL=" >nul
if errorlevel 1 (
    echo host not reachable
    GOTO:VPN
) else (
    echo host reachable
    GOTO:DRIVE
)

:VPN
echo Pulse Secure Login
echo Enter Password:
SET /p PASS=""
"%PULSE%" -u %USER% -p %PASS% -url %PULSE_SERVER% -r User
GOTO:RETRY

:DRIVE
net use g: /delete
echo Adding G Drive
net use g: "\\Server\NetworkFolder"
reg import "\\Server\Drive labels\g drive label.reg"