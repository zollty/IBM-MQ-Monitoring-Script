#!/bin/sh
#
# 检查某个 队列 的深度
# 
# 建议：
#   对主要使用的队列深度设定阈值（比如10000），超过则告警
#   同时，建议监控“死信队列”的深度，并设定阈值（比如200），超过则告警
#

qmngr_name="QMEMBFE"
queue_name="BMSRESPONSE_MNG"

out=$(
runmqsc ${qmngr_name} <<EOF
dis qs(${queue_name})
EOF
)
echo "$out" | awk '/CURDEPTH/ {n=index($1, ")");print substr($1,10,n-10)}'
