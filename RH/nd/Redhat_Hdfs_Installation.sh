#!/bin/bash
_HHD="hadoop-hdfs"
sudo rpm -qa | grep -i $_HHD
if [ $? -ne 0 ];then
sudo yum install $_HHD -y
else
echo "$_HHD is already installed in your system"
fi

_H="hadoop"
sudo rpm -qa | grep -i $_H
if [ $? -ne 0 ];then
sudo yum install $_H -y
else
echo "$_H is already installed in your system"
fi
