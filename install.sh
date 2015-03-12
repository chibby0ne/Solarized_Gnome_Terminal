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

### Get Repos ###
echo "Downloading Repos"
git submodule init
git submodule update


### Add crontab entry ###
if [[ $(crontab -l | grep -q "get_sunrise_sunset" ; echo $?) -eq 1  ]]; then
    echo "Crontab Entry: Adding"
    if [[ $# -eq 0 ]]; then
        (crontab -l; echo "@reboot cd $dir && ./get_sunrise_sunset.sh")  | crontab -
    elif [[ $# -eq 2 ]]; then
        (crontab -l; echo "@reboot cd $dir &&  ./get_sunrise_sunset.sh $country $city")  | crontab -
    fi
else
    echo "Crontab Entry: Already Added"
fi

##  Add bashrc code ##
if [[ $(grep -q "SOLARIZED_GNOME_TERMINAL script" ~/.bashrc ; echo $?) -eq 1 ]]; then
    echo "Bashrc Code: Adding"
    cat bashrc_code.sh >> ~/.bashrc
    dir=${dir//\//\\\/}             # sustitute / to \/ in dir in order for sed to work
    sed -i "s/solarized_files_dir=/&$dir/g" ~/.bashrc
else
    echo "Bashrc Code: Already Added"
fi

##  Add vimrc code ##
if [[ $(grep -q "SOLARIZED_GNOME_TERMINAL script" ~/.vimrc ; echo $?) -eq 1 ]]; then
    echo "Vimrc Code: Adding"
    cat vimrc_code.txt >> ~/.vimrc
else
    echo "Vimrc Code: Already Added"
fi

## Update time for today
echo "Updating times for today"
./get_sunrise_sunset.sh

### Installation ended ###
echo "Installation Finished"
