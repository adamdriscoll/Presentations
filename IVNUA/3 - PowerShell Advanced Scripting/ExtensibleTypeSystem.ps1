Get-CimInstance -Class Win32_process | get-member -membertype AliasProperty
Get-Process | Get-Member -MemberType ScriptProperty
Get-Process | Add-Member -Name 'ThreadCount' -Value { $this.Threads.Count } -MemberType ScriptProperty -PassThru | Select Name,ThreadCount
$Item = Get-ChildItem .\testFile.txt | Add-Member -Name 'Read' -Value { Get-Content $this.FullName } -MemberType ScriptMethod -PassThru
$Item.Read() 
code "C:\Windows\System32\WindowsPowerShell\v1.0\DotNetTypes.format.ps1xml"