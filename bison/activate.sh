#!/bin/bash

# Save default bison datadir
export _BISON_PKGDATADIR=$BISON_PKGDATADIR

#!/bin/bash
if [ $CONDA_BUILD = 0 ]; then
  BISON_PKGDATADIR=$CONDA_PREFIX/share/bison
else
  BISON_PKGDATADIR=$CONDA_DEFAULT_ENV/share/bison
fi

echo "setting bison datadir to $BISON_PKGDATADIR"
export BISON_PKGDATADIR
