Get-Dependency -Path 'C:\Users\adamr\Desktop\PSDepend\example.depend.psd1'
Get-PSDependType | Select-Object DependencyType

Invoke-PSDepend -Path 'C:\Users\adamr\Desktop\PSDepend\basic' -Test | Select-Object Dependency*
Invoke-PSDepend -Path 'C:\Users\adamr\Desktop\PSDepend\basic' -Force 
Invoke-PSDepend -Path 'C:\Users\adamr\Desktop\PSDepend\basic' -Test | Select-Object Dependency*


Invoke-PSDepend -Path 'C:\Users\adamr\Desktop\PSDepend\depends'