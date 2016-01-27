#!/bin/bash

# TODO: Remove unused lib and include in site-packages

# Set all the scons option explicitly

scons \
QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
WITH_CGAL=True cgal_includes=$PREFIX/include cgal_libpath=$PREFIX/lib \
bison_bin=$PREFIX/bin flex_bin=$PREFIX/bin flex_libpath=$PREFIX/lib flex_include=$PREFIX/include \
readline_includes=$PREFIX/include readline_lib=$PREFIX/lib \
qhull_includes=$PREFIX/include qhull_lib=$PREFIX/lib \
gmp_includes=$PREFIX/include gmp_lib=$PREFIX/lib WITH_GMP=True \
mpfr_includes=$PREFIX/include mpfr_lib=$PREFIX/lib WITH_MPFR=True \
prefix=$PREFIX -h

#$PYTHON setup.py build_ext --scons-ext-param="\
#QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
#python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
#boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
#openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
#vplants_tool_lib=$PREFIX/lib vplants_tool_include=$PREFIX/include \
#vplants_stat_tool_lib=$PREFIX/lib vplants_stat_tool_include=$PREFIX/include \
#prefix=$PREFIX\
#" install --prefix=$PREFIX

#cp -R build-scons/lib/* $PREFIX/lib
#cp -R build-scons/include/* $PREFIX/include

