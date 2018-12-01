#!/bin/bash

# Creating the container
docker run -td --name="testing" -p 127.0.0.1:80:80 ubuntu:18.04

# Injecting scripts into container
docker cp ../ubuntu-starter.sh testing:/
docker cp ../packages.apt testing:/
docker cp ../packages.snap testing:/

echo "Must install sudo inside the container to run the scripts"