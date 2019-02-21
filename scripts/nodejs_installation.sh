#!/bin/bash

# Gettin PPA setup script
curl -sL https://deb.nodesource.com/setup_10.x -o /tmp/nodesource_setup.sh

# Executing the script
. /tmp/nodesource_setup.sh

# Properly installing nodejs
apt update
apt install nodejs -y

# Verify if installation succeeded
nodejs -v
npm -v

GLOBAL_PACKAGES="cat ../packages/packages.global.npm"
# Installing global packages
npm install -g "$GLOBAL_PACKAGES" -y

echo "export PATH=PATH:$(yarn global bin)" >> ~/.zshrc

# Executing bing-daily-wallpaper
bing-daily-wallpaper