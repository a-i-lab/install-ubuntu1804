#!/bin/bash

DIR=$(pwd)

## https://github.com/weiliu89/caffe/tree/ssd

echo "#######################install caffe########################\n"
cd 
mkdir common-lib
cd common-lib
git clone https://github.com/weiliu89/caffe/tree/ssd
cd caffe
git checkout ssd
rm -rf Makefile
cp $DIR/config-files/caffe_Makefile.config Makefile.config
cp $DIR/config-files/caffe_Makefile Makefile

while true; do
    read -p "Please check your Makefile and Makefile.config and decide if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done



#download layers from
wget -O http://vision.cs.unc.edu/wliu/projects/ParseNet/VGG_ILSVRC_16_layers_fc_reduced.caffemodel