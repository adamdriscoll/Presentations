$Content = $null

$Select1 = New-BTSelectionBoxItem -Id 'Item1' -Content 'Universal Dashboard'
$Select2 = New-BTSelectionBoxItem -Id 'Item2' -Content 'Universal Automation'
$Select3 = New-BTSelectionBoxItem -Id 'Item3' -Content 'Universal API'

$list = New-BTInput -Id 'Selection001' -Items $Select1, $Select2, $Select3 -Title "Cool Projects" -DefaultSelectionBoxItemId "Item3"
$text = New-BTText -Text "Ironman Software"
$Binding = New-BTBinding -Children $text
$Visual = New-BTVisual -BindingGeneric $Binding
$button = New-BTButton -Content "Check it out" -Arguments "???"
$action = New-BTAction -Inputs $list -Buttons $button
$Content = New-BTContent -Visual $Visual -Actions $action
Submit-BTNotification -Content $Content