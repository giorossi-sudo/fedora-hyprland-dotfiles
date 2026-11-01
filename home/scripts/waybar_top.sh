#!/usr/bin/bash
#
# Riccardo Palombo - https://riccardo.im
# Preparato per la community Patreon: patreon.com/riccardopalombo
# 

killall -q -o 1s -w waybar 2>/dev/null
waybar -c $HOME/.config/waybar/config -s $HOME/.config/waybar/style.css &
