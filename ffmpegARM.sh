#!/bin/bash
#Create working directory
mkdir ffmpeg-arm
cd ffmpeg-arm
#Download the Android NDK
wget https://dl.google.com/android/repository/android-ndk-r17b-linux-x86_64.zip
#Unzip file
unzip android-ndk-r17b-linux-x86_64.zip
#Delete the zip file
rm -v android-ndk-r17b-linux-x86_64.zip
#Set Variables
NDK=$(pwd)/android-ndk-r17b
echo $NDK
SYSROOT=$NDK/platforms/android-16/arch-arm/
echo $SYSROOT
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
echo $TOOLCHAIN

function build_one
{
./configure --prefix=$PREFIX --disable-shared --enable-gpl --enable-static --disable-doc --enable-ffmpeg --disable-ffplay --disable-ffprobe --disable-ffserver --enable-avdevice --disable-doc --disable-symver --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- --target-os=linux --arch=armv7 --enable-cross-compile --sysroot=$SYSROOT --extra-cflags="-Os -fPIE $ADDI_CFLAGS" --extra-ldflags="-pie $ADDI_LDFLAGS" $ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}
CPU=armv7-a
PREFIX=$(pwd)/android/$CPU
echo $PREFIX
ADDI_CFLAGS="-march=armv7-a"
#build_one
