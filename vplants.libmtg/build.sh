#!/bin/bash

# Set all the scons option explicitly
cd mtg
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

export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig

scons QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
build_prefix=$SRC_DIR/build-scons build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin \
gl_include=$PREFIX/include gl_lib=$PREFIX/lib \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
readline_includes=$PREFIX/include readline_lib=$PREFIX/lib termcap_includes=$PREFIX/include termcap_lib=$PREFIX/lib \
pthread_includes=$PREFIX/include pthread_lib=$PREFIX/lib \
bison_bin=$PREFIX/bin flex_bin=$PREFIX/bin flex_libpath=$PREFIX/lib flex_include=$PREFIX/include \
WITH_EIGEN=True eigen_includes=$PREFIX/include/eigen3 \
WITH_QHULL_2011=True qhull_includes=$PREFIX/include qhull_lib=$PREFIX/lib \
gmp_includes=$PREFIX/include gmp_libpath=$PREFIX/lib WITH_GMP=True \
mpfr_includes=$PREFIX/include mpfr_libpath=$PREFIX/lib WITH_MPFR=True \
ann_includes=$PREFIX/include ann_libpath=$PREFIX/lib \
vplants_plantgl_include=$PREFIX/include vplants_plantgl_lib==$PREFIX/lib \
vplants_tool_include=$PREFIX/include vplants_tool_lib==$PREFIX/lib \
vplants_amlobj_include=$PREFIX/include vplants_amlobj_lib==$PREFIX/lib \
EXTRA_CXXFLAGS="${CXXFLAGS}" EXTRA_LINKFLAGS="${LINKFLAGS}" \
num_jobs=1 build

$PYTHON setup.py install --prefix=$PREFIX
cd ..