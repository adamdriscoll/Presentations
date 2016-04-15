

function Get-Light {
    <#
        .SYNOPSIS
            Gets a light based on the specified name.
        .DESCRIPTION
            This cmdlet communicates with OpenHabs REST API.
        .PARAMETER Name 
            The name of the light to retrieve 
    #>
    [CmdletBinding(ValueFromPipeline=$true)]
    param([Parameter(Mandatory)][string]$Name)

    begin {
        
    }

    process {
        Invoke-WebRequest -Uri "http://$env:HomeUrl:8080/rest/items/$name" -Method Get
    }

    end {

    }
}

function Set-Light {
    [CmdletBinding(ValueFromPipeline=$true, SupportsShouldProcess = $true)]
    param([Parameter(Mandatory)][string]$Name,
          [Parameter(Mandatory)][ValidateSet('ON', 'OFF')]$State)

    begin {
        
    }

    process {
        if ($PSCmdlet.ShouldProcess($Name))
        {
            Invoke-WebRequest -Uri "http://$env:HomeUrl:8080/rest/items/$name" -Method POST -Body $State -ContentType 'text/plain'    
        }
    }

    end {

    }
}