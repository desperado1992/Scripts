#!/bin/bash
user=root
host=localhost
pass=root
sudo mysql  -h $host -u$user -p$pass -e "CREATE DATABASE metastore;GRANT ALL PRIVILEGES ON *.* TO 'hive'@'$host' IDENTIFIED BY 'hive';FLUSH PRIVILEGES;"
sudo chmod 666 /etc/hive/conf/hive-site.xml
sudo cat > /etc/hive/conf/hive-site.xml<<EOF
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
<name>javax.jdo.option.ConnectionURL</name>
<value>jdbc:mysql://localhost:3306/metastore?createDatabaseIfNotExist=true</value>
</property>
<property>
<name>javax.jdo.option.ConnectionDriverName</name>
<value>com.mysql.jdbc.Driver</value>
</property>
<property>
<name>javax.jdo.option.ConnectionUserName</name>
<value>hive</value>
</property>
<property>
<name>javax.jdo.option.ConnectionPassword</name>
<value>hive</value>
</property>
</configuration>
EOF
sudo chmod 644 /etc/hive/conf/hive-site.xml
