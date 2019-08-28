# run awk script on one file

```bash
awk -f myAwkScript.awk fileToProcess
```

# poor hack to run on multiple files:

1. create a file containing the paths to the files.

```bash
find . -name "MyRegexPattern*.txt" > pathsToFile
```

2. loop over the files

```bash
for word in $(cat fileContainingOnePathPerLine); do awk -f myAwkScript.awk $word; done > desiredOutput
```
