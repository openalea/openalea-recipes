#!/bin/bash

# setting GMP_LIBRARIES with the full -L<path> -lgmp
# was necessary on OSX/clang.  Not sure if it somehow worked on linux
# with just the path
# had been using SYS_PREFIX, but PREFIX is probably more appropriate since
# having gmp as a requirement will install it to PREFIX, not SYS_PREFIX
# from https://github.com/rustychris/conda-recipes/

mkdir build && cd build

# needs qt5 for imageio
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCGAL_INSTALL_LIB_DIR=lib \
  -DWITH_CGAL_ImageIO=OFF -DWITH_CGAL_Qt5=OFF \
  ..

#cmake -DGMP_LIBRARIES="-L$PREFIX/lib -lgmp" -DGMP_INCLUDE_DIR=$PREFIX/include -DCMAKE_INSTALL_PREFIX=$PREFIX -DWITH_CGAL_ImageIO:BOOL=OFF -DWITH_CGAL_Qt5:BOOL=OFF .
make install  -j${CPU_COUNT}
