#!/bin/bash

printf "\033[1;34m Starting to install docker 🐋"

# Unninstalling older docker-engines
apt remove docker docker-engine docker.io -y

# Updating before anything
apt update

# Installing packages to allow apt to use a repository over https
apt install apt-transport-https ca-certificates software-properties-common -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Verify you have the key
apt-key fingerprint 0EBFCD88

# Setup stable repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y

# Updating again to install the docker
apt update

# Installing the Docker CE
apt install docker-ce -y

usermod -aG docker $USER
