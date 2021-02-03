#########################

# PS-Auto-IT: Windows Debloater
# Description: Debloat your system, removes tracking, unused services running in background...
# You might want to comment out some of the following scripts depending on your needs.
#
# Author(s): W4RH4WK
# Version: 1.0.0
# Note: These scripts should be updated regularly using the author's repos or other sources

##########################

$host.UI.RawUI.WindowTitle = "Debloating Windows 10"

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloating Windows 10."

# Source: https://github.com/W4RH4WK/Debloat-Windows-10

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Disable MMAgent."
.\scripts\modules\windows-debloater\disable-mmagent.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Block Telemetry."
.\scripts\modules\windows-debloater\block-telemetry.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Disable services."
.\scripts\modules\windows-debloater\disable-services.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Fix privacy Settings."
.\scripts\modules\windows-debloater\fix-privacy-settings.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Optimize UI."
.\scripts\modules\windows-debloater\optimize-user-interface.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Optimize WU."
.\scripts\modules\windows-debloater\optimize-windows-update.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Remove default apps."
.\scripts\modules\windows-debloater\remove-default-apps.ps1

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Debloater: Remove OneDrive."
.\scripts\modules\windows-debloater\remove-onedrive.ps1

$curDir = Get-Location
Add-Content -Path "$curDir\log.txt" -Value "[Ok] Debloating Windows"
