@{
    PSDependOptions = @{
        Target = '$DependencyFolder\Dependencies'
        Parameters = @{
            Force = $True
        }
    }

    FindOpenFile = 'latest'

    PowerShellProTools = @{
        Name = 'powershellprotools'
        DependencyType = 'PSGalleryModule'
        Parameters = @{
            Repository = 'PSGallery'
            SkipPublisherCheck = $true
        }
        Version = '5.5.0'
        Tags = 'prod', 'test'
    }

    openpsscriptpad = @{
        DependencyType = 'task'
        Target ='$PWD\open.ps1'
        DependsOn = 'PowerShellProTools'
    }
}