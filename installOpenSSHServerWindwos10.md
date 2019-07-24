# Install openSSH Server on Windows

https://www.windowspro.de/wolfgang-sommergut/openssh-windows-server-2019-installieren

## installieren

```powershell
Get-WindowsCapability -Online | ? name -like *OpenSSH.Server* |
Add-WindowsCapability -Online
```

## aktivieren (benötigt Neustart)

```powershell
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic
```

## starten (setzt keinen Autostart)

```powershell
Start-Service sshd
Start-Service ssh-agent
```

## remote einloggen

```bash
ssh username@hostname
```

## powershell verwenden

```powershell
powershell.exe
