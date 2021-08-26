@echo off

REM *****
REM * Batch script to check if a file share is available for this system
REM *****

ping -n 1 %1 -w 100 > nul || goto :hostDown
goto :hostAvail

:hostAvail
if errorlevel 0 net use \\%1\%2 /user:%3 %4 /persistent:no > nul 2>&1 || goto :mountFail
if errorlevel 0 net use \\%1\%2 /delete >nul
echo Share is available
goto :theEnd

:mountFail
echo Share is not available
goto :theEnd

:hostDown
echo Host is unreachable
goto :theEnd

:theEnd
exit /b
