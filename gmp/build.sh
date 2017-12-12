#!/bin/bash

if [ "$(uname)" == "Darwin" ];
then
    export CC=$PREFIX/bin/gcc
    export CXX=$PREFIX/bin/g++

    export MACOSX_VERSION_MIN=10.7
    export CXXFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS}"
    export LINKFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export LINKFLAGS="${LINKFLAGS} -L${LIBRARY_PATH}"
fi

chmod +x configure

./configure --prefix=$PREFIX --enable-cxx --enable-fat

make
make check
make install
