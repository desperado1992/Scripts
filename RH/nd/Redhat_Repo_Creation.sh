#!/bin/bash
_CDH=cloudera-cdh4.repo
_CM=cloudera-manager.repo
sudo touch /etc/yum.repos.d/{$_CDH,$_CM}
sudo chmod 666 /etc/yum.repos.d/{$_CDH,$_CM}
sudo cat > /etc/yum.repos.d/$_CDH << EOF
[cloudera-cdh4]
name=Cloudera's Distribution for Hadoop, Version 4
baseurl=http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4.4.0
gpgkey=http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera 
gpgcheck=1
EOF
sudo cat > /etc/yum.repos.d/$_CM << EOF
[cloudera-manager]
name=Cloudera Manager
baseurl=http://archive.cloudera.com/cm4/redhat/6/x86_64/cm/4.7.3
gpgkey=http://archive.cloudera.com/cm4/redhat/6/x86_64/cm/RPM-GPG-KEY-cloudera
gpgcheck=1
EOF
sudo rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
