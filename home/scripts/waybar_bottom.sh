#!/usr/bin/bash
systemctl --user stop waybar-bottom.service 2>/dev/null
systemd-run --user --unit=waybar-bottom --collect /usr/bin/waybar -c $HOME/.config/waybar/config_bottom -s $HOME/.config/waybar/style_bottom.css
