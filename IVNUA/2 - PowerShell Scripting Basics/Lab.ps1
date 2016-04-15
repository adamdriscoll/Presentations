function Get-FileSize {
    [CmdletBinding()]
    param($Directory)

    if ($Directory -eq $null)
    {
        Write-Error 'Directory was not specified'
    }
    else
    {
        Write-Verbose "Finding files in $Directory"

        $Files = Get-ChildItem -Path $Directory | Where PSISContainer -eq $false 
        foreach($file in $Files)
        {
            [PSCustomObject]@{
                Name = $File.Name
                Size = $File.Length
                Contents = (Get-Content $File.FullName);
            }
        }
    }
}

Get-FileSize -Directory 'C:\windows\system32'  -Verbose