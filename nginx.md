# making all servers available

ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

finding default servers

grep -R default_server /etc/nginx/sites-enabled/

check for syntax errors in configs

nginx -t
