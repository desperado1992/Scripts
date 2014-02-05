#!/bin/bash
_Hbregionserver="hbase-regionserver"
sudo rpm -qa | grep -i $_Hbregionserver
if [ $? -ne 0 ];then
sudo yum install $_Hbregionserver -y
else
echo "$_Hbregionserver is already installed in your system"
fi

_Hbase="hbase"
sudo rpm -qa | grep -i $_Hbase
if [ $? -ne 0 ];then
sudo yum install $_Hbase -y
else
echo "$_Hbase is already installed in your system"
fi

_Hbthrift="hbase-thrift"
sudo rpm -qa | grep -i $_Hbthrift
if [ $? -ne 0 ];then
sudo yum install $_Hbthrift -y
else
echo "$_Hbthrift is already installed in your system"
fi

#sudo service hbase-regionserver start

