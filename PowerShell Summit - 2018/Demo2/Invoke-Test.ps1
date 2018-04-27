Import-Module Pester -MinimumVersion '4.3.1'
$PesterModule = Split-Path (Get-Module Pester).Path -Parent

. (Join-Path $PSScriptRoot "Invoke-RunTestScriptInDockerCoreContainers.ps1") -SourcePaths @(".\ScriptModule.psm1","ScriptModule.tests.ps1", $PesterModule)  -TestFileAndParams "ScriptModule.tests.ps1" -TestImageNames @('ubuntu16.04', 'nanoserver')