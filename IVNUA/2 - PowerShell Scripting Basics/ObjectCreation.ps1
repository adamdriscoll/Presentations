#The PowerShell 1.0 Way
$Beer = New-Object PSObject
$Beer | Add-Member -Name Brewer -Value 'Ale Asylum' -MemberType NoteProperty 
$Beer | Add-Member -Name Name -Value 'Satisfaction Jackson' -MemberType NoteProperty 
$Beer | Add-Member -Name ABV -Value 9.8 -MemberType NoteProperty 
$Beer

#The (kinda) PowerShell 2.0 way
$Beer = @{
        Brewer = 'Ale Asylum'
        Name = 'Satisfaction Jackson'
        ABV = 9.8
}

$Beer.Brewer
$Beer['Brewer']
$Beer.Name = 'Hopalicous'
$Beer.Name
$Beer['First Year Produced'] = 2006
$Beer.'First Year Produced'

#The PowerShell 3.0 way
$Beer = [PSCustomObject]@{ 
    Brewer = 'Lakefront Brewery'
    Name = 'Riverwest Stein'
    ABV = 6
}