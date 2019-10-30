#!/bin/sh
qmngr_name="QMEMBFE"

path="/tmp/$(head -n 20 /dev/urandom | cksum | cut -f1 -d ' ')"
echo "dis queue(*)" > ${path}
runmqsc ${qmngr_name} < ${path} | awk '/QUEUE\(/ {print $0}'
rm -f ${path}
