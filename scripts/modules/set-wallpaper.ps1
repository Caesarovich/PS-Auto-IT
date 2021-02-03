#########################

# PS-Auto-IT: Set Wallpaper
# Description: Defines a custome image as the desktop wallpaper
#   This is useful if your company replaces the default Windows' wallpaper by a branding one
#
# Author(s): Caesarovich
# Version: 1.1.1

##########################
$host.UI.RawUI.WindowTitle = "Changing the Wallpaper"

# Change that according to your needs
# Place the image file in the root folder of Auto-IT
$wallpaperFileName = "wp.png"

$curDir = Get-Location
$options = Get-Content "$curDir\options.json" | ConvertFrom-Json

if ($options["ShouldChangeWP"] -eq "Yes") {
  Set-ItemProperty -Path "HKCU:Control Panel\Desktop" -Name WallPaper -Value "$destinationDir\$wallpaperFileName"
  rundll32.exe user32.dll, UpdatePerUserSystemParameters
  Write-Host -ForegroundColor Green -Object "`n> Changing the wallpaper`n"

  Add-Content -Path "$curDir\log.txt" -Value "[Ok] Wallpaper"
}
else {
  Write-Host -ForegroundColor Green -Object "`n> Wallpaper change disabled.`n"
  Add-Content -Path "$curDir\log.txt" -Value "[X] Wallpaper"
}
