sudo apt update && sudo apt upgrade
sudo apt install build-essential
git clone https://github.com/meganz/sdk
cd sdk
sh autogen.sh
./configure --enable-java --with-java-include-dir=/usr/lib/jvm/java-8-openjdk-amd64/include
make
