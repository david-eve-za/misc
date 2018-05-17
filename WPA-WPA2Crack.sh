#!/usr/bin/bash
apt update && apt upgrade
#Install nescesary applications
apt install aircrack-ng crunch libssl-dev libpcap0.8-dev autoconf automake build-essential cmake python-dev zlib-devel -y
#Download CowPatty
wget http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz
tar zxfv cowpatty-4.6.tgz
cd cowpatty-4.6
make cowpatty
sudo cp cowpatty /usr/bin
#install Pyrit
git clone https://github.com/JPaulMora/Pyrit.git
pip install psycopg2
pip install scapy
cd Pyrit
python setup.py clean
python setup.py build
python setup.py install
