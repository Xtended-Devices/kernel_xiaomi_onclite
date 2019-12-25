#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018 Raphiel Rollerscaperers (raphielscape)
# Copyright (C) 2018 Rama Bondan Prakoso (rama982)
# Android Kernel Build Script

# Install build package for debian based linux
sudo apt install bc bash git-core gnupg build-essential \
    zip curl make automake autogen autoconf autotools-dev libtool shtool python \
    m4 gcc libtool zlib1g-dev flex bison libssl-dev

# Clone toolchain
if [ ! -d stock ]; then
git clone -b g4.9-64 https://github.com/ProtoChuz/toolchains stock
fi
cd stock && git fetch && git pull && cd ..
if [ ! -d stock_32 ]; then
git clone -b 4.9-32 https://github.com/ProtoChuz/toolchains stock_32
fi
cd stock_32 && git fetch && git pull && cd ..

# Clone AnyKernel3
git clone https://github.com/rama982/AnyKernel3 -b onc-miui

#Download Clang
if [ ! -d clang ]; then
    wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/android-10.0.0_r3/clang-r353983c.tar.gz
    mkdir -p clang/clang-r353983c/
    tar xvzf clang-r353983c.tar.gz -C clang/clang-r353983c
    rm clang-r353983c.tar.gz
fi
