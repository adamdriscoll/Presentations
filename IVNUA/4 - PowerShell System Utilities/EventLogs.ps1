#Listen Event Log Messages
Get-EventLog -LogName Application -Newest 10 

#Write Event Log Messages
Write-EventLog -LogName Application -Source 'MySourceName' -EntryType Error -Category 1 -EventId 8 -Message 'This is a message' 

#Creates a new event log. Requires admin privileges
New-EventLog -LogName 'AdamDriscoll' -Source 'PowerShellScript' 

#Write to our new event log 
Write-EventLog -LogName 'AdamDriscoll' -Source 'PowerShellScripts' -EntryType Information -EventId 1 -Message 'Event log coming from PowerShell!!'

#Get our new event log message
Get-EventLog -LogName 'AdamDriscoll'