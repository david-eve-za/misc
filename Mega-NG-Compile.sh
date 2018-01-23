sudo apt update && sudo apt upgrade -y
sudo apt install build-essential autoconf libtool -y
git clone https://github.com/meganz/sdk
cd sdk
sh autogen.sh
sudo apt install swig2.0 libcrypto++-dev libsodium-dev zlib1g-dev libsqlite3-dev libssl-dev libc-ares-dev -y
sudo apt install libcurl4-openssl-dev libfreeimage-dev libreadline6-dev -y
./configure --enable-java --with-java-include-dir=/usr/lib/jvm/java-8-openjdk-amd64/include
make
