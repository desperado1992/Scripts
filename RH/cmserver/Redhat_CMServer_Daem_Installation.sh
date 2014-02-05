#!/bin/bash
##installing cloudera manager server and daemons
_CMS="cloudera-manager-server"
sudo rpm -qa | grep -i $_CMS
if [ $? -ne 0 ];then
sudo yum install $_CMS -y
else
echo "$_CMS is already installed in your system"
fi

_CMD="cloudera-manager-daemons"
sudo rpm -qa | grep -i $_CMD
if [ $? -ne 0 ];then
sudo yum install $_CMD -y
else
echo "$_CMD is already installed in your system"
fi
#sudo yum install cloudera-manager-server cloudera-manager-daemons -y
sudo /bin/bash /usr/share/cmf/schema/scm_prepare_database.sh -h localhost mysql amon amon amon_password
sudo service cloudera-scm-server start
