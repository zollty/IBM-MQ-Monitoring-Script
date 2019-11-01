#!/bin/sh
#
# 检查某个 listener 的状态（比如pid、running、端口）
# 

qmngr_name="QMEMBFE"
listener_name="QMEMBFE"

out=$(
runmqsc ${qmngr_name} <<EOF
dis lsstatus(${listener_name})
EOF
)
echo "$out" | sed -n '7,12p'