#!/bin/bash

DIR=$(pwd)

echo "#######################install autoware########################\n"
sudo apt update
sudo apt upgrade -y
sudo apt install -y python-catkin-pkg python-rosdep ros-$ROS_DISTRO-catkin
sudo apt install -y python3-pip python3-colcon-common-extensions python3-setuptools python3-vcstool
pip3 install -U setuptools
cd utils
wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz
mkdir eigen && tar --strip-components=1 -xzvf 3.3.7.tar.gz -C eigen
cd eigen && mkdir build && cd build && cmake .. && make && make install