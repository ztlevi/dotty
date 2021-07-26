#!/usr/bin/env zsh
source $DOTTY_CONFIG_HOME/env

tempdir=/tmp/temp-install
mkdir -p $tempdir

# Polybar
cd $tempdir
sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev \
  libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev \
  libxcb-ewmh-dev libxcb-icccm4-dev libiw-dev
sudo apt install -y libxcb-xkb-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev \
  libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
wget --no-check-certificate $(get_github_latest_release_url 'polybar/polybar') -O polybar.tar
tar xvf polybar.tar
cd $tempdir/polybar && sudo ./build.sh -f --all-features --gcc

rm -rf $tempdir
