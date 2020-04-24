## Dienste, die vor dem Testen neu gestartet werden sollten

```bash
systemctl php-fpm restart
systemctl nginx restart
```

# Moodle installieren

```bash
wget https://download.moodle.org/download.php/direct/stable33/moodle-latest-33.tgz
tar -zxvf moodle-latest-33.tgz
mv moodle /var/www/moodle

mkdir -p /var/moodledata
chown -R www-data:www-data /var/www/moodle
chown -R www-data:www-data /var/moodledata
```


dann eine Datenbank anlegen

```sql
CREATE DATABASE moodle;
REATE USER 'moodleuser'@'localhost' IDENTIFIED BY 'pAsSw0rT';
GRANT ALL ON moodle.* TO 'moodleuser'@'localhost' IDENTIFIED BY 'pAsSw0rT' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
```

#config für nginx

```bash
location ^~ /moodle/ {
	client_max_body_size 10G;
	proxy_buffering off;
	proxy_request_buffering off;
	proxy_max_temp_file_size 10240m;
	proxy_set_header Host $host;
	proxy_set_header X-Forwarded-Host $host;
	proxy_set_header X-Forwarded-Server $host;
	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Forwarded-Proto $scheme;
	proxy_pass http://127.0.0.1:82;
	proxy_redirect off;
}
```

# serverblock

```bash

server {
	listen   82;
	server_name 127.0.0.1;
	root /var/www;
	rewrite ^/(.*.php)(/)(.*)$ /$1?file=/$3 last;
	index index.php index.html index.htm;	
	client_max_body_size 10G;
 
	location ~ [^/]\.php(/|$) {
	try_files $uri =404;
	fastcgi_split_path_info  ^(.+\.php)(/.+)$;
	fastcgi_index index.php;
	fastcgi_pass php-handler;
	fastcgi_param PHP_VALUE "open_basedir=/var/www:/tmp/:/var/moodledata";
	include fastcgi_params;
	fastcgi_param PATH_INFO $fastcgi_path_info;
	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}
}
```