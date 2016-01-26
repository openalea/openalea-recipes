#!/bin/bash

# Set all the scons option explicitly
cd stat_tool
#$PYTHON setup.py build_ext --scons-ext-param="QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False" \
#                 install --prefix=$PREFIX

#scons -h
#scons QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
#python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
#boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
#openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
#vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include prefix=$PREFIX -h

$PYTHON setup.py build_ext --scons-ext-param="QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include prefix=$PREFIX" \
                 install --prefix=$PREFIX

cp -R build-scons/lib/* $PREFIX/lib
cp -R build-scons/include/* $PREFIX/include


#ls $SP_DIR/include
#ls $SP_DIR/lib

