#!/bin/bash
##installing mysql server and configuring my.cnf file
sudo apt-get update
package="mysql-server"

pakver=`sudo dpkg-query -W -f='${PackageSpec} ${Status}\n' | grep installed |  sort -u | cut -f1 -d '' | grep mysql-server | wc -l | awk '{print $1}'`
if [ "$pakver" = "0" ];then
    echo "$package is not yet installed!!!installing $package"
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
    sudo apt-get -y install mysql-server
    file=/etc/mysql/my.cnf

   if [ -e $file ];then
   echo "The $file exists";echo "changing file permissions to writable!!";sudo chmod ugo+w $file
   elif [ ! -e $file ];then
   echo "The $file does NOT exist"
   fi

elif [ "$pakver" != "0" ];then
pakdae="mysqld"
echo "$package is already installed!!!check $pakdae is started or not!!if not start the $pakdae"
daever=`ps aux | grep -v grep | grep  $pakdae | wc -l | awk '{print $1}'`
  if [ "$daever" != "0" ];then
  echo "$pakdae  is already running"
  elif [ "$daever" = "0" ];then
  echo "$pakdae daemon is not yet started!!starting $pakdae"
  sudo service mysql start
  sleep 10s
  fi
fi

sudo touch /var/log/mysql/mysql-bin.log
sudo chown -R mysql:mysql /var/log/mysql/mysql-bin.log
sudo service mysql stop
sleep 10s
sudo chmod 666 /etc/mysql/my.cnf
sudo cat > /etc/mysql/my.cnf << EOF
#
# The MySQL database server configuration file.

#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

# This will be passed to all mysql clients
# It has been reported that passwords should be enclosed with ticks/quotes
# escpecially if they contain "#" chars...
# Remember to edit /etc/mysql/debian.cnf when changing the socket location.
[client]
port		= 3306
socket		= /var/run/mysqld/mysqld.sock

# Here is entries for some specific programs
# The following values assume you have at least 32M ram

# This was formally known as [safe_mysqld]. Both versions are currently parsed.
[mysqld_safe]
socket		= /var/run/mysqld/mysqld.sock
nice		= 0

[mysqld]
transaction-isolation=READ-COMMITTED
#
# * Basic Settings
#
user		= mysql
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
port		= 3306
basedir		= /usr
datadir		= /var/lib/mysql
tmpdir		= /tmp
lc-messages-dir	= /usr/share/mysql
skip-external-locking
#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address		= 127.0.0.1
#
# * Fine Tuning
#
key_buffer		= 16M
key_buffer_size         = 32M
thread_stack		= 256K
thread_cache_size       = 64
# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
myisam-recover         = BACKUP
#max_connections        = 100
max_connections        = 550
# log-bin should be on a disk with enough free space
log_bin			= /var/log/mysql/mysql-bin.log
# For MySQL version 5.1.8 or later. Comment out binlog_format for older versions
binlog_format           = mixed

read_buffer_size = 2M
read_rnd_buffer_size = 16M
sort_buffer_size = 8M
join_buffer_size = 8M

# InnoDB settings
innodb_file_per_table = 1
innodb_flush_log_at_trx_commit  = 2
innodb_log_buffer_size          = 64M
#innodb_buffer_pool_size         = 4G
innodb_thread_concurrency       = 8
innodb_flush_method             = O_DIRECT
innodb_log_file_size = 512M


#table_cache            = 64
#thread_concurrency     = 10
#
# * Query Cache Configuration
#
query_cache_limit	= 8M
query_cache_size        = 64M
query_cache_type        = 1
#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# As of 5.1 you can enable the log at runtime!
#general_log_file        = /var/log/mysql/mysql.log
#general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
#log_slow_queries	= /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes
#
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
#server-id		= 1
#log_bin			= /var/log/mysql/mysql-bin.log
expire_logs_days	= 10
max_binlog_size         = 100M
#binlog_do_db		= include_database_name
#binlog_ignore_db	= include_database_name
#
# * InnoDB
#
# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
# Read the manual for more InnoDB related options. There are many!
#
# * Security Features
#
# Read the manual, too, if you want chroot!
# chroot = /var/lib/mysql/
#
# For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
#
# ssl-ca=/etc/mysql/cacert.pem
# ssl-cert=/etc/mysql/server-cert.pem
# ssl-key=/etc/mysql/server-key.pem
[mysqldump]
quick
quote-names
max_allowed_packet	= 16M

[mysql]
#no-auto-rehash	# faster start of mysql but no tab completition

[isamchk]
key_buffer		= 16M
#
# * IMPORTANT: Additional settings that can override those from this file!
#   The files must end with '.cnf', otherwise they'll be ignored.
#
!includedir /etc/mysql/conf.d/
EOF
sudo chmod 644 /etc/mysql/my.cnf
sudo chmod 666 /var/lib/mysql/
sudo mv /var/lib/mysql/ib_logfile* /tmp
sudo chmod 700 /var/lib/mysql/
pakdae="mysqld"
echo "check $pakdae is started or not!!if not start the $pakdae"
daever=`ps aux | grep -v grep | grep  $pakdae | wc -l | awk '{print $1}'`
  if [ "$daever" != "0" ];then
  echo "$pakdae  is already running"
  elif [ "$daever" = "0" ];then
  echo "$pakdae daemon is not yet started!!starting $pakdae"
  sudo service mysql start
  sleep  10s
  fi
sudo apt-get -y install libmysql-java
