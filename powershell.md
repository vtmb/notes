# Converting csv files to json

```pwsh
Import-Csv -Delimiter ";" ./computers.csv | ConvertTo-Json | Add-Content -Path "computers.json"
```
