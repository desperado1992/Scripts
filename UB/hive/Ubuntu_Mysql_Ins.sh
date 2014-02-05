#!/bin/bash
##installing mysql-server without prompting password
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install mysql-server -y
sudo service mysql start
sudo apt-get install libmysql-java -y
sudo update-rc.d mysql defaults
