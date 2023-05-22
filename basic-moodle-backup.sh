#!/bin/bash

# Setzen Sie das Backup-Verzeichnis
backup_dir="/home/backup"

# Setzen Sie die Datenbankinformationen
db_user="Ihr_DB_Benutzername"
db_password="Ihr_DB_Passwort"
db_name="moodle"

# Fügen Sie hier weitere Einstellungen für rsync hinzu, falls gewünscht
rsync_options="-av --delete --bwlimit=5m"

# Startzeit ermitteln
start_time=$(date +%s)

# Aktivieren des Wartungsmodus in Moodle
php /var/www/html/moodle/admin/cli/maintenance.php --enable

# Führen Sie die Datenbanksicherung mit Lock-Tables durch
mysqldump --lock-tables -u $db_user -p$db_password $db_name > $backup_dir/moodle_db_backup.sql

# Führen Sie die Sicherung mit rsync in niedriger Priorität und niedriger I/O-Priorität aus
nice -n 19 ionice -c3 rsync $rsync_options /var/www/moodledata $backup_dir
nice -n 19 ionice -c3 rsync $rsync_options /var/www/html/moodle $backup_dir

# Sichern der MariaDB-Version
mariadb_version=$(mysql --version | awk '{print $5}')
echo "MariaDB Version: $mariadb_version" > $backup_dir/database_info.txt

# Sichern der PHP-Module
php_modules=$(php -m)
echo "PHP-Module: $php_modules" >> $backup_dir/database_info.txt

# Sichern der Apache-Konfigurationsdatei
cp /etc/apache2/apache2.conf $backup_dir/apache2.conf

# Deaktivieren des Wartungsmodus in Moodle
php /var/www/html/moodle/admin/cli/maintenance.php --disable

# Endzeit ermitteln
end_time=$(date +%s)

# Laufzeit berechnen
duration=$((end_time - start_time))
hours=$((duration / 3600))
minutes=$(( (duration % 3600) / 60 ))
seconds=$((duration % 60))

# Laufzeit ausgeben
echo "Das Backup-Skript wurde in $hours Stunden, $minutes Minuten und $seconds Sekunden ausgeführt."
