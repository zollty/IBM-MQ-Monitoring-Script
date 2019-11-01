#!/bin/sh
qmngr_name="QMEMBFE"

out=$(
runmqsc ${qmngr_name} <<EOF
dis listener(*)
EOF
)
echo "$out" | awk '/LISTENER\(/ {print $0}'