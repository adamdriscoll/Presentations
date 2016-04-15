Function Get-Notepad 
{
	Get-Process -Name Notepad 
}

Get-Notepad

Function Get-HighCpuProcess {
	Get-Notepad | Where CPU -gt 50
}

Function Get-ProcessByCpu {
	Get-Process | Where CPU -gt $args[0]
}

Function Get-ProcessByCpu($CPU) {
	Get-Process | Where CPU -gt $CPU
}

Function Start-VSCode {
	param($CommandName = "code", $File)

	Start-Process $CommandName -ArgumentList $File
}
