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

#$PYTHON setup.py build_ext --scons-ext-param="QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include/qt QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
#python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
#boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
#openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
#build_prefix=$PREFIX/stattool build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin \
#vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include prefix=$PREFIX" \
#                 install --prefix=$PREFIX

scons QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include/qt QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
build_prefix=$PREFIX/stattool build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin \
vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include  \
build

$PYTHON setup.py install --prefix=$PREFIX --single-version-externally-managed --record record.txt
# Make sure the linked gfortran libraries are searched for on the RPATH.
#if [[ `uname` == 'Darwin' ]]; then
#    WRAPPER_LIB=$(find $PREFIX/lib/python2.7/site-packages -name '_stat_tool.so')
#    #otool -L $WRAPPER_LIB
#    install_name_tool -change build-scons/lib/libvpstat_tool.dylib $PREFIX/lib/libvpstat_tool.dylib $WRAPPER_LIB
#fi

#cp -R build-scons/lib/* $PREFIX/lib
#cp -R build-scons/include/* $PREFIX/include


#ls $SP_DIR/include
#ls $SP_DIR/lib

