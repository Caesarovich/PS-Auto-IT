:: This scripts copy the files from a USB stick onto the Desktop
:: It then runs the start script

@echo off
Color 1F

powershell.exe -ExecutionPolicy Bypass -file "scripts/install.ps1"

exit