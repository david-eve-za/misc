
#!/bin/bash -i
set -e

LOG_FILE=/dev/null

#git config --global user.email "david.eve.za@gmail.com"
#git config --global user.name "david-eve-za"
function createMEGABindings
{
    echo "* Creating MEGA Java bindings"
    mkdir -p examples/java/src/nz/mega/sdk
    swig -c++ -Iinclude -java -package nz.mega.sdk -outdir examples/java/src/nz/mega/sdk -o bindings/megasdk.cpp -DHAVE_LIBUV -DENABLE_CHAT bindings/megaapi.i &>> ${LOG_FILE}
}
echo "Updating and Upgrading the sistem"
sleep 5
sudo apt update && sudo apt upgrade -y
echo "Installing build-essential autoconf libtool"
sleep 5
sudo apt install build-essential autoconf libtool -y
echo "Installing Required libraries"
sleep 5
sudo apt install swig libcrypto++-dev libsodium-dev zlib1g-dev libsqlite3-dev libssl-dev libc-ares-dev -y
sudo apt install libcurl4-openssl-dev libfreeimage-dev libreadline-dev libpcre++-dev -y
echo "Clonning https://github.com/meganz/sdk"
sleep 5
git clone https://github.com/meganz/sdk
echo "Accesing and preparing the compilation of code"
sleep 5
cd sdk
createMEGABindings
pause
sh autogen.sh
echo "Configuring the build"
sleep 5
./configure --enable-java --with-java-include-dir=/usr/lib/jvm/java-8-openjdk-amd64/include
echo "Compile the code"
sleep 5
make
mkdir examples/java/libs
cp bindings/java/.libs/libmegajava.so examples/java/libs/
cp -a bindings/java/nz/mega/sdk examples/java/src/nz/mega/
cd examples/java/
mkdir bin
javac -d bin -sourcepath src/ src/nz/mega/bindingsample/CrudExample.java
java -cp bin nz.mega.bindingsample.CrudExample
