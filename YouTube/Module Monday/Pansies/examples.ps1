# New-Text
New-Text 'Hello, World!' -ForegroundColor red -BackgroundColor white

# https://www.w3schools.com/charsets/ref_html_entities_4.asp
New-Text '&hearts;' -ForegroundColor '#cccfff' -BackgroundColor '#222ccc'

# https://jonasjacek.github.io/colors/
New-Text '&spades;' -ForegroundColor 'xt5' -BackgroundColor 'Green'

# Write-Host
Write-Host "Hello, World! &clubs;" -BackgroundColor "#ccc333" -ForegroundColor "#555fff"
Write-Host "Hello, World! $(New-Text '&hearts;' -ForegroundColor red -BackgroundColor white);" -BackgroundColor "#ccc333" -ForegroundColor "#555fff"

Get-Gradient red blue
Get-Gradient red blue -Flatten | ForEach-Object { Write-Host " " -BackgroundColor $_ -NoNewline}
Get-Gradient red blue -Flatten -Width 20 | ForEach-Object { Write-Host " " -BackgroundColor $_ -NoNewline}

Get-Complement Cyan


[PoshCode.Pansies.RgbColor]::ColorMode = [PoshCode.Pansies.ColorMode]::ConsoleColor
Get-Gradient red blue -Flatten | ForEach-Object { Write-Host " " -BackgroundColor $_ -NoNewline}
[PoshCode.Pansies.RgbColor]::ColorMode = [PoshCode.Pansies.ColorMode]::Automatic
Get-Gradient red blue -Flatten | ForEach-Object { Write-Host " " -BackgroundColor $_ -NoNewline}

#Provider
"I ${fg:red}LOVE${fg:clear} PS"