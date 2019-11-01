#!/bin/sh
qmngr_name="QMEMBFE"

out=$(
runmqsc ${qmngr_name} <<EOF
dis topic(*)
EOF
)
echo "$out" | awk '/TOPIC\(/ {print $0}'