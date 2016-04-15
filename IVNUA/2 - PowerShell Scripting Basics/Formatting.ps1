Start-Process Notepad
Get-Process Notepad | Format-List * 
Get-Process Notepad | Format-Table Name, Id, MainModule, Responding 
Get-Process 
Code "C:\Windows\System32\WindowsPowerShell\v1.0\DotNetTypes.format.ps1xml"

Get-Process Notepad | Format-Table Name, Id, MainModule, Responding | Out-File .\FormattedFile.txt
.\FormattedFile.txt

$Items = Get-Process Notepad | Format-Table Name, Id, MainModule, Responding 
$Items.ToString()

$Items = Get-Process Notepad | Format-Table Name, Id, MainModule, Responding | Out-String
$Items.ToString()
