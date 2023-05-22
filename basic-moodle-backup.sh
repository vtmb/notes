#!/bin/bash

# Setzen Sie das Backup-Verzeichnis
backup_dir="/home/backup"

# Setzen Sie die Datenbankinformationen
db_user="Ihr_DB_Benutzername"
db_password="Ihr_DB_Passwort"
db_name="moodle"

# Fügen Sie hier weitere Einstellungen für rsync hinzu, falls gewünscht
rsync_options="-av --delete --bwlimit=5m"

# Führen Sie die Datenbanksicherung mit Lock-Tables durch
mysqldump --lock-tables -u $db_user -p$db_password $db_name > $backup_dir/moodle_db_backup.sql

# Führen Sie die Sicherung mit rsync in niedriger Priorität und niedriger I/O-Priorität aus
nice -n 19 ionice -c3 rsync $rsync_options /var/www/moodledata $backup_dir
nice -n 19 ionice -c3 rsync $rsync_options /var/www/html/moodle $backup_dir
