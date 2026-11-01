#!/usr/bin/bash
systemd-run --user --unit=waybar-top --collect /usr/bin/waybar -c $HOME/.config/waybar/config -s $HOME/.config/waybar/style.css
