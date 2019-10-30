#!/bin/bash
#
# 检查MQ的总连接数，（可以理解为：通道连接数、网络连接数，差不多是一个意思）
# 
# 建议连接数 控制在 100以下，（只是建议，具体请参见MQ官方文档的描述）
#

dspmqtrn -a | grep "TranNum(" | wc -l
# 与下面两个等价
# netstat -tnp | grep amqrmppa | wc -l
# 或
# netstat -tn | grep :14 | wc -l
