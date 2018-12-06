"""DISTRO IGNITER CLI

Usage:
  pycli start
  pycli -h|--help
  pycli -v|--version

Options:
  start Starts the CLI
  -h --help  Display the available commands
  -v --version  Display CLI version
"""
from __future__ import print_function, unicode_literals
from docopt import docopt
import os
import glob
import cutie
import subprocess

__version__ = 'v0.0.1'

# Gettin script names by creation time
scripts = glob.glob("scripts/*.sh")
scripts.sort(key=lambda x: os.path.getmtime(x))

feature_options = [
    "Python",
    "Snap Packages",
    "Docker"
    "APT Packages",
    "Node.JS",
    "VSCode Extensions"
]

def start():
    print(" > Select the features you want to install (<space> to select, <Enter> to confirm)\n")
    features_indices = cutie.select_multiple(feature_options, hide_confirm=True)
    features = [
        feature_index for feature_index, feature
        in enumerate(feature_options)
        if feature_index in features_indices 
    ]
    for feature_index in features:
        subprocess.call(scripts[feature_index], shell=True)


if __name__ == '__main__':
    arguments = docopt(__doc__, version=__version__)
    if arguments['start']:
        start()
    else:
        print(arguments)