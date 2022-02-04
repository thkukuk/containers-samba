#!/bin/sh

DEBUG=${DEBUG:-"0"}
ARGS=""

if [ "${DEBUG}" -eq "1" ]; then
        set -x
        ARGS="-v $ARGS"
fi

export PATH=/usr/sbin:/sbin:${PATH}

if [ -n "${HOSTNAME}" ]; then
	ARGS="-n $HOSTNAME $ARGS"
else 
	echo "HOSTNAME environment variable must be set."
	exit 1
fi

if  [ -n "${WORKGROUP}" ]; then
	ARGS="-w $WORKGROUP $ARGS"
fi

if  [ -n "${DOMAIN}" ]; then
	ARGS="-d $DOMAIN $ARGS"
fi

exec wsdd ${ARGS}
