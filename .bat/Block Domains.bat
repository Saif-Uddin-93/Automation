@echo off

set hostsPath=C:\Windows\System32\drivers\etc\hosts

setlocal enabledelayedexpansion

set blockedDomains[1]=google.com
set blockedDomains[2]=google.co.uk
set blockedDomains[3]=test.com
set blockedDomains[4]=example.com
set blockedDomains[5]=helloworld.com

set max=5
set /a index=1

:add
set domain=!blockedDomains[%index%]!
echo 0.0.0.0 !domain! >> "%hostsPath%"
if %index% lss %max% (GOTO:add)
set /a index+=1

endlocal

pause
::fsutil file createnew %hostsPath% 0



