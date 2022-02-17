function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-FromWinGet {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName
    )
    
    winget install $PackageName --accept-package-agreements --accept-source-agreements
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
        Install-Module -Name $ModuleName -Scope CurrentUser -Force
        Install-Module $ModuleName -Scope CurrentUser -Force

        Invoke-Command -ScriptBlock $PostInstall
    } else {
        Write-Host "$ModuleName was already installed, skipping"
    }
}

# Use WinGet
Install-FromWinGet 'Git.Git'
Install-FromWinGet 'Git.GitLFS'
Install-FromWinGet 'TortoiseGit.TortoiseGit'
Install-FromWinGet 'Lexikos.AutoHotkey'
Install-FromWinGet 'Microsoft.AzureCLI'
Install-FromWinGet 'Microsoft.GitCredentialManagerCore'

# Use Choco
Install-Chocolatey

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/system-init/main/common/.gitconfig' -OutFile (Join-Path $env:USERPROFILE '.gitconfig')

Install-FromChocolatey 'vscode'
Install-FromChocolatey '7zip'
# https://github.com/darkato42/Capslock/tree/master/win
$chocoToolsPath = ([System.Environment]::GetEnvironmentVariables('User')).ChocolateyToolsLocation
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/Capslock/master/win/CapsLock.ahk' -OutFile (Join-Path $chocoToolsPath 'CapsLock.ahk')

Install-FromChocolatey 'greenshot'
Install-FromChocolatey 'dotnetcore-sdk'
Install-FromChocolatey 'microsoft-windows-terminal'
Install-FromChocolatey 'fiddler'
Install-FromChocolatey 'postman'
Install-FromChocolatey 'powershell-core'

Install-PowerShellModule 'Posh-Git' { Add-PoshGitToProfile -AllHosts }
Install-PowerShellModule 'oh-my-posh' { }
Install-PowerShellModule 'PSReadLine' { }
Install-PowerShellModule 'nvm' {
    Install-NodeVersion latest
    Set-NodeVersion -Persist User
}

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/system-init/main/windows/Microsoft.PowerShell_profile.ps1' -OutFile $PROFILE

