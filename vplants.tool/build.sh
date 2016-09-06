#!/bin/bash

# Set all the scons option explicitly
cd tool
#$PYTHON setup.py build_ext --scons-ext-param="QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False" \
#                 install --prefix=$PREFIX

scons QTDIR=$PREFIX QT4_FRAMEWORK=False QT4_BINPATH=$PREFIX/bin QT4_LIBPATH=$PREFIX/lib QT4_CPPPATH=$PREFIX/include/qt build_prefix=$PREFIX build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin build
