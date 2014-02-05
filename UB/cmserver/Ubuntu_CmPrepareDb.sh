#!/bin/bash
sudo /bin/bash /usr/share/cmf/schema/scm_prepare_database.sh -h localhost mysql amon amon amon_password
sudo service cloudera-scm-server start
