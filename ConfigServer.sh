#Enable autostart on boot for network
sed -i 's/ONBOOT=no/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-eth*
#Enable repositories
subscription-manager register --username $1 --password $2 --auto-attach
#Update the python version to 3.7.0
yum -y groupinstall development
yum -y install zlib-devel
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xJf Python-3.7.0.tar.xz
cd Python-3.7.0
./configure
make make install
