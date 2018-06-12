#!/usr/bin/bash
echo "Updating and Upgrading the sistem"
sleep 15
sudo apt update && sudo apt upgrade -y
echo "Installing build-essential autoconf libtool"
sleep 15
sudo apt install build-essential autoconf libtool -y
echo "cloning https://github.com/meganz/MEGAcmd.git"
sleep 15
git clone https://github.com/meganz/MEGAcmd.git
cd MEGAcmd
git submodule update --init --recursive
echo "Installing Required libraries"
sleep 15
sudo apt install swig libcrypto++-dev libsodium-dev zlib1g-dev libsqlite3-dev libssl-dev libc-ares-dev -y
sudo apt install libcurl4-openssl-dev libfreeimage-dev libreadline-dev libpcre++-dev -y
echo "Configuring the build"
sleep 15
sh autogen.sh
./configure
echo "Make and install the package"
sleep 15
make
sudo make install