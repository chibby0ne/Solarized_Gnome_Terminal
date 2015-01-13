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

### Get Repos ####
# echo "Downloading additional Repos"

# # Solarized for Gnome Terminal 
# git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git &> /dev/null

# # Color ls 
# git clone https://github.com/seebi/dircolors-solarized.git &> /dev/null

### Add crontab entry ###
echo "Adding crontab entry"

if [[ $# -eq 0 ]]; then
    (crontab -l; echo "00 12 * * * cd $dir && ./get_sunrise_sunset.sh")  | crontab -
elif [[ $# -eq 2 ]]; then
    (crontab -l; echo "00 12 * * * cd $dir &&  ./get_sunrise_sunset.sh $country $city")  | crontab -
fi

##  Add bashrc code ##
echo "Adding bashrc code"
cat bashrc_code.sh >> ~/.bashrc
dir=${dir//\//\\\/}             # sustitute / to \/ in dir in order for sed to work
sed -i "s/solarized_files_dir=/&$dir/g" ~/.bashrc

### Installation ended ###
echo "Installation Finished"
