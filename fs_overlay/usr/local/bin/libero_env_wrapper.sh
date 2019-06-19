#!/bin/bash -il

# Ignore the first parameter (this script) passed into the container.
CMD="$1"
shift

# Get license and env vars all setup...
LIBERO_SCRIPT="/usr/local/bin/libero_env.sh"

if [ -f $LIBERO_SCRIPT ] ; then
  source $LIBERO_SCRIPT
fi

# If workspace has been specified cd to it, so we know where we are running out of.
if [ -d /workspace ]
then
  cd /workspace
  $CMD "$@"
else
  echo "WARNING: '/workspace' volume not mounted!, not executing ${CMD}."
fi
