zahlen in Klammern finden
awk -F'[()]' '{print $2}' file
