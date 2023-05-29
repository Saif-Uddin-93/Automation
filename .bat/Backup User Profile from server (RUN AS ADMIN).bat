::Written by Saif Uddin

@echo off
::SET SRC_COMPUTER=%COMPUTERNAME%
SET SRC_SERVER="FileServer\BACKUPS"
SET /p DEST_COMPUTER="Enter Computer Name: "
::SET USER=%USERNAME%
SET /p USER="Enter username: "

SET SRC_DESKTOP=\\%SRC_SERVER%\Users\%USER%\Desktop
SET SRC_DOCUMENTS=\\%SRC_SERVER%\Users\%USER%\Documents
SET SRC_DOWNLOADS=\\%SRC_SERVER%\Users\%USER%\Downloads
SET SRC_MUSIC=\\%SRC_SERVER%\Users\%USER%\Music
SET SRC_PICTURES=\\%SRC_SERVER%\Users\%USER%\Pictures
SET SRC_VIDEOS=\\%SRC_SERVER%\Users\%USER%\Videos
SET SRC_FONTS=\\%SRC_SERVER%\Users\%USER%\Windows\Fonts

SET DEST_DESKTOP=\\%DEST_COMPUTER%\c$\Users\%USER%\Desktop
SET DEST_DOCUMENTS=\\%DEST_COMPUTER%\c$\Users\%USER%\Documents
SET DEST_DOWNLOADS=\\%DEST_COMPUTER%\c$\Users\%USER%\Downloads
SET DEST_MUSIC=\\%DEST_COMPUTER%\c$\Users\%USER%\Music
SET DEST_PICTURES=\\%DEST_COMPUTER%\c$\Users\%USER%\Pictures
SET DEST_VIDEOS=\\%DEST_COMPUTER%\c$\Users\%USER%\Videos
SET DEST_FONTS=\\%DEST_COMPUTER%\c$\Windows\Fonts

::backup bookmarks
xcopy /Y "\\%SRC_SERVER%\Users\%USER%\AppData\Local\Google\Chrome\User Data\default" "\\%DEST_COMPUTER%\c$\Users\%USER%\AppData\Local\Google\Chrome\User Data\default\bookmarks"

::backup files
xcopy /Y/E/C/I/H "%SRC_DESKTOP%" "%DEST_DESKTOP%"
::pause
xcopy /Y/E/C/I/H "%SRC_DOCUMENTS%" "%DEST_DOCUMENTS%"
::pause
xcopy /Y/E/C/I/H "%SRC_MUSIC%" "%DEST_MUSIC%"
::pause
xcopy /Y/E/C/I/H "%SRC_PICTURES%" "%DEST_PICTURES%"
::pause
xcopy /Y/E/C/I/H "%SRC_VIDEOS%" "%DEST_VIDEOS%"
::pause
xcopy /Y/E/C/I/H "%SRC_DOWNLOADS%" "%DEST_DOWNLOADS%"

xcopy /Y/E/C/I/H "%SRC_FONTS%" "%DEST_FONTS%"
pause