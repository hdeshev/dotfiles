#!/bin/sh

# Gnome keyring daemon
gnome-keyring-daemon --daemonize --login

# Start dropbox daemon
# ~/.dropbox-dist/dropboxd &

# Start the pCloud Sync client
psyncgui &

# XFCE power manager - turn off monitor, hibernate on lid close
if [ "$(pidof xfce4-power-manager)" ]
then
  echo "xfce4-power-manager already running"
else
  xfce4-power-manager &
fi
