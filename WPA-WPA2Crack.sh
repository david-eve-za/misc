#!/usr/bin/bash
apt update && apt upgrade
#Install nescesary applications
apt install aircrack-ng crunch libssl-dev libpcap0.8-dev autoconf automake build-essential cmake python-dev zlib1g-dev python-pip python-dev -y
#Download CowPatty
wget http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz
tar zxfv cowpatty-4.6.tgz
cd cowpatty-4.6
make
sudo cp cowpatty /usr/bin
sudo cp genpmk /usr/bin
cd ..
rm -vRf cowpatty-4.6*
#install Pyrit
git clone https://github.com/JPaulMora/Pyrit.git
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
pip install psycopg2
pip install scapy
cd Pyrit
python setup.py clean
python setup.py build
python setup.py install
cd ..
rm -vRf Pyrit

#$1-> ESSID
#$2-> HandShake file .cap
#crunch 8 8 -f /usr/share/crunch/charset.lst mixalpha-numeric-all | pyrit -e $1 -f -passthrourg | cowpatty -d - -r $2 - $1
