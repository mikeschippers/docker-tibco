#!/bin/bash
export TEA_SERVER=http://$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'):8777/tea
echo Starting TEA SERVER on http://$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'):8777/tea
exec "$@"
