# Install openSSH Server on Windows

https://www.windowspro.de/wolfgang-sommergut/openssh-windows-server-2019-installieren

# installieren

```bash
Get-WindowsCapability -Online | ? name -like *OpenSSH.Server* |
Add-WindowsCapability -Online
```

# aktivieren

```bash
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic
```
