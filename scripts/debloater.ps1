$version = "1.1.0"

$host.UI.RawUI.WindowTitle = "Debloating Windows 10"

# Source: https://github.com/W4RH4WK/Debloat-Windows-10

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|   Windows Debloat   |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|   Version: $version    |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|                     |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "| By: W4RH4WK         |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"

.\scripts\debloater-scripts\block-telemetry.ps1

.\scripts\debloater-scripts\disable-services.ps1

.\scripts\debloater-scripts\fix-privacy-settings.ps1

.\scripts\debloater-scripts\optimize-user-interface.ps1

.\scripts\debloater-scripts\optimize-windows-update.ps1

.\scripts\debloater-scripts\remove-default-apps.ps1

.\scripts\debloater-scripts\remove-onedrive.ps1

$curDir = Get-Location
Add-Content -Path "$curDir\log.txt" -Value "[Ok] Debloating Windows"