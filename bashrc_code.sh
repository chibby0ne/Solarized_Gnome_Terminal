
## THIS CODE WAS ADDED BY SOLARIZED_GNOME_TERMINAL script ##
## FOR CORRECT BEHAVIOUR DO NOT MODIFY ##

# getting time and setting dark or light theme
solarized_files_dir=
sunrise=10#08
sunset=10#16
time=$(date +%k%M)


if [[ sunrise -le time && time -lt sunset ]]; then
    $solarized_files_dir/gnome-terminal-colors-solarized/set_light.sh
    eval $(dircolors $solarized_files_dir/dircolors-solarized/dircolors.ansi-light)
else
    $solarized_files_dir/gnome-terminal-colors-solarized/set_dark.sh
    eval $(dircolors $solarized_files_dir/dircolors-solarized/dircolors.ansi-dark)
fi
