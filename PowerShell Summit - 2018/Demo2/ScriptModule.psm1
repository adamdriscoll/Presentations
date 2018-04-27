function Get-OSSpecificItem {

    if ($PSEdition -eq "Desktop") {
        $IsWindows = $true
    }

    if ($IsLinux) {
        "Running on Linux"
    } elseif ($IsMacOS) {
        "Running on MacOS"
    } elseif ($IsWindows) {
        "Running on Windows"
    }
}