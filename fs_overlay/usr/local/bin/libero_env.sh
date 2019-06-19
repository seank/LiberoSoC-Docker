#!/bin/bash

# Most tools require a valid license, start the license manager...
bash /usr/local/bin/start-lmgrd.sh

export LIBERO_INSTALLED_DIR=/usr/local/microsemi/Libero_SoC_v11.9/

export LM_LICENSE_FILE=/root/license/License.dat
export LM_LICENSE_FILE=1702@${HOSTNAME}:$LM_LICENSE_FILE
export SNPSLMD_LICENSE_FILE=1702@${HOSTNAME}:$SNPSLMD_LICENSE_FILE

export PATH=$PATH:$LIBERO_INSTALLED_DIR/Libero/bin
export PATH=$PATH:$LIBERO_INSTALLED_DIR/Synplify/bin
export PATH=$PATH:$LIBERO_INSTALLED_DIR/ModelSim/modeltech/linuxacoem
export MODEL_TECH=$LIBERO_INSTALLED_DIR/ModelSim/modeltech/linuxacoem/

export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

# Echo hostid to help debug any license issues.
lmhostid

