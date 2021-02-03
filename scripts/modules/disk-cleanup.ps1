$version = "2.0.0"

$host.UI.RawUI.WindowTitle = "DIsk cleanup"

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|    Disk cleanup     |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|   Version: $version    |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|                     |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "| By: Caesarovich     |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"



# Nettoyage de disque
Write-Host -ForegroundColor Green -Object "> Starting Disk Cleanup..."

Write-Host 'Clearing CleanMgr.exe automation settings.'
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\*' -Name StateFlags0001 -ErrorAction SilentlyContinue | Remove-ItemProperty -Name StateFlags0001 -ErrorAction SilentlyContinue

Write-Host 'Enabling Update Cleanup. This is done automatically in Windows 10 via a scheduled task.'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup' -Name StateFlags0001 -Value 2 -PropertyType DWord

Write-Host 'Enabling Temporary Files Cleanup.'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files' -Name StateFlags0001 -Value 2 -PropertyType DWord

Write-Host 'Starting CleanMgr.exe...'
Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:1' -Wait

Write-Host 'Waiting for CleanMgr and DismHost processes. Second wait neccesary as CleanMgr.exe spins off separate processes.'
Get-Process -Name cleanmgr,dismhost -ErrorAction SilentlyContinue | Wait-Process


Write-Host -ForegroundColor Green -Object "> Cleaning done."

$curDir = Get-Location
Add-Content -Path "$curDir\log.txt" -Value "[Ok] Disk cleanup"