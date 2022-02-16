# how to deal with xrandr (raspberry)

xrandr -q 

this queries the modes

cvt 1920 1080 60

this calculates the mode line. must export DISPLAY=:0 when login via ssh. Must not be used as root

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode HDMI-2 1920x1080_60.00
xrandr --output HDMI-2 --mode 1920x1080

