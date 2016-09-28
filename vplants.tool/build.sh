#!/bin/bash

# Set all the scons option explicitly
cd tool
#$PYTHON setup.py build_ext --scons-ext-param="QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False" \
#                 install --prefix=$PREFIX

if [ "$(uname)" == "Darwin" ];
then
    export CC=clang
    export CXX=clang++

    export MACOSX_VERSION_MIN=10.7
    export CXXFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -std=c++11"
    export LINKFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export LINKFLAGS="${LINKFLAGS} -stdlib=libc++ -std=c++11 "
fi

scons QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
build_prefix=$PREFIX/libtool build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin \
readline_includes=$PREFIX/include readline_lib=$PREFIX/lib termcap_includes=$PREFIX/include termcap_lib=$PREFIX/lib \
pthread_includes=$PREFIX/include pthread_lib=$PREFIX/lib \
EXTRA_CXXFLAGS="${CXXFLAGS}" EXTRA_LINKFLAGS="${LINKFLAGS}" \
num_jobs=$CPU_COUNT build
