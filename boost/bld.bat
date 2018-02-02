:: Start with bootstrap

:: Write python configuration, see https://github.com/boostorg/build/issues/194
@echo using python > user-config.jam
@echo : %PY_VER% >> user-config.jam
@echo : %PYTHON:\=\\% >> user-config.jam
@echo : %PREFIX:\=\\%\\include >> user-config.jam
@echo : %PREFIX:\=\\%\\libs >> user-config.jam
@echo ; >> user-config.jam
xcopy user-config.jam C:\Users\appveyor

:: Set the right msvc version according to Python version
if "%PY_VER%"=="2.7" (
    set MSVC_VER=9.0
    set LIB_VER=90
) else if "%PY_VER%"=="3.4" (
    set MSVC_VER=10.0
    set LIB_VER=100
) else (
    set MSVC_VER=14.0
    set LIB_VER=140
)

call bootstrap.bat

if errorlevel 1 exit 1


.\b2 install ^
    --build-dir=buildboost ^
    --prefix=%LIBRARY_PREFIX% ^
    toolset=msvc-%VS_MAJOR%.0 ^
    address-model=%ARCH% ^
    variant=release ^
    threading=multi ^
    link=static,shared ^
    --layout=system ^
    --with-python ^
    -j%CPU_COUNT%
if errorlevel 1 exit 1


:: Install fix-up for a non version-specific boost include
move %LIBRARY_INC%\boost-%PKG_VERSION_MAJOR%_%PKG_VERSION_MINOR%\boost %LIBRARY_INC%
if errorlevel 1 exit 1

:: Move dll's to LIBRARY_BIN
move %LIBRARY_LIB%\*vc%LIB_VER%-mt-%PKG_VERSION_MAJOR%_%PKG_VERSION_MINOR%.dll "%LIBRARY_BIN%"
