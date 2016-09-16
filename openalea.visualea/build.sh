#!/bin/bash
cd visualea
$PYTHON setup.py install --single-version-externally-managed --prefix=$PREFIX
cd ..