"""DISTRO IGNITER CLI

Usage:
  pycli start
  pycli -i|--install <feature>
  pycli -h|--help
  pycli -v|--version

Options:
  start Starts the CLI
  -i --install <feature>  Feature you want to install
  -h --help  Display the available commands
  -v --version  Display CLI version
"""
from __future__ import print_function, unicode_literals
from docopt import docopt
from PyInquirer import style_from_dict, Token, prompt
from pprint import pprint
import subprocess

__version__ = 'v0.0.1'

# style = style_from_dict({
#     Token.QuestionMark: '#c51162 bold',
#     Token.Selected: '#c51162',  # default
#     Token.Pointer: '#7200ca bold',
#     Token.Instruction: '',  # default
#     Token.Answer: '#c51162 bold',
#     Token.Question: '',
# })
style = style_from_dict({
    Token.QuestionMark: '#ff0000 bold',
    Token.Selected: '#ff0000',  # default
    Token.Pointer: '#e254ff bold',
    Token.Instruction: '',  # default
    Token.Answer: '#00c853 bold',

    Token.Question: '',
})

questions = [
    {
        'type': 'checkbox',
        'name': 'features',
        'message': 'Select the features to install',
        'choices': [
            {
                'name': 'APT packages',
                'checked': True
            },
            {
                'name': 'Snap packages',
                'checked': True
            },
            {
                'name': 'Node.JS',
                'checked': True
            },
            {
                'name': 'Python',
                'checked': True
            },
            {
                'name': 'Docker',
                'checked': True
            },
            
        ],
        'validate': lambda answer: 'You must choose at least one topping.' \
            if len(answer) == 0 else True
    }
]

def start():
    features = prompt(questions, style=style)
    pprint(features)
    # for feature in features:
    # subprocess.call("bash-script.sh", shell=True)
        


def install(feature):
    pass


if __name__ == '__main__':
    arguments = docopt(__doc__, version=__version__)
    if arguments['start']:
        start()
    else:
        print(arguments)