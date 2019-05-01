$Pages = @()

$Pages += New-UDPage -Name 'Concepts' -Icon Book -Content {

    New-UDHeading -Text "Controls" -Size 3

    New-UDIcon -Icon rocket -Color red

    New-UDButton -Text "Click Me!"

    New-UDImage -Url 'https://cdn-powershell.pressidium.com/wp-content/uploads/2018/08/Full-Logo-No-year.png'

    # ---------------------------------------------------

    New-UDHeading -Text "Layout" -Size 3

    New-UDLayout -Columns 12  {
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
        New-UDCard -Title "" -BackgroundColor Black
    }

    # ---------------------------------------------------

    New-UDHeading -Text "Content vs Endpoint" -Size 3

    New-UDRow -Columns {
        New-UDColumn -SmallSize 6 -Content {
            New-UDCard -Title "Content" -Content {
                Get-Random
            }
        }

        New-UDColumn -SmallSize 6 -Endpoint {
            New-UDCard -Title "Endpoint" -Content {
                Get-Random
            }
        }
    }
}

$Dashboard = New-UDDashboard -Title "Concepts" -Pages $Pages 

Get-UDDashboard | Stop-UDDashboard
Start-UDDashboard -Dashboard $Dashboard -Port 10000