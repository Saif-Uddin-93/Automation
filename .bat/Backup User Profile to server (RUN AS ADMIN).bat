::Written by Saif Uddin

@echo off
::SET SRC_COMPUTER=%COMPUTERNAME%
SET /p SRC_COMPUTER="Enter source computer name: "
SET DEST_SERVER="FileServer\BACKUPS"
::SET USER=%USERNAME%
SET /p USER="Enter username: "

SET SRC_DESKTOP=\\%SRC_COMPUTER%\c$\Users\%USER%\Desktop
SET SRC_DOCUMENTS=\\%SRC_COMPUTER%\c$\Users\%USER%\Documents
SET SRC_DOWNLOADS=\\%SRC_COMPUTER%\c$\Users\%USER%\Downloads
SET SRC_MUSIC=\\%SRC_COMPUTER%\c$\Users\%USER%\Music
SET SRC_PICTURES=\\%SRC_COMPUTER%\c$\Users\%USER%\Pictures
SET SRC_VIDEOS=\\%SRC_COMPUTER%\c$\Users\%USER%\Videos
SET SRC_FONTS=\\%SRC_COMPUTER%\c$\Windows\Fonts

SET DEST_DESKTOP=\\%DEST_SERVER%\Users\%USER%\Desktop
SET DEST_DOCUMENTS=\\%DEST_SERVER%\Users\%USER%\Documents
SET DEST_DOWNLOADS=\\%DEST_SERVER%\Users\%USER%\Downloads
SET DEST_MUSIC=\\%DEST_SERVER%\Users\%USER%\Music
SET DEST_PICTURES=\\%DEST_SERVER%\Users\%USER%\Pictures
SET DEST_VIDEOS=\\%DEST_SERVER%\Users\%USER%\Videos
SET DEST_FONTS=\\%DEST_SERVER%\Users\%USER%\Windows\Fonts

::backup bookmarks
xcopy /Y "\\%SRC_COMPUTER%\c$\Users\%USER%\AppData\Local\Google\Chrome\User Data\default\bookmarks" "\\%DEST_SERVER%\Users\%USER%\AppData\Local\Google\Chrome\User Data\default"

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