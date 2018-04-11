
[![Build Status](https://travis-ci.org/openalea/openalea-recipes.svg?branch=master)](https://travis-ci.org/openalea/openalea-recipes) [![Build status](https://ci.appveyor.com/api/projects/status/3g9dkugncosftuee?svg=true)](https://ci.appveyor.com/project/pradal/openalea-recipes)


# Conda Recipes for OpenAlea

[OpenAlea] depends on a **very** large number of heterogeneous packages, in C++ and Python.
Some of these packages are provided by Conda (MinGW, Qt, PyQt, sip, boost).

For the packages that *aren't* provided by [conda], we use the recipes provided by this repository.
We provide also some packages available in conda, to have homogeneous compiler flags (C++11, ...).

[condabld]: http://conda.pydata.org/docs/build.html
[oachannel]: https://anaconda.org/openalea
[conda]: http://conda.pydata.org/
[OpenAlea]: http://openalea.gforge.inria.fr


## Contents

- [Installing OpenAlea for development](#installing)
- [How to build these packages yourself](#howtobuild)
- [Appendix: Writing a new recipe](#writing)


<a name="installing"></a>
==================================
Installing openalea for development
==================================

Here's how to install everything you need to develop openalea.

0. Prerequisite: Install [Miniconda]
------------------------------------

[Miniconda]: http://conda.pydata.org/miniconda.html

```
# Install miniconda to the prefix of your choice, e.g. /my/miniconda

# LINUX:
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh

# MAC:
wget https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh
bash Miniconda-latest-MacOSX-x86_64.sh

# Windows:
powershell "$client = new-object System.Net.WebClient; $client.DownloadFile(\"https://repo.continuum.io/miniconda/Miniconda2-latest-Windows-x86_64.exe\", \"Miniconda2-latest-Windows-x86_64.exe\")"
Miniconda2-latest-Windows-x86_64.exe

# Activate conda
CONDA_ROOT=`conda info --root`
source ${CONDA_ROOT}/bin/activate root
```

<a name="writing"></a>
==============================
Appendix: Writing a new recipe
==============================

The [conda documentation][2] explains in detail how to create a new package, but here's a quick summary:

[2]: http://conda.pydata.org/docs/build.html

0. Prerequisite: Install `conda-build`
--------------------------------------

```
source activate root
conda install conda-build
```

1. Create recipe files
----------------------

Add a directory to this repo:

```
cd openalea-recipes
mkdir somepackage
cd somepackage
```

A complete recipe has at least 3 files:

 - `meta.yaml`
 - `build.sh` (used for both Mac and Linux)
 - `bld.bat` (used for Windows)

...additional files (such as patches) may be needed for some recipes.

Write **meta.yaml**:

```
$ cat meta.yaml
package:
  name: somepackage
  version: 1.2.3

source:
  fn: somepackage-1.2.3.tar.bz2
  url: http://www.randompackages.org/somepackage/somepackage-1.2.3.tar.bz2
  md5: b060bb137d6bd8accf8f0c4c59d2746d

requirements:
  build:
    - zlib
    - python
  run:
    - zlib
    - python

about:
  home: http://www.somepackage.com
  license: WYSIWYG v3
```

Write **build.sh**:

```
$ cat build.sh
# configure, make, and install
configure --prefix=$PREFIX --with-zlib=$PREFIX
make -j${CPU_COUNT}
make install
```

Write **bld.bat**:

```
$ cat bld.bat
mkdir build
cd build

REM Configure step
cmake -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_BUILD_TYPE=Release %SRC_DIR%

REM Build step
devenv SomePackage.sln /Build "%RELEASE_TARGET%"
if errorlevel 1 exit 1

REM Install step
devenv SomePackage.sln /Build "%RELEASE_TARGET%" /Project INSTALL
if errorlevel 1 exit 1
```

2. Build the package
--------------------

```
# Switch back to the `openalea-recipes` directory
$ cd ../

# Build the package
$ conda build somepackage
```

3. Upload the package to your [anaconda] channel.
------------------------------------------------

```
conda install anaconda-client

# Upload to your personal channel:
anaconda upload /my/miniconda/conda-bld/osx-64/somepackage-1.2.3-0.tar.bz2

# Or to openalea's anaconda channel:
anaconda upload -u openalea /my/miniconda/conda-bld/osx-64/somepackage-1.2.3-0.tar.bz2
```

[anaconda]: http://anaconda.org
