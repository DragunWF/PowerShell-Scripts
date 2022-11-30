Write-Output "Welcome back, Great DragunWF of the Philippines.`n"

function Help-Profile() {
    $commands = "- Help-Profile`n- Run-Bot -botIndex`n- Switch-Dir -index"
    Write-Host "Commands:`n$commands`n"
}

function Start-Bot($location, $botName) {
    Write-Host "Running $botName Bot...`n"
    Set-Location $location
    npm start
}

function Switch-Dir($index) {
    switch ($index) {
        1 {
            Set-Location E:\DevStuff\Repositories
        }
        2 {
            Set-Location E:\DevStuff\Unity Projects
        }
    }
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
            <# Dragonbot doesn't use Node.js #>
            Write-Host "Running the good old Dragonbot...`n"
            Set-Location "E:\DevStuff\Repositories\Dragonbot"
            python main.py
            continue
        }
        default {
            Write-Host "The index $botIndex is invalid!"
        }
    }

    Set-Location = $previousDir
}

Help-Profile