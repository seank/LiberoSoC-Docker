#!/bin/bash

if [ -f /root/license/License.dat ]
then
  /usr/local/microsemi/Libero_SoC_v11.9/Libero/bin/lmgrd -c /root/license/License.dat -l /tmp/license.log
  # Print the log file, incase of error.
  cat /tmp/license.log
else
  echo "WARNING: /root/license/License.dat not found."
fi

