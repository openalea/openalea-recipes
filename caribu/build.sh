#!/bin/bash
scons build_prefix=$SRC_DIR/build-scons build_includedir=$PREFIX/include build_libdir=$PREFIX/lib build_bindir=$PREFIX/bin \
num_jobs=$CPU_COUNT build
$PYTHON setup.py install --prefix=$PREFIX
