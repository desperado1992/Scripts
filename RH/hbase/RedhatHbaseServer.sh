#!/bin/bash
_Hbmaster="hbase-master"
sudo rpm -qa | grep -i $_Hbmaster
if [ $? -ne 0 ];then
sudo yum install $_Hbmaster -y
else
echo "$_Hbmaster is already installed in your system"
fi

_Hbrest="hbase-rest"
sudo rpm -qa | grep -i $_Hbrest
if [ $? -ne 0 ];then
sudo yum install $_Hbrest -y
else
echo "$_Hbrest is already installed in your system"
fi

#sudo service hbase-master start
#sudo service hbase-rest start
