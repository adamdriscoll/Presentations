#WMI vs CIM
Get-WmiObject Win32_Process | Select Name, ProcessId
Get-CimInstance Win32_Process | Select Name, ProcessId

#Access remote machines
Get-CimInstance -ComputerName Localhost -Class Win32_Service

#utilize WMI type accelerator
[wmi]"\\driscoll-desk\root\cimv2:win32_share.name='admin$'"

#Invoke methods on classes
Invoke-CimMethod -ClassName Win32_Process -MethodName 'Create' -Arguments @{ CommandLine = 'notepad.exe' } 

#Filter WMI objects based on properties
$Notepad = Get-CimInstance Win32_Process -Filter "Name='Notepad.exe'"

