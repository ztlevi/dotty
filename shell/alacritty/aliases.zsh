# You will need to `zinit update Users/zhot--.dotty--shell--alacritty/vivid.zsh` if you update the snippet
zinit snippet ${0:A:h}/vivid.zsh

case $(_os) in
macos) alias alacritty=/Applications/Alacritty.app/Contents/MacOS/alacritty ;;
esac
alias ot="alacritty --working-directory=."
