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

# Install Utility Tools

The preferred order of installation methods:
[winget-cli](https://github.com/microsoft/winget-cli) > [chocolatey](https://github.com/chocolatey/choco) > others

* Chocolatey
* Git
* vscode
* 7zip
* [AutoHotKey](https://www.autohotkey.com/)
* [CapsLock Enhancement](https://github.com/darkato42/Capslock/tree/master/win)
* [Greenshot](https://github.com/greenshot/greenshot)
* dotnetcore-sdk
* microsoft-windows-terminal
* fiddler
* postman
* [powershell-core](https://github.com/powershell/powershell)
* 

Run with Admin PowerShell:

```powershell
# iex is an alias for Invoke-Expression
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/InstallTools.ps1'))
```
