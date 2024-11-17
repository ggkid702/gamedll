@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo RP10 Cheats.
    echo.
    echo This script requires administrator privileges.
    echo.
    echo Requesting elevated privileges...
    powershell -Command "Start-Process '%~0' -Verb runAs"
    exit /b
)

:: Disable Remote Access Auto Connection Manager
sc config RasAuto start= disabled
sc stop RasAuto

:: Disable Secure Socket Tunneling Protocol Service
sc config SstpSvc start= disabled
sc stop SstpSvc

echo The services have been disabled.
pause
