#!/bin/bash

# Errors seem to happen if you use license files that are mounted on remote file systems.
if [ -d /tmp/license ]
then
  cp -R /tmp/license /
fi

# Start the license server
if [ -f /license/License.dat ]
then
  killall lmgrd
  #TODO add check for lmgrd path.
  export PATH=/license/Linux_Licensing_Daemon:$PATH
  lmgrd -c /license/License.dat -l /tmp/license.log
  # Print the log file, incase of error.
  cat /tmp/license.log
else
  echo "WARNING: /root/license/License.dat not found."
fi

