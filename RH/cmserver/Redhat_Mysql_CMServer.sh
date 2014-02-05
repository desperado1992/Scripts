#!/bin/bash
sudo yum install mysql-server -y
sudo service mysqld start
sudo yum install mysql-connector-java -y
sudo chmod 666 /etc/my.cnf
sudo cat > /etc/my.cnf << EOF
[mysqld]
transaction-isolation=READ-COMMITTED
# Disabling symbolic-links is recommended to prevent assorted security risks
#symbolic-links=0
key_buffer              = 16M
key_buffer_size         = 32M
max_allowed_packet      = 16M
thread_stack            = 256K
thread_cache_size       = 64
query_cache_limit       = 8M
query_cache_size        = 64M
query_cache_type        = 1
# Important: see Configuring the Databases and Setting max_connections
max_connections         = 550
# log-bin should be on a disk with enough free space
log-bin=/x/home/mysql/logs/binary/mysql_binary_log
# For MySQL version 5.1.8 or later. Comment out binlog_format for older versions.
binlog_format           = mixed
read_buffer_size 		= 2M
read_rnd_buffer_size 		= 16M
sort_buffer_size 		= 8M
join_buffer_size 		= 8M
# InnoDB settings
innodb_file_per_table 		= 1
innodb_flush_log_at_trx_commit  = 2
innodb_log_buffer_size          = 64M
#innodb_buffer_pool_size         = 4G
innodb_thread_concurrency       = 8
innodb_flush_method             = O_DIRECT
innodb_log_file_size 		= 512M

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
EOF
sudo chmod 644 /etc/my.cnf
sudo mkdir -p /x/home/mysql/logs/binary/
sudo chown -R mysql:mysql /x/
sudo service mysqld stop
sudo sleep 30
sudo mv /var/lib/mysql/ib_logfile* /tmp
sudo service mysqld start
sudo sleep 30
sudo /usr/bin/mysqladmin -u root password 'root'
sudo /sbin/chkconfig mysqld on
##creating databases for cloudera manager

USER=root
HOSTNAME=localhost
PASS=root
DB1=amon
USER1=amon
DB2=smon
USER2=smon
DB3=rmon
USER3=rmon
DB4=hmon
USER4=hmon
DB5=hive
USER5=hive
DB6=nav
USER6=nav


sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "CREATE USER '$USER1'@'localhost' IDENTIFIED BY 'amon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "create database $DB1 DEFAULT CHARACTER SET utf8;"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "grant all on $DB1.* TO '$DB1'@'%' IDENTIFIED BY 'amon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "flush privileges;"

sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "CREATE USER '$USER2'@'localhost' IDENTIFIED BY 'smon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "create database $DB2 DEFAULT CHARACTER SET utf8;"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "grant all on $DB2.* TO '$DB2'@'%' IDENTIFIED BY 'smon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "flush privileges;"


sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "CREATE USER '$USER3'@'localhost' IDENTIFIED BY 'rmon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "create database $DB3 DEFAULT CHARACTER SET utf8;"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "grant all on $DB3.* TO '$DB3'@'%' IDENTIFIED BY 'rmon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "flush privileges;"

sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "CREATE USER '$USER4'@'localhost' IDENTIFIED BY 'hmon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "create database $DB4 DEFAULT CHARACTER SET utf8;"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "grant all on $DB4.* TO '$DB4'@'%' IDENTIFIED BY 'hmon_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "flush privileges;"

sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "CREATE USER '$USER5'@'localhost' IDENTIFIED BY 'hive_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "create database $DB5 DEFAULT CHARACTER SET utf8;"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "grant all on $DB5.* TO '$DB5'@'%' IDENTIFIED BY 'hive_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "flush privileges;"


sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "CREATE USER '$USER6'@'localhost' IDENTIFIED BY 'nav_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "create database $DB6 DEFAULT CHARACTER SET utf8;"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "grant all on $DB6.* TO '$DB6'@'%' IDENTIFIED BY 'nav_password';"
sudo mysql -u $USER -h $HOSTNAME -p$PASS -Bse "flush privileges;"

