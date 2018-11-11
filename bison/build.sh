#!/bin/bash
export PERL=${BUILD_PREFIX}/bin/perl

mkdir build
cd build

M4=m4 \
  ../configure --prefix="$PREFIX"
make -j${CPU_COUNT} ${VERBOSE_AT}

make check
make install

mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d

cp $RECIPE_DIR/activate.sh $PREFIX/etc/conda/activate.d/bison.sh
cp $RECIPE_DIR/deactivate.sh $PREFIX/etc/conda/deactivate.d/bison.sh


