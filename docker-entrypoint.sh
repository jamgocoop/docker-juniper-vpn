#!/bin/bash

set -x

if [ -z "$JUNIPER_HOST" ]; then
	echo >&2 'error: missing JUNIPER_HOST environment variable'
	exit 1
fi

if [ -z "$JUNIPER_USER" ]; then
	echo >&2 'error: missing JUNIPER_USER environment variable'
	exit 1
fi

if [ -z "$JUNIPER_PASSWORD" ]; then
	echo >&2 'error: missing JUNIPER_PASSWORD environment variable'
	exit 1
fi

sed 's/{{JUNIPER_HOST}}/'"${JUNIPER_HOST}"'/' -i /root/startup.sh
sed 's/{{JUNIPER_USER}}/'"${JUNIPER_USER}"'/' -i /root/startup.sh
sed 's/{{JUNIPER_PASSWORD}}/'"${JUNIPER_PASSWORD}"'/' -i /root/startup.sh

exec "$@"