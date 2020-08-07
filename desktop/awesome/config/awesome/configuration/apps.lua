local filesystem = require("gears.filesystem")
local with_dpi = require("beautiful").xresources.apply_dpi
local get_dpi = require("beautiful").xresources.get_dpi

HOME = os.getenv("HOME")

return {
    -- List of apps to start by default on some actions
    default = {
        terminal = "alacritty",
        editor = "nvim",
        rofi_drun = "rofi -dpi " ..
            get_dpi() ..
                " -width " ..
                    with_dpi(400) .. " -show drun -theme " .. HOME .. "/.config/rofi/themes/material-sidebar.rasi",
        rofi_window = "rofi -dpi " ..
            get_dpi() ..
                " -width " ..
                    with_dpi(400) .. " -show window -theme " .. HOME .. "/.config/rofi/themes/material-center.rasi",
        lock = "i3lock-fancy-rapid 5 3",
        quake = "alacritty --title QuakeTerminal"
    },
    -- List of apps to start once on start-up
    run_on_start_up = {
        "_run compton",
        "_run blueberry-tray", -- Bluetooth tray icon
        "_run xfce4-power-manager", -- Power manager
        "_run emacs --name 'Emacs_1'",
        "_run alacritty --class 'Alacritty,Alacritty_2'",
        "_run alacritty --class 'Alacritty,Alacritty_2'",
        "_run launch-browser",
        "_run slack"
    }
}
