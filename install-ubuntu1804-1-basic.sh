#!/bin/bash

echo "#######################First time update########################\n"
sudo apt update
sudo apt upgrade
mkdir utils
cd utils

sudo apt install git clang-format curl

echo "#######################Downloading vscode#######################\n"
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

echo "#######################Downloading typora#######################\n"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

echo "#######################Downloading psensor#######################\n"
sudo apt install lm-sensors hddtemp
sudo sensors-detect
sensors
sudo apt install psensor

# sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
# sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
# sudo apt-get update
# sudo apt-get install cuda-10-0
# wget http://developer.download.nvidia.com/compute/cuda/10.0/Prod/patches/1/cuda-repo-ubuntu1804-10-0-local-nvjpeg-update-1_1.0-1_amd64.deb
# sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-nvjpeg-update-1_1.0-1_amd64.deb

#mkdir utils
#mkdir catkin_ws/src
#cd catkin_ws/src

# wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
