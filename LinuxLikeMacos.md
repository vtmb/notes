open command in linux like that in macos:

in bashrc

```bash
alias open=xdg-open
```

in .profile
```bash
mouseid=$(xinput --list | sed -E '/mouse/I!d;s/.*?mouse.*?id=([0-9]+).*/\1/i;q')
xinput --set-prop $mouseid 'libinput Natural Scrolling Enabled' 1
```
