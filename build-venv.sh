#!/bin/bash

set -e
set -x

cd $(dirname "${BASH_SOURCE[0]}")

PYTHON=${PYTHON:-"python"}
VENV="venv"

# build clean virtualenv
rm -rf $VENV
virtualenv --python=$PYTHON $VENV
source $VENV/bin/activate

# install standard packages
pip install --upgrade pip
pip install ipython
pip install pytest

# install package
python setup.py install

# install optional dependencies
pip install udplogger
pip install redmsg
