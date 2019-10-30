#!/bin/sh
#
# 检查某个 listener 的状态（比如pid、running、端口）
# 

qmngr_name="QMEMBFE"
listener_name="QMEMBFE"

path="/tmp/$(head -n 20 /dev/urandom | cksum | cut -f1 -d ' ')"
echo "dis lsstatus(${listener_name})" > ${path}
runmqsc ${qmngr_name} < ${path} | sed -n '7,12p'
rm -f ${path}
