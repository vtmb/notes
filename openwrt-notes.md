# Skripte in OpenWRT

ein skript anlegen, beispielsweise set_config_openwrt.sh

dort folgendes zB für hostname eintragen

```bash
#!/bin/sh
NEW_HOSTNAME="Mein HOSTNAME"
uci set system.@system[0].hostname="$NEW_HOSTNAME"
uci commit system
/etc/init.d/system reload
```

das skript muss ausführbar sein

also chmod +x set_config_openwrt.sh

dann ausführen

./set_config_openwrt.sh
