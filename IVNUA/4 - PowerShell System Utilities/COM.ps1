#Create a new IE window 
$IE = New-Object -ComObject 'InternetExplorer.Application'

$IE.visible = $true
$IE.Navigate('http://www.google.com')

while($IE.Busy) { Start-Sleep -Milliseconds 100 }

$doc = $IE.Document
$textBox = $doc.getElementById("lst-ib") 
$googleSearchButton = $doc.getElementsByName('btnK') | Select -First 1

$textbox.value = 'Rick Roll'

Start-Sleep 1
$googleSearchButton.click()