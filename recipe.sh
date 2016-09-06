export LANG=en_US.UTF-8

conda build openalea.deploy
conda install --use-local openalea.deploy

conda build scons
conda install --use-local scons

conda build openalea.sconsx
conda install --use-local openalea.sconsx

conda build openalea.tool
conda install --use-local openalea.tool

conda build openalea.stat_tool
conda install --use-local openalea.stat_tool
