echo "Updating and Upgrading the sistem"
sudo apt update && sudo apt upgrade -y
echo "Installing build-essential autoconf libtool"
sudo apt install build-essential autoconf libtool -y
echo "cloning https://github.com/meganz/MEGAcmd.git"
git clone https://github.com/meganz/MEGAcmd.git

cd MEGAcmd
git submodule update --init --recursive
echo "Installing Required libraries"
sudo apt install swig libcrypto++-dev libsodium-dev zlib1g-dev libsqlite3-dev libssl-dev libc-ares-dev -y
sudo apt install libcurl4-openssl-dev libfreeimage-dev libreadline-dev libpcre++-dev -y
echo "Configuring the build"
sh autogen.sh
./configure
echo "Make and install the package"
make
sudo make install