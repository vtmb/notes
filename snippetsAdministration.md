# deleting all files of a specific type
```bash 
find . -name *.shs -exec rm {} \;
```

# deleteting all empty folders
```bash
find . -empty -type d -delete
