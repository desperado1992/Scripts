#!/bin/bash
pakdae="zookeeper"
echo "check $pakdae is started or not..if not start the $pakdae"
daever=`ps aux | grep -v grep | grep  $pakdae | wc -l | awk '{print $1}'`
if [ "$daever" != "0" ];then
echo "$pakdae  is already running"
elif [ "$daever" == "0" ];then
echo "$pakdae daemon is not yet started!!starting $pakdae"
sudo service zookeeper-server start
fi
