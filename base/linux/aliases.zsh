if [[ $(_os) == 'linux-arch' ]]; then
  zinit wait lucid for OMZP::archlinux
elif [[ $(_os) == 'linux-debian' ]]; then
  zinit wait lucid for OMZP::ubuntu
elif [[ $(_os) == 'linux-RHEL' ]]; then
  zinit wait lucid for OMZP::yum
fi

alias sc=systemctl
alias jc=journalctl
alias ssc='sudo systemctl'
alias ufw='sudo ufw'

alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'

if _is_callable brew; then
  alias bubu='brew update && brew outdated && brew upgrade && brew cleanup'
fi

# Clipboard pipes
if _is_callable xclip; then
  alias y='xclip -selection clipboard -in'
  alias p='xclip -selection clipboard -out'
elif _is_callable xsel; then
  alias y='xsel -i --clipboard'
  alias p='xsel -o --clipboard'
fi

function ppalist() {
  for APT in $(find /etc/apt/ -name \*.list); do
    grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY; do
      CURRENT_USER=$(echo $ENTRY | cut -d/ -f4)
      PPA=$(echo $ENTRY | cut -d/ -f5)
      echo sudo apt-add-repository ppa:$CURRENT_USER/$PPA
    done
  done
}
