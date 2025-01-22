# Retrieve all local drives (DriveType = 3)
$Drives = Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3"

function Get-Storage-Status() {
    Write-Output "`nYour Computer's Storage Status:"

    # Iterate through each drive
    foreach ($Drive in $Drives) {
        # Calculate total size and free space in GB, rounding to nearest whole number
        $DriveSize = [math]::Round($Drive.Size / 1GB)
        $FreeSpace = [math]::Round($Drive.FreeSpace / 1GB)

        # Output the results for each drive
        Write-Output "$($Drive.DeviceID) Total Size: $DriveSize GB | Free Space: $FreeSpace GB"
    }

    Write-Output ""
}

Get-Storage-Status