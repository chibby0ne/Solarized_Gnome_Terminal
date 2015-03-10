#Solarized for Gnome complete installation script

A simple script that downloads all the repositories needed to install and correctly use the famous and excellent [solarized colorscheme](http://ethanschoonover.com/solarized) for the Gnome Terminal and vim, and sets up a cron job to automatically change between dark and light version of the solarized colorscheme depending on when the sunrise and sunset is on your indicated location and the time of the year.

Pretty cool huh? :) 


## Requirements 

* [vim](http://www.vim.org)
* [git... Don't you have it already?](http://git-scm.com/downloads)
* [wget](https://www.gnu.org/software/wget/)
* Bash
* dconf-cli

## Installation

``` bash
git clone https://www.github.com/chibby0ne/Solarized_Gnome_Terminal
cd Solarized_Gnome_Terminal/
./install.sh [COUNTRY] [CITY]
```

`[COUNTRY]` and `[CITY]` are optional parameters.
Default parameters of script are: Germany Kaiserslautern.

**NOTE**: If you're using a different location than the default one (and you probably are), give all TWO parameters as they are needed to disambiguate location and simplicity of script.


## Usage 

It's all taken care for in the background by crontab and the script `get_sunrise_sunset.sh`. Isn't that awesome? 

The background colors theme as well as the color shown by the shell command `ls` can only change when `.bashrc` is sourced, therefore only after passing the sunset(to dark) or sunrise(to light) time when opening a new terminal do they change. The same applies for vim; the background can only change when opening a new vim session because `.vimrc` is reread with the new values of sunrise/sunset.

## Future improvements

- [x] Work with submodules so that the downloaded repos can be updated when this one is updated
- [x] Use minutes for more precision (not sure how relevant as the switch is not necessarily made immediately after sunset but when opening or sourcing .bashrc)
- [x] Include vimrc code, as there's vimrc sunrise/sunset time update
- [x] Installation script should check if the .rc files already have the code added to them so that the code is not added appended more than once

## License

This project is licensed under the [GNU GPLv2](LICENSE)

## Copyright 

Copyright © 2014 Antonio Gutierrez

## Thanks

We stand on the shoulders of giants. 
Thanks to [seebi](https://github.com/seebi), [Anthony25](https://github.com/Anthony25) and of course [altercation](https://github.com/altercation)
