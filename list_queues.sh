#!/bin/sh
qmngr_name="QMEMBFE"

out=$(
runmqsc ${qmngr_name} <<EOF
dis queue(*)
EOF
)
echo "$out" | awk '/QUEUE\(/ {print $0}'