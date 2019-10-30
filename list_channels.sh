#!/bin/sh
qmngr_name="QMEMBFE"

path="/tmp/$(head -n 20 /dev/urandom | cksum | cut -f1 -d ' ')"
echo "dis channel(*)" > ${path}
runmqsc ${qmngr_name} < ${path} | tail -n +6
rm -f ${path}
