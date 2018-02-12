echo "Updating and Upgrading the sistem"
sleep 5
sudo apt update && sudo apt upgrade -y
echo "Installing build-essential autoconf libtool"
sleep 5
sudo apt install build-essential autoconf libtool -y
echo "Clonning https://github.com/meganz/sdk"
sleep 5
git clone https://github.com/meganz/sdk
echo "Accesing and preparing the compilation of code"
sleep 5
cd sdk
sh autogen.sh
echo "Installing Required libraries"
sleep 5
sudo apt install swig libcrypto++-dev libsodium-dev zlib1g-dev libsqlite3-dev libssl-dev libc-ares-dev -y
sudo apt install libcurl4-openssl-dev libfreeimage-dev libreadline-dev libpcre++-dev libpython-dev -y
echo "Configuring the build"
sleep 5
./configure --disable-silent-rules --enable-python --enable-java --with-java-include-dir=/usr/lib/jvm/java-8-openjdk-amd64/include
echo "Compile the code"
sleep 5
make
sudo make install
mkdir examples/java/libs
#cp bindings/java/.libs/libmegajava.so examples/java/libs/
cp -a bindings/java/nz/mega/sdk examples/java/src/nz/mega/
cd examples/java
mkdir bin
javac -d bin -sourcepath src/ src/nz/mega/bindingsample/CrudExample.java
java -cp bin nz.mega.bindingsample.CrudExample
