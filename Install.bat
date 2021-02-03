:: This scripts copy the files from a USB stick onto the desktop
:: It then runs the start script

@echo off
Color 3F

powershell.exe -ExecutionPolicy Bypass -file "scripts/install.ps1"

start "Start script" cmd /c %destinationDir%\Start.bat

exit