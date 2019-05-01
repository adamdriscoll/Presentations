Import-Module UniversalDashboard

Get-UDDashboard | Stop-UDDashboard

$Pages = @()

$Pages += New-UDPage -Name "Universal Dashboard" -Icon globe -Content {

    New-UDElement -Tag "div" -Attributes @{
        style = @{
            paddingTop = "100px"
        }
    } 

    New-UDRow -Columns {
        New-UDColumn -SmallOffset 3 -SmallSize 6 -Content {
            New-UDElement -Tag "div" -Attributes @{className = 'center'} -Endpoint {
                $image = (Invoke-RestMethod "https://api.giphy.com/v1/gifs/random?api_key=$env:GiphyApiKey&tag=kitten&rating=PG").data.images.downsized
                New-UDImage -Url $image.url -Height $image.height -Width $image.width
            } -AutoRefresh -RefreshInterval 5
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallOffset 3 -SmallSize 2 -Content {
            New-UDImage -Url 'https://github.com/ironmansoftware/universal-dashboard/raw/master/images/logo.png' -Height '200' -Width '200'
        }
        New-UDColumn -SmallSize 6 -Content {
            New-UDRow -Columns {
                New-UDHeading -Text "PowerShell Universal Dashboard" -Size 3
            }
            New-UDRow -Columns {
                New-UDHeading -Text "by Adam Driscoll" -Size 4
            }
        }
    }
}

$Pages += New-UDpage -Name "About Me" -Icon user_circle -Content {

    New-UDElement -Tag "div" -Attributes @{
        style = @{
            paddingTop = "100px"
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 -SmallOffset 4 -Content {
            New-UDCard -Title "Adam Driscoll" -Content {
                ""
            } -Image (New-UDImage -Path "$PSScriptRoot\images\me.jpg") 
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'aspnet' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'aspnet' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'aspnet' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "Microsoft MVP" -Text "x6 Microsoft MVP in Cloud and Datacenter" -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"    
            }
            
        }

        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'react' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'react' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'react' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "Business Owner" -Text "Owner of Ironman Software." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"
            }
            
        }

        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'md' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'md' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'md' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "Software Architect" -Text "Software Architect at STEALTHbits Technologies." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"
            }
        }

        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'ps' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'ps' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'ps' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "Endurance Athlete" -Text "x2 Ironman Triathlon Finisher." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"
            }
            
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallOffset 4 -SmallSize 8 -Content {
            New-UDElement -Tag 'iframe' -Attributes @{
                src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9144714.18110723!2d-110.66101801578368!3d39.836637880917266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54abd455727d06d5%3A0x6a5cb7d981f48951!2sHailey%2C+ID+83333!5e0!3m2!1sen!2sus!4v1556227708341!5m2!1sen!2sus"
                width = 600 
                height = 450
                frameborder = 0
                style = @{border = 0}
                allowfullscreen = $true
            }
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 8 -SmallOffset 2 -Content {
            New-UDImage -Path "$PSScriptRoot\images\idaho.png"
        }
    }
}

$Pages += New-UDpage -Name "About" -Icon info_circle -Content {

    New-UDElement -Tag "div" -Attributes @{
        style = @{
            paddingTop = "100px"
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 -SmallOffset 4 -Content {
            New-UDCard -Title "Create beautiful websites with PowerShell" -Content {
                "You can use Universal Dashboard to produce websites with PowerShell"
            } -Image (New-UDImage -Url 'https://i0.wp.com/ironmansoftware.com/wp-content/uploads/2019/01/splash.png?resize=1024%2C492&ssl=1' -Height "300") -Reveal {
                New-UDHeading -Text "No JavaScript, HTML or CSS necessary. Blends right in to your existing PowerShell scripts." -Size 5
            }
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'aspnet' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'aspnet' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'aspnet' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "ASP.NET Core" -Text "ASP.NET Core is a web server and framework for .NET Core built by Microsoft." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"    
            }
            
        }

        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'react' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'react' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'react' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "React" -Text "React is a JavaScript library for building web interfaces built by Facebook." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"
            }
            
        }

        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'md' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'md' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'md' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "Material Design" -Text "Design concepts by Google for web controls and layouts." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"
            }
        }

        New-UDColumn -SmallSize 3 -Content {
            New-UDElement -Tag "div" -Id 'ps' -Attributes @{
                onMouseOver = {
                    Set-UDElement -Id 'ps' -Attributes @{
                        style = @{
                            backgroundColor = '#3685FF'
                            padding = '10px'
                        }
                    }
                }
                onMouseLeave = {
                    Set-UDElement -Id 'ps' -Attributes @{
                        style = @{
                            backgroundColor = 'white'
                            padding = '0px'
                        }
                    }
                }
            } -Content {
                New-UDCard -Title "PowerShell" -Text "PowerShell is the interface for Universal Dashboard is the only language required to write a dashboard." -BackgroundColor "#31A9E8" -FontColor "#FFFFFF"
            }
            
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 -SmallOffset 2 -Content {
            New-UDCard -Title "Host it anywhere" -Content {
                "You can host UD from the command line, within the UD service or in Azure\IIS. You can even spin it up in a Docker Container or on a Raspberry Pi."
            } -Image (New-UDImage -Url "https://cdn-images-1.medium.com/max/1200/1*pz3t0mFJmFqVJD2D5WFyOw.png" -Height 300)
        }
        New-UDColumn -SmallSize 4 -Content {
            New-UDCard -Title "Cross platform" -Content {
                "Universal Dashboard runs on PowerShell v5+ and PowerShell Core (v6). Run your dashboard on Windows, Linux or Mac."
            } -Image (New-UDImage -Url "http://openness.blob.core.windows.net/openmedia/2014/10/Microsoft-Loves-Linux-Openness-e1414168049882.png" -Height 300)
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 -SmallOffset 2 -Content {
            New-UDCard -Title "Expose REST APIs" -Content {
                "Turn your PowerShell cmdlets and functions into web-accessible REST APIs"
            } -Image (New-UDImage -Url 'https://i2.wp.com/ironmansoftware.com/wp-content/uploads/2019/01/rest.png?w=493&ssl=1' -Height '300') 
        }
        New-UDColumn -SmallSize 4 -Content {
            New-UDCard -Title "Easy to use controls" -Content {
                "Tons of built in controls for everything from textboxes to charts."
            } -Image (New-UDImage -Url 'https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-L9mVQO4zbOX7ZcHvIte%2F-LT31FPOH8R7vKhPAg76%2F-LT31INt1uanB7MHSBAu%2Finfluxdb.gif?alt=media&token=9c99d982-11cc-4af9-b5be-53a58230d589' -Height '300') 
        }
    }

    # #############################################################################

    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 -SmallOffset 2 -Content {
            New-UDCard -Title "Builtin authentication" -Content {
                "Universal Dashboard supports OAuth providers such as Microsoft, Twitter, Google and Facebook as well as forms auth."
            } -Image (New-UDImage -Url "https://i1.wp.com/ironmansoftware.com/wp-content/uploads/2019/01/login.png?w=700&ssl=1" -Height 300)
        }
        New-UDColumn -SmallSize 4 -Content {
            New-UDCard -Title "Advanced customization" -Content {
                "Build any control your heart desires with New-UDElement. Use pure PowerShell or extend with JavaScript."
            } -Image (New-UDImage -Url "https://github.com/ironmansoftware/ud-chatroom/raw/master/images/chatroom.gif" -Height 200)
        }
    }

    # #############################################################################



    # #############################################################################

    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 -SmallOffset 2 -Content {
            New-UDCard -Title "Free!" -Content {
                "Universal Dashboard Community Edition is free. Enterprise Edition provides a bit more for a resonable cost. "
            } -Image (New-UDImage -Url "https://www.milehighonthecheap.com/lotc-cms/wp-content/uploads/2018/01/free-word-DP.jpg" )
        }
        New-UDColumn -SmallSize 4 -Content {
            New-UDCard -Title "Open source" -Content {
                "Universal Dashboard is open source and on GitHub"
            } -Image (New-UDImage -Url "https://tettra.co/wp-content/logos/github.png" -Height 250)
        }
    }
}

# -------------- Concepts -----------------------------

$Pages += New-UDPage -Name "Controls" -Icon clone -Content {
}

$Pages += New-UDPage -Name "Visualizations" -Icon beer -Content {
    # New-UDRow -Columns {
    #     New-UDColumn -SmallSize 12 -Content {
    #         New-UDCounter -Title "Activities this month" -Icon bicycle -Endpoint {
    #             $Activities = Get-Content -Raw (Join-Path $ScriptRoot "strava.json") | ConvertFrom-Json
    #             $Activities.Count
    #         } -TextSize Large 
    #     }
    # }
        
    New-UDLayout -Columns 2 -Content {
        # #############################################################################

        # New-UDTable -Title "Last 10 Activities" -Headers @("Type", "Date", "Distance", "Time", 'View') -Endpoint {
        #     $Activities = (Get-Content -Raw (Join-Path $ScriptRoot "strava.json") | ConvertFrom-Json) | Select-Object -First 10
        #     $Activities | ForEach-Object {
        #         [PSCustomObject]@{
        #             type = $_.Type
        #             date = ([DateTime]$_.start_time)
        #             distance = $_.distance
        #             time = [TimeSpan]::FromSeconds($_.moving_time)
        #             link = (New-UDLink -Url "https://www.strava.com/activities/$($_.Id)" -Text 'View' -OpenInNewWindow)
        #         } 
        #     } | Out-UDTableData -Property @("type", "date", "distance", "time", 'link')
        # }

        # #############################################################################

        New-UDChart -Title "Hours Spent This Month" -Endpoint {
            $Activities = Get-Content -Raw (Join-Path $ScriptRoot "strava.json") | ConvertFrom-Json

            $Activities | Group-Object -Property type | ForEach-Object {
                [PSCustomObject]@{
                    type = $_.Name
                    time = [TimeSpan]::FromSeconds(($_.group.moving_time | Measure-Object -Sum).Sum).TotalHours
                }
            } | Out-UDChartData -DataProperty time -LabelProperty type -BackgroundColor @('#B21212', '#FFFC19', '#1485CC', '#02B218')
        } -Options @{
            scales = @{
                yAxes = @(
                    @{
                        ticks = @{
                            beginAtZero = $true
                        }
                    }
                )
            }
        }

        # #############################################################################

        New-UDChart -Title "Distance Traveled This Month" -Type Pie -Endpoint {
            $Activities = Get-Content -Raw (Join-Path $ScriptRoot "strava.json") | ConvertFrom-Json

            $Activities | Group-Object -Property type | ForEach-Object {
                [PSCustomObject]@{
                    type = $_.Name
                    time = ($_.group.distance | Measure-Object -Sum).Sum.ToString("F")
                }
            } | Out-UDChartData -DataProperty time -LabelProperty type -BackgroundColor @('#B21212', '#FFFC19', '#1485CC', '#02B218')
        } 

        # #############################################################################

        # New-UDRow -Columns {
        #     New-UDColumn -SmallSize 6 -Content {
        #         New-UDMonitor -Title "CPU Usage" -Type Line -Endpoint {
        #             Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -Expand Average | Out-UDMonitorData
        #         }
        #     }

        #     New-UDColumn -SmallSize 6 -Content {
        #         New-UdChart -Title "Disk Space by Drive" -Type Bar -AutoRefresh -Endpoint {
        #             Get-CimInstance -ClassName Win32_LogicalDisk | ForEach-Object {
        #                     [PSCustomObject]@{ DeviceId = $_.DeviceID;
        #                                 Size = [Math]::Round($_.Size / 1GB, 2);
        #                                 FreeSpace = [Math]::Round($_.FreeSpace / 1GB, 2); } } | Out-UDChartData -LabelProperty "DeviceID" -Dataset @(
        #                 New-UdChartDataset -DataProperty "Size" -Label "Size" -BackgroundColor "#80962F23" -HoverBackgroundColor "#80962F23"
        #                 New-UdChartDataset -DataProperty "FreeSpace" -Label "Free Space" -BackgroundColor "#8014558C" -HoverBackgroundColor "#8014558C"
        #             )
        #         } -OnClick {
        #             Show-UDToast -Message $EventData
        #         }
        #     }
        # }


        # #############################################################################

        New-UDRow -Columns {
            New-UDColumn  -Endpoint {
            $Data = @(
                @{
                    country = "AD"
                    "hot dog" = (Get-Random -Maximum 100 -Minimum 10)
                    "hot dogColor" = "hsl(102, 70%, 50%)"
                    "burger" = (Get-Random -Maximum 100 -Minimum 10)
                    "burgerColor" = "hsl(102, 70%, 50%)"
                    "fries" = (Get-Random -Maximum 100 -Minimum 10)
                    "friesColor" = "hsl(102, 70%, 50%)"
                    "sandwich" = (Get-Random -Maximum 100 -Minimum 10)
                    "sandwichColor" = "hsl(102, 70%, 50%)"
                    "wrap" = (Get-Random -Maximum 100 -Minimum 10)
                    "wrapColor" = "hsl(102, 70%, 50%)"
                    "cookie" = (Get-Random -Maximum 100 -Minimum 10)
                    "cookieColor" = "hsl(102, 70%, 50%)"
                }
                @{
                    country = "AA"
                    "hot dog" = (Get-Random -Maximum 100 -Minimum 10)
                    "hot dogColor" = "hsl(102, 70%, 50%)"
                    "burger" = (Get-Random -Maximum 100 -Minimum 10)
                    "burgerColor" = "hsl(102, 70%, 50%)"
                    "fries" = (Get-Random -Maximum 100 -Minimum 10)
                    "friesColor" = "hsl(102, 70%, 50%)"
                    "sandwich" = (Get-Random -Maximum 100 -Minimum 10)
                    "sandwichColor" = "hsl(102, 70%, 50%)"
                    "wrap" = (Get-Random -Maximum 100 -Minimum 10)
                    "wrapColor" = "hsl(102, 70%, 50%)"
                    "cookie" = (Get-Random -Maximum 100 -Minimum 10)
                    "cookieColor" = "hsl(102, 70%, 50%)"
                }
                @{
                    country = "AE"
                    "hot dog" = (Get-Random -Maximum 100 -Minimum 10)
                    "hot dogColor" = "hsl(102, 70%, 50%)"
                    "burger" = (Get-Random -Maximum 100 -Minimum 10)
                    "burgerColor" = "hsl(102, 70%, 50%)"
                    "fries" = (Get-Random -Maximum 100 -Minimum 10)
                    "friesColor" = "hsl(102, 70%, 50%)"
                    "sandwich" = (Get-Random -Maximum 100 -Minimum 10)
                    "sandwichColor" = "hsl(102, 70%, 50%)"
                    "wrap" = (Get-Random -Maximum 100 -Minimum 10)
                    "wrapColor" = "hsl(102, 70%, 50%)"
                    "cookie" = (Get-Random -Maximum 100 -Minimum 10)
                    "cookieColor" = "hsl(102, 70%, 50%)"
                }
                @{
                    country = "AZ"
                    "hot dog" = (Get-Random -Maximum 100 -Minimum 10)
                    "hot dogColor" = "hsl(102, 70%, 50%)"
                    "burger" = (Get-Random -Maximum 100 -Minimum 10)
                    "burgerColor" = "hsl(102, 70%, 50%)"
                    "fries" = (Get-Random -Maximum 100 -Minimum 10)
                    "friesColor" = "hsl(102, 70%, 50%)"
                    "sandwich" = (Get-Random -Maximum 100 -Minimum 10)
                    "sandwichColor" = "hsl(102, 70%, 50%)"
                    "wrap" = (Get-Random -Maximum 100 -Minimum 10)
                    "wrapColor" = "hsl(102, 70%, 50%)"
                    "cookie" = (Get-Random -Maximum 100 -Minimum 10)
                    "cookieColor" = "hsl(102, 70%, 50%)"
                }
            )
                New-UDNivoChart -Heatmap -Data $data  -Keys @("hot dog", "burger", "fries", "sandwich", "wrap", "cookie") -IndexBy "country" -ForceSquare -Height 300 -Width 600 
            } 
        }

        $Data = @()        
        for($i = 365; $i -gt 0; $i--) {
            $Data += @{
                day = (Get-Date).AddDays($i * -1).ToString("yyyy-MM-dd")
                value = Get-Random
            }
        }

        $From = (Get-Date).AddDays(-365)
        $To = Get-Date

        New-UDNivoChart -Calendar -Data $Data -From $From -To $To -Height 500 -Width 1000 -MarginTop 50 -MarginRight 130 -MarginBottom 50 -MarginLeft 60
                
    }
}



$Pages += New-UDPage -Name "Layout" -Icon table -Content {

    # New-UDHeading -Text "Use New-UDLayout for simple layouts" -Size 3

    # New-UDLayout -Columns 3 {
    #     New-UDCard -Text "Column 1" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 2" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    # }

    # #############################################################################

    # New-UDHeading -Text "Use New-UDRow + New-UDColumn for more custom layouts" -Size 3

    # New-UDRow -Columns {
    #     New-UDColumn -Size 4 -Content {
    #         New-UDCard -Text "Column 1 - Size -eq 4" -BackgroundColor 'black' -FontColor 'white'
    #     }
    #     New-UDColumn -Size 2 -Content {
    #         New-UDCard -Text "Column 2 - Size -eq 2" -BackgroundColor 'black' -FontColor 'white'
    #     }
    #     New-UDColumn -Size 6 -Content {
    #         New-UDCard -Text "Column 3 - Size -eq 6" -BackgroundColor 'black' -FontColor 'white'
    #     }
    # }

    # #############################################################################

    # New-UDHeading -Text "Offset columns and vary their sizes" -Size 3

    # New-UDRow -Columns {
    #     New-UDColumn -SmallOffset 2 -SmallSize 4 -Content {
    #         New-UDCard -Text "Column 1 - Size -eq 4, Offset -eq 2" -BackgroundColor 'black' -FontColor 'white'
    #     }
    #     New-UDColumn -SmallSize 2 -Content {
    #         New-UDCard -Text "Column 2 - Size -eq 2" -BackgroundColor 'black' -FontColor 'white'
    #     }
    # }

    # #############################################################################
    
    # New-UDHeading -Text "Change size based on screen size" -Size 3

    # New-UDRow -Columns {
    #     New-UDColumn -SmallSize 12 -MediumSize 8 -LargeSize 2 -Content {
    #         New-UDCard -Text "I change my size based on screen size!" -BackgroundColor 'black' -FontColor 'white'
    #     }
    # }

    # #######################

    # New-UDHeading -Text "Grid Layout (Beta)" -Size 3

    # $Layout = '{"lg":[{"w":1,"h":2,"x":2,"y":0,"i":"grid-element-card1","moved":false,"static":false},{"w":1,"h":3,"x":3,"y":0,"i":"grid-element-card2","moved":false,"static":false}]}'

    # New-UDGridLayout -LayoutJson $Layout -Content {
    #     New-UDCard -Id 'card1' -Text "card1" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Id 'card2' -Text "card2" -BackgroundColor 'black' -FontColor 'white'
    # } 
}

$Pages += New-UDPage -Name "Inputs" -Icon edit -Content {
    # New-UDInput -Title "Basic Input" -Endpoint {
    #     param($Text, [Switch]$bool, [System.DayOfWeek]$Select)

    #     Show-UDToast -Message "You selected: $Text $Bool $Select" -Duration 3000 
    # }

    #-----------------------------------------

    # New-UDInput -Title "Input Actions" -Endpoint {
    #     param($WhatShouldISay)

    #     New-UDInputAction -Content @(
    #         New-UDHeading -Text $WhatShouldISay -Size 1
    #     )
    # }

    #-----------------------------------------

    # New-UDInput -Title "Validation Input" -Endpoint {
    #     param([ValidateLength(1,10)][String]$Text)

    #     Show-UDToast -Message "You selected: $Text $Bool $Select" -Duration 3000
    # } -Validate

    #-----------------------------------------

    # New-UDInput -Title "Custom Inputs" -Content {
    #     New-UDInputField -Type file -Name "CSV" 
    # } -Endpoint {
    #     param($CSV) 

    #     $Objects = ConvertFrom-Csv $CSV

    #     Show-UDModal  -Content {

    #         $Properties = $Objects | Get-Member -MemberType NoteProperty | Select-Object -Expand Name 

    #         New-UDGrid -Title "CSV" -Headers $Properties -Properties $Properties -Endpoint {
    #             $Objects | Out-UDGridData 
    #         }
    #     }
    # }
}

$Pages += New-UDPage -Name "Custom Elements" -Icon puzzle_piece -Content {
    # New-UDElement -Tag "div" -Attributes @{
    #     style = @{
    #         padding = "100px"
    #         backgroundColor = "black"
    #         color = "white"
    #     }
    # } -Content {
    #     "I'm a div with a bunch of padding!"
    # }

    # <div style="padding=100px;background-color:black;color:white;">I'm a div with a bunch of padding!</div>

    # #############################################################################


    # New-UDElement -Tag "svg" -Attributes @{
    #     width = "400"
    #     height = "180"
    # } -Content {
    #     New-UDElement -Tag "rect" -Attributes @{
    #         x = 50
    #         y = 20 
    #         rx = 20
    #         ry = 20
    #         width = 150
    #         height = 150
    #         style = @{
    #             fill = "red"
    #             stroke = "black"
    #             strokeWidth = 5
    #             opacity = "0.5"
    #         }
    #     }
    # }

    #     <svg width="100" height="100">
    #       <circle cx="50" cy="50" r="40" stroke="green" strokeWidth="4" fill="yellow" />
    # </svg>

    #-------------------------------------------

    # New-UDRow -AutoRefresh -RefreshInterval 1 -Endpoint {
    #     $Time = Get-Date
    #     New-UDColumn -Content {
    #         New-UDKnob -Value $Time.Hour
    #     }
    #     New-UDColumn -Content {
    #         New-UDKnob -Value $Time.Minute -ForegroundColor "#38E8A1"
    #     }
    #     New-UDColumn -Content {
    #         New-UDKnob -Value $Time.Second -ForegroundColor "#442EE8"
    #     }
    # }        
}


$Pages += New-UDPage -Name "Dynamic Interfaces" -Icon bolt -Content {

    # New-UDHeading -Text "Set Element" -Size 3

    # New-UDElement -Tag "div" -Id "Placeholder" 

    # New-UDButton -Text "Click me" -OnClick {
    #     Set-UDElement -Id "Placeholder" -Content { "Dude! You clicked the button!" }
    # }

    # New-UDButton -Text "Toast Me" -OnClick {
    #     Show-UDToast -Message "Mmmmmmm toast" -Title "This is a sweet toast" 
    # }

    # New-UDButton -Text "Modal me" -OnClick {
    #     Show-UDModal -Content {
    #         New-UDHeading -Text "Loading..."
    #         New-UDPreloader -BackgroundColor Red
    #     }
    # }

    # #############################################################################

    # New-UDHeading -Text "Child Elements" -Size 3

    # New-UDElement -Tag "ul" -Id "AListOfDateTimes" 

    # New-UDButton -Text "Click me" -OnClick {
    #     Add-UDElement -ParentId "AListOfDateTimes" -Content {
    #         New-UDElement -Tag "li" -Content { (Get-Date).ToString('G') }
    #     }
    # }

    # New-UDButton -Text "I don't like dates" -OnClick {
    #     Clear-UDElement -Id "AListOfDateTimes"
    # }

    # ############################################################################

    # New-UDHeading -Text "Get Element" -Size 3

    # New-UDElement -Tag 'div' -Id 'someDiv' 

    # New-UDTextbox -Id 'textbox' -Label 'Enter Some Text' 
    # New-UDButton -Text 'Get Element' -OnClick {
    #     $Element = Get-UDElement -Id 'textbox'
    #     $Value = $Element.Attributes['value']
    #     Set-UDElement -Id 'someDiv' -Content { $Value }
    # }

    # ############################################################################

    # New-UDHeading -Text "Sync Element" -Size 3

    New-UDLayout -Columns 3 -Content {
        New-UDCounter -Title "Counter 1" -Id 'counter1' -Endpoint {
            $Cache:Value
        }
        New-UDCounter -Title "Counter 2" -Id 'counter2' -Endpoint {
            $Cache:Value
        }
        New-UDCounter -Title "Counter 3" -Id 'counter3' -Endpoint {
            $Cache:Value
        }
    }

    New-UDButton -Text 'Sync Counters' -OnClick {
        $Cache:Value = Get-Random
        1..3 | ForEach-Object { Sync-UDElement -Id "counter$_"}
    }
}


#region Cache vs Session

$Pages += New-UDPage -Name "Cache and Session" -Icon biohazard -Content {
    # New-UDLayout -Columns 2 -Content {
    #     New-UDCounter -Title "Session" -Endpoint { $Session:SessionValue } -AutoRefresh -RefreshInterval 2
    #     New-UDCounter -Title "Cache" -Endpoint { $Cache:CacheValue } -AutoRefresh -RefreshInterval 2
    #     New-UDButton -Text "Session++" -OnClick { $Session:SessionValue += 1 }
    #     New-UDButton -Text "Cache++" -OnClick { $Cache:CacheValue += 1 }
    # }
}

#endregion

#region Scheduled Endpoints 

$Pages += New-UDPage -Name "Scheduled Endpoints" -Icon compass {

}

$Endpoints = @()

$Schedule = New-UDEndpointSchedule -Every 10 -Minute 
$AthleteScheduled = New-UDEndpoint -Schedule $Schedule -Endpoint {
    $Cache:Activities = Get-Content -Raw (Join-Path $ScriptRoot "strava.json") | ConvertFrom-Json
}

$Endpoints += $AthleteScheduled

$AthleteCached = New-UDEndpoint -Url "activity/cache" -Method GET -Endpoint {
    $Cache:Activities | ConvertTo-Json
}

$Endpoints += $AthleteCached

#endregion

#region Login Pages and Authorization

$Pages += New-UDPage -Name "Security" -Icon _lock -Content {

}

$LoginPage = New-UDLoginPage -AuthenticationMethod (
    New-UDAuthenticationMethod -Endpoint {
        param([PSCredential]$Credential)
            New-UDAuthenticationResult -Success -UserName $Credential.UserName
    } 
) -AuthorizationPolicy (
    New-UDAuthorizationPolicy -Name "Administrator" -Endpoint {
        param($ClaimsPrincipal)
        $ClaimsPrincipal.Identity.Name -eq 'Administrator'
    }
)

# $Pages += New-UDPage -Name "Settings" -Icon cog -Endpoint {
#     New-UDHeading -Text "Hello, $User! This is a administrator only page."
# } -AuthorizationPolicy "Administrator"

#endregion

#region REST APis

$Pages += New-UDPage -Name "REST APIs" -Icon code {

}

@(
    [PSCustomObject]@{ UserName = "Adam"; Role = "Code Monkey" }
    [PSCustomObject]@{ UserName = "Sarah"; Role = "Developer" }
    [PSCustomObject]@{ UserName = "Bob"; Role = "Quality Assurance" }
    [PSCustomObject]@{ UserName = "Stu"; Role = "Documentation" }
) | ConvertTo-Json | Out-File -FilePath (Join-Path $PSScriptRoot "data.json") -Force

New-UDEndpoint -Url "user" -Method GET -Endpoint {
    Get-Content -Raw (Join-Path $ScriptRoot "data.json")
} | Out-Null

New-UDEndpoint -Url "user/:username" -Method GET -Endpoint {
    param($username)

    (Get-Content -Raw (Join-Path $ScriptRoot "data.json") | ConvertFrom-Json) | Where-Object UserName -like $username | ConvertTo-Json
} | Out-Null

New-UDEndpoint -Url "user" -Method POST -Endpoint {
    param($Body)

    $User = ConvertFrom-Json $Body
    $Users = Get-Content -Raw (Join-Path $ScriptRoot "data.json") | ConvertFrom-Json
    $Users += $User 

    $Users | ConvertTo-Json | Out-File -FilePath (Join-Path $ScriptRoot "data.json") 
} | Out-Null

New-UDEndpoint -Url "user/:username" -Method DELETE -Endpoint {
    param($username)

    $Users = (Get-Content -Raw (Join-Path $ScriptRoot "data.json") | ConvertFrom-Json) | Where-Object UserName -NotLike $username 
    $Users | ConvertTo-Json | Out-File -FilePath (Join-Path $ScriptRoot "data.json") 

} | Out-Null

New-UDEndpoint -Url "user/:username" -Method PUT -Endpoint {
    param($username, $Body)

    $Users = (Get-Content -Raw (Join-Path $ScriptRoot "data.json") | ConvertFrom-Json) | Where-Object UserName -NotLike $username 
    $Users += $Body | ConvertFrom-Json
    $Users | ConvertTo-Json | Out-File -FilePath (Join-Path $ScriptRoot "data.json") 
    
} | Out-Null

<#
    Invoke-RestMethod http://localhost:999/api/user
    curl http://localhost:999/api/user

    Invoke-RestMethod http://localhost:999/api/user/Adam
    Invoke-RestMethod http://localhost:999/api/user -Method POST -Body (@{
        UserName = "Lee"
        Role = "Technical Project Manager"
    } | ConvertTo-Json)
    Invoke-RestMethod http://localhost:999/api/user/Lee
    Invoke-RestMethod http://localhost:999/api/user/Lee -Method PUT -Body (@{
        UserName = "Lee"
        Role = "Waterboy"
    } | ConvertTo-Json)
    Invoke-RestMethod http://localhost:999/api/user/Lee
    Invoke-RestMethod http://localhost:999/api/user/Lee -Method DELETE
    Invoke-RestMethod http://localhost:999/api/user

#>

#endregion

#region Debugging

$Pages += New-UDPage -Name "Debugging" -Icon bug -Content {
    New-UDElement -Tag 'div' -Endpoint {
        $Variable = 'Test'
        $Variable = Get-Process
        throw "Oh noz!" 
    }
}

#endregion 

# -------------- Endpoint Init ------------------------

#region Performance 

<#
    $Endpoint = New-UDEndpoint -Url "/hitme" -Endpoint { }
    Start-UDRestApi -Endpoint $Endpoint -Port 10003
    $ProgressPreference = "SilentlyContinue"
    Measure-Command { 1..8 | ForEach-Object { Start-ThreadJob { 1..1000 | ForEach-Object { Invoke-RestMethod http://localhost:10003/hitme -UseBasicParsing } }  } | Wait-Job }
#>
    
#endregion

$Pages += New-UDPage -Name "More Resources" -Icon book -Content {
    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 {
            New-UDCollection -Content {
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon book -Size Large
                     " Documentation" 
                    } -SecondaryContent { New-UDLink -Icon book -Text ">" -Url "https://docs.universaldashboard.io" -OpenInNewWindow }
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon bug -Size Large
                    " Issue Tracker" 
                } -SecondaryContent { New-UDLink -Icon bug -Text ">" -Url "https://github.com/ironmansoftware/universal-dashboard/issues" -OpenInNewWindow }
                New-UDCollectionItem -Content {
                   New-UDIcon -Icon users -Size Large
                   " Forums" 
                } -SecondaryContent { New-UDLink -Icon users -Text ">" -Url "https://forums.universaldashboard.io" -OpenInNewWindow }    
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon shopping_cart -Size Large
                    " UD Marketplace" 
                 } -SecondaryContent { New-UDLink -Icon shopping_cart -Text ">" -Url "https://ironmansoftware.com/universal-dashboard-marketplace/" -OpenInNewWindow } 
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon shopping_cart -Size Large
                    " Store" 
                 } -SecondaryContent { New-UDLink -Icon shopping_cart -Text ">" -Url "https://ironmansoftware.com" -OpenInNewWindow }    
                 New-UDCollectionItem -Content {
                    New-UDIcon -Icon github -Size Large
                    " Open Source" 
                 } -SecondaryContent { New-UDLink -Icon github -Text ">" -Url "https://github.com/ironmansoftware" -OpenInNewWindow }    
            }
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallOffset 3 -SmallSize 6 -Content {
            New-UDElement -Tag "div" -Attributes @{className = 'center'} -Endpoint {
                New-UDHeading -Text "Thanks!" -Size 3
                $image = (Invoke-RestMethod "https://api.giphy.com/v1/gifs/random?api_key=$env:GiphyApiKey&tag=puppy&rating=PG").data.images.downsized
                New-UDImage -Url $image.url -Height $image.height -Width $image.width
            } -AutoRefresh -RefreshInterval 5
        }
    }
}

# ---------------------------------

$Navigation = New-UDSideNav -Content {
    New-UDSideNavItem -Url "https://docs.universaldashboard.io" -Text "Documentation" -Icon book
    New-UDSideNavItem -Url "https://github.com/ironmansoftware/universal-dashboard" -Text "GitHub Repository" -Icon github
    New-UDSideNavItem -Url 'https://forums.universaldashboard.io' -Text "Forums" -Icon users
    New-UDSideNavItem -Url "https://ironmansoftware.com/universal-dashboard-marketplace/" -Text "Marketplace" -Icon shopping_bag
} -Fixed

# ---------------------------------

Import-Module "$PSScriptRoot\UniversalDashboard.Knob\UniversalDashboard.Knob.psd1"
$ScriptRoot = $PSScriptRoot

$Parameters =  @{
    Title = 'PowerShell and DevOps Summit - Universal Dashboard'
    Pages = $Pages 
    EndpointInitialization = (New-UDEndpointInitialization -Module ("$PSScriptRoot\UniversalDashboard.Knob\UniversalDashboard.Knob.psd1") -Variable @("ScriptRoot"))
    #LoginPage = $LoginPage
    #Navigation = $Navigation
}

$Dashboard = New-UDDashboard @Parameters

Start-UDDashboard -Dashboard $Dashboard -Port 999 -AutoReload -AllowHttpForLogin -Endpoint $Endpoints
