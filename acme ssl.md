## Erinnerung an mich selbst: Man kann für eine Domain ein gepacktes Zertifikat erzeugen, in dem alle Subdomains abgedeckt werden, etwa so:

acme.sh --issue -d meinedomain.de -d subdomain.meinedomain.de --keylength 4096 -w /var/www/letsencrypt --key-file /etc/letsencrypt/meinedomain.de/key.pem --ca-file /etc/letsencrypt/meinedomain.de/ca.pem --cert-file /etc/letsencrypt/meinedomain.de/cert.pem --fullchain-file /etc/letsencrypt/meinedomain.de/fullchain.pem --reloadcmd "sudo /bin/systemctl reload nginx.service"

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

