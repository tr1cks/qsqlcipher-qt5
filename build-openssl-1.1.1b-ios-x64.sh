#!/bin/bash
git clone https://github.com/openssl/openssl.git --branch="OpenSSL_1_1_1b"
cd openssl

export CC=clang;
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
export CROSS_SDK=iPhoneOS.sdk
export PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH"

./Configure ios64-cross no-shared no-dso no-hw no-engine -fembed-bitcode --openssldir=/opt/libs/openssl-1.1.1b-ios-x64 --prefix=/opt/libs/openssl-1.1.1b-ios-x64
make depend
make test
make install
cd ..
rm -rf openssl
