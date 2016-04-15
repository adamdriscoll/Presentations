Start-Job { Get-Process } -PassThru
Get-Job 
Get-Job | Receive-Job
Get-Job
Start-Job { Start-Sleep -Seconds 10 } 
Get-Job
Get-Job | Remove-Job 
Start-Job { Start-Sleep -Seconds 10 } 
Start-Job { Start-Sleep -Seconds 10 } 
Start-Job { Start-Sleep -Seconds 10 } 
Get-Job | Wait-Job
Get-Job | Remove-Job
Invoke-Command { Get-Service } -AsJob
Invoke-Command { Get-Service } -AsJob -ComputerName IP
$Trigger = New-ScheduledJobTrigger -Once -At 13:30
Register-ScheduledJob -Name OneThirtyJob -Trigger $Trigger -ScriptBlock { Invoke-RestMethod http://www.myautomatedhouse.com/api/items/light1 -Method Post -Body 'ON' }
taskschd.msc 