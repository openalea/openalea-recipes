mkdir -p build-cmake
cd build-cmake
cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ..
cmake ..
nmake
nmake install
