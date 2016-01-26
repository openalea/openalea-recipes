#!/bin/bash

# Set all the scons option explicitly
cd tool
#$PYTHON setup.py build_ext --scons-ext-param="QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False" \
#                 install --prefix=$PREFIX

scons QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False build
cp -R build-scons/lib $PREFIX
cp -R build-scons/include $PREFIX
