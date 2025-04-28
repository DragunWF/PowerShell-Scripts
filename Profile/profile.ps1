# Initialize oh-my-posh theme
oh-my-posh init pwsh --config 'E:\DevStuff\Repositories\PowerShell-Scripts\Config\dragunwf.json' | Invoke-Expression

# Welcome Message
Write-Output "Welcome back, Great DragunWF of the Philippines.`n"

$global:shutdown_started = $false

# Data Configuration
$global:config = @{
    Commands  = @(
        "Help-Profile", 
        "Organize", 
        "Open -location", 
        "Run-Bot -botName", 
        "Dev -location", 
        "Backup-Mh-Rise", 
        "Get-Storage-Status",
        "shutdown-start -minutes",
        "shutdown-cancel"
    )
    Locations = @{
        "repo"       = "E:\DevStuff\Repositories"
        "unity"      = "E:\DevStuff\Unity Projects"
        "smartstudy" = "E:\DevStuff\Repositories\SmartStudy"
        "smartstudy-backend" = "E:\DevStuff\Repositories\SmartStudy\SmartStudy-Django-Backend"
        "curvera" = "E:\DevStuff\Repositories\Curvera-System"
    }
    Bots      = @{
        "dragunbot"  = @{ Path = "E:\DevStuff\Repositories\DragunBot"; Cmd = { python bot\main.py } }
        "dragonbot"  = @{ Path = "E:\DevStuff\Repositories\Dragonbot"; Cmd = { python main.py } }
        "ancalagon"  = @{ Path = "E:\DevStuff\Repositories\Ancalagon"; Cmd = { npm start } }
        "scarlet"    = @{ Path = "E:\DevStuff\Repositories\Scarlet"; Cmd = { npm start } }
    }
}

# Function Definitions

function Help-Profile {
    Write-Host "Commands:"
    foreach ($command in $global:config.Commands) {
        Write-Host "- $command"
    }

    Write-Host "`nLocations:"
    foreach ($location in $global:config.Locations.Keys) {
        Write-Host "- $location"
    }

    Write-Host "`nBots:"
    foreach ($botName in $global:config.Bots.Keys) {
        Write-Host "- $botName"
    }
    Write-Host ""
}

function Dev($devLocation) {
    if ($global:config.Locations.ContainsKey($devLocation)) {
        Set-Location $global:config.Locations[$devLocation]
    } else {
        Write-Host "Developer location '$devLocation' not recognized!`n"
    }
}

function Organize {
    python "E:\DevStuff\Repositories\ShadowPlay-Organizer\src\main.py" "E:\Videos\NVIDIA GeForce\NVIDIA Shadowplay"
}

function Backup-Mh-Rise {
    python "E:\DevStuff\Repositories\mini-scripts\scripts\games\mh-rise\backup_save_files.py"
}

function Open($argument) {
    try {
        start $argument
    } catch {
        Write-Host "Failed to open: $argument"
    }
}

function Run-Bot($botName) {
    if ($global:config.Bots.ContainsKey($botName)) {
        $bot = $global:config.Bots[$botName]
        Write-Host "Running `"$botName`" Bot...`n"
        Set-Location $bot.Path
        & $bot.Cmd
    } else {
        Write-Host "The bot '$botName' is not recognized!`n"
    }
}

function Get-Storage-Status() {
    E:\DevStuff\Repositories\PowerShell-Scripts\Misc\get_storage_status.ps1
}

function shutdown-start($minutes) {
    if ($null -eq $minutes -or $minutes -eq "") {
        Write-Host "Error: No time specified. Please provide minutes as an argument to the parameter."
        return
    }
    
    try {
        $minutesInt = [int]$minutes
    }
    catch {
        Write-Host "Error: Invalid input. Please provide a valid number."
        return
    }
    
    if ($minutesInt -lt 0) {
        Write-Host "Error: Cannot schedule shutdown with negative time. Please provide a positive number of minutes."
        return
    }
    
    shutdown /s /t ($minutesInt * 60)
    if (!$global:shutdown_started) {
        $global:shutdown_started = $true
        $shutdownTime = (Get-Date).AddMinutes($minutesInt)
        $formattedTime = $shutdownTime.ToString("h:mm tt")
        Write-Host "Your computer will shutdown in $minutesInt minute(s) at $formattedTime"
    }
}

function shutdown-cancel() {
    shutdown /a
    if ($global:shutdown_started) {
        $global:shutdown_started = $false
        Write-Host "Computer shutdown has been cancelled!"
    }
}

# Run Help on Load
Help-Profile
