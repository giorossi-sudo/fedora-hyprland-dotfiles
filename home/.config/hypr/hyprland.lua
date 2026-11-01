----------------------------------------------------------------------------------------
-- Hyprland Config - Fedora GNOME Adapted (Hyprland 0.57+ Lua)
-- Basato sui dotfiles di Riccardo Palombo (ThinkPad X1 OLED)
-- Adattato per Fedora e ASUS Zenbook 14 OLED
----------------------------------------------------------------------------------------

--
-- VARIABILI D'AMBIENTE (Cruciali per la compatibilità Wayland e sessione GNOME su Fedora)
--
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("BROWSER", "firefox")
hl.env("EDITOR", "micro")
hl.env("SWAYSOCK", os.getenv("XDG_RUNTIME_DIR") or "/run/user/1000")

--
-- MONITOR (Ottimizzato per ASUS Zenbook 14 OLED 2.8K 2880x1800)
--
hl.monitor({
    output   = "eDP-1",
    mode     = "2880x1800@90",
    position = "auto",
    scale    = 1.6,
})
hl.monitor({
    output   = "",
    reserved = {-15, -15, 0, 0},
})

--
-- INPUT (Tastiera italiana e touchpad naturale)
--
hl.config({
    input = {
        kb_layout    = "it",
        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
        },
    },

    general = {
        gaps_in     = 10,
        gaps_out    = 20,
        border_size = 2,

        col = {
            inactive_border = "0xFF181818",
            active_border   = {
                colors = {"rgba(e6001277)", "rgba(18181811)", "rgba(e6001277)"},
                angle  = 30,
            },
        },

        resize_on_border = true,
    },

    decoration = {
        rounding     = 0,
        dim_inactive = false,
        dim_strength = 0.5,

        shadow = {
            enabled      = false,
            range        = 20,
            offset       = {5, 5},
            render_power = 3,
            color        = 0x33000000,
        },

        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        split_width_multiplier = 1.5,
    },

    misc = {
        disable_hyprland_logo = true,
    },
})

-- Curve di animazione personalizzate
hl.curve("overshot", { type = "bezier", points = { {0.13, 0.99}, {0.29, 1.1} } })

-- Animazioni
hl.animation({ leaf = "windows",    enabled = true, speed = 4, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "border",     enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "overshot", style = "slide" })

-- Gesti touchpad (3 dita per cambiare workspace)
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

--
-- REGOLE FINESTRE
--
hl.window_rule({
    match = { title = "fly-foot-write" },
    float = true,
})
hl.window_rule({
    match = { class = "org.kde.polkit-kde-authentication-agent-1" },
    float = true,
})
hl.window_rule({
    match = { class = "polkit-gnome-authentication-agent-1" },
    float = true,
})
hl.window_rule({
    match        = { class = "code-oss" },
    border_color = { colors = {"rgb(666666)", "rgb(000000)"} },
})
hl.window_rule({
    match        = { title = "fly-foot-write" },
    border_color = { colors = {"rgb(FFFFFF)", "rgb(000000)"} },
})

--
-- MOUSE BINDS
--
hl.bind("SUPER + SHIFT + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:272",         hl.dsp.window.resize(), { mouse = true })

--
-- SCORCIATOIE APPLICAZIONI & SISTEMA
--
local mainMod = "SUPER"
local swaysock = os.getenv("XDG_RUNTIME_DIR") or "/run/user/1000"
local wobSocket = swaysock .. ".wob"

hl.bind(mainMod .. " + RETURN",         hl.dsp.exec_cmd("footclient"))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("footclient --override=colors.background=6E1200 --title=fly-foot-tiled"))
hl.bind(mainMod .. " + SHIFT + Q",      hl.dsp.window.kill())
hl.bind(mainMod .. " + SHIFT + E",      hl.dsp.exec_cmd(os.getenv("HOME") .. "/scripts/tofi-power.sh"))
hl.bind(mainMod .. " + T",              hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + V",              hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE",          hl.dsp.exec_cmd("tofi-drun"))
hl.bind(mainMod .. " + B",              hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F",      hl.dsp.window.fullscreen({ state = 1 }))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("grim -l 1 " .. os.getenv("HOME") .. "/Pictures/$(date +'%s_grim.png') && notify-send 'Screenshot salvato!'"))

-- Navigazione finestre
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -60, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 60,  y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0,   y = -60, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0,   y = 60,  relative = true }), { repeating = true })

-- Gestione Workspaces (1 - 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, silent = true }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Tasti Multimediali (Volume, Microfono, Luminosità schermo) con OSD Wob
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -ui 5 && pamixer --get-volume > " .. wobSocket), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -ud 5 && pamixer --get-volume > " .. wobSocket), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pamixer --toggle-mute && ( pamixer --get-mute && echo 0 > " .. wobSocket .. " )"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl set 5%- | sed -En 's/.*\\(([0-9]+)%\\).*/\\1/p' > " .. wobSocket), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl set +5% | sed -En 's/.*\\(([0-9]+)%\\).*/\\1/p' > " .. wobSocket), { locked = true, repeating = true })

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/autostart")
    hl.exec_cmd("swaybg -o '*' -i " .. os.getenv("HOME") .. "/Pictures/Wallpapers/Zenbook_OLED_2880x1800.png -m fill")
end)
