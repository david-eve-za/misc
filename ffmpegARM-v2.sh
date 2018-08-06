#!/bin/bash
sudo apt update -qq 
sudo apt -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  pkg-config \
  texinfo \
  wget \
  zlib1g-dev \
  gcc-arm-linux-gnueabi \
  g++-arm-linux-gnueabi
#Create working directory
mkdir ffmpeg-arm
cd ffmpeg-arm

#Set Variables
WORK_DIR=$(pwd)
NDK=$WORK_DIR/arm
SYSROOT=$NDK/sysroot
TOOLCHAIN=$NDK
CPU=armv7
PREFIX=$WORK_DIR/android/$CPU
ADDI_CFLAGS="-marm -march=armv7-a -mfloat-abi=softfp -mthumb -mfpu=vfpv3-d16 -mtune=cortex-a8"
ADDI_LDFLAGS="-marm -march=armv7-a -Wl,--fix-cortex-a8"
ADDITIONAL_CONFIG_FLAG="--arch=arm --disable-asm"

#Download the Android NDK
wget https://dl.google.com/android/repository/android-ndk-r17b-linux-x86_64.zip
#Unzip file
unzip android-ndk-r17b-linux-x86_64.zip
#Delete the zip file
rm -v android-ndk-r17b-linux-x86_64.zip
#Create Custom NDK
cd android-ndk-r17b/build/tools/
python make_standalone_toolchain.py --arch arm --stl=libc++ --install-dir $WORK_DIR/arm --force
cd $WORK_DIR && \
rm -vRf android-ndk-r17b

cd $WORK_DIR && \
git -C x264 pull 2> /dev/null || git clone --depth 1 https://git.videolan.org/git/x264 && \
cd x264 && \
PATH="$WORK_DIR/bin:$PATH" PKG_CONFIG_PATH="$WORK_DIR/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$WORK_DIR/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-pic --disable-asm && \
PATH="$WORK_DIR/bin:$PATH" make && \
make install

sudo apt install mercurial libnuma-dev && \
cd $WORK_DIR && \
if cd x265 2> /dev/null; then hg pull && hg update; else hg clone https://bitbucket.org/multicoreware/x265; fi && \
cd x265/build/arm-linux && \
PATH="$WORK_DIR/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$WORK_DIR/ffmpeg_build" -DENABLE_SHARED=off ../../source && \
PATH="$WORK_DIR/bin:$PATH" make && \
make install

cd $WORK_DIR && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure --prefix="$WORK_DIR/ffmpeg_build" --disable-shared && \
make && \
make install

cd $WORK_DIR && \
wget -O lame-3.100.tar.gz https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz && \
tar xzvf lame-3.100.tar.gz && \
cd lame-3.100 && \
PATH="$WORK_DIR/bin:$PATH" ./configure --prefix="$WORK_DIR/ffmpeg_build" --bindir="$WORK_DIR/bin" --disable-shared --enable-nasm && \
PATH="$WORK_DIR/bin:$PATH" make && \
make install

cd $WORK_DIR && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$WORK_DIR/bin:$PATH" PKG_CONFIG_PATH="$WORK_DIR/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$WORK_DIR/ffmpeg_build" \
  --enable-shared \
  --disable-static \
  --enable-protocol=file \
  --enable-pic \
  --enable-small \
  --disable-programs \
  --disable-doc \
  --disable-symver \
  --target-os=android \
  --enable-cross-compile \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --extra-cflags="-Os -fpic $ADDI_CFLAGS -I$WORK_DIR/ffmpeg_build/include" \
  --extra-ldflags="$ADDI_LDFLAGS, -L$WORK_DIR/ffmpeg_build/lib" \
  --sysroot=$SYSROOT \
  $ADDITIONAL_CONFIG_FLAG \
  --enable-gpl \
  --enable-libx264 \
  --enable-libx265 && \
PATH="$WORK_DIR/bin:$PATH" make && \
make install && \
hash -r