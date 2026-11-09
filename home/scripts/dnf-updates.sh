#!/bin/bash

if [ "$1" = "upgrade" ]; then
    footclient --override=colors.background=0044D0 --override=colors.foreground=FFFFFF --title=fly-foot-write bash -c 'sudo dnf upgrade --refresh; echo ""; read -r -p "Premi Invio per chiudere..." _'
    pkill -RTMIN+8 waybar 2>/dev/null || true
else
    if command -v jq >/dev/null 2>&1; then
        count=$(dnf check-update --json 2>/dev/null | jq -r '.upgrades | length // 0' 2>/dev/null)
    else
        count=$(dnf check-update -q 2>/dev/null | grep -v -E '^$|^Upgrades' | wc -l)
    fi
    echo "${count:-0}"
fi
