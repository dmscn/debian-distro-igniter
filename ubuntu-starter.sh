#!/bin/bash

update_and_upgrade() {
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean -y
}

create_default_aliases() {
    if [ `alias | grep dlb | wc -l` > 0 ]; then
        # Delete all local branches except master
        [ -f ~/.zshrc ] && echo "alias dlb=\"git branch | grep -v 'master' | xargs git branch -D\"" >> ~/.zshrc
    fi
}

package_exists() {
    dpkg -s "$1" >/dev/null 2>&1
}


# Upgrading system before anything
echo ">>> Upating system..."

update_and_upgrade


# apt packages
echo ">>> Looking for new packages..."

for pkg in `cat packages.apt`; do
    if package_exists $pkg; then
        echo "$pkg is already installed."
    else
        sudo apt-get install $pkg
    fi
done


# Snap Packages
echo ">>> Looking for new snap packages..."

for snap in `cat packages.snap`; do
    if package_exists $snap; then
        echo "$snap is already installed."
    else
		sudo snap install $snap
	fi
done


# SSH Setup
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo ">>> Creating SSH Keys"
    ssh-keygen
    eval `ssh-agent`
    ssh-add ~/.ssh/id_rsa
fi


# OhMyZsh
if [ ! -f ~/.zshrc ]; then
    echo ">>> Installing OhMyZsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


# Aliases
create_default_aliases


# Google Chrome
# Only base64
if package_exists google-chrome-stable; then
    echo "Google Chrome is already installed."
else
    echo ">>> Installing Google Chrome"
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt-get update
	sudo apt-get install google-chrome-stable
fi