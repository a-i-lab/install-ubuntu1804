#!/usr/bin/env bash

set -euf -o pipefail

# This line will only work in scripts and not sourced bash scripts.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo "#######################install lgsvl python api########################\n"

git clone https://github.com/lgsvl/PythonAPI $SCRIPTPATH/utils/lgsvl-python-api
cd $SCRIPTPATH/utils/lgsvl-python-api
sudo pip3 install --user .

git clone https://github.com/a-i-lab/lgsvl_scenario $HOME/lgsvl_ws/lgsvl_scenario
