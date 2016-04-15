## Start-Demo.ps1
##################################################################################################
## This is an overhaul of Jeffrey Snover's original Start-Demo script by Joel "Jaykul" Bennett
##
## I've switched it to using ReadKey instead of ReadLine (you don't have to hit Enter each time)
## As a result, I've changed the names and keys for a lot of the operations, so that they make 
## sense with only a single letter to tell them apart (sorry if you had them memorized).
##
## I've also been adding features as I come across needs for them, and you'll contribute your 
## improvements back to the PowerShell Script repository as well.
##################################################################################################
## Revision History (version 3.3)
## 3.3.3 Fixed:    Script no longer says "unrecognized key" when you hit shift or ctrl, etc.
##       Fixed:    Blank lines in script were showing as errors (now printed like comments)
## 3.3.2 Fixed:    Changed the "x" to match the "a" in the help text
## 3.3.1 Fixed:    Added a missing bracket in the script
## 3.3 - Added:    Added a "Clear Screen" option
##     - Added:    Added a "Rewind" function (which I'm not using much)
## 3.2 - Fixed:    Put back the trap { continue; }
## 3.1 - Fixed:    No Output when invoking Get-Member (and other cmdlets like it???)
## 3.0 - Fixed:    Commands which set a variable, like: $files = ls
##     - Fixed:    Default action doesn't continue
##     - Changed:  Use ReadKey instead of ReadLine
##     - Changed:  Modified the option prompts (sorry if you had them memorized)
##     - Changed:  Various time and duration strings have better formatting
##     - Enhance:  Colors are settable: prompt, command, comment
##     - Added:    NoPauseAfterExecute switch removes the extra pause
##                 If you set this, the next command will be displayed immediately
##     - Added:    Auto Execute mode (FullAuto switch) runs the rest of the script
##                 at an automatic speed set by the AutoSpeed parameter (or manually)
##     - Added:    Automatically append an empty line to the end of the demo script
##                 so you have a chance to "go back" after the last line of you demo
##################################################################################################
##
param(
  $file=".\demo.txt", 
  [int]$command=0, 
  [System.ConsoleColor]$promptColor="Yellow", 
  [System.ConsoleColor]$commandColor="White", 
  [System.ConsoleColor]$commentColor="Green", 
  [switch]$FullAuto,
  [int]$AutoSpeed = 3,
  [switch]$NoPauseAfterExecute
)

$RawUI = $Host.UI.RawUI
$hostWidth = $RawUI.BufferSize.Width

# A function for reading in a character 
function Read-Char() {
  $_OldColor = $RawUI.ForeGroundColor
  $RawUI.ForeGroundColor = "Red"
  $inChar=$RawUI.ReadKey("IncludeKeyUp")
  # loop until they press a character, so Shift or Ctrl, etc don't terminate us
  while($inChar.Character -eq 0){
    $inChar=$RawUI.ReadKey("IncludeKeyUp")
  }
  $RawUI.ForeGroundColor = $_OldColor
  return $inChar.Character
}

function Rewind($lines, $index, $steps = 1) {
   $started = $index;
   $index -= $steps;
   while(($index -ge 0) -and ($lines[$index].Trim(" `t").StartsWith("#"))){
      $index--
   }
   if( $index -lt 0 ) { $index = $started }
   return $index
}

$file = Resolve-Path $file
while(-not(Test-Path $file)) {
  $file = Read-Host "Please enter the path of your demo script (Crtl+C to cancel)"
  $file = Resolve-Path $file
}

Clear-Host

$_lines = Get-Content $file
# Append an extra (do nothing) line on the end so we can still go back after the last line.
$_lines += "Write-Host 'The End'"
$_starttime = [DateTime]::now
$FullAuto = $false

Write-Host -nonew -back black -fore $promptColor $(" " * $hostWidth)
Write-Host -nonew -back black -fore $promptColor @"
<Demo Started :: $(split-path $file -leaf)>$(' ' * ($hostWidth -(18 + $(split-path $file -leaf).Length)))
"@
Write-Host -nonew -back black -fore $promptColor "Press"
Write-Host -nonew -back black -fore Red " ? "
Write-Host -nonew -back black -fore $promptColor "for help.$(' ' * ($hostWidth -17))"
Write-Host -nonew -back black -fore $promptColor $(" " * $hostWidth)

# We use a FOR and an INDEX ($_i) instead of a FOREACH because
# it is possible to start at a different location and/or jump 
# around in the order.
for ($_i = $Command; $_i -lt $_lines.count; $_i++)
{  
	# Put the current command in the Window Title along with the demo duration
	$Dur = [DateTime]::Now - $_StartTime
   $RawUI.WindowTitle = "$(if($dur.Hours -gt 0){'{0}h '})$(if($dur.Minutes -gt 0){'{1}m '}){2}s   {3}" -f 
                        $dur.Hours, $dur.Minutes, $dur.Seconds, $($_Lines[$_i])

	# Echo out the commmand to the console with a prompt as though it were real
	Write-Host -nonew -fore $promptColor "[$_i]$([char]0x2265) "
	if ($_lines[$_i].Trim(" ").StartsWith("#") -or $_lines[$_i].Trim(" ").Length -le 0) { 
		Write-Host -fore $commentColor "$($_Lines[$_i])  "
		continue 
	} else {
		Write-Host -nonew -fore $commandColor "$($_Lines[$_i])  "
	}

	if( $FullAuto ) { Start-Sleep $autoSpeed; $ch = [char]13 } else { $ch = Read-Char }
	switch($ch)
	{
		"?" {
			Write-Host -Fore $promptColor @"

Running demo: $file
(n) Next       (p) Previous
(q) Quit       (s) Suspend 
(t) Timecheck  (v) View $(split-path $file -leaf)
(g) Go to line by number
(f) Find lines by string
(a) Auto Execute mode
(c) Clear Screen
"@
			$_i-- # back a line, we're gonna step forward when we loop
		}
		"n" { # Next (do nothing)
			Write-Host -Fore $promptColor "<Skipping Line>"
		}
		"p" { # Previous
			Write-Host -Fore $promptColor "<Back one Line>"
			while ($_lines[--$_i].Trim(" ").StartsWith("#")){}
			$_i-- # back a line, we're gonna step forward when we loop
		}
		"a" { # EXECUTE (Go Faster)
			$AutoSpeed = [int](Read-Host "Pause (seconds)")
			$FullAuto = $true;
			Write-Host -Fore $promptColor "<eXecute Remaining Lines>"
			$_i-- # Repeat this line, and then just blow through the rest
		}
		"q" { # Quit
			Write-Host -Fore $promptColor "<Quiting demo>"
			$_i = $_lines.count;
			break;
		}
		"v" { # View Source
			$lines[0..($_i-1)] | Write-Host -Fore Yellow 
			$lines[$_i]        | Write-Host -Fore Green
			$lines[($_i+1)..$lines.Count] | Write-Host -Fore Yellow 
			$_i-- # back a line, we're gonna step forward when we loop
		}
		"t" { # Time Check
			 $dur = [DateTime]::Now - $_StartTime
       Write-Host -Fore $promptColor $(
          "{3} -- $(if($dur.Hours -gt 0){'{0}h '})$(if($dur.Minutes -gt 0){'{1}m '}){2}s" -f 
          $dur.Hours, $dur.Minutes, $dur.Seconds, ([DateTime]::Now.ToShortTimeString()))
			 $_i-- # back a line, we're gonna step forward when we loop
		}
		"s" { # Suspend (Enter Nested Prompt)
			Write-Host -Fore $promptColor "<Suspending demo - type 'Exit' to resume>"
			$Host.EnterNestedPrompt()
			$_i-- # back a line, we're gonna step forward when we loop
		}
		"g" { # GoTo Line Number
			$i = [int](Read-Host "line number")
			if($i -le $_lines.Count) {
				if($i -gt 0) {
               # extra line back because we're gonna step forward when we loop
               $_i = Rewind $_lines $_i (($_i-$i)+1)
				} else {
					$_i = -1 # Start negative, because we step forward when we loop
				}
			}
		}
		"f" { # Find by pattern
			$match = $_lines | Select-String (Read-Host "search string")
			if($match -eq $null) {
				Write-Host -Fore Red "Can't find a matching line"
			} else {
				$match | % { Write-Host -Fore $promptColor $("[{0,2}] {1}" -f ($_.LineNumber - 1), $_.Line) }
				if($match.Count -lt 1) {
					$_i = $match.lineNumber - 2  # back a line, we're gonna step forward when we loop
				} else {               
					$_i-- # back a line, we're gonna step forward when we loop
				}
			}
		}
      "c" { 
         Clear-Host
         $_i-- # back a line, we're gonna step forward when we loop
      }
		"$([char]13)" { # on enter
			Write-Host
			trap [System.Exception] {Write-Error $_; continue;}
			Invoke-Expression ($_lines[$_i]) | out-default
			if(-not $NoPauseAfterExecute -and -not $FullAuto) { 
				$null = $RawUI.ReadKey("NoEcho,IncludeKeyUp")  # Pause after output for no apparent reason... ;)
			}
		}
		default
		{
			Write-Host -Fore Green "`nKey not recognized.  Press ? for help, or ENTER to execute the command."
			$_i-- # back a line, we're gonna step forward when we loop
		}
	}
}
$dur = [DateTime]::Now - $_StartTime
Write-Host -Fore $promptColor $(
   "<Demo Complete -- $(if($dur.Hours -gt 0){'{0}h '})$(if($dur.Minutes -gt 0){'{1}m '}){2}s>" -f 
   $dur.Hours, $dur.Minutes, $dur.Seconds, [DateTime]::Now.ToLongTimeString())
Write-Host -Fore $promptColor $([DateTime]::now)
Write-Host
# SIG # Begin signature block
# MIIIPgYJKoZIhvcNAQcCoIIILzCCCCsCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUhnYBsMQ+7cZlmxCQp6UPJj6A
# u0GgggVbMIIFVzCCBD+gAwIBAgIRAO2rPg5HUjL4ofGGpnMP2jwwDQYJKoZIhvcN
# AQEFBQAwgZUxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2Fs
# dCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8G
# A1UECxMYaHR0cDovL3d3dy51c2VydHJ1c3QuY29tMR0wGwYDVQQDExRVVE4tVVNF
# UkZpcnN0LU9iamVjdDAeFw0wODEwMDYwMDAwMDBaFw0wOTEwMDYyMzU5NTlaMIHE
# MQswCQYDVQQGEwJVUzEOMAwGA1UEEQwFMTQ2MjMxETAPBgNVBAgMCE5ldyBZb3Jr
# MRIwEAYDVQQHDAlSb2NoZXN0ZXIxFDASBgNVBAkMC01TIDA4MDEtMTdBMRowGAYD
# VQQJDBExMzUwIEplZmZlcnNvbiBSZDEaMBgGA1UECgwRWGVyb3ggQ29ycG9yYXRp
# b24xFDASBgNVBAsMC1NFRURVIFRvb2xzMRowGAYDVQQDDBFYZXJveCBDb3Jwb3Jh
# dGlvbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK50RXT2KUvECfWZ
# weqeXzTCykPPRh9nC3Hzur/mmvkQHA8iinnSKX4j19C1/MV0rAEeCU1bF7Sgxvov
# ORreM1Ye/wEqJLAUP/IGZI/qsmmwasGFGbnuevpA3WieNCr5cFGl8Y5Mx6ejaDFi
# O0GT9EM6gOGZaEEMRbHZc4qXT7CrWScs4Yur5bBZsowaMk5JkvZgihhnN93QolEW
# ObmtQZlbBDqLuoL9fUnIexlqqIrC/4h0K8VM26HvqhgGlQF2wf4t9xCHFJiX2F7D
# B10lef5aXzyPVrvxxrRWyBtCQuL7xdXneRanJaYG3B3kclc+4/6dq9a+s/huXjmE
# omumgGcCAwEAAaOCAW8wggFrMB8GA1UdIwQYMBaAFNrtZHQUnBQ8q92Zqb1bKE2L
# PMnYMB0GA1UdDgQWBBT5ITlG5CdiD+nI0uTqnXNGnd44QjAOBgNVHQ8BAf8EBAMC
# B4AwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDAzARBglghkgBhvhC
# AQEEBAMCBBAwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwIwKzApBggrBgEFBQcC
# ARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwQgYDVR0fBDswOTA3oDWg
# M4YxaHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VUTi1VU0VSRmlyc3QtT2JqZWN0
# LmNybDA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNv
# bW9kb2NhLmNvbTAhBgNVHREEGjAYgRZKb2VsLkJlbm5ldHRAWGVyb3guY29tMA0G
# CSqGSIb3DQEBBQUAA4IBAQAZxnV+BbJBohpy+wKs6U8hRiPUhDYaijzTyrZontf5
# PEyBbhAkJFIWauIaq9eSQEJeErXO/zuO6+wY/azBzOTleMM9qdGWHFtfAw5WiIuC
# 90TzDBSuP7LImZV5Pb6nxRbesDF2U7EM5sBzYSWAMfpBmYRz97EHPW5QNzpBLFJn
# Dhb/M27rDYh7FVjy1+C5E3glIa0A0q+lcxEtFuUij4JId+oMcfpSgYJZvR1Kvkjd
# GDAtWCzvALaNFd65kChbrOqcClOCacQRnP9N4DJl/RVNKZtcUcVAyTpvOlJBA5vG
# OVcsJT4TnSMjPX6d5pXMwcE1oWCUWvK99W+N81DvBBuZMYICTTCCAkkCAQEwgasw
# gZUxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2FsdCBMYWtl
# IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMY
# aHR0cDovL3d3dy51c2VydHJ1c3QuY29tMR0wGwYDVQQDExRVVE4tVVNFUkZpcnN0
# LU9iamVjdAIRAO2rPg5HUjL4ofGGpnMP2jwwCQYFKw4DAhoFAKB4MBgGCisGAQQB
# gjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYK
# KwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFNEM/yDz
# vLFTxZZERqngy81y1rFyMA0GCSqGSIb3DQEBAQUABIIBAIi+6WT4dPUfVZyJ1Efd
# DzTqYmH2wmcGg8KncjeA2vi+F3+9EPDIMRUSNxDO+l/iAel4uiNE3CNlZDiCfi4v
# W+nc1TTpen1q33ITFLgFaUvMztgJ1D02NsEIAsGX0Qu9FHYXXGkdx6HiTyy5lfl2
# sLvmQiINVfHJnn28YhSqpEByebojR6177/VhDqk7h9vvhMhuBP+XWlzO+nwaZ84T
# BcS8Qb/JkKxkhKYhbsfViQX0Rq4/5MjhjR7ctEJvCfkb0dkY97sHddg4kWGy5amI
# ydV6EoqjHHUJatdgmCc38KIQVdXvaZyC5rTRg/uEJias4BQq3HLdUQDJ+u5l0EeY
# MbI=
# SIG # End signature block