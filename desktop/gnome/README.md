# misc/gnome

## Theme setup

- Gnome:
  - [Gnome user theme extension](https://extensions.gnome.org/extension/19/user-themes/).
  - [gTile](https://extensions.gnome.org/extension/28/gtile/) Tile windows on a grid
  - [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/) is an alternative to
    the default dock.
- [Imporve Font Rendering](https://wiki.manjaro.org/index.php?title=Improve_Font_Rendering)

## Gnome interface scale

```sh
gsettings set org.gnome.desktop.interface scaling-factor 2
```

## For Ubuntu

You need to disable HUD (alt key) from `Keyboard->Shortcut->Launchers->Keys to show the HUD`. Or set
the HUD key to super.

## Apps

Control center: See `~/.config/dotty/config/desktop/bspwm/bin/settings` Software update manager:
`sudo /usr/bin/python3 /usr/bin/update-manager` Software updates app: `sudo software-properties-gtk`
