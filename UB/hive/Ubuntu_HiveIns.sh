#!/bin/bash
##installing hive and linking mysql jar to hive lib
sudo apt-get install hive -y
sudo ln -s /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/mysql-connector-java.jar
