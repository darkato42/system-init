```
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell
```
From the Powershell folder, I doubled clicked on ExecutionPolicy and changed the value to unrestricted

This is for setting up a Windows environment.

Run with:

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/darkato42/system-init/main/windows/setup.ps1'))
```
