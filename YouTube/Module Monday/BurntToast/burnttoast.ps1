New-BurntToastNotification

New-BurntToastNotification -Text "Hello, world!"

New-BurntToastNotification -Text "Hello, world!" -AppLogo .\UDLogo.png

New-BurntToastNotification -Text "Hello, world!" -AppLogo .\UDLogo.png -UniqueIdentifier 'Toast1'
New-BurntToastNotification -Text "Hello, world!" -AppLogo .\UDLogo.png -UniqueIdentifier 'Toast1'

New-BurntToastNotification -ProgressBar @(
    New-BTProgressBar -Status 'Copying files' -Value 0.2
)

New-BurntToastNotification -Sound Call -Text "New text message!"

New-BurntToastNotification -Header (
    New-BTHeader -Title "Ironman Software" -Id "1"
)

New-BurntToastNotification -Button @(
    New-BTButton -Content "Ironman Software" -Arguments "https://ironmansoftware.com"
) -Text "Hello"

Submit-BTNotification -Content (
    New-BTContent -Duration 1000
)

Get-BTHistory

New-BurntToastNotification -Text "Universal Dashboard" -AppLogo .\UDLogo.png -UniqueIdentifier 'Toast1'
Remove-BTNotification -Group 'Toast1'

# Complex example

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

# Launch PowerShell

New-BurntToastNotification -Button @(
    New-BTButton -Content "Run Script" -Arguments "powershell://C:\Users\adamr\Desktop\BurntToast\script.ps1" -ActivationType Protocol
) -Text "Hello"