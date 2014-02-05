#!/bin/bash
_CMA="cloudera-manager-agent"
sudo rpm -qa | grep -i $_CMA
if [ $? -ne 0 ];then
sudo yum install $_CMA -y
else
echo "$_CMA is already installed in your system"
fi

_CMD="cloudera-manager-daemons"
sudo rpm -qa | grep -i $_CMD
if [ $? -ne 0 ];then
sudo yum install $_CMD -y
else
echo "$_CMD is already installed in your system"
fi
#sudo yum install cloudera-manager-agent cloudera-manager-daemons -y

