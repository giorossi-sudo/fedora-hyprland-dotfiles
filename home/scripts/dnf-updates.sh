#!/bin/sh
if [ "$1" = "upgrade" ]; then
    footclient --override=colors.background=0044D0 --override=colors.foreground=FFFFFF --title=fly-foot-write sudo dnf upgrade
    pkill -RTMIN+8 waybar 2>/dev/null || true
else
    count=$(dnf check-update -q 2>/dev/null | grep -v '^$' | wc -l)
    echo "$count"
fi
