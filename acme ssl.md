es ist besser, wenn für letsencrypt ein extra user angelegt wird

```bash
adduser letsencrypt
usermod -a -G www-data letsencrypt
```

der User muss noch ein paar Dinge tun dürfen

```bash
visudo

letsencrypt ALL=NOPASSWD: /bin/systemctl reload nginx.service
```

als dieser User kann man nun acme installieren ( `su letsencrypt` )

```bash
curl https://get.acme.sh | sh
```
