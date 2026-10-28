# Fedora Hyprland Dotfiles (ASUS Zenbook 14 & GNOME Coexistence)

Porting e adattamento per **Fedora Linux** (Fedora 40 / 41 / 42 / 44+) con **GNOME** della celebre configurazione Hyprland di **Riccardo Palombo**, ottimizzata e aggiornata su misura per **ASUS Zenbook 14 OLED** (display 2.8K @ 90Hz).

> Crediti originali: [RiccardoPP/dotfiles](https://github.com/RiccardoPP/dotfiles) (creata per Arch/EndeavourOS su ThinkPad X1) | [Riccardo Palombo YouTube](https://youtube.com/riccardopalombo)

---

## 🚀 Novità e Adattamenti

Rispetto alla configurazione originale per Arch Linux/ThinkPad, questo repository include tutte le modifiche per **Fedora**, la **convivenza pacifica e simultanea con GNOME** e l'ottimizzazione per **ASUS Zenbook 14 OLED**:

1. **Ottimizzazione ASUS Zenbook 14 OLED (2.8K 90Hz & Touchpad)**:  
   - Calibrazione monitor nativa su display OLED `2880x1800` a `90Hz` con scaling consigliato a `1.6` (`eDP-1`).
   - Touchpad ottimizzato con `natural_scroll = yes`, `tap-to-click = yes` e gesture multi-touch a 3 dita per il cambio rapido dei workspace.
   - Rimozione delle direttive specifiche per il TrackPoint ThinkPad.
2. **Nessun conflitto con GNOME (`/etc/environment` eliminato)**:  
   Nella versione Arch le variabili globali `XDG_CURRENT_DESKTOP=Hyprland` venivano scritte in `/etc/environment`. Su Fedora questo corrompe l'avvio della sessione GNOME in GDM. In questo fork le variabili sono state spostate in sicurezza dentro `~/.config/hypr/hyprland.conf` tramite le direttive `env = ...`.
3. **Polkit nativo per Fedora con fallback universale**:  
   Su Fedora i binari degli agenti Polkit risiedono in `/usr/libexec/`. `autostart` include un fallback a cascata compatibile con MATE, GNOME e KDE (`polkit-mate`, `polkit-gnome`, `polkit-kde`).
4. **Pacchetti DNF e COPR**:  
   Tutti i pacchetti Arch/AUR sono stati convertiti per il gestore pacchetti Fedora (`dnf` e repository COPR per `tofi`).
5. **Passaggio da `exa` a `eza`**:  
   `exa` è deprecato; `~/.bashrc` usa automaticamente il tool moderno `eza` con supporto retrocompatibile.
6. **Gestione corretta del socket OSD wob**:  
   Configurazione standardizzata di `SWAYSOCK` su `$XDG_RUNTIME_DIR`.
7. **Supporto e compatibilità con Hyprland 0.56+**:  
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

La configurazione predefinita è calibrata per lo schermo OLED 2.8K (2880×1800 a 90Hz) dell'**ASUS Zenbook 14 OLED**:
```ini
monitor=eDP-1,2880x1800@90,auto,1.6
monitor=,addreserved,-15,-15,0,0
```

Se utilizzi un display esterno o un monitor con risoluzione differente (es. Full HD 1920×1080 standard):
1. Apri `~/.config/hypr/hyprland.conf`.
2. Modifica o aggiungi la riga monitor impostando la risoluzione e la scala desiderata (es. `1.0`):
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
