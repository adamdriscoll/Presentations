#Enable remoting without confirmation
Enable-PSRemoting -Force

#Enable remtoing but ignore firewall settings
Enable-PSRemoting -SkipNetworkProfileCheck

#Enter-PSSession for interactive sessions
Enter-PSSession Localhost
Get-Process 
Exit-PSSession

#Invoke command for non-interative sessions
Invoke-Command -ComputerName localhost { Get-Process } 

#Winrm configuration
winrm quickconfig

#Trusted hosts for non-domain machines
winrm s winrm/config/client '@{TrustedHosts="RemoteComputer"}'
winrm s winrm/config/client '@{TrustedHosts="CorpServer56"}'

#Constrained endpoints
Get-PSSessionConfiguration

