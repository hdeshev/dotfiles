#!/bin/sh

if_installed() {
    which $1 > /dev/null && \
        eval $@
}

TRACKBALL_DEVICE="Primax Kensington Eagle Trackball"
TRACKBALL_ID="$(xinput list --id-only "$TRACKBALL_DEVICE")"

if [ -n "$TRACKBALL_ID" ] ; then
    echo "Enabling middle button emulation for trackball '$TRACKBALL_DEVICE' with id '$TRACKBALL_ID'"
    xinput set-prop $TRACKBALL_ID "libinput Middle Emulation Enabled" 1
fi

# Set up Synaptics touchpad palm detection
if_installed synclient PalmDetect=1
if_installed synclient PalmMinWidth=8
if_installed synclient PalmMinZ=100

# "mouse" speed and acceleration
xset m 6 1

# remap caps lock to ctrl
setxkbmap -option ctrl:nocaps
# right Win key is my Compose key
setxkbmap -option compose:rwin
# us & bg phonetic layout. right alt switches, caps lock lights up when bg toggled
setxkbmap us,bg ,phonetic grp:toggle,grp_led:caps
