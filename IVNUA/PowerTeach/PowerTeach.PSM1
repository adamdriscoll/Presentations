$TeacherCSFile = (Join-Path $PSScriptRoot 'TeacherConnectionString.txt')
$StudentCSFile = (Join-Path $PSScriptRoot 'StudentConnectionString.txt')
if ((Test-Path $TeacherCSFile))
{
    $Script:TeacherConnectionString = Get-Content $TeacherCSFile    
}

if ((Test-Path $StudentCSFile))
{
    $Script:StudentConnectionString = Get-Content $StudentCSFile    
}
 
function Send-ServiceBusMessage {
    param($ConnectionString, [string]$Message)

    $Client = [Microsoft.ServiceBus.Messaging.QueueClient]::CreateFromConnectionString($ConnectionString)
    $BrokeredMessage = new-object Microsoft.ServiceBus.Messaging.BrokeredMessage('Student Message')
    $BrokeredMessage.Properties.Add('Content', $Message.ToString())

    $Client.Send([Microsoft.ServiceBus.Messaging.BrokeredMessage]$BrokeredMessage)
    $Client.Close()
}

function Get-StudentScript {
    $Client = [Microsoft.ServiceBus.Messaging.QueueClient]::CreateFromConnectionString($Script:TeacherConnectionString)
    
    try
    {
        while($true)
        {
            $Message = $Client.Receive([TimeSpan]::FromSeconds(10))

            if ($Message -eq $Null)
            {
                return
            }

            $Json = $message.Properties['Content'] | ConvertFrom-Json

            $Script = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($Json.Content))
            $NewFIle = $PSIse.CurrentPowerShellTab.Files.Add()
            $NewFile.Editor.Text = $Script
        
            $message.Complete()
        }

    }
    catch 
    {
        $message.Abandon()
    }
    finally 
    {
        $Client.Close()
    }
}

function Send-ScriptToTeacher {
    $Content = $psISE.CurrentFile.Editor.Text
    $Content = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($Content))
    $MessageBody = [PSCustomObject]@{
        Content = $Content    
        Timestamp = (Get-Date)
        Author = $env:USERNAME
    } | ConvertTo-Json 

    Send-ServiceBusMessage -ConnectionString $Script:StudentConnectionString -Message $MessageBody
}

if (-not( $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus | where { $_.DisplayName -eq "PowerTeach" } ) )
{
    $commentsMenu = $psISE.CurrentPowerShellTab.AddOnsMenu.SubMenus.Add("PowerTeach",$null,$null)
    $null = $commentsMenu.Submenus.Add("Send current script to teacher", {Send-ScriptToTeacher}, "Ctrl+SHIFT+S")

    if (![String]::IsNullOrEmpty($Script:TeacherConnectionString))
    {
        $null = $commentsMenu.Submenus.Add("Receive student scripts", {Get-StudentScript}, "Ctrl+Alt+S")
    }
}
