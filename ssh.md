# einen ssh key generieren und auf eine remote maschine kopieren

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
ssh-copy-id user@hostname.example.com
```

# Auf einen internen Rechner zugreifen

```bash
ssh -J name@publicserver name@internalcomputer
```

funktioniert auch mit sftp

```bash
sftp -J name@publicserver name@internalcomputer
```

# Auf einen internen Service zugreifen

oder: public server als jumphost zum internen service:

```bash
ssh -L PortAußen:localhost:PortInnen -J name@publicserver internalServer
```

# Ein grafisches Programm von remote starten

```bash
export DISPLAY=:0
xeyes
```
