function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-FromChocolatey {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName
    )

    choco install $PackageName --yes
}

function Install-PowerShellModule {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $ModuleName,

        [ScriptBlock]
        [Parameter(Mandatory = $true)]
        $PostInstall = {}
    )

    if (!(Get-Command -Name $ModuleName -ErrorAction SilentlyContinue)) {
        Write-Host "Installing $ModuleName"
        Install-Module -Module $ModuleName -Scope CurrentUser -Confirm $true
        Import-Module $ModuleName -Confirm

        Invoke-Command -ScriptBlock $PostInstall
    } else {
        Write-Host "$ModuleName was already installed, skipping"
    }
}

Install-Chocolatey

Install-FromChocolatey 'git'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/system-init/main/common/.gitconfig' -OutFile (Join-Path $env:USERPROFILE '.gitconfig')

Install-FromChocolatey 'vscode'
Install-FromChocolatey '7zip'
Install-FromChocolatey 'autohotkey'
# https://github.com/darkato42/Capslock/tree/master/win
$chocoToolsPath = ([System.Environment]::GetEnvironmentVariables('User')).ChocolateyToolsLocation
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/Capslock/master/win/CapsLock.ahk' -OutFile (Join-Path $chocoToolsPath 'CapsLock.ahk')

Install-FromChocolatey 'greenshot'
Install-FromChocolatey 'dotnetcore-sdk'
Install-FromChocolatey 'microsoft-windows-terminal'
Install-FromChocolatey 'fiddler'
Install-FromChocolatey 'postman'
Install-FromChocolatey 'powershell-core'

Install-FromChocolatey 'poshgit'
Install-FromChocolatey 'oh-my-posh'
Install-FromChocolatey 'nvm'

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/system-init/main/windows/Microsoft.PowerShell_profile.ps1' -OutFile $PROFILE

