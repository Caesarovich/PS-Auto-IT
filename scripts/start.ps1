# Script de lancement de la procédure complète
$version = "1.2.2"

$host.UI.RawUI.WindowTitle = "Launching..."

$curDir = Get-Location
$date = Get-Date
Add-Content -Path "$curDir\log.txt" -Value "# Script Start $date #"

Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/ ----------------------------------- /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/         StartScript v$version          /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/                                     /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/    By  Caesarovich                  /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/                                     /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/             25/11/2020              /"
Write-Host -BackgroundColor DarkGreen -ForegroundColor White -Object "/ ----------------------------------- /`r`n"

Write-Host -ForegroundColor Green -Object "> Starting of the script`r`n"
#Set-ExecutionPolicy RemoteSigned

# MMAgent
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Disable MMAgent."
Disable-MMAgent -m
Get-MMAgent

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\options-generator.ps1'
.\scripts\options-generator.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\set-wallpaper.ps1'
# .\scripts\set-wallpaper.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\windows-updater.ps1'
.\scripts\windows-updater.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\install-softwares.ps1'
.\scripts\install-softwares.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\disk-cleanup.ps1'
.\scripts\disk-cleanup.ps1

#Add-Content -Path "$curDir\log.txt" -Value '.\scripts\debloater.ps1'
#.\scripts\debloater.ps1

$date = Get-Date
Add-Content -Path "$curDir\log.txt" -Value "# Script End $date #"
Write-Host -BackgroundColor Black -ForegroundColor Green -Object "> End of Script <"

Write-Host -Object "Log File:"

$logs = Get-Content -Path "$curDir\log.txt"

Write-Host -Object $logs

Pause