Write-Output "Welcome back, Great DragunWF of the Philippines.`n"
Set-Location E:\DevStuff\Repositories

function Help-Profile() {
    $commands = "  Help-Profile`n  Run-Bot -botIndex"
    Write-Host "Commands:`n$commands`n"
}

function Start-Bot($location, $botName) {
    Write-Host "Running $botName Bot...`n"
    Set-Location $location
    npm start
}

function Run-Bot($botIndex) {
    $previousDir = Get-Location

    switch ($botIndex) {
        1 {
            Start-Bot -location "E:\DevStuff\Repositories\Ancalagon" -botName "Ancalagon"
            continue
        }
        2 {
            Start-Bot -location "E:\DevStuff\Repositories\Scarlet" -botName "Scarlet"
            continue
        }
        3 {
            Start-Bot -location "E:\DevStuff\Repositories\Dragonbot" -botName "Dragon"
            continue
        }
        default {
            Write-Host "The index $botIndex is invalid!"
        }
    }

    Set-Location = $previousDir
}

Help-Profile