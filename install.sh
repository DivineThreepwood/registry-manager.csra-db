#!/bin/bash

echo Update...
git pull
echo Start installation routine...
mkdir -p build &&
cd build &&
cmake .. -DCMAKE_INSTALL_PREFIX=$prefix &&
make install &&
cd .. &&
rm -rf build &&
echo Installation successful.

