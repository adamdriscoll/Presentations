Measure-Command { 1..100 | % { Start-Job {  } } | Wait-Job }

Get-Job | Remove-Job

Measure-Command { 1..100 | % { Start-RSJob -ScriptBlock {"TEST"} } | Wait-RSJob }

Get-Job | Remove-Job

Measure-Command { 1..100 | % { Start-ThreadJob {"TEST"} } | Wait-Job }

Get-Job | Remove-Job

Start-ThreadJob -ScriptBlock { 1..100 | % { start-sleep -Milliseconds 100; "Output $_" } } -ThrottleLimit 2
Start-ThreadJob -ScriptBlock { 1..100 | % { start-sleep -Milliseconds 100; "Output $_" } }
Start-ThreadJob -ScriptBlock { 1..100 | % { start-sleep -Milliseconds 100; "Output $_" } }
Get-Job

Get-Job | Remove-Job

Start-ThreadJob -ScriptBlock {
    $args[0]
} -ArgumentList "Argument" 

Get-Job | Remove-Job

"Pipeline" | Start-ThreadJob -ScriptBlock {
    $Input
} 

Get-Job | Remove-Job

Start-ThreadJob -FilePath ".\script.ps1"

Get-Job | Remove-Job

Start-ThreadJob { Read-Host;  Write-Warning "WarningOut" } -StreamingHost $Host | Wait-Job 

Get-Job | Remove-Job

Start-ThreadJob -InitializationScript {
    function Get-Stuff
    {
        "Get-Stuff"
    }
} -ScriptBlock {
    Get-Stuff
}

Get-Job | Remove-Job

$job = Start-ThreadJob -ScriptBlock { Write-Warning "WarningOut" } | Wait-Job
$job.Warning

Get-Job | Remove-Job

Start-ThreadJob -ScriptBlock { Wait-Debugger; Get-Process }

Get-Job | Remove-Job

