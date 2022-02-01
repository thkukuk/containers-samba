#!/bin/sh

DEBUG=${DEBUG:-"0"}

[ "${DEBUG}" -eq "1" ] && set -x

export PATH=/usr/sbin:/sbin:${PATH}

ARGS=""

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
