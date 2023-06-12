#!/bin/bash

# Setzen Sie das Backup-Verzeichnis
backup_dir="DEIN-BACKUP-VERZEICHNIS"
archive_dir="DEIN-MOODLE-ARCHIV"
moodle_installation_dir="/var/www/html/moodle"
moodle_data_dir="/var/www/moodledata"
php_interpreter="/usr/bin/php"

# Setzen Sie die Datenbankinformationen
db_user="DEIN DATENBANK USER"
db_password="DEIN DATENBANK PASSWORT"
db_name="DEI DATENBANK NAME"

# Fügen Sie hier weitere Einstellungen für rsync hinzu, falls gewünscht
rsync_options="-av --delete --bwlimit=5m"

# Startzeit ermitteln
start_time=$(date +%s)

# Aktivieren des Wartungsmodus in Moodle
echo "Wartungsmodus wird aktiviert"
$php_interpreter $moodle_installation_dir/admin/cli/maintenance.php --enable

# Führen Sie die Datenbanksicherung mit Lock-Tables durch
echo "Datenbanksicherung wird erzeugt"
mysqldump --user=$db_user -p$db_password --lock-tables --databases $db_name > $backup_dir/moodle_db_backup.sql

# Führen Sie die Sicherung mit rsync in niedriger Priorität und niedriger I/O-Priorität aus
echo "Moodle-Installationsverzeichnis und Moodle-data werden per rysnc synchronisiert"
nice -n 19 ionice -c3 rsync $rsync_options $moodle_data_dir $backup_dir
nice -n 19 ionice -c3 rsync $rsync_options $moodle_installation_dir $backup_dir

# Sichern der MariaDB-Version
mariadb_version=$(mysql --version | awk '{print $5}')
echo "MariaDB Version: $mariadb_version" > $backup_dir/database_info.txt

# Sichern der PHP-Module
php_modules=$(php -m)
echo "PHP-Module: $php_modules" >> $backup_dir/php_info.txt

# Sichern der Apache-Konfigurationsdatei
cp /etc/apache2/apache2.conf $backup_dir/apache2.conf

# Deaktivieren des Wartungsmodus in Moodle
$php_interpreter $moodle_installation_dir/admin/cli/maintenance.php --disable

# Erstellen eines Archivs
echo "Archiv wird erstellt, Pfad: $archive_dir/latestbackup.tar.gz"
tar -cpzf $archive_dir/latestbackup.tar.gz -C $backup_dir .

# Endzeit ermitteln
end_time=$(date +%s)

# Laufzeit berechnen
duration=$((end_time - start_time))
hours=$((duration / 3600))
minutes=$(( (duration % 3600) / 60 ))
seconds=$((duration % 60))

# Laufzeit ausgeben
echo "Das Backup-Skript wurde in $hours Stunden, $minutes Minuten und $seconds Sekunden ausgeführt."
