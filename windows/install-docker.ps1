# Install windows feature subsystem for linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# Install windows feature virtual machine platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Download wsl2 update
iwr -Uri 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi' -OutFile wsl_update_x64.msi
# Install wsl2 using 'function msi-install <file.msi>'
msi-install.ps1 wsl_update_x64.msi
wsl --set-default-version 2