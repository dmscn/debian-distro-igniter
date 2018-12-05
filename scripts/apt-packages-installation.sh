#!/bin/bash

package_exists() {
    dpkg -s "$1" >/dev/null 2>&1
}

echo ">>> Looking for new packages..."

for pkg in `cat packages/packages.apt`; do
    if package_exists $pkg; then
        echo "$pkg is already installed."
    else
        apt-get install $pkg -y
    fi
done

add-apt-repository ppa:daniruiz/flat-remix -y
apt-get update
apt-get install flat-remix flat-remix-gnome flat-remix-gtk -y
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-GTK"