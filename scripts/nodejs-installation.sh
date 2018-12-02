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