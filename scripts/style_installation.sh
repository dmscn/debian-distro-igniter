#!/bin/bash

echo ">>> Styling your SO..."

## Styling SO
add-apt-repository ppa:daniruiz/flat-remix -y
apt-get update
apt-get install flat-remix flat-remix-gnome flat-remix-gtk -y
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-GTK"
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM