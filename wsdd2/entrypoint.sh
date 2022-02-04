#!/bin/sh

DEBUG=${DEBUG:-"0"}
ARGS=""

if [ "${DEBUG}" -eq "1" ]; then
        set -x
	ARGS="-W -W -L -L $ARGS"
fi

export PATH=/usr/sbin:/sbin:${PATH}

if [ -n "${HOSTNAME}" ]; then
	ARGS="-H $HOSTNAME -N $HOSTNAME $ARGS"
else 
	echo "HOSTNAME environment variable must be set."
	exit 1
fi

if  [ -n "${WORKGROUP}" ]; then
	ARGS="-G $WORKGROUP $ARGS"
fi

exec wsdd2 ${ARGS}
