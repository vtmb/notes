# PHP installieren 

```bash
apt-get update
apt-get install php-fpm php-gd php-mysql php-curl php-xml php-zip php-intl php-mbstring php-bz2 php-json php-apcu php-imagick
```


# PHP konfiguerieren

Konfiguriert wird in dieser Datei `/etc/php/7.2/fpm/pool.d/www.conf`

## User vom Webserver konfigurieren

```bash
user = www-data
group = www-data
```

## Umgebungsvariablen von PHP sichtbar machen

hierzu die Semikola entfernen

```bash
env[HOSTNAME] = $HOSTNAME
env[PATH] = /usr/local/bin:/usr/bin:/bin
env[TMP] = /tmp
env[TMPDIR] = /tmp
env[TEMP] = /tmp
```

# Anpassen von `/etc/php/7.2/fpm/php.ini`

Pfadangaben sicher interpretieren `cgi.fix_pathinfo = 0`
Memorylimit für Nextclout `memory_limit = 512M`

# Opcache optimieren

```bash
opcache.enable = 1
opcache.enable_cli = 1
opcache.memory_consumption = 128
opcache.interned_strings_buffer = 8
opcache.max_accelerated_files = 10000
opcache.revalidate_freq = 1
opcache.save_comments = 1
```

# CLI anpassen `/etc/php/7.2/cli/php.ini?`

```bash
cgi.fix_pathinfo = 0
opcache.revalidate_freq = 1
open_basedir = /var/www/:/tmp/:/var/nextcloud_data
```

# User anpassen in NGINX

```bash
/etc/nginx/nginx.conf

