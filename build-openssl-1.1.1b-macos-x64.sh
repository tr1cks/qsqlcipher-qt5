#!/bin/bash
git clone https://github.com/openssl/openssl.git --branch="OpenSSL_1_1_1b"
cd openssl
./Configure darwin64-x86_64-cc enable-ec_nistp_64_gcc_128 no-ssl2 no-ssl3 no-comp --openssldir=/opt/libs/openssl-1.1.1b-macos-x64 --prefix=/opt/libs/openssl-1.1.1b-macos-x64
make depend
make test
make install
cd ..
rm -rf openssl
