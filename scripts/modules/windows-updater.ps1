$version = "2.1.0"

$host.UI.RawUI.WindowTitle = "Windows 10 Updates"

Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/ ----------------------------------- /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/        WindowsUpdater v$version        /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/                                     /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/    By  Caesarovich                  /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/                                     /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/             25/11/2020              /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/ ----------------------------------- /`r"


# Désactiver windows Update qui ralentit le démarrage
Write-Host -ForegroundColor Green -Object "> Disabling automatic search`r`n"

$AUSettings = (New-Object -com "Microsoft.Update.AutoUpdate").Settings
$AUSettings.NotificationLevel = 1
$AUSettings.Save


# Installation de NuGet

Write-Host -ForegroundColor Green -Object "> Installing NuGet...`r`n"

Install-PackageProvider -Name NuGet -Force

# Installation du module PSWindowsUpdate

Write-Host -ForegroundColor Green -Object "> Installing PSWindowsUpdate module...`r`n"

Install-Module PSWindowsUpdate -Force

# Set-ExecutionPolicy RemoteSigned

Import-Module PSWindowsUpdate

# Effectuer les mises à jour

Write-Host -ForegroundColor Green -Object "> Searching and installing Windows Updates...`r`n"

Get-WindowsUpdate -AcceptAll -Install

$curDir = Get-Location
Add-Content -Path "$curDir\log.txt" -Value "[Ok] Updating Windows"