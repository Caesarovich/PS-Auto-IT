# Auto-IT - A modulable Bash/Powershell script for automating IT workers' job

## Introduction

Auto-IT is a **modulable** Bash/Powershell script for automating IT workers' job. This script will do *most of your job* as an IT worker when you work in computer repairing, refurbishment, selling, etc... In a single click it will run: **Windows Updates, Windows Debloater, Disk Cleaner, installing common softwares, change the default wallpaper by your companie's wallpaper and more !** As it is made to be modulable **you can easily add your own modules**, customize or remove the existing ones.


## How to use
### Launching:
#### Launch from a portable storage device

You can place this script folder onto a storage device such as a **USB Stick**. Once plugged in a computer **run the `.\Install.bat` file**.
**It will copy itself onto the computer and start itself** so you can then unplug your storage device to use it on another computer.

You will be prompted to give **elevated privileges** to the script, if you do not accept it will close itself.

#### Launch as is
If you just need to start it as is just open the `.\Start.bat` file. 

You will be prompted to give **elevated privileges** to the script, if you do not accept it will close itself.

### Picking options
By default the options generator is ran and will prompt you some options related to your **current installation**. You can also **disable or modify** that script (`.\scripts\options-generator.ps1`) as you need.

### Now let it do its work !

Now just sit there and watch it do your job. 


## Modules

You can **disable, remove, modify or add modules** to your will easily. If you want your custom module to be **added to this repository** it must follow the **custom modules guidelines**.

### Custom Modules Guidelines

In order to create your custom module you should at first insert this small piece of comment on the top of the file:

```ps1
#########################

# Auto-IT: Your Module Name
# Description: A description of what it does.
#
# Author(s): Your name
# Version: The version of this module (If you make revisions to it)
# Note: optionnal side note

##########################
```
