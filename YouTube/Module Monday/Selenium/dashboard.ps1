New-UDDashboard -Title 'Selenium' -Content {

    New-UDDatePicker -Id 'datePicker'

    New-UDElement -Attributes @{
        className = 'myClass'
    } -tag 'div' -Content { "Testing" }

    New-UDTextbox 

    New-UDImage -Url "/images/whiteclouds.jpeg"

    New-UDList -Id 'list' -Content {
        New-UDListItem -Label 'Inbox' -Icon (New-UDIcon -Icon envelope -Size 3x) -SubTitle 'New Stuff'
        New-UDListItem -Label 'Drafts' -Icon (New-UDIcon -Icon edit -Size 3x) -SubTitle "Stuff I'm working on "
        New-UDListItem -Label 'Trash' -Icon (New-UDIcon -Icon trash -Size 3x) -SubTitle 'Stuff I deleted'
        New-UDListItem -Label 'Spam' -Icon (New-UDIcon -Icon bug -Size 3x) -SubTitle "Stuff I didn't want"
    }

    New-UDTypography -Text "Hello, World!" -Id 'typo'

    New-UDButton -Id 'button' -Text 'Click Me' -OnClick {
        Show-UDToast -Message 'Hello, World!'
    }

    New-UDTextbox -Id 'textbox'

    New-UDButton -Id 'add' -Text 'Click me too' -OnClick {
        Start-Sleep 5
        Add-UDElement -Content {
            New-UDElement -Id 'child' -Tag 'div' -Content {
                "Selenium"
            }
        } -ParentId 'parent'
    }

    New-UDElement -Tag 'div' -Content {} -Id 'parent'

}