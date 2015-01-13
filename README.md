#Solarized for Gnome complete installation script

A simple script that downloads all the repositories needed to install and correctly utilize the famous and excellent solarized theme for the Gnome Terminal, and sets up a cron job to automatically change between dark and light version of the solarized colorscheme depending on when the sunrise and sunset is on your indicated location and the time of the year.

Pretty cool huh? :) 


## Requirements 

* [git... Don't you have it already?](http://git-scm.com/downloads)
* [wget](https://www.gnu.org/software/wget/)
* Bash
* dconf-cli

## Installation

``` bash
git clone https://www.github.com/chibby0ne/Solarized_Gnome_Terminal
cd Solarized_Gnome_Terminal/
git submodule init
git submodule update
./install.sh [COUNTRY] [CITY]
```

`[COUNTRY]` and `[CITY]` are optional parameters.
Default parameters of script is: Germany Kaiserslautern.

**NOTE**: If you're using a different location than the default one (and you probably are), give all TWO parameters as they are needed to disambiguate location and simplicity of script.


## Usage 

It's all taken care for in the background by crontab and the script `get_sunrise_sunset.sh`. Isn't that awesome? 

The background colors theme as well as the color shown by the shell command `ls` only changes when opening a new terminal or opening a new terminal, after the passing the sunset(to dark) or sunrise(to light) time.

## Future improvements

- [X] Work with submodules so that the downloaded repos can be updated when this one is updated
- [ ] Use minutes for more precision (not sure how relevant as the switch is not necessarily made immediately after sunset but when opening or sourcing .bashrc)
- [ ] Include vimrc code, as there's vimrc sunrise/sunset time update
- [X] Installation script should check if the .rc files already have the code added to them so that the code is not added appended more than once

## License

This project is licensed under the [GNU GPLv2](LICENSE)

## Copyright 

Copyright © 2014 Antonio Gutierrez

## Thanks

We stand on the shoulders of giants. 
Thanks to [seebi](https://github.com/seebi), [Anthony25](https://github.com/Anthony25) and of course [altercation](https://github.com/altercation)
