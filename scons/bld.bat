"%PYTHON%" setup.py install --prefix="%PREFIX%" --standard-lib --no-version-script
if errorlevel 1 exit 1
