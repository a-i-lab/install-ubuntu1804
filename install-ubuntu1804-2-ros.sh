#!/bin/bash

echo "#######################install ros########################\n"
sudo apt update
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop-full
sudo echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
sudo apt install ros-${ROS_DISTRO}-rosserial ros-${ROS_DISTRO}-rosserial-server
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
catkin_make