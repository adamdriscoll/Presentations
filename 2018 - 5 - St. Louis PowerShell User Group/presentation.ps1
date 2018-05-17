$HomePage = New-UDPage -Name "Universal Dashboard" -Icon globe -Content {

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
            } -AutoRefresh -RefreshInterval 3
        }
    }

    New-UDRow -Columns {
        New-UDColumn -SmallOffset 3 -SmallSize 2 -Content {
            New-UDImage -Url 'https://ironmansoftware.com/images/udlogo.png' -Height '200' -Width '200'
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

$About = New-UDpage -Name "About" -Icon info_circle -Content {

    New-UDElement -Tag "div" -Attributes @{
        style = @{
            paddingTop = "100px"
        }
    }

    # New-UDRow -Columns {
    #     New-UDColumn -SmallOffset 2 
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Create beautiful websites with PowerShell" -Content {
    #             "You can use Universal Dashboard to produce websites with PowerShell"
    #         } -Image (New-UDImage -Url 'https://ironmansoftware.com/images/poshud.png' -Height "300") -Reveal {
    #             New-UDHeading -Text "No JavaScript, HTML or CSS necessary. Blends right in to your existing PowerShell scripts." -Size 5
    #         }
    #     }
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Expose REST APIs" -Content {
    #             "Turn your PowerShell cmdlets and functions into web-accessible REST APIs"
    #         } -Image (New-UDImage -Url 'https://ironmansoftware.com/images/universal-dashboard/rest-api.png' -Height '300') 
    #     }
    # }

    # #############################################################################

    # New-UDRow -Columns {
    #     New-UDColumn -SmallOffset 2 
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Builtin authentication" -Content {
    #             "Universal Dashboard supports OAuth providers such as Microsoft, Twitter, Google and Facebook as well as forms auth."
    #         } -Image (New-UDImage -Url "https://ironmansoftware.com/images/universal-dashboard/login.png" -Height 300)
    #     }
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Advanced customization" -Content {
    #             "Build any control your heart desires with New-UDElement. Use pure PowerShell or extend with JavaScript."
    #         } -Image (New-UDImage -Url "https://ironmansoftware.com/images/universal-dashboard/chatroom.gif" -Height 200)
    #     }
    # }

    # #############################################################################

    # New-UDRow -Columns {
    #     New-UDColumn -SmallOffset 2 
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Host it anywhere" -Content {
    #             "You can host UD from the command line, within the UD service or in Azure\IIS. You can even spin it up in a Docker Container or on a Raspberry Pi."
    #         } -Image (New-UDImage -Url "https://cdn-images-1.medium.com/max/1200/1*pz3t0mFJmFqVJD2D5WFyOw.png" -Height 300)
    #     }
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Cross platform" -Content {
    #             "Universal Dashboard runs on PowerShell v5+ and PowerShell Core (v6). Run your dashboard on Windows, Linux or Mac."
    #         } -Image (New-UDImage -Url "http://openness.blob.core.windows.net/openmedia/2014/10/Microsoft-Loves-Linux-Openness-e1414168049882.png" -Height 300)
    #     }
    # }

    # #############################################################################

    # New-UDRow -Columns {
    #     New-UDColumn -SmallOffset 2 
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Free to try, cheap to buy" -Content {
    #             "Universal Dashboard is free to try. Your dashboard will run for 1 hour before you'll have to restart it. "
    #         } -Image (New-UDImage -Url "https://d1yn1kh78jj1rr.cloudfront.net/preview/free-sample-stamp_MJl0grOu_M.jpg" -Height 200)
    #     }
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Title "Free for open source projects" -Content {
    #             "Free licenses for open source project owners that wish to create a dashboard for their project"
    #         } -Image (New-UDImage -Url "https://tettra.co/wp-content/logos/github.png" -Height 250)
    #     }
    # }
}

$Layout = New-UDPage -Name "Layout" -Icon table -Content {

    # New-UDHeading -Text "Use New-UDLayout for simple layouts" -Size 3

    # New-UDLayout -Columns 3 {
    #     New-UDCard -Text "Column 1" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 2" -BackgroundColor 'black' -FontColor 'white'
    #     New-UDCard -Text "Column 3" -BackgroundColor 'black' -FontColor 'white'
    # }

    # #############################################################################

    # New-UDHeading -Text "Use New-UDRow + New-UDColumn for more custom layouts" -Size 3

    # New-UDRow -Columns {
    #     New-UDColumn -SmallSize 4 -Content {
    #         New-UDCard -Text "Column 1 - Size -eq 4" -BackgroundColor 'black' -FontColor 'white'
    #     }
    #     New-UDColumn -SmallSize 2 -Content {
    #         New-UDCard -Text "Column 2 - Size -eq 2" -BackgroundColor 'black' -FontColor 'white'
    #     }
    #     New-UDColumn -SmallSize 6 -Content {
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
}

$Basic = New-UDPage -Name "Basics" -Icon chain -Content {

    New-UDRow -Columns {
        New-UDColumn -SmallOffset 1 -SmallSize 11 -Content {
            # New-UDHeading -Text "Cards" -Size 3
            # New-UDHeading -Text "Cards are basic containers in Material Design" -Size 4

            # New-UDLayout -Columns 3 {
            #     New-UDCard -Title "Card Style Content" -Content {
            #         "This is some card content"
            #     }
            #     New-UDCard -Title "Card Style Content" -Content { "This card has a link" } -Links @(
            #         New-UDLink -Url "https://www.google.com" -Text "Google" -OpenInNewWindow
            #     )
            #     New-UDCard -Title "Card Style Content" -Content { "This card has a custom background color" } -BackgroundColor "Orange" -FontColor "#000000"
            # }

            # #############################################################################

            # New-UDHeading -Text "Collections" -Size 3
            # New-UDHeading -Text "Collections are just lists of items for display" -Size 4

            # New-UDCollection -Content {
            #     New-UDCollectionItem -Content { "Step 1"}
            #     New-UDCollectionItem -Content { "Step 2"}
            #     New-UDCollectionItem -Content { "Step 3"}
            # }

            # #############################################################################

            # New-UDHeading -Text "Collapsibles" -Size 3
            # New-UDHeading -Text "Collapsibles let you show and hide additional content" -Size 4

            # New-UDCollapsible -Items {
            #     New-UDCollapsibleItem -Title "Collapsibles" -Icon bell -Content {
            #         "Some more content"
            #     }
            #     New-UDCollapsibleItem -Title "Collapsibles" -Icon battery_full -Content {
            #         "Some other content"
            #     }
            #     New-UDCollapsibleItem -Title "Collapsibles" -Icon columns -Content {
            #         "Some super sweet content"
            #     }
            # }

            # #############################################################################

            # New-UDHeading -Text "Inputs" -Size 3
            # New-UDHeading -Text "Inputs allow you to take inputs from users" -Size 4

            # New-UDLayout -Columns 5 {
            #     New-UDButton -Text "Click me!" -OnClick {
            #         Send-UDToast -Message "I was clicked!"
            #     }
            #     New-UDCheckbox -Label "Check box" 
            #     New-UDSwitch 
            #     New-UDSelect -Option {
            #         New-UDSelectOption -Name "Option1" -Value 1
            #         New-UDSelectOption -Name "Option2" -Value 2
            #         New-UDSelectOption -Name "Option3" -Value 3
            #     }
            #     New-UDTextbox -Label "Enter some text" -Placeholder "Sample text"
            # }
        }
    }
}

$Visualizations = New-UDPage -Name "Visualizations" -Icon bar_chart -Content {
    New-UDLayout -Columns 2 -Content {
        # New-UDCounter -Title "Activities this month" -Icon bicycle -Endpoint {
        #     $Start = [DateTime]"$([DateTime]::UtcNow.Month)/1/$([DateTime]::UtcNow.Year)"
        #     $End = [DateTime]::UtcNow

        #     (Get-StravaActivity -AccessToken $Env:StravaApiToken -Page 1 -PerPage 100 -Before $End -After $Start).Count + $Random
        # }

        # #############################################################################

        # New-UDTable -Title "Last 10 Activities" -Headers @("Type", "Date", "Distance", "Time", 'View') -Endpoint {
        #     $Activities = Get-StravaActivity -AccessToken $Env:StravaApiToken -Page 1 -PerPage 10
        #     $Activities | ForEach-Object {
        #         [PSCustomObject]@{
        #             type = $_.Type
        #             date = ([DateTime]$_.start_date)
        #             distance = (($_.distance * 3.28) / 5280.0).ToString("F") # Convert to miles
        #             time = [TimeSpan]::FromSeconds($_.moving_time)
        #             link = (New-UDLink -Url "https://www.strava.com/activities/$($_.Id)" -Text 'View' -OpenInNewWindow)
        #         } 
        #     } | Out-UDTableData -Property @("type", "date", "distance", "time", 'link')
        # }

        # #############################################################################

        # New-UDChart -Title "Hours Spent This Month" -Endpoint {
        #     $Start = [DateTime]"$([DateTime]::UtcNow.Month)/1/$([DateTime]::UtcNow.Year)"
        #     $End = [DateTime]::UtcNow

        #     $a = Get-StravaActivity -AccessToken $Env:StravaApiToken -Page 1 -PerPage 100 -Before $End -After $Start 
            
        #     $a | Group-Object -Property type | ForEach-Object {
        #         [PSCustomObject]@{
        #             type = $_.name
        #             time = [TimeSpan]::FromSeconds(($_.group.moving_time | Measure-Object -Sum).Sum).TotalHours
        #         }
        #     } | Out-UDChartData -DataProperty time -LabelProperty type -BackgroundColor @('#B21212', '#FFFC19', '#1485CC', '#02B218')
        # } 

        # #############################################################################

        # New-UDChart -Title "Distance Traveled This Month" -Type Pie -Endpoint {
        #     $Start = [DateTime]"$([DateTime]::UtcNow.Month)/1/$([DateTime]::UtcNow.Year)"
        #     $End = [DateTime]::UtcNow

        #     $a = Get-StravaActivity -AccessToken $Env:StravaApiToken -Page 1 -PerPage 100 -Before $End -After $Start 
            
        #     $a | Group-Object -Property type | ForEach-Object {
        #         [PSCustomObject]@{
        #             type = $_.name
        #             time = ((($_.group.distance | Measure-Object -Sum).Sum * 3.28) / 5280.0).ToString("F")
        #         }
        #     } | Out-UDChartData -DataProperty time -LabelProperty type -BackgroundColor @('#B21212', '#FFFC19', '#1485CC', '#02B218')
        # } 
    }
}

#region REST APis

# $Activity = New-UDEndpoint -Url "activity" -Method GET -Endpoint {
#     $accessToken = $Request.Headers["token"]
#     Get-StravaActivity -AccessToken $accessToken | ConvertTo-Json
# }

# $Athlete = New-UDEndpoint -Url "athlete" -Method GET -Endpoint {
#     $accessToken = $Request.Headers["token"]
#     Get-StravaAthlete -AccessToken $accessToken | ConvertTo-Json
# }

# $Endpoints = @(
#     $Athlete
#     $Activity
# )

# Invoke-RestMethod http://localhost:999/api/athlete -Headers @{ Token = $env:StravaApiToken}
# curl http://localhost:999/api/athlete -H "Token: %StravaApiToken%"

#endregion

#region Authentication 

$LoginPage = New-UDLoginPage -AuthenticationMethod @(
    New-UDAuthenticationMethod -Endpoint {
        New-UDAuthenticationResult -Success -UserName "Adam"
    }
)

#endregion

$CustomElements = New-UDPage -Name "Custom Elements" -Icon puzzle_piece -Content {
    # New-UDElement -Tag "div" -Attributes @{
    #     style = @{
    #         padding = "100px"
    #         backgroundColor = "black"
    #         color = "white"
    #     }
    # } -Content {
    #     "I'm a div with a bunch of padding!"
    # }

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

    # #############################################################################

    # New-UDRow -Columns {
    #     New-UDColumn -SmallSize 3 {
    #         New-UDSparkline -Data @(10, 20, 1, 19, 6, 50, 4, 25)
    #     }
    # }
}

$DynamicInterfaces = New-UDPage -Name "Dynamic Interfaces" -Icon bolt -Content {
    # New-UDElement -Tag "div" -Id "Placeholder" 

    # New-UDButton -Text "Click me" -OnClick {
    #     Set-UDElement -Id "Placeholder" -Content { "Dude! You clicked the button!" }
    # }

    # #############################################################################

    # New-UDElement -Tag "ul" -Id "AListOfDateTimes" 

    # New-UDButton -Text "Click me" -OnClick {
    #     Add-UDElement -ParentId "AListOfDateTimes" -Content {
    #         New-UDElement -Tag "li" -Content { (Get-Date).ToString('G') }
    #     }
    # }

    # New-UDButton -Text "I don't like dates" -OnClick {
    #     Clear-UDElement -Id "AListOfDateTimes"
    # }

    # #############################################################################

    # New-UDColumn -Endpoint {
    #     while($true) {
    #         $DateTime = Get-Date

    #         # Update the digital clock with the time string
    #         Set-UDElement -Id "digital" -Broadcast -Content {$DateTime.ToLongTimeString()}

    #         Start-Sleep -Seconds 1
    #     }
    # }

    # New-UDRow -Columns {
    #     New-UDColumn -Size 2 -Content {
    #         New-UDHeading -Size 3 -Content {
    #             New-UDElement -Tag "div" -Id "digital" -Attributes @{ textAlign = "center" }
    #         }
    #     }
    # }
}

#region Scheduled Endpoints 

# $Schedule = New-UDEndpointSchedule -Every 10 -Minute 
# $AthleteScheduled = New-UDEndpoint -Schedule $Schedule -Endpoint {
#     $Cache:Athlete = Get-StravaAthlete -AccessToken $env:StravaApiToken | ConvertTo-Json
# }

# $Endpoints += $AthleteScheduled

# $AthleteCached = New-UDEndpoint -Url "athlete/cache" -Method GET -Endpoint {
#     $Cache:Athlete
# }

# $Endpoints += $AthleteCached

#endregion

$MoreResources = New-UDPage -Name "More Resources" -Icon book -Content {
    New-UDRow -Columns {
        New-UDColumn -SmallSize 4 {
            New-UDCollection -Content {
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon book -Size Large
                     " Documentation" 
                    } -SecondaryContent { New-UDLink -Icon book -Text ">" -Url "https://legacy.gitbook.com/@adamdriscoll" -OpenInNewWindow }
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon bug -Size Large
                    " Issue Tracker" 
                } -SecondaryContent { New-UDLink -Icon bug -Text ">" -Url "https://github.com/ironmansoftware/universal-dashboard/issues" -OpenInNewWindow }
                New-UDCollectionItem -Content {
                   New-UDIcon -Icon users -Size Large
                   " Chatroom" 
                } -SecondaryContent { New-UDLink -Icon users -Text ">" -Url "https://gitter.im/ironmansoftware" -OpenInNewWindow }    
                New-UDCollectionItem -Content {
                    New-UDIcon -Icon shopping_cart -Size Large
                    " Store" 
                 } -SecondaryContent { New-UDLink -Icon shopping_cart -Text ">" -Url "https://ironmansoftware.com/pricing" -OpenInNewWindow }    
                 New-UDCollectionItem -Content {
                    New-UDIcon -Icon github -Size Large
                    " Open Source" 
                 } -SecondaryContent { New-UDLink -Icon github -Text ">" -Url "https://github.com/ironmansoftware" -OpenInNewWindow }    
            }
        }
    }
}

$Dashboard = New-UDDashboard -Title "St. Louis PowerShell User Group - Universal Dashboard" -Pages @(
    $HomePage
    $About
    $Layout
    $Basic
    $Visualizations
    $CustomElements
    $DynamicInterfaces
    $MoreResources
) -EndpointInitializationScript {
    Import-Module UniversalDashboard.Sparklines
} #-LoginPage $LoginPage 

Start-UDDashboard -Dashboard $Dashboard -Port 999 -AutoReload -Endpoint $Endpoints -AllowHttpForLogin