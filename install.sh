#!/usr/bin/env bash
#
# Script di installazione automatico per Fedora (adattato per convivenza con GNOME)
# Basato sui dotfile di Riccardo Palombo per Hyprland / ThinkPad X1 OLED
#

set -e

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

echo -e "${CYAN}=== Installatore Hyprland Dotfiles per Fedora (con GNOME) ===${RESET}\n"

# 1. Verifica sistema Fedora
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" != "fedora" ]; then
        echo -e "${YELLOW}Attenzione: Questo script è progettato per Fedora Linux. Il tuo sistema risulta '$NAME'.${RESET}"
        read -p "Vuoi continuare comunque? (s/N): " confirm
        [[ "$confirm" =~ ^[sSyY]$ ]] || exit 1
    fi
fi

# 2. Installazione pacchetti DNF
echo -e "\n${GREEN}[1/5] Installazione dei pacchetti tramite DNF...${RESET}"
sudo dnf install -y \
    hyprland \
    waybar \
    foot \
    micro \
    nemo \
    nemo-fileroller \
    swaybg \
    swaylock \
    swayidle \
    brightnessctl \
    pamixer \
    mako \
    gammastep \
    grim \
    slurp \
    swappy \
    imv \
    wob \
    eza \
    jetbrains-mono-fonts-all \
    fontawesome-fonts \
    xdg-desktop-portal-hyprland \
    polkit-gnome \
    python3-requests

# 3. Installazione launcher tofi (tramite COPR se non presente)
echo -e "\n${GREEN}[2/5] Verifica / Installazione di Tofi...${RESET}"
if ! command -v tofi &>/dev/null; then
    echo "Installazione di tofi tramite repository COPR..."
    sudo dnf copr enable -y errornointernet/tofi || true
    sudo dnf install -y tofi || echo -e "${YELLOW}Nota: Se tofi non è disponibile, puoi usare rofi-wayland.${RESET}"
else
    echo "Tofi è già installato."
fi

# 4. Copia dei file di configurazione
echo -e "\n${GREEN}[3/5] Distribuzione dei file di configurazione nella tua home...${RESET}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config"
mkdir -p "$HOME/scripts"
mkdir -p "$HOME/Pictures"

# Copia .config
echo "Copia delle configurazioni in ~/.config..."
cp -r "$SCRIPT_DIR/home/.config/"* "$HOME/.config/"

# Copia script
echo "Copia degli script in ~/scripts..."
cp -r "$SCRIPT_DIR/home/scripts/"* "$HOME/scripts/"
chmod +x "$HOME/scripts/"*.sh
chmod +x "$HOME/.config/hypr/autostart"

# Copia wallpaper
echo "Copia dello sfondo in ~/Pictures..."
cp -n "$SCRIPT_DIR/home/Pictures/"* "$HOME/Pictures/" 2>/dev/null || true

# 5. Integrazione ~/.bashrc
echo -e "\n${GREEN}[4/5] Configurazione alias di shell...${RESET}"
if ! grep -q "waykill" "$HOME/.bashrc" 2>/dev/null; then
    echo -e "\nAggiunta alias consigliati a ~/.bashrc..."
    cat "$SCRIPT_DIR/home/.bashrc" >> "$HOME/.bashrc"
    echo "Alias aggiunti."
else
    echo "Alias già presenti in ~/.bashrc."
fi

echo -e "\n${GREEN}[5/5] Completato con successo!${RESET}"
echo -e "${CYAN}----------------------------------------------------------------------"
echo -e "NOTE IMPORTANTI:"
echo -e "1. Per avviare Hyprland:"
echo -e "   - Esegui il Logout da GNOME."
echo -e "   - Nella schermata di login GDM, clicca sul tuo profilo utente."
echo -e "   - Clicca sull'icona a forma di ingranaggio in basso a destra."
echo -e "   - Seleziona 'Hyprland' e inserisci la password."
echo -e "2. Monitor e Scaling:"
echo -e "   - La config è impostata originariamente con scala 1.7 per pannello OLED 2.8K."
echo -e "   - Per schermi standard 1080p o diversi, modifica ~/.config/hypr/hyprland.conf"
echo -e "     impostando la riga: monitor=,preferred,auto,1.0"
echo -e "3. GNOME rimane intatto e selezionabile in qualunque momento dal menu GDM."
echo -e "----------------------------------------------------------------------${RESET}"
