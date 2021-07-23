source $DOTTY_HOME/desktop/general/aliases.zsh

if _is_callable xdg-open; then
  alias oo="xdg-open . >/dev/null &"
  alias soo="sudo xdg-open . >/dev/null &"
elif _is_callable xdg-open; then
  alias oo="gvfs-open . >/dev/null &"
  alias soo="sudo gvfs-open . >/dev/null &"
fi

# Dump all config: dconf dump / >~/Downloads/user.conf
dconf-dump-gnome() {
  dconf dump /org/gnome/shell/extensions/dash-to-dock/ >$DOTTY_HOME/desktop/gnome/dconf/dash-to-dock.conf
  dconf dump /org/gnome/terminal/legacy/ >$DOTTY_HOME/desktop/gnome/dconf/gnome.conf
  dconf dump /org/gnome/settings-daemon/plugins/media-keys/ >$DOTTY_HOME/desktop/gnome/dconf/media-keys.conf
  dconf dump /org/gnome/desktop/wm/ >$DOTTY_HOME/desktop/gnome/dconf/wm.conf
  dconf dump /org/gnome/mutter/keybindings/ >$DOTTY_HOME/desktop/gnome/dconf/mutter-keys.conf
  dconf dump /org/gnome/shell/extensions/gtile/ >$DOTTY_HOME/desktop/gnome/dconf/gtile.conf
}

dconf-load-gnome() {
  # Dconf load dash-to-dock
  dconf reset -f /org/gnome/shell/extensions/dash-to-dock/
  dconf load /org/gnome/shell/extensions/dash-to-dock/ <$DOTTY_HOME/desktop/gnome/dconf/dash-to-dock.conf
  # Dconf load Gnome terminal config...
  dconf reset -f /org/gnome/terminal/legacy/
  dconf load /org/gnome/terminal/legacy/ <$DOTTY_HOME/desktop/gnome/dconf/gnome.conf
  # Dconf load Gnome keybindings...
  dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/
  dconf load /org/gnome/settings-daemon/plugins/media-keys/ <$DOTTY_HOME/desktop/gnome/dconf/media-keys.conf
  dconf reset -f /org/gnome/desktop/wm/
  dconf load /org/gnome/desktop/wm/ <$DOTTY_HOME/desktop/gnome/dconf/wm.conf
  dconf reset -f /org/gnome/mutter/keybindings/
  dconf load /org/gnome/mutter/keybindings/ <$DOTTY_HOME/desktop/gnome/dconf/mutter-keys.conf
  dconf reset -f /org/gnome/shell/extensions/gtile/
  dconf load /org/gnome/shell/extensions/gtile/ <$DOTTY_HOME/desktop/gnome/dconf/gtile.conf
}
