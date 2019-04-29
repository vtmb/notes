# set domain/subdomain

how to set domains? subdomains?

```bash
	server {
                listen 80;
                server_name www.domain.de;
                root /srv/data;

                location / {
                        index index.html index.htm;
                }
        }

        server {
                listen 80;
                server_name subdomain.domain.de;
                root /srv/subdomains/about;

                location / {
                        index index.html index.htm;
                }
        }
```

# where are my acceslogs?
```bash
/var/log/nginx/access.log
```

# how to make logs dsgvo friendly:

config file, in the http {} part:
```bash
access_log off;
error_log off;
```

# which rights should be set?
chmod 755 for directories
chmod 644 for files

# making all servers available
```bash
ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/
```

# finding default servers
```bash
grep -R default_server /etc/nginx/sites-enabled/
```

# check for syntax errors in configs
```bash
nginx -t
