#########################

# PS-Auto-IT: Install Softwares
# Description: Install various softwares using Chocolatey
#
# Author(s): Caesarovich
# Version: 1.5.0
# Note: Jump to line 136 to customize the softwares this script installs

##########################

$host.UI.RawUI.WindowTitle = "Installing softwares..."


$curDir = Get-Location
$options = Get-Content "$curDir\options.json" | ConvertFrom-Json

#
Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "> Installing softwares..."

# Functions 

function IsChocoInstalled {
  Try {
    $isChocoInstalled = choco -v

    if (-not($isChocoInstalled)) {
      return $false
    }
    else {
      return $isChocoInstalled
    }  
  } 
  Catch {
    return $false
  }
}

function InstallChoco {
  $isInstalled = IsChocoInstalled

  if ($isInstalled -eq $false) {
    Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "Chocolatey is not installed. Installing..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    $isInstalled = IsChocoInstalled

    if ($isInstalled -ne $false) {
      Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "Chocolatey Version $isInstalled has been installed."
    }
    else {
      Write-Host -BackgroundColor Red -ForegroundColor Yellow -Object "Error installing Chocolatey !"
      Pause
      exit
    }
  }
  else {
    Write-Host -BackgroundColor DarkGreen -ForegroundColor Yellow -Object "Chocolatey Version $isInstalled is already installed."
  }
}

function InstallPackage {
  param (
    $PackageName,
    $Params
  )

  try {
    choco upgrade $PackageName -y $Params
  }
  catch {
    Write-Host -BackgroundColor Red -ForegroundColor Yellow -Object "# Error: $_.Exception.Message"
  }

}

# This allows you to set the current user's default browser automaticly
# /!\ Makes Windows do some fuckery since recent updates
function Set-DefaultBrowser {
  param($defaultBrowser)

  $regKey = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\{0}\UserChoice"
  $regKeyHttp = $regKey -f 'http'
  $regKeyHttps = $regKey -f 'https'

  switch -Regex ($defaultBrowser.ToLower()) {
    # Internet Explorer
    'ie|internet|explorer' {
      Set-ItemProperty $regKeyHttp  -name ProgId IE.HTTP
      Set-ItemProperty $regKeyHttps -name ProgId IE.HTTPS
      break
    }
    # Firefox
    'ff|firefox' {
      Set-ItemProperty $regKeyHttp  -name ProgId FirefoxURL
      Set-ItemProperty $regKeyHttps -name ProgId FirefoxURL
      break
    }
    # Google Chrome
    'cr|google|chrome' {
      Set-ItemProperty $regKeyHttp  -name ProgId ChromeHTML
      Set-ItemProperty $regKeyHttps -name ProgId ChromeHTML
      break
    }
  } 
  # Thanks StackOverFlow https://stackoverflow.com/questions/17536405/cant-set-chrome-as-default-browser-from-powershell/27859397
}

# Use that to remove any desktop icon some softwares might enforce to add on the desktop
function RemoveDesktopIcon {
  param($Icon)

  $FileName = "C:\Users\Public\Desktop\$Icon"

  if (Test-Path $FileName) {
    Remove-Item $FileName
  }
}



# Installing chocolatey 

try {
  InstallChoco
}
catch {
  Write-Host -BackgroundColor Red -ForegroundColor Yellow -Object "# Error: $_.Exception.Message"
  Write-Host -BackgroundColor Magenta -ForegroundColor Yellow -Object "# If the above error is <(429) Too Many Requests>, it means you should wait some minutes before re-running this script."
  Add-Content -Path "$curDir\log.txt" -Value "[X] Installing Softwares (Error)"
  Pause
  [Environment]::Exit(1)
}


############################

# Installing packets

# Adobe Acrobat Reader #
Write-Host -ForegroundColor Green -Object "> Installing Acrobat Reader..."
InstallPackage -PackageName adobereader

# VLC Media Player #
Write-Host -ForegroundColor Green -Object "> Installing VLC..."
InstallPackage -PackageName vlc
RemoveDesktopIcon -Icon "VLC media player.lnk"

# WinRAR #
Write-Host -ForegroundColor Green -Object "> Installing WinRar..."
InstallPackage -PackageName winrar

# Glary's Utilities Free #
# Write-Host -ForegroundColor Green -Object "> Installing Glary's Utilities Free..."
# InstallPackage -PackageName glaryutilities-free

# Driver Booster #
# Write-Host -ForegroundColor Green -Object "> Installing Driver Booster..."
# InstallPackage -PackageName driverbooster
# RemoveDesktopIcon -Icon "Driver Booster 8.lnk"



# Browser
# There I use the user options to install a different browser depending on the need
# You can just remove this part and keep only the part you're interested in.

if ($options["WichBrowser"] -eq "Yes") {
  Write-Host -ForegroundColor Green -Object "> Installing Google Chrome..."
  InstallPackage -PackageName googlechrome

  Write-Host -ForegroundColor Green -Object "> Define Google Chrome as default browser."
  Set-DefaultBrowser -defaultBrowser chrome

  if ($options["ShouldInstallAB"] -eq "Yes") {
    Write-Host -ForegroundColor Green -Object "> Installing Adblock Plus (Chrome)..."
    InstallPackage -PackageName adblockpluschrome
    
  }
}
elseif ($options["WichBrowser"] -eq "No") {
  Write-Host -ForegroundColor Green -Object "> Installing Firefox..."
  InstallPackage -PackageName firefox

  Write-Host -ForegroundColor Green -Object "> Define Firefox as default browser."
  Set-DefaultBrowser -defaultBrowser firefox

  if ($options["ShouldInstallAB"] -eq "Yes") {
    Write-Host -ForegroundColor Green -Object "> Installing Adblock Plus (Firefox)..."
    InstallPackage -PackageName adblockplusfirefox
  }
}


# Libre Office #
if ($options["ShouldInstallLO"] -eq "Yes") {
  Write-Host -ForegroundColor Green -Object "> Installing Libre Office Fresh..."
  InstallPackage -PackageName libreoffice-fresh
}


############################

Write-Host -ForegroundColor Green -Object "> Software installs finished."
Add-Content -Path "$curDir\log.txt" -Value "[Ok] Installing softwares"
