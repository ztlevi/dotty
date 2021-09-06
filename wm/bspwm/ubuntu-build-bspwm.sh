#!/usr/bin/env zsh
source $DOTTY_CONFIG_HOME/env

tempdir=/tmp/temp-install
mkdir -p $tempdir

# rofi
sudo add-apt-repository ppa:jasonpleau/rofi -y
sudo apt-get update
sudo apt install -y rofi

# bspwm
cd $tempdir
APT_INSTALL xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

wget --no-check-certificate $(get_github_latest_release_url 'baskerville/bspwm') -O bspwm.tar.gz
tar -zxvf bspwm.tar.gz
cd $tempdir/bspwm-* && make && sudo make install
sudo cp -fp contrib/freewm/bspwm.desktop "/usr/share/xsessions"

# sxhkd
cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'baskerville/sxhkd') -O sxhkd.tar.gz
tar -zxvf sxhkd.tar.gz
cd $tempdir/sxhkd-* && make && sudo make install

# dunst
cd $tempdir
APT_INSTALL libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev
wget --no-check-certificate $(get_github_latest_release_url 'dunst-project/dunst') -O dunst.tar.gz
tar -zxvf dunst.tar.gz
export PKG_CONFIG_PATH=/usr/share/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
cd dunst-* && make && sudo make install

# maim
cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'naelstrof/slop') -O slop.tar.gz
tar xvf slop.tar.gz
cd slop-*
cmake -DCMAKE_INSTALL_PREFIX="/usr" ./
make && sudo make install

cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'naelstrof/maim') -O maim.tar.gz
tar xvf maim.tar.gz
cd maim-*
cmake -DCMAKE_INSTALL_PREFIX="/usr" ./
make && sudo make install

rm -rf $tempdir
