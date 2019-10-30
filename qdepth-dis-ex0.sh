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

path="/tmp/$(head -n 20 /dev/urandom | cksum | cut -f1 -d ' ')"
echo "dis qs(${queue_name})" > ${path}
runmqsc ${qmngr_name} < ${path} | awk '/CURDEPTH/ {n=index($1, ")");print substr($1,10,n-10)}'
rm -f ${path}
