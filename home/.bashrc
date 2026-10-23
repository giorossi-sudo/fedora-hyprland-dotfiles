#
# ~/.bashrc snippet - Hyprland / Fedora
#
[[ $- != *i* ]] && return

# Gestione alias ls con supporto prioritario per eza (Fedora)
if command -v eza &>/dev/null; then
    alias ls='eza -lgh'
    alias ll='eza -lgha'
    alias lt='eza --tree'
elif command -v exa &>/dev/null; then
    alias ls='exa -lgh'
    alias ll='exa -lgha'
    alias lt='exa --tree'
else
    alias ls='ls --color=auto -lh'
    alias ll='ls --color=auto -lha'
fi

alias conf='micro ~/.config/hypr/hyprland.conf'
alias conf-term='micro ~/.config/foot/foot.ini'
alias chx='chmod +x'
alias ddu='du -sh * | sort -hr | head -20'
alias waykill='killall waybar && ~/scripts/waybar_top.sh && ~/scripts/waybar_bottom.sh'
PS1='[\u@\h \W]\$ '
export MICRO_TRUECOLOR=1
