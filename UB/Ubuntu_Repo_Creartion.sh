#!/bin/bash
sudo touch /etc/apt/sources.list.d/cloudera.list
sudo chmod 666 /etc/apt/sources.list.d/cloudera.list
sudo cat > /etc/apt/sources.list.d/cloudera.list << EOF
deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib
deb-src http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib
# Packages for Cloudera's Distribution for Hadoop, Version 4, on Ubuntu 12.04 x86_64
deb [arch=amd64] http://archive.cloudera.com/cm4/ubuntu/precise/amd64/cm precise-cm4 contrib
deb-src http://archive.cloudera.com/cm4/ubuntu/precise/amd64/cm precise-cm4 contrib
EOF
sudo curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
sudo chmod 644 /etc/apt/sources.list.d/cloudera.list
sudo apt-get update
sudo apt-get install oracle-j2sdk1.6 -y
