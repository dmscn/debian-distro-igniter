#!/bin/bash

# Unninstalling older docker-engines
sudo apt remove docker docker-engine docker.io -y

# Updating before anything
sudo apt update

# Installing packages to allow apt to use a repository over https
sudo apt install apt-transport-https ca-certificates software-properties-common -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify you have the key
sudo apt-key fingerprint 0EBFCD88

# Setup stable repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y

# Updating again to install the docker
sudo apt update

# Installing the Docker CE
sudo apt install docker-ce -y

echo "To run docker as a non-root user run 'sudo usermod -aG docker your-user'"