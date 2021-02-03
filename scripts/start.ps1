#########################

# PS-Auto-IT: Start Script
# Description: This script is the starting point that runs all the other module scripts.
#  You might want to disable/enable some of the below modules depending on your needs
#
# Author(s): Caesarovich
# Version: 1.3.0

##########################

$host.UI.RawUI.WindowTitle = "Starting..."

$curDir = Get-Location
$date = Get-Date

Add-Content -Path "$curDir\log.txt" -Value "# Script Start: $date #"
Write-Host -ForegroundColor Green -Object "> Starting of the scripts`r`n"

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\options-generator.ps1'
.\scripts\modules\options-generator.ps1

# Defines .\wp.png as wallpaper
# This is useful if your company replaces the default Windows' wallpaper by a branding one
#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\set-wallpaper.ps1'
# .\scripts\modules\set-wallpaper.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\windows-updater.ps1'
.\scripts\modules\windows-updater.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\install-softwares.ps1'
.\scripts\modules\install-softwares.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\disk-cleanup.ps1'
.\scripts\modules\disk-cleanup.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\debloater.ps1'
.\scripts\modules\windows-debloater\start.ps1

$date = Get-Date
Add-Content -Path "$curDir\log.txt" -Value "# Script End $date #"
Write-Host -BackgroundColor Black -ForegroundColor Green -Object "> End of Script <"

Write-Host -Object "Log File:"

$logs = Get-Content -Path "$curDir\log.txt"

Write-Host -Object $logs

Pause

# Restart-Computer

### Thanks for using Auto-IT !
### Please help contribute to the project --> https://github.com/Caesarovich/Auto-IT
