#!/usr/bin/env bash

set -euf -o pipefail

echo "#######################First time update########################\n"
sudo add-apt-repository ppa:bluetooth/bluez
sudo apt update
sudo apt upgrade
mkdir utils
cd utils

sudo apt install unzip git htop clang-format curl wget software-properties-common apt-transport-https python-pip python3-pip libssl-dev libffi-dev python3-dev zlib1g-dev libcurl4-openssl-dev iperf3 bmon -y

echo "#######################Downloading Cmake#######################\n"

while true; do
    read -p "Please download cmake first from their website and put it under utils/cmake-3.17.3 if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd cmake-3.17.3
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

sudo add-apt-repository universe -y
sudo apt update -y
sudo apt install exfat-fuse exfat-utils -y

read -p "What is your git username? :" username
git config --global user.name "$username"
read -p "What is your git email? :" email
git config --global user.email $email

while true; do
    read -p "Wireshark will be installed next. Press yes when prompted later on setting up wireshark as root. if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo apt install wireshark -y
sudo usermod -aG wireshark $(whoami)

while true; do
    read -p "System will reboot now. if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo reboot