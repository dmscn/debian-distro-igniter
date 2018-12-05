#!/bin/bash

package_exists() {
    dpkg -s "$1" >/dev/null 2>&1
}

echo ">>> Looking for new snap packages..."

for snap in `cat packages/packages.snap`; do
    if package_exists $snap; then
        echo "$snap is already installed."
    else
		snap install $snap -y
	fi
done