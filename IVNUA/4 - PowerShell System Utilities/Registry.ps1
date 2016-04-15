Set-Location HKCU:\
New-Item -Path .\Demo
Set-Location .\Demo
1..10 | % { New-Item -Path ".\$_" }
Get-ChildItem 
regjump HKCU\Demo
Get-ChildItem | Remove-Item
Get-ChildItem
New-ItemProperty -Path .\ -Name 'MyStringValue' -Value 'This is a string' -Type String