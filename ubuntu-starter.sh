#!/bin/bash

update_and_upgrade() {
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean -y
}

package_exists() {
	return $(dpkg-query -W -f='${Status}' $1 | grep "ok installed")
}

# Upgrading system before anything
echo "Upating system..."

update_and_upgrade

# apt packages
echo "Installing new packages..."

for pkg in cat packages.apt; do
	if ! package_exists $pkg; then
		sudo apt install $pkg -y
	fi
done

# Snap Packages
echo "Installing snap packages..."

for snap in cat packages.snap; do
    if ! package_exists $snap; then
		sudo snap install $snap --classic
	fi
done

# deb packages
echo "Installing deb packages..."

for uri in cat deb_uris; do
    curl -sL -o/var/cache/apt/archives/package.deb $uri && sudo dpkg -i /var/cache/apt/archives/package.deb
done

# OhMyZsh
echo "Installing OhMyZsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Google Chrome
echo "Installing Google Chrome"

if ! package_exists google-chrome-stable; then
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt-get update
	sudo apt-get install google-chrome-stable
fi