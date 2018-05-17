#!/usr/bin/bash
apt update && apt upgrade
#Install nescesary applications
apt install aircrack-ng crunch libssl-dev libpcap0.8-dev autoconf automake build-essential cmake -y
#Download CowPatty
wget http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz
tar zxfv cowpatty-4.6.tgz
cd cowpatty-4.6
make cowpatty
sudo cp cowpatty /usr/bin

