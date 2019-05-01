$Variable = "MyValue"
function Get-Stuff {
    "MyFunctions"
}

$EndpointInitialization = New-UDEndpointInitialization -Variable 'Variable' -Function 'Get-Stuff' 

$Dashboard = New-UDDashboard -Title "Concepts" -Content {
    New-UDCard -Endpoint {
        $Variable
    }

    New-UDCard -Endpoint {
        Get-Stuff
    }
} -EndpointInitialization $EndpointInitialization

Start-UDDashboard -Dashboard $Dashboard -Port 10001