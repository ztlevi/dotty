alias ot="tilix ."
dconf-dump-tilix() {
  dconf dump /com/gexperts/Tilix/ >$DOTFILES/shell/tilix/dconf/tilix.conf
}

# Tilix fix: https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ -e /etc/profile.d/vte.sh ] && ([ $TILIX_ID ] || [ $VTE_VERSION ]); then
  source /etc/profile.d/vte.sh
fi
