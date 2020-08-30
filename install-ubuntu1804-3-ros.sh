#!/usr/bin/env bash

set -euf -o pipefail

echo "#######################install ros########################\n"
sudo apt update
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y ros-melodic-desktop-full
sudo echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
source /opt/ros/melodic/setup.bash
sudo apt install -y ros-${ROS_DISTRO}-rosserial*
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
sudo apt install libpcl-dev -y
pip install -U matplotlib
catkin_make
cd ~/Arduino/libraries
source /opt/ros/melodic/setup.bash
rospack profile
rosrun rosserial_arduino make_libraries.py .
