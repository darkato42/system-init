# System Settings

1. Check Windows Updates
1. [Activate Developer Mode and developer settings](https://docs.microsoft.com/en-gb/windows/apps/get-started/enable-your-device-for-development?OCID=WinClient_Ver1703_Settings_DevMode), such as showing hidden files, file extensions, PowerShell execution policy etc.

# Enable Windows Optional Features

* IIS
* Containers
* Hyper-V
* Windows-Subsystem-Linux

Run with Admin PowerShell:

```powershell
# iex is an alias for Invoke-Expression
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/SetupIIS.ps1'))
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/SetupOtherWinFeatures.ps1'))
```

# Install Fonts

Download from:
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode/Regular/complete

Drag `.ttf` files into Font settings in Systems settings.

# Install Utility Tools

The preferred order of installation methods:
[winget-cli](https://github.com/microsoft/winget-cli) > [chocolatey](https://github.com/chocolatey/choco) > others

* Chocolatey
* Git
* TortoiseGit
* [AutoHotKey](https://www.autohotkey.com/)
* Microsoft.AzureCLI
* Microsoft.GitCredentialManagerCore
* Microsoft.VisualStudioCode
* Microsoft.dotnet
* Microsoft.PowerShell
* Microsoft.WindowsTerminal
* OhMyPosh
* 7zip
* [Greenshot](https://github.com/greenshot/greenshot)
* Postman
* Fiddler
* NodeJS
* [CapsLock Enhancement](https://github.com/darkato42/Capslock/tree/master/win)

Run with Admin PowerShell:

```powershell
# iex is an alias for Invoke-Expression
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/InstallTools.ps1'))
```

# Azure CLI extensions

```
az extension add --name azure-devops
```

# Verifying commands

```
// Check PowerShell Version
$PSVersionTable

// Replace $PROFILE
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/darkato42/system-init/main/windows/Microsoft.PowerShell_profile.ps1' -OutFile $PROFILE
```
