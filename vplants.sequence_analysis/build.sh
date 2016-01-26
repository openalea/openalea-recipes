#!/bin/bash

# TODO: Remove unused lib and include in site-packages

# Set all the scons option explicitly
cd sequence_analysis

#scons \
#QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
#python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
#boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
#openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
#vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include \
#vplants_stat_tool_lib=$PREFIX/lib vplants_stat_tool_include=$PREFIX/include \
#prefix=$PREFIX build

$PYTHON setup.py build_ext --scons-ext-param="\
QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include \
vplants_stat_tool_lib=$PREFIX/lib vplants_stat_tool_include=$PREFIX/include \
prefix=$PREFIX\
" install --prefix=$PREFIX

cp -R build-scons/lib/* $PREFIX/lib
cp -R build-scons/include/* $PREFIX/include

