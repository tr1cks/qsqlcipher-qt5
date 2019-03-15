#!/bin/bash
git clone https://github.com/sqlcipher/sqlcipher.git --branch="v4.0.1"
cd sqlcipher

./configure
make sqlite3.c
cp sqlite3.c sqlite3.h ../macx-libs/
cd ..
rm -rf sqlcipher
