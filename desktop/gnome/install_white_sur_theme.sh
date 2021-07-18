#!/usr/bin/env zsh

source ${0:A:h}/../../env

tempdir=/tmp/temp-install
mkdir -p $tempdir

# WhiteSur theme
cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'vinceliuice/WhiteSur-gtk-theme') -O WhiteSur-gtk.tar.gz
tar -zxvf WhiteSur-gtk.tar.gz
cd WhiteSur-gtk-*
./install.sh -c light --theme blue
./tweaks.sh --firefox
./tweaks.sh --dash-to-dock
sudo ./tweaks.sh --gdm --background default
./tweaks.sh --snap

cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'vinceliuice/WhiteSur-icon-theme') -O WhiteSur-icon.tar.gz
tar -zxvf WhiteSur-icon.tar.gz
cd WhiteSur-icon-*
./install.sh --theme default

# Set themes
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-light-blue'
