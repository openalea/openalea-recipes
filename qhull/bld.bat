copy bin\q*.exe "%LIBRARY_BIN%" || exit /b 1
copy bin\rbox.exe "%LIBRARY_BIN%" || exit /b 1
copy bin\q*.dll "%LIBRARY_BIN%" || exit /b 1

mkdir "%LIBRARY_PREFIX%\share\doc\%PKG_NAME%"
copy COPYING.txt "%LIBRARY_PREFIX%\share\doc\%PKG_NAME%" || exit /b 1

