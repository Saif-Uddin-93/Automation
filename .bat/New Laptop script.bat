@echo off

tzutil /s "GMT Standard Time"

start /b outlook.exe

start /b /d "C:\Users\%username%\AppData\Local\Microsoft\Teams" Update.exe --processStart "Teams.exe"

start /b chrome.exe https://EXAMPLE.CloudStorage.com/ https://EXAMPLE.service-now.com/

gpupdate /force

pause