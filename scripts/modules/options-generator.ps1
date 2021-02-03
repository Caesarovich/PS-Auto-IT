#########################

# Auto-IT: User options generator
# Description: This script prompts forms to the user and save the result in a .json file
#  Use this to add per-machine options. Like for instance what browser should be installed on this particular computer
#  Adding an option and retrieving it is pretty easy but you need to take a look at the below code.
#
# Author(s): Caesarovich
# Version: 1.3.0

##########################
# Functions

function Show-Message {

  param (
    [string]$Message = "Please enter a message",
    [string]$Title = "Window Title",
    [switch]$OKCancel,
    [switch]$AbortRetryIgnore,
    [switch]$YesNoCancel,
    [switch]$YesNo,
    [switch]$RetryCancel,
    [switch]$IconError,
    [switch]$IconQuestion,
    [switch]$IconWarning,
    [switch]$IconInformation
  )
  
  if ($OKCancel) { $Btn = 1 }
  elseif ($AbortRetryIgnore) { $Btn = 2 }
  elseif ($YesNoCancel) { $Btn = 3 }
  elseif ($YesNo) { $Btn = 4 }
  elseif ($RetryCancel) { $Btn = 5 }
  else { $Btn = 0 }
  
  if ($IconError) { $Icon = 16 }
  elseif ($IconQuestion) { $Icon = 32 }
  elseif ($IconWarning) { $Icon = 48 }
  elseif ($IconInformation) { $Icon = 64 }
  else { $Icon = 0 }
      
  
  # Load Windows.Forms library
  [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
  
  $Response = [System.Windows.Forms.MessageBox]::Show($Message, $Title , $Btn, $Icon)
  Return $Response
}


#

$askBrowser = 'What Browser do you wish to install ?
  Select "Yes" to install Google Chrome
  Select "No" to install Firefox    
  Select "Cancel" to leave Microsoft Edge.'

$wichBrowser = Show-Message -YesNoCancel -IconQuestion -Title "Pick a browser" -Message $askBrowser



$shouldChangeBrowser = "No"
$shouldInstallAB = "No"
if ($wichBrowser -eq "Yes" -Or $wichBrowser -eq "No") {
  # $shouldChangeBrowser = Show-Message -YesNo -IconWarning -Title "Definir un nouveau naviguateur par defaut ?" -Message "Voulez vous changez le naviguateur par defaut ?"
  $shouldInstallAB = Show-Message -Message "Do you wish to install AdBlock ?" -Title "Install AdBlock ?" -YesNo -IconQuestion
}

$shouldInstallLO = Show-Message -Message "Do you wish to install LibreOffice ?" -Title "Install LibreOffice ?" -YesNo -IconQuestion

$shouldChangeWP = Show-Message -Message "Should the wallpaper be replaced ?" -Title "Change the wallpaper ?" -YesNo -IconQuestion

$options = @{
  WichBrowser         = $wichBrowser.ToString()
  ShouldChangeBrowser = $shouldChangeBrowser.ToString()
  ShouldInstallAB     = $shouldInstallAB.ToString()
  ShouldInstallLO     = $shouldInstallLO.ToString()
  SHouldChangeWP      = $shouldChangeWP.ToString()
}

$options = $options | ConvertTo-Json -Depth 1

$curDir = Get-Location

Write-Host -ForegroundColor Green -Object "`n> Creating options file..."

Set-Content "$curDir\options.json"  -Value $options

Add-Content -Path "$curDir\log.txt" -Value '[Ok] Options generated'