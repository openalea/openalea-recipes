#!/bin/bash


./configure --disable-dependency-tracking --disable-shared  --prefix="$PREFIX"
make
make install


