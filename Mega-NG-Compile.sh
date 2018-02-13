git config --global user.email "david.eve.za@gmail.com"
git config --global user.name "david-eve-za"
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
sudo apt install libcurl4-openssl-dev libfreeimage-dev libreadline-dev libpcre++-dev -y
echo "Configuring the build"
sleep 5
./configure --enable-java --with-java-include-dir=/usr/lib/jvm/java-8-openjdk-amd64/include
echo "Compile the code"
sleep 5
make
cd ..
cd ..
git clone https://github.com/david-eve-za/MegaManager.git
cd MegaManager
mvn compile
mvn assembly:single
#sudo make install
#mkdir examples/java/libs
cp -v ../misc/sdk/bindings/java/.libs/libmegajava.so libs/
sleep 5
#cp -av ../nz/mega/sdk examples/java/src/nz/mega/
#sleep 5
#cd examples/java
#mkdir bin
#javac -d bin -sourcepath src/ src/nz/mega/bindingsample/CrudExample.java
#java -cp bin nz.mega.bindingsample.CrudExample
cd target
java -jar MegaManager-1.0-SNAPSHOT-jar-with-dependencies.jar 
sudo apt install locate
sudo updatedb
locate libmega
