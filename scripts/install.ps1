#########################

# Auto-IT: Install script
# Description: A script to copy the files onto the current user's desktop directory. 
#  That is useful if you have this script on a USB stick and want to run it on multiple computers.
#
# Author(s): Caesarovich
# Version: 1.3.0

##########################

$host.UI.RawUI.WindowTitle = "Installing..."

# Get the current user's desktop folder location
$curDir = Get-Location
$destinationDir = "$env:USERPROFILE\Desktop\Auto-IT-Temp"


Write-Host -ForegroundColor Green -Object "Copying files..."
Write-Host -ForegroundColor Green -Object "$curDir => $destinationDir"

New-Item -ItemType Directory -Force -Path $destinationDir

Copy-Item -Path "$curDir\*" -Destination $destinationDir -Recurse

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "`n> You can unplug the USB stick ! <"

# You might want to comment this 'pause' for a more fluid usage
pause

Start-Process "$destinationDir\Start.bat"