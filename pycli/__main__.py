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

feature_options = [
    {
        "name": "Python",
        "checked": True,
        "script": "python_installation.sh"
    },
    {
        "name": "MySQL",
        "checked": True,
        "script": "mysql_installation.sh"
    },
    {
        "name": "Redis",
        "checked": True,
        "script": "redis_installation.sh"
    },
    {
        "name": "Snap Packages",
        "checked": True,
        "script": "snap_packages_installation.sh"
    },
    {
        "name": "Docker",
        "checked": True,
        "script": "docker_installation.sh"
    },
    {
        "name": "Node.JS",
        "checked": True,
        "script": "nodejs_installation.sh"
    },
    {
        "name": "VSCode Extensions",
        "checked": True,
        "script": "vscode_extensions_installation.sh"
    },
    {
        "name": "Theme",
        "checked": True,
        "script": "style_installation.sh"
    },
]

checkbox_input = [
    {
        'type': 'checkbox',
        'message': 'Select features to install',
        'name': 'features',
        'choices': feature_options,
        'validate': lambda answer: 'You must choose at least one feature.'
        if len(answer) == 0 else True
    }
]

# Styling the CLI
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
    answers = prompt(checkbox_input, style=checkbox_input_style).get(
        'features', [])
    features = [
        feature for feature_index, feature
        in enumerate(feature_options)
        if feature.get("name") in answers
    ]
    # subprocess.call("./starter.sh", shell=True)
    for feature in features:
        scriptUrl = './scripts/' + feature.get('script', '')
        subprocess.call(scriptUrl, shell=True)


if __name__ == '__main__':
    arguments = docopt(__doc__, version=__version__)
    if arguments['start']:
        start()
    else:
        print(arguments)
