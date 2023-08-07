@echo off

set hostsPath=C:\Windows\System32\drivers\etc

set max=5

setlocal enabledelayedexpansion
set blockedDomains[1]=google.com
set blockedDomains[2]=google.co.uk
set blockedDomains[3]=test.com
set blockedDomains[4]=example.com
set blockedDomains[5]=helloworld.com
set /a index=1

:add
for %%i in (%index%) do (
    set domain=!blockedDomains[%%i]!
    echo 0.0.0.0 !domain! >> "%hostsPath%\hosts"
    set /a index+=1
    if %index% lss %max% (GOTO:add)
)

endlocal

pause



