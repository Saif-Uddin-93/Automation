@echo off

set hostsPath=C:\Windows\System32\drivers\etc

setlocal enabledelayedexpansion

set blockedDomains[0]=google.com
set blockedDomains[1]=google.co.uk

for %%i in (0 1) do (
    set domain=!blockedDomains[%%i]!
    echo 0.0.0.0 !domain! >> "%hostsPath%\hosts"
)

endlocal