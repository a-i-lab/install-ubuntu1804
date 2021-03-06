# #!/bin/bash

DIR=$(pwd)

echo "#######################install opencv########################\n"

while true; do
    read -p "Please reboot system first before proceeding. if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install build-essential cmake git unzip pkg-config -y

sudo apt-get install libjpeg-dev libpng-dev libtiff-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev -y
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt-get install libavresample-dev libvorbis-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install libgtk2.0-dev libcanberra-gtk* libgtk-3-dev -y
sudo apt-get install x264 libxvidcore-dev libx264-dev libgtk-3-dev -y
sudo apt-get install python3-dev python3.6-dev python3-numpy python3-pip -y
sudo apt-get install python3-testresources -y
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev -y
sudo apt-get install libv4l-dev v4l-utils -y
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
sudo apt-get install libxine2-dev -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt-get update
sudo apt-get install libjasper-dev -y
sudo apt-get install libopenblas-dev libatlas-base-dev libblas-dev -y
sudo apt-get install liblapack-dev gfortran -y
sudo apt-get install libhdf5-dev protobuf-compiler -y
sudo apt-get install libprotobuf-dev libgoogle-glog-dev libgflags-dev -y

cd $DIR
cd utils
OPEN_CV_VER=3.4.10

wget -O opencv.zip https://github.com/opencv/opencv/archive/$OPEN_CV_VER.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPEN_CV_VER.zip

unzip opencv.zip
unzip opencv_contrib.zip
sudo mv opencv-$OPEN_CV_VER opencv
sudo mv opencv_contrib-$OPEN_CV_VER opencv_contrib
cd opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_TIFF=ON \
        -D WITH_FFMPEG=ON \
        -D WITH_GSTREAMER=ON \
        -D WITH_TBB=ON \
        -D BUILD_TBB=ON \
        -D WITH_EIGEN=ON \
        -D WITH_V4L=ON \
        -D WITH_LIBV4L=ON \
        -D WITH_VTK=OFF \
        -D WITH_OPENGL=ON \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D INSTALL_C_EXAMPLES=OFF \
        -D INSTALL_PYTHON_EXAMPLES=OFF \
        -D BUILD_NEW_PYTHON_SUPPORT=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D BUILD_TESTS=OFF \
        -D BUILD_EXAMPLES=OFF \
        -D WITH_CUDA=ON \
        -D ENABLE_FAST_MATH=ON \
        -D CUDA_FAST_MATH=ON \
        -D WITH_CUBLAS=ON \
        -D BUILD_opencv_cudacodec=OFF ..

# -D ENABLE_PRECOMPILED_HEADERS=OFF

make -j4

while true; do
    read -p "please check if make is ok. if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo make install
sudo ldconfig
sudo apt-get update