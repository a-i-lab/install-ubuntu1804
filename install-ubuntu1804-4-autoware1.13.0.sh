#!/bin/bash
#https://github.com/Autoware-AI/autoware.ai/wiki/Source-Build

DIR=$(pwd)

echo "#######################install autoware########################\n"
sudo apt update
sudo apt upgrade -y
sudo apt install -y python-catkin-pkg python-rosdep ros-$ROS_DISTRO-catkin
sudo apt install -y python3-pip python3-colcon-common-extensions python3-setuptools python3-vcstool
pip3 install -U setuptools
python -m pip install tornado
pip install bson
mkdir utils
cd utils
wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz
mkdir eigen && tar --strip-components=1 -xzvf 3.3.7.tar.gz -C eigen
cd eigen && mkdir build && cd build && cmake .. && make && sudo make install

cd
mkdir -p autoware.ai
cd autoware.ai
mkdir src
wget -O autoware.ai.repos "https://raw.githubusercontent.com/Autoware-AI/autoware.ai/1.13.0/autoware.ai.repos"
vcs import src < autoware.ai.repos
rosdep update
rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO
AUTOWARE_COMPILE_WITH_CUDA=1 colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

while true; do
    read -p "Please check if it worked, see this file for more troubleshooting tips. if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# if you face build issues with 'undefined reference to cv', follow this: https://github.com/autowarefoundation/autoware/pull/2090/commits/63abbb1c4d26be67ea0312b04b6dd9918cef3978
# so you need to add ${OpenCV_LIBS} to target_link_libraries of calibration_publisher CMakeLists.txt inside

# if you see something is not a member of cv, it means the autoware src is not using the updated cv naming, check online on what is the new naming

cd
mkdir -p lgsvl_ws/my_src/src
cd lgsvl_ws/my_src/src
git clone https://github.com/a-i-lab/lgsvl_startup.git
cd ..
catkin_make

pip install pymongo
sudo apt install libvulkan1
