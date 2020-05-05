#!/bin/bash

export LIBERO_INSTALLED_DIR=/usr/local/microsemi/Libero_SoC_v12.4/

export LM_LICENSE_FILE=/license/License.dat
export LM_LICENSE_FILE=1702@localhost:$LM_LICENSE_FILE
export SNPSLMD_LICENSE_FILE=1702@localhost:$SNPSLMD_LICENSE_FILE

export PATH=$LIBERO_INSTALLED_DIR/Libero/bin:$PATH
export PATH=$LIBERO_INSTALLED_DIR/Synplify/bin:$PATH
export PATH=$LIBERO_INSTALLED_DIR/ModelSim/modeltech/linuxacoem:$PATH
export PATH=/license/Linux_Licensing_Daemon:$PATH
export MODEL_TECH=$LIBERO_INSTALLED_DIR/ModelSim/modeltech/linuxacoem/

export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib/i686:/usr/lib64:$LD_LIBRARY_PATH
ldconfig /usr/local/lib

# Clean license
actel_wuclean -R

# If workspace has been specified cd to it, so we know where we are running out of.
if [ -d /workspace ]
then
  cd /workspace
else
  echo "WARNING: '/workspace' volume not mounted!, not executing ${CMD}."
fi

exec "$@"

