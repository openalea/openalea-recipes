#!/bin/bash

# TODO: Remove unused lib and include in site-packages

# Set all the scons option explicitly
cd sequence_analysis


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
vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include  \
vplants_stat_tool_lib=$PREFIX/lib vplants_stat_tool_include=$PREFIX/include \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
build_prefix=$PREFIX/libvpseq build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin \
EXTRA_CXXFLAGS="${CXXFLAGS}" EXTRA_LINKFLAGS="${LINKFLAGS}" \
num_jobs=$CPU_COUNT build

PYTHON setup.py install --prefix=$PREFIX
cd ..

