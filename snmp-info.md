#SNMP

## Raum setzen
``` bash
snmpset -v3 -l authPriv -u SNMPv3Admin -a SHA -A 123456789 -x DES -X 123456789 -n v3context 10.10.3.41 1.3.6.1.2.1.1.6.1 s "Raum-034"
```

# Achtung: SHA und DES müssen passen, -n ist der Context.
