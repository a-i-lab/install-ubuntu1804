#!/bin/bash

echo "#######################First time update########################\n"
sudo apt update
sudo apt upgrade
mkdir utils
cd utils

sudo apt install unzip git htop clang-format curl wget software-properties-common apt-transport-https python-pip python3-pip libssl-dev libffi-dev python3-dev -y

echo "#######################Downloading Cmake#######################\n"
wget https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2.tar.gz
tar xvzf cmake-3.17.2.tar.gz 
cd cmake-3.17.2
./bootstrap --system-curl
make -j4
sudo make install
cd ..

echo "#######################Downloading git lfs#######################\n"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs -y
git lfs install

echo "#######################Downloading chrome#######################\n"
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

echo "#######################Downloading typora#######################\n"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora -y

echo "#######################Downloading psensor#######################\n"
sudo apt install lm-sensors hddtemp -y
sudo sensors-detect
sensors
sudo apt install psensor -y

read -p "What is your git username? :" username
git config --global user.name "$username"
read -p "What is your git email? :" email
git config --global user.email $email
