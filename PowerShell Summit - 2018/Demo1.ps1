#Configure VS Code

Write-Host $Env:PSModulePath -ForegroundColor Yellow

Import-Module ActiveDirectory

#Add Windows PowerShell module path to PS Core
Import-Module WindowsPSModulePath
Add-WindowsPSModulePath
Write-Host $Env:PSModulePath -ForegroundColor Yellow

# Still doesn't let AD module load....
Import-Module ActiveDirectory

# Search AD for the logged in user via .NET Classes
$DirectoryEntry = [System.DirectoryServices.DirectoryEntry]::new("LDAP://192.168.100.6", 'administrator', $ENV:VMPassword)
$DirectorySearcher = [System.DirectoryServices.DirectorySearcher]::new($DirectoryEntry, "(sAMAccountName=adam.driscoll)")
$Me = $DirectorySearcher.FindOne()
Write-Host $Me.Properties['DisplayName'] -ForegroundColor Yellow

# Add missing assemblies to process
Import-Module PSCoreWindowsCompat

# Search AD for the logged in user via .NET Classes
$DirectoryEntry = [System.DirectoryServices.DirectoryEntry]::new("LDAP://192.168.100.6", 'administrator', $ENV:VMPassword)
$DirectorySearcher = [System.DirectoryServices.DirectorySearcher]::new($DirectoryEntry, "(sAMAccountName=adam.driscoll)")
$Me = $DirectorySearcher.FindOne()
Write-Host $Me.Properties['DisplayName'] -ForegroundColor Yellow

# Add shim module to be able to invoke Windows PowerShell from PowerShell Core
Import-Module PowerShim

# Invoke using shim 
Invoke-Shim {
    Import-Module ActiveDirectory
    Get-ADUser -Identity 'adam.driscoll' -Server '192.168.100.6' -Credential administrator
}



