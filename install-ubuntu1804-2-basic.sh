#!/bin/bash

echo "#######################First time update########################\n"
sudo apt update
sudo apt upgrade
mkdir utils
cd utils

sudo apt install git htop clang-format curl wget software-properties-common apt-transport-https python3-pip libssl-dev libffi-dev python3-dev -y

echo "#######################Downloading chrome#######################\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
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
