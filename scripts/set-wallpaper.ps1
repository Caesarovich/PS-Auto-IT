$version = "1.0.1"

$host.UI.RawUI.WindowTitle = "Changing the Wallpaper"

Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "| Change Wallpaper |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|   Version: $version    |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|                     |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "| By: Caesarovich |`r"
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "|---------------------|`r"

$curDir = Get-Location
$options = Get-Content "$curDir\options.json" | ConvertFrom-Json

if ($options["ShouldChangeWP"] -eq "Yes") {
    Set-ItemProperty -Path "HKCU:Control Panel\Desktop" -Name WallPaper -Value "$destinationDir\wp.png"
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    Write-Host -ForegroundColor Green -Object "`n> Changing the wallpaper`n"

    Add-Content -Path "$curDir\log.txt" -Value "[Ok] Wallpaper"
} else {
    Write-Host -ForegroundColor Green -Object "`n> Wallpaper change disabled.`n"
    Add-Content -Path "$curDir\log.txt" -Value "[X] Wallpaper"
}
