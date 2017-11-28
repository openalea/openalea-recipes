mkdir -p build-cmake
cd build-cmake
cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_BUILD_TYPE=Release ..
cmake ..
nmake
nmake install
