#   Description:
# This will disable the Windows' Memory Management Agent wich uses a lot of CPU resources

# This has been added by caesarovich

# MMAgent
Disable-MMAgent -m
Get-MMAgent