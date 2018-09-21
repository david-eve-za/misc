#Enable autostart on boot for network
#sed -i 's/ONBOOT=no/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-eth*
#Enable repositories
#subscription-manager register --username $1 --password $2 --auto-attach
#Update the python version to 3.7.0
yum autoremove python.x86_64
yum -y groupinstall development
yum -y install zlib-devel
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xJf Python-3.7.0.tar.xz
cd Python-3.7.0
./configure
make 
make install
#Download Avalon
cd ..
wget http://highqsoft.com/public/software/AvalonSuite-4.7-833-Linux64-JacORB.tgz
wget http://highqsoft.com/public/software/AvalonSuite-4.7-833-Linux64-SunORB.tgz
#Uninstall old java versions
yum autoremove java-1.6.0-openjdk.x86_64
yum autoremove java-1.7.0-openjdk.x86_64
wget http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm
