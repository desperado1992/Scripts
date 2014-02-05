#!/bin/bash
sudo yum install zookeeper-server -y
sudo service zookeeper-server init --myid=2
