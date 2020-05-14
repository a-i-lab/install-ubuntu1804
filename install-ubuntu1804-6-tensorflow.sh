#!/bin/bash

DIR=$(pwd)

echo "#######################install tensorflow########################\n"
sudo apt update
sudo pip install -U pip
sudo pip install -U setuptools
sudo pip install tensorflow