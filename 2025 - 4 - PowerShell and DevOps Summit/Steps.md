Create Azure Web App
- New Resource Group
- Linux
- West US Region
- Docker Container -> ironmansoftware/universal:latest

Show PSU up and running in azure after deployment
Set admin creds and login

In Azure portal, setup app registration.
Copy URL for PSU Web App
Entra ID -> App Registrations -> New Registration
Authentication -> Add Redirect URL <url>/auth

Create Tenant URL Variable ($TenantUrl)

 https://login.microsoftonline.com/xxxxxxxxx

Create PSU App URL variable ($WebAppUrl)
Grab client ID and create variable in PSU ($ClientId)
Create Client Secret and Copy value ($ClientSecret)

Create Onboarding app.
Add code for a new button and authorization
Talk about the segments of the URL, redirect etc. 

```powershell
New-UDApp -Content { 
            New-UDButton -OnClick {
                $State = Get-Random
                $Scopes = "offline_access%20user.readwrite.all" 
                $RedirectUri = $WebAppUrl + "/auth"
                $RedirectUri = [System.Web.HttpUtility]::UrlEncode($RedirectUri)
                Invoke-UDRedirect -Url "$TenantUrl/oauth2/v2.0/authorize?client_id=$ClientId&redirect_url=$RedirectUri&response_mode=query&response_type=code&scope=$Scopes&state=$($State)&prompt=consent" -OpenInNewWindow
            } -Text "Authenticate" -Icon (New-UDIcon -Icon 'Lock') -ShowLoading
    }
```

Show the app with the button and click the Authorize to see the login

In PSU, navigate to endpoints and talk about HTTP endpoints
Create /auth endpoint

```powershell
$Result = Invoke-RestMethod -Method "POST" -Uri "$TenantUrl/oauth2/v2.0/token" -Body @{
    client_id = $ClientId
    code = $code
    scope = 'user.readwrite.all'
    grant_type = 'authorization_code'
    client_secret = $Secret:ClientSecret
}

$Expiration = [DateTime]::Now.AddSeconds($Result.expires_in)

Set-PSUCache -Key $UserName -Value $Result.access_token -AbsoluteExpiration $Expiration

"Authenticated! You can close this window"
```

Navigate back to web app and client authentication button
Show login and redirect back to app
Add code for loading experience

```powershell
New-UDApp -Content { 
    New-UDDynamic -Id 'content' -Content {
        $Session:Code = Get-PSUCache -Key $User

        if (-not $Session:Code)
        {
            New-UDButton -OnClick {
                $State = Get-Random
                $Scopes = "offline_access%20user.readwrite.all" 
                $RedirectUri = $WebAppUrl + "/auth"
                $RedirectUri = [System.Web.HttpUtility]::UrlEncode($RedirectUri)
                Invoke-UDRedirect -Url "$TenantUrl/oauth2/v2.0/authorize?client_id=$ClientId&redirect_url=$RedirectUri&response_mode=query&response_type=code&scope=$Scopes&state=$($State)&prompt=consent" -OpenInNewWindow

                do {
                    $Session:Code = Get-PSUCache -Key $User
                    Start-Sleep -Seconds 1
                } while(-not $Session:Code)

		        Sync-UDElement -Id 'content'

            } -Text "Authenticate" -Icon (New-UDIcon -Icon 'Lock') -ShowLoading
        }
        elseif($Session:Code)
        {
		New-UDAlert -Title "Authenticated!"
        }
    }
}
```

Clear the PSU cache in admin terminal Remove-PSUCache -Key 'admin'
Redo the login experience
Create new script for generating user password (New-OBPassword.ps1)

```powershell
    param (
        [int]$length = 12
    )

    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()'
    $password = -join ((1..$length) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
    return $password
```

Create new script for generating using (New-OBUser.ps1)

```powershell
param(
    $UserName,
    $MailNickname,
    $DisplayName
)

Write-Progress -Activity "Authenticating with Graph..."

$Code = Get-PSUCache -Key $UAJob.Identity.Name

Connect-MgGraph -AccessToken ($Code | ConvertTo-SecureString -AsPlainText) -NoWelcome
$PasswordProfile = @{
  Password = & "$PSScriptRoot\New-OBPassword.ps1"
}

Write-Progress -Activity "Creating user..."

$MgUser = New-MgUser -DisplayName $DisplayName -PasswordProfile $PasswordProfile -AccountEnabled -MailNickName $MailNickname -UserPrincipalName $UserName
[PSCustomObject]@{
    TempPassword = $PasswordProfile.Password
    UserName = $UserName
}
```

Update web app to call script.

```powershell
New-UDCard -Content {
    New-UDForm -Children {
        New-UDTextbox -Id 'UserName' -Label 'User Name' -FullWidth
        New-UDTextbox -Id 'DisplayName' -Label 'Display Name' -FullWidth
        New-UDTextbox -Id 'MailNickname' -Label 'Mail Nickname' -FullWidth
    } -OnSubmit {
        Show-UDSnackbar -Message "Creating $($EventData.DisplayName)"

        $MgUser = Invoke-PSUScript -Name 'New-OBUser.ps1' -Parameters @{
            UserName = $EventData.UserName
            DisplayName = $EventData.DisplayName
            MailNickname = $EventData.MailNickname
        } -Wait

        if ($MgUser)
        {
            Show-UDSnackbar -Message "Created $($MgUser.UserName)" -Variant success
            New-UDCard -Content {
                New-UDList -Children {
                    New-UDListItem -Label "User Name $($MgUser.UserName)"
                    New-UDListItem -Label "Temporary Password: $($MgUser.TempPassword)"
                }
            }
        }
    } -SubmitText 'Create User' 
} -Title 'New User' 
```

Show creating user
Show job history after script is run
Create Get-OBUser.ps1

```powershell
$Code = Get-PSUCache -Key $UAJob.Identity.Name

Connect-MgGraph -AccessToken ($Code | ConvertTo-SecureString -AsPlainText) -NoWelcome
Get-MgUser -All | Where-Object DisplayName -match 'PSU' | Select-Object DisplayName, UserPrincipalName
```

Create reporting app

## Full app code

```powershell
New-UDApp -Content { 
    New-UDDynamic -Id 'content' -Content {
        $Session:Code = Get-PSUCache -Key $User

        if (-not $Session:Code)
        {
            New-UDButton -OnClick {
                $State = Get-Random
                $Scopes = "offline_access%20user.readwrite.all" 
                $RedirectUri = $WebAppUrl + "/auth"
                $RedirectUri = [System.Web.HttpUtility]::UrlEncode($RedirectUri)
                Invoke-UDRedirect -Url "$TenantUrl/oauth2/v2.0/authorize?client_id=$ClientId&redirect_url=$RedirectUri&response_mode=query&response_type=code&scope=$Scopes&state=$($State)&prompt=consent" -OpenInNewWindow

                do {
                    $Session:Code = Get-PSUCache -Key $User
                    Start-Sleep -Seconds 1
                } while(-not $Session:Code)

		        Sync-UDElement -Id 'content'

            } -Text "Authenticate" -Icon (New-UDIcon -Icon 'Lock') -ShowLoading
        }
        elseif($Session:Code)
        {
            New-UDCard -Content {
                New-UDForm -Children {
                    New-UDTextbox -Id 'UserName' -Label 'User Name' -FullWidth
                    New-UDTextbox -Id 'DisplayName' -Label 'Display Name' -FullWidth
                    New-UDTextbox -Id 'MailNickname' -Label 'Mail Nickname' -FullWidth
                } -OnSubmit {
                    Show-UDSnackbar -Message "Creating $($EventData.DisplayName)"

                    $MgUser = Invoke-PSUScript -Name 'New-OBUser.ps1' -Parameters @{
                        UserName = $EventData.UserName
                        DisplayName = $EventData.DisplayName
                        MailNickname = $EventData.MailNickname
                    } -Wait

                    if ($MgUser)
                    {
                        Show-UDSnackbar -Message "Created $($MgUser.UserName)" -Variant success
                        New-UDCard -Content {
                            New-UDList -Children {
                                New-UDListItem -Label "User Name $($MgUser.UserName)"
                                New-UDListItem -Label "Temporary Password: $($MgUser.TempPassword)"
                            }
                        }
                    }
                } -SubmitText 'Create User' 
            } -Title 'New User' 

            New-UDDynamic -Id 'form' -Content {
                $Users = Invoke-PSUScript -Name "Get-OBUser.ps1" -Wait 
                New-UDTable -Data $Users
            } -LoadingComponent {
                New-UDElement -Tag 'div' -Content {
                    New-UDProgress -Circular -Label "Loading users..." 
                } -Attributes @{
                    style = @{
                        width = "500px"
                    }
                }
                
            } 
        }
    }
}
```

Demonstrate that our users have been created
Show off portal
