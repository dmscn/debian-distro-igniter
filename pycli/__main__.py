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
from PyInquirer import style_from_dict, Token, prompt
import subprocess

__version__ = 'v0.0.1'

# Gettin script names by creation time
scripts = glob.glob("scripts/*.sh")
scripts.sort(key=lambda x: os.path.getmtime(x))

feature_options = [
    {
        "name": "Python",
        "checked": True
    },
    {
        "name": "Snap Packages",
        "checked": True
    },
    {
        "name": "Docker",
        "checked": True
    },
    {
        "name": "APT Packages",
        "checked": True
    },
    {
        "name": "Node.JS",
        "checked": True
    },
    {
        "name": "VSCode Extensions",
        "checked": True
    }
]

checkbox_input = [
    {
        'type': 'checkbox',
        'message': 'Select features to install',
        'name': 'features',
        'choices': feature_options,
        'validate': lambda answer: 'You must choose at least one feature.' \
            if len(answer) == 0 else True
    }
]

checkbox_input_style = style_from_dict({
    Token.Separator: '#cc5454',
    Token.QuestionMark: '#673ab7 bold',
    Token.Selected: '#cc5454',  # default
    Token.Pointer: '#673ab7 bold',
    Token.Instruction: '',  # default
    Token.Answer: '#f44336 bold',
    Token.Question: '',
})


def start():
    answers = prompt(checkbox_input, style=checkbox_input_style).get('features', [])
    features = [
        feature_index for feature_index, feature
        in enumerate(feature_options)
        if feature.get("name") in answers
    ]
    subprocess.call("../starter.shgaa", shell=True)
    for feature_index in features:
        subprocess.call(scripts[feature_index], shell=True)


if __name__ == '__main__':
    arguments = docopt(__doc__, version=__version__)
    if arguments['start']:
        start()
    else:
        print(arguments)