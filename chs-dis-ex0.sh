#!/bin/sh
#
# 检查 某个通道 的连接数
#

qmngr_name="QMEMBFE"
channel_name="BILL_SVR_CHL"

path="/tmp/$(head -n 20 /dev/urandom | cksum | cut -f1 -d ' ')"
echo "dis chs(${channel_name})" > ${path}
runmqsc ${qmngr_name} < ${path} | grep CONNAME | wc -l
rm -f ${path}
