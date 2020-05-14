#!/bin/bash

DIR=$(pwd)

echo "#######################install caffe########################\n"
sudo apt update
sudo apt-get install cmake git unzip
sudo apt-get install libprotobuf-dev libleveldb-dev liblmdb-dev
sudo apt-get install libsnappy-dev libopencv-dev
sudo apt-get install libhdf5-serial-dev
sudo apt-get install protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install libatlas-base-dev libopenblas-dev
sudo apt-get install the python3-dev
sudo apt-get install python3-skimage
sudo pip3 install pydot
sudo apt-get install graphviz

wget -O caffe.zip https://github.com/Qengineering/caffe/archive/master.zip
unzip caffe.zip
cd caffe-master

echo "Follow this guy instructions"
echo "https://qengineering.eu/install-caffe-on-ubuntu-18.04-with-opencv-4.1.html"