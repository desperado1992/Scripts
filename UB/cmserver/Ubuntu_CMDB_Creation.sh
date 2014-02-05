#!/bin/bash
user=root
host=localhost
pass=root
for db in  amon smon rmon hmon hive nav
do
sudo mysql  -h $host -u$user -p$pass -e "CREATE DATABASE IF NOT EXISTS $db DEFAULT CHARACTER SET utf8;GRANT ALL PRIVILEGES ON $db.* TO '$db'@'$host' IDENTIFIED BY '${db}_password';FLUSH PRIVILEGES;"
done
