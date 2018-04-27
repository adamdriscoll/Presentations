Import-Module (Join-Path $PSScriptRoot 'ScriptModule.psm1')
Import-Module (Join-Path $PSScriptRoot '4.3.1/Pester.psd1')

$WarningPreference = 'SilentlyContinue'

if ($IsLinux) {
    Describe "Get-OSSpecificItem on Linux" {
        It "runs on Linux" {
            Get-OSSpecificItem | Should be "Running on Linux"
        }
    }
}

if ($IsWindows) {
    Describe "Get-OSSpecificItem on Windows" {
        It "runs on Windows" {
            Get-OSSpecificItem | Should be "Running on Windows"
        }
    }
}
