#!/bin/bash
p="mysql-server"
sudo rpm -qa "$p" > t1
my_size=$(wc -l < t1)
echo "size of reported fil is $my_size lines"

if [[ "$( rpm -qa $p)" =~ "${p}" ]];then
echo -e "\033[1;32mpackage $p is installed..\033[0m"
echo "check $p daemon is starting or not"
Service_Name="mysqld"
Validation=`ps aux | grep -v grep | grep  $Service_Name | wc -l | awk '{print $1}'`

  if [ "$Validation" != "0" ];then
    echo -e "\033[1;32mService $Service_Name is already running\033[0m"
    
  else
    echo -e "\033[1;31mservice $Sevice_Name is not started!!starting mysql daemon\033[0m"
    sudo service $Service_Name start
    
  fi
else
echo -e  "\033[1;31mpackage $p is not found!!Installing $p\033[0m"
sudo yum install mysql-server -y

fi
sudo yum install mysql-connector-java -y

Service_Name=mysqld
 Validation=`ps aux | grep -v grep | grep  $Service_Name | wc -l | awk '{print $1}'`

  if [ $Validation != "0" ];then
    echo "Service $Service_Name is already running"
  else
  echo "$Service_Name is stopped,starting $Service_Name service........"
  sleep 1
  sudo service $Service_Name start

 fi
sudo /usr/bin/mysqladmin -u root password 'root'
sudo /sbin/chkconfig mysqld on
