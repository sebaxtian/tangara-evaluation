#!/bin/bash

#
# Install and setup poetry:
# https://python-poetry.org/docs/#installing-with-the-official-installer
#

# previously install python-is-python3
# sudo apt install python-is-python3
curl -sSL https://install.python-poetry.org | python -
export PATH="$HOME/.local/bin:$PATH"
# Also add it to .bashrc
# export PATH="$HOME/.local/bin:$PATH"
poetry --version
poetry completions bash >> ~/.bash_completion
poetry config virtualenvs.in-project true
poetry init
poetry install --no-root
