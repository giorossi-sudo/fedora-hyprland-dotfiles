#!/usr/bin/bash
systemctl --user stop waybar-top.service 2>/dev/null
systemd-run --user --unit=waybar-top --collect /usr/bin/waybar -c $HOME/.config/waybar/config -s $HOME/.config/waybar/style.css
