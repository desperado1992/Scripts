#!/bin/bash
_HM="hadoop-0.20-mapreduce"
sudo rpm -qa | grep -i $_HM
if [ $? -ne 0 ];then
sudo yum install $_HM -y
else
echo "$_HM is already installed in your system"
fi

