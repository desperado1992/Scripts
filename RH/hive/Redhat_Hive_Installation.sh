#!/bin/bash
_HV="hive"
sudo rpm -qa | grep -i $_HV
if [ $? -ne 0 ];then
echo "$_HV is already installed in your system"
else
sudo yum install $_HV -y
fi
sudo cp /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/
