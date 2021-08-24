#!/usr/bin/env zsh
# Install nerd fonts
mkdir -p $XDG_DATA_HOME/fonts/
local nerd_fonts_version="2.1.0"
(
  cd $XDG_DATA_HOME/fonts/
  # Firacode
  font_types=("Regular" "Medium" "Bold" "Light")
  for font_type in ${font_types[@]}; do
    curl -fLo "FiraCode $font_type Nerd Font Complete Mono.otf" \
      https://github.com/ryanoasis/nerd-fonts/raw/$nerd_fonts_version/patched-fonts/FiraCode/$font_type/complete/Fira%20Code%20$font_type%20Nerd%20Font%20Complete%20Mono.otf
    curl -fLo "FiraCode $font_type Nerd Font Complete.otf" \
      https://github.com/ryanoasis/nerd-fonts/raw/$nerd_fonts_version/patched-fonts/FiraCode/$font_type/complete/Fira%20Code%20$font_type%20Nerd%20Font%20Complete.otf
  done
  # UbuntuMono
  curl -fLo "UbuntuMono Regular Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/$nerd_fonts_version/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
  curl -fLo "UbuntuMono Italic Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/$nerd_fonts_version/patched-fonts/UbuntuMono/Regular-Italic/complete/Ubuntu%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
  curl -fLo "UbuntuMono Bold Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/$nerd_fonts_version/patched-fonts/UbuntuMono/Bold/complete/Ubuntu%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
  curl -fLo "UbuntuMono Bold Italic Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/$nerd_fonts_version/patched-fonts/UbuntuMono/Bold-Italic/complete/Ubuntu%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
)
