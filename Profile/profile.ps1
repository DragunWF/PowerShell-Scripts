# Welcome Message
Write-Output "Welcome back, Great DragunWF of the Philippines.`n"

# Data Configuration
$global:config = @{
    Commands  = @("Help-Profile", "Organize", "Open -location", "Run-Bot -botName", "Dev -location", "Backup-Mh-Rise")
    Locations = @{
        "repo"       = "E:\DevStuff\Repositories"
        "unity"      = "E:\DevStuff\Unity Projects"
        "smartstudy" = "E:\DevStuff\Repositories\SmartStudy"
        "smartstudy-backend" = "E:\DevStuff\Repositories\SmartStudy\SmartStudy-Django-Backend"
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

# Run Help on Load
Help-Profile
