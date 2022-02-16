# Developer Settings

1. Apply all File Explorer settings
2. Change PowerShell execution policy

# Enable Windows Optional Features

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/SetupIIS.ps1'))
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/SetupOtherWinFeatures.ps1'))
```

# Install Tools

Run with:

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/InstallTools.ps1'))
```
