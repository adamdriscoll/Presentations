$ScriptRoot = Split-Path $PSISE.CurrentFile.FullPath

#Import CSV data 
$Items = Import-CSV (Join-Path $ScriptRoot NYC_Social_Media_Usage.csv)
$Items | Get-Member
$Items | Format-Table Agency, Platform, Likes

$Items | Where Platform -eq 'Facebook' | Export-Csv .\NYC_Facebook_Usage.csv

.\NYC_Facebook_Usage.csv

#Xml 
$LotteryWinners = [Xml](Get-Content (Join-Path $ScriptRoot LotteryWinners.xml))
$LotteryWinners.response.row.row

#JSON
$BritishLibrary = Get-Content (Join-Path $ScriptRoot BritishLibrary.json) | ConvertFrom-Json
$BritishLibrary.record | Select dcterms:title

