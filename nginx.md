# install nginx on Ubuntu 18.04

use packages from nginx - add the signing key

```bash
wget -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
```

add package repository to `/etc/apt/sources.list.d/nginx.list`

```bash
# Nginx (Mainline)
deb [arch=amd64] http://nginx.org/packages/mainline/ubuntu/ bionic nginx
deb-src [arch=amd64] http://nginx.org/packages/mainline/ubuntu/ bionic nginx
```

install nginx 

```bash
apt-get update
apt-get install nginx
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
