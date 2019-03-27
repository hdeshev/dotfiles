#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if_installed() {
    which $1 > /dev/null && \
        eval $@
}
# source ~/.bashfiles/gnome-keyring.sh

$SCRIPT_DIR/input-devices.sh

## DPMS monitor setting (standby -> suspend -> off) (seconds)
# xset dpms 300 600 900

# make sure you run xscreensaver (with splash) and configure locking and power management first
xscreensaver -no-splash &

# redshift uses warm colors
if [ "$(pidof redshift)" ] ; then
    echo "redshift already running"
else
    if_installed redshift-gtk -l 42.75:23.20&
fi

if [ "$(pidof keepassx)" ] ; then
  echo "keepassx already running"
else
  keepassx $HOME/.keepassx/deshev.kdbx &
fi

# mount ~/private
if_installed ~/bin/mount-private.sh &

#using feh to render the wallpaper
bash $HOME/.fehbg

#clipboard history
if [ "$(pidof parcellite)" ]
then
  echo "parcellite already running"
else
  parcellite &
fi

#per-window kbd layout selection
if [ "$(pidof kbdd)" ]
then
  echo "kbdd already running"
else
  kbdd
fi

# Workaround to make Java GUI apps work see:
# http://awesome.naquadah.org/wiki/Problems_with_Java
# You need `wmname` - Arch package: wmname; Ubuntu package: suckless-tools
#wmname LG3D

# Start the XFCE settings daemon to make GUI programs look good
xfsettingsd --replace

# Network Manager applet - connect to various networks (eth, wlan)
if [ "$(pidof nm-applet)" ]
then
  echo "nm-applet already running"
else
  nm-applet &
fi

# Lid close, suspends, etc
xfce4-power-manager

HOST=$(hostname)
source $SCRIPT_DIR/hosts/$HOST.sh
