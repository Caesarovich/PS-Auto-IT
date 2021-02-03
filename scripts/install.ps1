$version = "1.2.3"

$host.UI.RawUI.WindowTitle = "Installation..."

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "| Script Installation |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|   Version: $version    |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|                     |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "| By: Caesarovich |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r`n"



$curDir = Get-Location
$destinationDir = "$env:USERPROFILE\Desktop\TempFiles"


Write-Host -ForegroundColor Green -Object "Copying files..."
Write-Host -ForegroundColor Green -Object "$curDir => $destinationDir"


New-Item -ItemType Directory -Force -Path $destinationDir

Copy-Item -Path "$curDir\*" -Destination $destinationDir -Recurse

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "`n> VYou can unplug the USB stick ! <"

pause

Start-Process "$destinationDir\Start.bat"