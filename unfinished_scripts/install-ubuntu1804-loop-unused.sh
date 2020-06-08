# #!/bin/bash

# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# filenames=(
#   install-ubuntu1804-1-basic.sh
#   install-ubuntu1804-2-ros.sh
# )

# for filename in "${filenames[@]}"; do
#   echo "#####################################"
#   echo "#####################################"
#   while true; do
#     read -p "$filename Do you wish to install this program?" yn
#     case $yn in
#         [Yy]* ) break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
#   done
#   cd DIR
#   sudo chmod +x $filename
#   sudo ./$filename
# done
