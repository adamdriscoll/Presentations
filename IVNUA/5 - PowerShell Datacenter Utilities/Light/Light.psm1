enum Ensure
{
   Absent
   Present
}
 
[DscResource()]
class Light
{
   [DscProperty(Key)]
   [string]$Name
 
   $State

   [string]$url
 
   #Use of enumeration
   [Ensure] $Ensure
 
   #Set function similar to Set-TargetResource
   [void] Set()
   {
      Invoke-WebRequest "http://$this.Url/rest/items/$($this.Name)" -Method Post -Body $this.State -ContentType 'text/plain'
   }
 
   #Test function similar to Test-TargetResource
   [bool] Test()
   {
      return $this.Get().State -eq $this.State
   }
 
   #Get function similar to Get-TargetResource
   [Light] Get()
   {
      $LightState = Invoke-WebRequest "http://$this.Url/rest/items/$($this.Name)" -Method Get -ContentType 'text/plain'
      $Light = [light]::new()
      $Light.Name = $this.Name
      $Light.State = $LightState
      return $Light
   }
}
