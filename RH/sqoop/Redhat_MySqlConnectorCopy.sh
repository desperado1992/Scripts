#!/bin/bash
SQ="sqoop"
rpm -q $SQ
if [ $? -ne "0" ];then
sudo yum install $SQ -y
else
echo "$SQ is already installed in your system"
fi
#Install Mysql jar for sqoop
MJ="mysql-connector-java"
rpm -q $MJ
if [ $? -ne "0" ];then
sudo yum install $MJ -y
else
echo "$MJ is already installed in your system"
fi
sudo cp /usr/share/java/mysql-connector-java.jar /usr/lib/sqoop/lib/
