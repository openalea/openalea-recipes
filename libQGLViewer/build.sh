#!/bin/bash


set -x -e

if [ "$(uname)" == "Darwin" ];
then
    export CC=clang
    export CXX=clang++

    export MACOSX_VERSION_MIN=10.7
    export CXXFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -std=c++11"
    export LINKFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export LINKFLAGS="${LINKFLAGS} -stdlib=libc++ -std=c++11 "

    export QMAKESPEC=macx-g++

fi

if [ "$(uname)" == "Linux" ];
then

    export QMAKESPEC=linux-g++
fi

[ -d build ]] || mkdir build
cd build


qmake PREFIX=$PREFIX NO_QT_VERSION_SUFFIX=1 ../libQGLViewer.pro

make
make install
cd ..


