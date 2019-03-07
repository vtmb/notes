open command in linux like that in macos:

in bashrc

```bash
alias open=xdg-open
```

some text on natural scrolling 

List all your currently available pointers and keyboards:

xinput list

Something like this will appear:

⎡ Virtual core pointer                          id=2    [master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
⎜   ↳ Logitech USB Laser Mouse                  id=9    [slave  pointer  (2)]
⎜   ↳ TPPS/2 IBM TrackPoint                     id=12   [slave  pointer  (2)]
⎜   ↳ SynPS/2 Synaptics TouchPad                id=11   [slave  pointer  (2)]
⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
    ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
    ↳ Power Button                              id=6    [slave  keyboard (3)]
    ↳ Video Bus                                 id=7    [slave  keyboard (3)]
    ↳ Power Button                              id=8    [slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard              id=10   [slave  keyboard (3)]
    ↳ ThinkPad Extra Buttons                    id=13   [slave  keyboard (3)]

Pick the id of the pointer in question, list all its device properties:

xinput list-props 12

Device 'TPPS/2 IBM TrackPoint':
    Device Enabled (143):   1
    Coordinate Transformation Matrix (145): 1.000000, ...
    libinput Natural Scrolling Enabled (281):   1
    libinput Natural Scrolling Enabled Default (282):   0
    libinput Scroll Methods Available (283):    0, 0, 1
    libinput Scroll Method Enabled (284):   0, 0, 1
    libinput Scroll Method Enabled Default (285):   0, 0, 1
    libinput Button Scrolling Button (286): 2
    ...


This is what we need: libinput Natural Scrolling Enabled (281)

To enable natural scrolling globally i.e. for "TPPS/2 IBM TrackPoint" (for the current session), first turn it OFF in 'Mouse & Touchpad' preferences.
Enter one of those two lines below, hit Enter. (both do the same, because to read or write a property you can use either its entire(!) name or its ID)

xinput set-prop 12 "libinput Natural Scrolling Enabled" 1

xinput set-prop 12 "281" 1

Now test it in applications where naturalscroling wouldn't work via system preferences.

Permanent solution

If the above test worked on your machine, you can apply the changes everytime you log into your session with a small startup script. The script part that matches deviceName is from this answer about button maps by @zerobandwidth).

Save the code below as natural_scrolling.sh in your home directory or in /any/path/youLike

#!/bin/bash
# Find all xinput devices whose name matches any of the arguments passed here,
# then set the Natural Scrolling' property to '1' regardless of its
# current state.

# expect multiple arguments, store them as array
deviceNames="$@"

# exit if no argument is passed
if [ "$deviceNames" = "" ]; then
        echo "No argument received, exiting."
        echo "Call this script with argument(s) like 'Logitech' that match"
        echo "any of your attached pointer devices."
    exit 1
fi

for deviceName in $deviceNames
do
    deviceId=$(xinput --list | awk -v search="$deviceName" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )
  # set device-specific property (works i.e for 'TrackPoint' & 'Logitech')
  xinput set-prop $id "libinput Natural Scrolling Enabled" 1
done

Mark the script executable:

chmod +x natural_scrolling.sh

Call it with unique(!) device_name string(s) as argument:

/any/path/youLike/natural_scrolling.sh Logitech TrackPoint

Add it to your startup applications, i.e via Session & Startup preferences in xfce and test it by logging out & back in again.
