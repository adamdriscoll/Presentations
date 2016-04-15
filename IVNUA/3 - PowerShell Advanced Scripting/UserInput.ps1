#Prompt for Credential
$Credential = Get-Credential 
Invoke-Command $Credential { Start-Process Notepad }

# Create a PSCredential without user input
$Password = ConvertTo-SecureString -AsPlainText -Force -String "MyPassword"
$Credential = New-Object System.Management.Automation.PSCredential -ArgumentList "domain\username", $Password
Invoke-Command $Credential { Start-Process Notepad }

#Confirmation with -Confirm
Start-Process Notepad -PassThru | Stop-Process -Confirm

#Confirmation with ConfirmPreference
$Global:ConfirmPreference = 'Low'
Start-Process Notepad -PassThru | Stop-Process
$Global:ConfirmPreference = 'High' 
Start-Process Notepad -PassThru | Stop-Process

#Progress 
for($i = 0; $i -lt 100; $i++)
{
    Write-Progress -Activity "Looping..." -Status "Processing item $i" -PercentComplete (($i / 100) * 100)
    Start-Sleep -Milliseconds 100
}