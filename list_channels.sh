#!/bin/sh
qmngr_name="QMEMBFE"

out=$(
runmqsc ${qmngr_name} <<EOF
dis channel(*)
EOF
)
echo "$out" | tail -n +6