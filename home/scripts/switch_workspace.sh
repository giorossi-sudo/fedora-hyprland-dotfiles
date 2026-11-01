#!/usr/bin/bash
TARGET="$1"
if [ -n "$TARGET" ]; then
    hyprctl dispatch "hl.dsp.focus({ workspace = tonumber('$TARGET') })"
fi
