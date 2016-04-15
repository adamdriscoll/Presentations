#Find built-in extension members
Get-CimInstance -Class Win32_process | get-member -membertype AliasProperty
Get-Process | Get-Member -MemberType ScriptProperty

#Add a new property
Get-Process | Add-Member -Name 'ThreadCount' -Value { $this.Threads.Count } -MemberType ScriptProperty -PassThru | Select Name,ThreadCount

#Add a new method
Start Notepad
$Process =  Get-Process Notepad | Add-Member -Name Clone -Value { 
        Start-Process $this.Path 
    } -MemberType ScriptMethod -PassThru

$Process.Clone()

$Item = Get-ChildItem .\testFile.txt | Add-Member -Name 'Read' -Value { Get-Content $this.FullName } -MemberType ScriptMethod -PassThru
$Item.Read() 
