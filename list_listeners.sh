#!/bin/sh
qmngr_name="QMEMBFE"

path="/tmp/$(head -n 20 /dev/urandom | cksum | cut -f1 -d ' ')"
echo "dis listener(*)" > ${path}
runmqsc ${qmngr_name} < ${path} | awk '/LISTENER\(/ {print $0}'
rm -f ${path}
