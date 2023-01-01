Write-Output "Welcome back, Great DragunWF of the Philippines.`n"

function Help-Profile() {
    $commands = "- Help-Profile`n- Run-Bot -botName`n- Dev -location"
    Write-Host "Commands:`n$commands`n"
}

function Start-Bot($location, $botName) {
    Write-Host "Running $botName Bot...`n"
    Set-Location $location
    npm start
}

function Dev($devLocation) {
    if ($devLocation -eq "repo" -or $devLocation -eq "repositories" -or $devLocation -eq "repository") {
        Set-Location "E:\DevStuff\Repositories"
    }
    elseif ($devLocation -eq "unity" -or $devLocation -eq "game" -or $devLocation -eq "gamedev") {
        Set-Location "E:\DevStuff\Unity Projects"
    }
    else {
        Write-Host "Developer location not recognized!`n"
    }
}

function Backup-mh() { <# Backup Monster Hunter Rise save files #>
    python E:\DevStuff\Repositories\mini-scripts\scripts\games\mh-rise\backup_save_files.py
}

function Run-Bot($botName) {
    switch ($botName) {
        "ancalagon" {
            Start-Bot -location "E:\DevStuff\Repositories\Ancalagon" -botName "Ancalagon"
            continue
        }
        "scarlet" {
            Start-Bot -location "E:\DevStuff\Repositories\Scarlet" -botName "Scarlet"
            continue
        }
        "dragonbot" {
            <# Dragonbot doesn't use Node.js #>
            Write-Host "Running the good old Dragonbot...`n"
            Set-Location "E:\DevStuff\Repositories\Dragonbot"
            python main.py
            continue
        }
        default {
            Write-Host "The bot $botName is not recogized!`n"
        }
    }
}

Help-Profile