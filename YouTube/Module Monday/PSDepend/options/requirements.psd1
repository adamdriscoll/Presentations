@{
    PSDependOptions = @{
        Target = '$DependencyFolder\Dependencies'
        Parameters = @{
            Force = $True
        }
    }
    
    pester = 'latest'
    'adamdriscoll/selenium-powershell' = 'master'
}