

function Get-Light {
    <#
        .SYNOPSIS
            Gets a light based on the specified name.
        .DESCRIPTION
            This cmdlet communicates with OpenHabs REST API.
        .PARAMETER Name 
            The name of the light to retrieve 
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory, ValueFromPipeline=$true)][string]$Name)

    begin {
        
    }

    process {
        Invoke-WebRequest -Uri "http://$env:HomeUrl:8080/rest/items/$name" -Method Get
    }

    end {

    }
}

function Set-Light {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param([Parameter(Mandatory, ValueFromPipeline=$true)][string]$Name,
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