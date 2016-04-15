#Non-Terminating
Get-Process -Id 2
Get-Service | Measure-Object 

Write-Error "This is a non-terminating error"
Get-Service | Measure-Object 

#Terminating: 	
Throw "This is a terminating error"
Get-Service | Measure-Object 

Get-Process -Id 2 -ErrorAction Stop
Get-Service | Measure-Object 

Try 
{
	Throw "This is a terminating error"
}
Catch 
{
	Write-Warning $_
}

Get-Service | Measure-Object 

try 
{
    throw "This is a terminating error"
    Get-Service | Measure-Object 
}
finally {
    Write-Host "Hey" -ForegroundColor Cyan
}
Get-Service