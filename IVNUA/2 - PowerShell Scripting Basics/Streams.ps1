function Write-Stream {
    [CmdletBinding()]
    param()

    Write-Warning "This is a warning!"
    Write-Error "This is an error!"
    Write-Output "This is output!"
    Write-Verbose "This is a verbose message!"
    Write-Debug "This is a debug message!"
    Write-Host "This is an information message!"
}

$text = Write-Stream