@echo off

REM *****
REM * Batch script to check if a file share is available for this system
REM * Author  : Marcel Stangenberger
REM * Created : 26/08/2021
REM *****

ping -n 1 %1 -w 100 > nul || goto :hostDown
goto :hostAvail

:hostAvail
if errorlevel 0 net use \\%1\%2 /user:%3 %4 /persistent:no > nul 2>&1 || goto :mountFail
if errorlevel 0 net use \\%1\%2 /delete >nul
echo 0
goto :theEnd

:mountFail
echo 1
goto :theEnd

:hostDown
echo 1
goto :theEnd

:theEnd
exit /b
