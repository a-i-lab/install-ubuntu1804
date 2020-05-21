# #!/bin/bash
# https://gist.github.com/Mahedi-61/2a2f1579d4271717d421065168ce6a73
echo "#######################install nvidia########################\n"
sudo apt-get purge nvidia* -y
sudo apt remove nvidia-* -y
sudo rm /etc/apt/sources.list.d/cuda*
sudo apt-get autoremove && sudo apt-get autoclean -y
sudo rm -rf /usr/local/cuda*


### to verify your gpu is cuda enable check
lspci | grep -i nvidia

### gcc compiler is required for development using the cuda toolkit. to verify the version of gcc install enter
gcc --version

# system update
sudo apt-get update
sudo apt-get upgrade -y


# install other import packages
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y


# first get the PPA repository driver
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update -y

 # installing CUDA-10.0
sudo apt-get -o Dpkg::Options::="--force-overwrite" install cuda-10-0 cuda-drivers -y

echo 'export PATH=/usr/local/cuda-10.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

mkdir utils
cd utils
# install cudnn https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html
CUDNN_TAR_FILE="cudnn-10.0-linux-x64-v7.6.5.32.tgz"

while true; do
    read -p "Please download cudnn from nvidia website and unzip it before proceeding, there should be a folder called 'cuda' inside utils after you unzip it. if you want to continue [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

cd ..
mkdir cuda-testing
cp -a /usr/local/cuda-10.0/samples  cuda-testing/
cd cuda-testing/samples
make -k -j4

cd bin/x86_64/linux/release
nvcc -V
source ~/.bashrc
./deviceQuery
