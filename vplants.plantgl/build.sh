#!/bin/bash


# Set all the scons option explicitly

#scons \
#QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
#python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
#boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
#openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
#WITH_CGAL=True cgal_includes=$PREFIX/include cgal_libpath=$PREFIX/lib \
#bison_bin=$PREFIX/bin flex_bin=$PREFIX/bin flex_libpath=$PREFIX/lib flex_include=$PREFIX/include \
#readline_includes=$PREFIX/include readline_lib=$PREFIX/lib \
#WITH_QHULL_2011=True qhull_includes=$PREFIX/include qhull_lib=$PREFIX/lib \
#gmp_includes=$PREFIX/include gmp_lib=$PREFIX/lib WITH_GMP=True \
#mpfr_includes=$PREFIX/include mpfr_lib=$PREFIX/lib WITH_MPFR=True \
#WITH_LAPACK=False \
#WITH_EIGEN=True eigen_includes=$PREFIX/include/eigen3 \
#EXTRA_CXXFLAGS='-DCGAL_CFG_NO_CPP0X_VARIADIC_TEMPLATES -DWITH_QHULL_2011' \
#prefix=$PREFIX build

$PYTHON setup.py build_ext --scons-ext-param="\
QTDIR=$PREFIX QT4_BINPATH=$PREFIX/bin QT4_CPPPATH=$PREFIX/include QT4_LIBPATH=$PREFIX/lib QT4_FRAMEWORK=False \
python_includes=$PREFIX/include/python2.7 python_libpath=$PREFIX/lib \
boost_includes=$PREFIX/include boost_lib=$PREFIX/lib \
openalea_lib=$PREFIX/lib openalea_includes=$PREFIX/include \
WITH_CGAL=True cgal_includes=$PREFIX/include cgal_libpath=$PREFIX/lib \
bison_bin=$PREFIX/bin flex_bin=$PREFIX/bin flex_libpath=$PREFIX/lib flex_include=$PREFIX/include \
readline_includes=$PREFIX/include readline_lib=$PREFIX/lib \
WITH_QHULL_2011=True qhull_includes=$PREFIX/include qhull_lib=$PREFIX/lib \
gmp_includes=$PREFIX/include gmp_lib=$PREFIX/lib WITH_GMP=True \
mpfr_includes=$PREFIX/include mpfr_lib=$PREFIX/lib WITH_MPFR=True \
WITH_LAPACK=False \
WITH_EIGEN=True eigen_includes=$PREFIX/include/eigen3 \
EXTRA_CXXFLAGS='-DCGAL_CFG_NO_CPP0X_VARIADIC_TEMPLATES -DWITH_QHULL_2011' \
prefix=$PREFIX\
" install --prefix=$PREFIX

if [[ `uname` == 'Darwin' ]]; then
    MATH_WRAPPER_LIB=$(find $PREFIX/lib/python2.7/site-packages -name '_pglmath.so')
    ALGO_WRAPPER_LIB=$(find $PREFIX/lib/python2.7/site-packages -name '_pglalgo.so')
    SG_WRAPPER_LIB=$(find $PREFIX/lib/python2.7/site-packages -name '_pglsg.so')
    GUI_WRAPPER_LIB=$(find $PREFIX/lib/python2.7/site-packages -name '_pglgui.so')

    #otool -L $WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglmath.dylib $PREFIX/lib/libpglmath.dylib $MATH_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpgltool.dylib $PREFIX/lib/libpgltool.dylib $ALGO_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglmath.dylib $PREFIX/lib/libpglmath.dylib $ALGO_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglalgo.dylib $PREFIX/lib/libpglalgo.dylib $ALGO_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglsg.dylib $PREFIX/lib/libpglsg.dylib $ALGO_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpgltool.dylib $PREFIX/lib/libpgltool.dylib $SG_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglmath.dylib $PREFIX/lib/libpglmath.dylib $SG_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglalgo.dylib $PREFIX/lib/libpglalgo.dylib $SG_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglsg.dylib $PREFIX/lib/libpglsg.dylib $SG_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpgltool.dylib $PREFIX/lib/libpgltool.dylib $GUI_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglmath.dylib $PREFIX/lib/libpglmath.dylib $GUI_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglgui.dylib $PREFIX/lib/libpglgui.dylib $GUI_WRAPPER_LIB
    install_name_tool -change build-scons/lib/libpglsg.dylib $PREFIX/lib/libpglsg.dylib $GUI_WRAPPER_LIB
fi

cp -R build-scons/lib/* $PREFIX/lib
cp -R build-scons/include/* $PREFIX/include

