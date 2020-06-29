#!/bin/bash

DIR=$(pwd)

echo "#######################install tensorflow########################\n"
sudo apt update
sudo apt install python3-dev python3-pip -y
sudo pip3 install -U pip
sudo pip3 install -U launchpadlib
sudo pip3 install -U setuptools
sudo pip3 install tensorflow==2.0.0
python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"