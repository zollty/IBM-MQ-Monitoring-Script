#!/bin/sh
#
# 检查 某个通道 的连接数
#

qmngr_name="QMEMBFE"
channel_name="BILL_SVR_CHL"

out=$(
runmqsc ${qmngr_name} <<EOF
dis chs(${channel_name})
EOF
)
echo "$out" | grep CONNAME | wc -l