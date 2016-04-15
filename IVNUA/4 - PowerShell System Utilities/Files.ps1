Set-Location "C:\Users\adriscoll\Dropbox\Presentations\2016 - 4 Illinois Valley User Group Spring Tech Conf\4 - PowerShell System Utilities\MyFolder"
New-Item -Path .\MyTextFile.txt -ItemType File
Get-ChildItem 
Get-ChildItem | Remove-Item 
New-Item -Path .\NestedFolder -ItemType Folder
New-Item -Path .\MyTextFile.txt -ItemType File 
Copy-Item .\MyTextFile.txt .\NestedFolder\MyTextFile.txt 
Remove-Item .\MyTextFile.txt 
Move-Item .\NestedFolder\MyTextFile.txt .\MyTextFile.txt
"This is a string!!" | Out-File .\MyTextFile.txt
Get-Content .\MyTextFile.txt
Start-Job { for($i = 0; $i -lt 10; $i++) { "Hey!" | Out-File .\MyTextFile.txt; Start-Sleep 2  } }
Get-Content .\MyTextFile.txt -Wait
Get-Acl -Path .\MyTextFile.txt
Set-Acl -Path .\MyTextFile.txt -AclObject 