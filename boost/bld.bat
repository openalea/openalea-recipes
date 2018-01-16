:: Start with bootstrap
call bootstrap.bat vc%VS_MAJOR%

if errorlevel 1 exit /b 1

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

if errorlevel 1 exit /b 1
