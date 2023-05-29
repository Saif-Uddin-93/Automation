@echo off

rmdir %temp% /s /q
rmdir "%LocalAppData%\Google\Chrome\User Data\Default\Cache\Cache_Data" /s /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Network\Cookies"
::pause