#!/usr/bin/env bash

tempdir=/tmp/temp-install
mkdir -p $tempdir

# Install breeze cursor
cd $tempdir
wget http://download.kde.org/stable/plasma/5.16.4/breeze-5.16.4.tar.xz
tar xvf breeze-5.16.4.tar.xz
sudo rm -rf /usr/share/icons/xcursor-breeze*
sudo cp -r breeze*/cursors/Breeze/Breeze /usr/share/icons/xcursor-breeze
sudo cp -r breeze*/cursors/Breeze_Snow/Breeze_Snow /usr/share/icons/xcursor-breeze-snow
sudo rm -rf /usr/share/icons/xcursor-breeze-snow/Breeze_Snow

rm -rf $tempdir
