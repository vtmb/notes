eine datei syncen aber mit anderem namen:

aber dafür muss erst der destination ordner erstellt werden!!

rsync -av --delete --bwlimit=5m --progress /var/www/source/ user@host:/var/www/destination

kein trailing slash bei destination!!
