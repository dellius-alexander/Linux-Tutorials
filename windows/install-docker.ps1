#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#Set-ExecutionPolicy Bypass -Scope Process -Force;
# Install windows feature subsystem for linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# Install windows feature virtual machine platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Download wsl2 update
iwr -Uri 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi' -OutFile wsl_update_x64.msi
# Install wsl2 using 'function msi-install <file.msi>'
.\install-msi.ps1 wsl_update_x64.msi
wsl --set-default-version 2