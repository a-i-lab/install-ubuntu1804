#!/bin/bash

DIR=$(pwd)

echo "#######################install caffe########################\n"
sudo apt update
sudo apt-get install cmake git unzip -y
sudo apt-get install libprotobuf-dev libleveldb-dev liblmdb-dev -y
sudo apt-get install libsnappy-dev libopencv-dev -y
sudo apt-get install libhdf5-serial-dev -y
sudo apt-get install protobuf-compiler -y
sudo apt-get install --no-install-recommends libboost-all-dev-y
sudo apt-get install libatlas-base-dev libopenblas-dev -y
sudo apt-get install the python3-dev-y
sudo apt-get install python3-skimage -y
sudo pip3 install pydot
sudo apt-get install graphviz -y

# wget -O caffe.zip https://github.com/Qengineering/caffe/archive/master.zip
# unzip caffe.zip
# cd caffe-master

# echo "Follow this guy instructions"
# echo "https://qengineering.eu/install-caffe-on-ubuntu-18.04-with-opencv-4.1.html"