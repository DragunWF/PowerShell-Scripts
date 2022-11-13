Write-Output "Welcome back, Great DragunWF of the Philippines.`n"
Set-Location E:\DevStuff\Repositories

function Start-Bot($location, $botName) {
    Write-Host "Running $botName Bot...`n"
    Set-Location $location
    npm start
}

function Run-Bot($botIndex) {
    $previousDir = Get-Location

    if (1 -eq $botIndex) {
        Start-Bot -location "E:\DevStuff\Repositories\Ancalagon" -botName "Ancalagon"
    }
    if (2 -eq $botIndex) {
        Start-Bot -location "E:\DevStuff\Repositories\Scarlet" -botName "Scarlet"
    }
    if (3 -eq $botIndex) {
        Start-Bot -location "E:\DevStuff\Repositories\Dragonbot" -botName "Dragon"
    }

    Set-Location = $previousDir
}