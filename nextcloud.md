Indizes generieren:

cd /var/www/html/nextcloud

sudo -u www-data php occ maintenance:mode --on

sudo -u www-data php occ db:add-missing-indices
sudo -u www-data php occ db:convert-filecache-bigint

sudo -u www-data php occ maintenance:mode --off
