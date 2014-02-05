#!/bin/bash
nn=`cat /tmp/ZooUpdation*.txt | grep NameNode1 | awk '{print $2}'`
sl1=`cat /tmp/ZooUpdation*.txt | grep Slave1 | awk '{print $2}'`
sl2=`cat /tmp/ZooUpdation*.txt | grep Slave2 | awk '{print $2}'`
zf="/etc/zookeeper/conf.dist/zoo.cfg"
sudo chmod 666 $zf
sudo cat >> $zf << EOF
server.1=$nn:2888:3888
server.2=$sl1:2888:3888
server.3=$sl2:2888:3888
leadServer=yes
EOF
sudo chmod 644 $zf

sudo service zookeeper-server start
