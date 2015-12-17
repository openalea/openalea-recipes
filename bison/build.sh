#!/bin/bash

mkdir build
cd build
../configure --prefix="$PREFIX"
make
make install

mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d

cp $RECIPE_DIR/activate.sh $PREFIX/etc/conda/activate.d/bison.sh
cp $RECIPE_DIR/deactivate.sh $PREFIX/etc/conda/deactivate.d/bison.sh


