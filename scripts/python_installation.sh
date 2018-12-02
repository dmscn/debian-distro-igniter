#!/bin/bash

# Downloading .pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Setting PYENV_ROOT environment variable
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc

# Setting it to PATH
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

# Including the execution command on the shell script
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Restarting the shell
exec "$SHELL"