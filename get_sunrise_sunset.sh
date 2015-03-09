#!/bin/bash

# This scripts gets the hour for sunrise and sunset for the given location from the internet
# and uses it to edit .bashrc variables of sunrise and sunset, which are then used to select
# automatically which kind of solarized theme to use in terminal: light(day) or dark(night)
# Author: Antonio Gutierrez

# get country and city in lower case
country=$(echo ${1:-germany} | tr [:upper:] [:lower:])
city=$(echo ${2:-kaiserslautern} | tr [:upper:] [:lower:])

#create webpage string
website="http://www.timeanddate.com/astronomy/$country/$city"

# temporary file where the webpage will be stored
temp=$(mktemp)

# get website
rc=$(wget $website -O $temp &> /dev/null) 

# store values for sunrise/sunset
if [[ rc -eq 0 ]]; then

    # use an array to store times
    declare -a times

    # parsing magic
    for (( i = 1; i != 3; i++ )); do
        times[$i]=$(sed "s/<span\ class=three>/&\n/g" $temp | sed "s/^\([0-9]\+:[0-9]\+\).*/\1/g" | sed -n "/^[0-9]/p" | sed -n ${i}p)
    done

    # don't need the webpage anymore
    rm $temp

    #update bashrc with today's values
    sed -i "s/sunrise=.*/sunrise=10#${times[1]/:/}/g" ~/.bashrc
    sed -i "s/sunset=.*/sunset=10#${times[2]/:/}/g" ~/.bashrc

    #update vimrc with today's values
    sed -i "s/let sunrise=.*/let sunrise=\"${times[1]}\"/g" ~/.vimrc
    sed -i "s/let sunset=.*/let sunset=\"${times[2]}\"/g" ~/.vimrc

else
    echo "Error: exit code $rc"
fi
