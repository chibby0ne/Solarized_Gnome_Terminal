#!/bin/bash

# This script acts as an installer
#Author: Antonio Gutierrez

dir=$(pwd)

if [[ $# -eq 0 ]]; then
    country=germany
    city=kaiseerslautern
elif [[ $# -eq 2 ]]; then
    country=$1
    city=$2
else
    echo "Error. Must specify two arguments: country city or no arguments (uses defaults i.e: germany kaiserslautern)"
    exit
fi

### Beginning Instalation ###
echo "Installating..."

### Add crontab entry ###
if [[ $(crontab -l | grep -q "get_sunrise_sunset" ; echo $?) -eq 1  ]]; then
    echo "Crontab Entry: Adding"
    if [[ $# -eq 0 ]]; then
        (crontab -l; echo "00 12 * * * cd $dir && ./get_sunrise_sunset.sh")  | crontab -
    elif [[ $# -eq 2 ]]; then
        (crontab -l; echo "00 12 * * * cd $dir &&  ./get_sunrise_sunset.sh $country $city")  | crontab -
    fi
else
    echo "Crontab Entry: Already Added"
fi

##  Add bashrc code ##
if [[ $(grep -q "solarized_files_dir" ~/.bashrc ; echo $?) -eq 1 ]]; then
    echo "Bashrc Code: Adding"
    cat bashrc_code.sh >> ~/.bashrc
    dir=${dir//\//\\\/}             # sustitute / to \/ in dir in order for sed to work
    sed -i "s/solarized_files_dir=/&$dir/g" ~/.bashrc
else
    echo "Bashrc Code: Already Added"
fi

### Installation ended ###
echo "Installation Finished"
