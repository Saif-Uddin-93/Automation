@echo off

set hostsPath=C:\Windows\System32\drivers\etc

setlocal enabledelayedexpansion

set blockedDomains[1]=google.com
set blockedDomains[2]=google.co.uk
set blockedDomains[3]=test.com
set blockedDomains[4]=example.com
set blockedDomains[5]=helloworld.com

set max=6
set /a index=1

:add
set domain=!blockedDomains[%index%]!
echo 0.0.0.0 !domain! >> "%hostsPath%"
set /a index+=1
::echo %index%
if %index% lss %max% (GOTO:add)

endlocal

pause
::fsutil file createnew c:\temp\emptyfile 0



