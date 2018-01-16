if "%ARCH%"=="32" (
    set PLATFORM=Win32
) else (
    set PLATFORM=x64
)

set mpfr_root=%cd%
cd ..
mkdir mpir\dll\%PLATFORM%\Release
mkdir mpir\lib\%PLATFORM%\Release

REM copy mpir headers
xcopy %LIBRARY_INC%\*.h mpir\lib\%PLATFORM%\Release\ /E
xcopy %LIBRARY_INC%\*.h mpir\dll\%PLATFORM%\Release\ /E
copy %LIBRARY_INC%\gmp-config.h mpir\lib\%PLATFORM%\Release\config.h
copy %LIBRARY_INC%\gmp-config.h mpir\dll\%PLATFORM%\Release\config.h
copy %LIBRARY_INC%\gmp-longlong.h mpir\lib\%PLATFORM%\Release\longlong.h
copy %LIBRARY_INC%\gmp-longlong.h mpir\dll\%PLATFORM%\Release\longlong.h

REM copy mpir libraries
copy %LIBRARY_BIN%\mpir.dll mpir\dll\%PLATFORM%\Release\mpir.dll
copy %LIBRARY_LIB%\mpir.lib mpir\dll\%PLATFORM%\Release\mpir.lib
copy %LIBRARY_LIB%\mpir_static.lib mpir\lib\%PLATFORM%\Release\mpir.lib

cd %mpfr_root%\build.vc14

msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release lib_mpfr\lib_mpfr.vcxproj
msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release dll_mpfr\dll_mpfr.vcxproj

REM msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release lib_mpfr_tests\lib_tests\lib_tests.vcxproj
REM python %mpfr_root%\build.vc14\run_lib_tests.py

copy dll\%PLATFORM%\Release\mpfr.lib %LIBRARY_LIB%\mpfr.lib
copy dll\%PLATFORM%\Release\mpfr.dll %LIBRARY_BIN%\mpfr.dll
copy dll\%PLATFORM%\Release\mpfr.pdb %LIBRARY_BIN%\mpfr.pdb

copy lib\%PLATFORM%\Release\mpfr.lib %LIBRARY_LIB%\mpfr_static.lib

cd ..
copy dll\%PLATFORM%\Release\mpfr.h %LIBRARY_INC%\mpfr.h
