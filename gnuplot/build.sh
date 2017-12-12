#!/bin/bash
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig

./configure \
    --with-qt=qt4 \
    --prefix=$PREFIX \
    --without-x \
    --without-lua \
    --with-readline=$PREFIX/lib

make && make install
