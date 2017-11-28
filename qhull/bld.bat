mkdir -p build-cmake
cd build-cmake
cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PREFIX% ..
cmake ..
nmake
nmake install