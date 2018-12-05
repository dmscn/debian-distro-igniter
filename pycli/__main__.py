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
from docopt import docopt

__version__ = 'v0.0.1'

def start():
    print('start called')


def install(feature):
    pass


if __name__ == '__main__':
    arguments = docopt(__doc__, version=__version__)
    if arguments['start']:
        start()
    else:
        print(arguments)