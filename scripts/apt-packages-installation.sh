#!/bin/bash

echo ">>> Looking for new packages..."

for pkg in `cat packages/packages.apt`; do
    if package_exists $pkg; then
        echo "$pkg is already installed."
    else
        apt-get install $pkg -y
    fi
done