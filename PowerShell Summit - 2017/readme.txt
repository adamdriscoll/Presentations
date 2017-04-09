Install
- Visual Studio 2015 Community (Ensure C++ tools are enabled)
- Git
- Visual Studio Code
- Windows SDK

Git clone --recurse https://github.com/adamdriscoll/powershell.git

Start-PSBootstrap
Start-PSBuild
Open VS Code 
Open the powershell folder in JS code
launch.json line 10 - Add .exe to end

Format-Hex
-----------------------
https://github.com/PowerShell/PowerShell/issues/3383
-----------------------
src/Microsoft.PowerShell.Commands.Utility/commands/utility/FormatAndOutput/format-hex/Format-Hex.cs

Write-Progress Updates
-----------------------
https://github.com/PowerShell/PowerShell/issues/2488
-----------------------
src/Microsoft.PowerShell.Commands.Utility/commands/utility/WriteProgressCmdlet.cs
src/Microsoft.PowerShell.ConsoleHost/host/msh/ProgressNode.cs
src/System.Management.Automation/engine/ProgressRecord.cs

https://github.com/PowerShell/PowerShell/blob/02b5f357a20e6dee9f8e60e3adb9025be3c94490/src/Microsoft.PowerShell.PSReadLine/ReadLine.cs#L892
https://github.com/PowerShell/PowerShell/blob/master/src/Microsoft.PowerShell.ConsoleHost/host/msh/ProgressPane.cs#L205

