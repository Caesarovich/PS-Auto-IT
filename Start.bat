:: This is the starting point of the whole script
:: Altough you can start using ./scripts/start.ps1 in an elevated PS Shell.

@echo off

Color 1F

:: Version of the script
set version=2.0.0

Title Starting script

set curDir=%~dp0
echo Current Dir: %curDir%

echo # Creating log file %curDir%log.txt
if not exist "%curDir%\log.txt" echo.> "%curDir%\log.txt"


:: This part ensure the next steps are executed in an elevated shell.
:: I don't remember the credit for that part. 

:: --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
  >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
  >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

:: --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
  echo Requesting administrative privileges...
  goto UACPrompt
) else ( 
  goto gotAdmin
)

:UACPrompt
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
  set params= %*
  echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

  "%temp%\getadmin.vbs"
  del "%temp%\getadmin.vbs"
  exit /B

:gotAdmin
  pushd "%CD%"
  CD /D "%~dp0"


:: Now let's start the real business
powershell.exe -ExecutionPolicy Bypass -file "scripts/start.ps1"