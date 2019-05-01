
$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$JsFiles = Get-ChildItem "$PSScriptRoot\*.bundle.js"
$Maps = Get-ChildItem "$PSScriptRoot\*.map"

$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($IndexJs.FullName)

foreach($item in $JsFiles)
{
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}

foreach($item in $Maps)
{
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}

function New-UDKnob {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [int]$Value,
        [Parameter()]
        [int]$Minimum = 0,
        [Parameter()]
        [int]$Maximum = 100,
        [Parameter()]
        [int]$Step = 1,
        [Parameter()]
        [Switch]$LogarithmicScale,
        [Parameter()]
        [int]$Width = 200,
        [Parameter()]
        [int]$Height = 200,
        [Parameter()]
        [float]$Thickness = 0.35,
        [Parameter()]
        [ValidateSet("butt", "round")]
        [string]$LineCap = "butt",
        [Parameter()]
        [UniversalDashboard.Models.DashboardColor]$BackgroundColor = "#EEE",
        [Parameter()]
        [UniversalDashboard.Models.DashboardColor]$ForegroundColor = "#EA2",
        [Parameter()]
        [string]$Font = 'Arial',
        [Parameter()]
        [string]$FontWeight = 'bold',
        [Parameter()]
        [Switch]$Counterclockwise,
        [Parameter()]
        [int]$AngleArc = 360,
        [Parameter()]
        [int]$AngleOffset = 0,
        [Parameter()]
        [string]$Title
    )

    End {
        @{
            assetId = $AssetId 
            isPlugin = $true 
            type = "ud-knob"

            id = $Id
            value = $Value
            min = $Minimum 
            max = $Maximum
            step = $Step
            log = $LogarithmicScale.IsPresent
            width = $Width
            height = $Height
            thickness = $Thickness
            lineCap = $LineCap
            bgColor = $BackgroundColor.HtmlColor
            fgColor = $ForegroundColor.HtmlColor
            font = $font 
            fontWeight = $FontWeight
            clockwise = -Not $Counterclockwise.IsPresent
            angleArch =$AngleArc
            angleOffset = $AngleOffset 
            title = $Title
        }
    }
}