#Enable autostart on boot for network
#sed -i 's/ONBOOT=no/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-eth*
#Enable repositories
#subscription-manager register --username $1 --password $2 --auto-attach
#Update the python version to 3.7.0
yum erase python.x86_64
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
yum erase java-1.6.0-openjdk.x86_64
yum erase java-1.7.0-openjdk.x86_64
#Install new Java Version
cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz"
tar xzf jdk-8u181-linux-x64.tar.gz
rm jdk-8u181-linux-x64.tar.gz
cd /opt/jdk1.8.0_181/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_181/bin/java 2
alternatives --config java
#Install derby database
wget http://apache.mirrors.pair.com//db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-bin.tar.gz
mkdir /opt/Apache
cp db-derby-10.14.2.0-bin.tar.gz /opt/Apache
cd /opt/Apache
tar xzvf db-derby-10.14.2.0-bin.tar.gz
rm db-derby-10.14.2.0-bin.tar.gz
export DERBY_INSTALL=/opt/Apache/db-derby-10.14.2.0-bin
