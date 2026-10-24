# Fedora Hyprland Dotfiles (GNOME Coexistence)

Porting e adattamento per **Fedora Linux** (Fedora 40 / 41 / 42 / 44+) con **GNOME** della celebre configurazione Hyprland di **Riccardo Palombo** originariamente creata per Arch/EndeavourOS su ThinkPad X1 Carbon OLED.

> Crediti originali: [RiccardoPP/dotfiles](https://github.com/RiccardoPP/dotfiles) | [Riccardo Palombo YouTube](https://youtube.com/riccardopalombo)

---

## 🚀 Novità e Adattamenti per Fedora

Rispetto alla configurazione originale per Arch Linux, questo repository risolve tutte le incompatibilità con Fedora e consente una **convivenza pacifica e simultanea con GNOME**:

1. **Nessun conflitto con GNOME (`/etc/environment` eliminato)**:  
   Nella versione Arch le variabili globali `XDG_CURRENT_DESKTOP=Hyprland` venivano scritte in `/etc/environment`. Su Fedora questo corrompe l'avvio della sessione GNOME in GDM. In questo fork le variabili sono state spostate in sicurezza dentro `~/.config/hypr/hyprland.conf` tramite le direttive `env = ...`.
2. **Polkit nativo per Fedora**:  
   Su Fedora i binari degli agenti Polkit risiedono in `/usr/libexec/` invece di `/usr/lib/`. `autostart` utilizza prioritariamente l'agente GNOME nativo `/usr/libexec/polkit-gnome-authentication-agent-1` con fallback automatici.
3. **Pacchetti DNF e COPR**:  
   Tutti i pacchetti Arch/AUR sono stati convertiti per il gestore pacchetti Fedora (`dnf` e repository COPR per `tofi`).
4. **Passaggio da `exa` a `eza`**:  
   `exa` è deprecato; `~/.bashrc` usa automaticamente il tool moderno `eza` con supporto retrocompatibile.
5. **Gestione corretta del socket OSD wob**:  
   Configurazione standardizzata di `SWAYSOCK` su `$XDG_RUNTIME_DIR`.
6. **Supporto e compatibilità con Hyprland 0.56+**:  
   Sintassi delle window rules aggiornata (con prefisso `match:` e flag espliciti `float 1`), gestione moderna del blocco `shadow` in `decoration`, gestures e gestione della priorità dei file di configurazione con archiviazione automatica di eventuali `hyprland.lua` generati di default.

---

## 📦 Installazione Rapida

Clona il repository sul tuo sistema Fedora ed esegui lo script di installazione:

```bash
git clone https://github.com/giorossi-sudo/fedora-hyprland-dotfiles.git
cd fedora-hyprland-dotfiles
chmod +x install.sh
./install.sh
```

Lo script si occuperà automaticamente di:
- Installare tutti i pacchetti necessari tramite `dnf`.
- Abilitare COPR e installare il launcher `tofi`.
- Installare i font JetBrains Mono e FontAwesome.
- Copiare i file di configurazione in `~/.config/` e gli script in `~/scripts/`.
- Copiare lo sfondo in `~/Pictures/thinkpad-oled.jpg`.
- Aggiungere gli alias utili in `~/.bashrc`.

---

## 🖥️ Configurazione Monitor & Display

La configurazione predefinita include le impostazioni calibrate per lo schermo OLED 2.8K (2880×1800) del ThinkPad X1:
```ini
monitor=,preferred,auto,1.7
monitor=,addreserved,-15,-15,0,0
```

Se utilizzi un display con risoluzione differente (es. Full HD 1920×1080 standard):
1. Apri `~/.config/hypr/hyprland.conf`.
2. Modifica la riga monitor impostando la scala desiderata (es. `1.0`):
   ```ini
   monitor=,preferred,auto,1.0
   ```

---

## ⌨️ Scorciatoie Principali (Keybindings)

| Scorciatoia | Azione |
| :--- | :--- |
| `Super + Invio` | Terminale Foot (`footclient`) |
| `Super + Shift + Invio` | Terminale Foot flottante con bordo rosso |
| `Super + Spazio` | Menu Applicazioni (`tofi-drun`) |
| `Super + Shift + E` | Menu Sessione / Spegnimento (`Logout`, `Reboot`, `Suspend`, `Shutdown`) |
| `Super + T` | File Manager Nemo |
| `Super + V` | Attiva/disattiva finestra flottante |
| `Super + F` | Schermo intero (Fullscreen) |
| `Super + Shift + Q` | Chiudi finestra attiva |
| `Super + B` | Nascondi/Mostra barre Waybar |
| `Stamp (Print)` | Screenshot rapido salvato in `~/Pictures/` |
| `Volume / Luminosità` | Tasti funzione multimediali con barra a schermo Wob |

---

## 🔄 Selezione Sessione (GNOME / Hyprland)

Puoi passare da GNOME a Hyprland in qualunque momento:
1. Effettua il **Logout**.
2. Nella schermata di login GDM, seleziona il tuo utente.
3. Clicca sull'icona dell'ingranaggio **⚙️** in basso a destra.
4. Scegli **Hyprland** o **GNOME**.
5. Inserisci la password e accedi.

---

## 📄 Licenza

Rilasciato sotto licenza MIT. Consulta il file [LICENSE](LICENSE) per i dettagli.
