:: Start with bootstrap
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

set LogFile=b2.build.log
set TempLog=b2.build.log.tmp
set LogTee=^> %TempLog%^&^& type %TempLog%^&^&type %TempLog%^>^>%LogFile%

:: Build step
.\b2 ^
  -q -d+2 ^
  --build-dir=bb-%VS_MAJOR% ^
  --prefix=%LIBRARY_PREFIX% ^
  toolset=msvc-%VS_MAJOR%.0 ^
  address-model=%ARCH% ^
  variant=release ^
  threading=multi ^
  link=static,shared ^
  -j%CPU_COUNT% ^
  --without-python ^
  stage ^
  %LogTee%

:: Install fix-up for a non version-specific boost include
move %LIBRARY_INC%\boost-%PKG_VERSION_MAJOR%_%PKG_VERSION_MINOR%\boost %LIBRARY_INC%
if errorlevel 1 exit 1

:: Move dll's to LIBRARY_BIN
move %LIBRARY_LIB%\*vc%LIB_VER%-mt-%PKG_VERSION_MAJOR%_%PKG_VERSION_MINOR%.dll "%LIBRARY_BIN%"
if errorlevel 1 exit 1
