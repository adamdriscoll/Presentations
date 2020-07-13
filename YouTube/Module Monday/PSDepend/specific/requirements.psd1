@{
    PSDependOptions = @{
        Target = '$DependencyFolder\Dependencies'
        Parameters = @{
            Force = $True
        }
    }
    
    'PSGalleryModule::Universal' = 'latest'
    'GitHub::ironmansoftware/universal-templates' = 'master'
}