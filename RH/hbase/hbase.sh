#!/bin/bash
nn=`cat /tmp/ZooUpdation*.txt | grep NameNode1 | awk '{print $2}'`

hs="/etc/hbase/conf/hbase-site.xml"
sudo cat > HS << EOF
<property>
<name>hbase.zookeeper.quorum</name>
<value>$nn</value>
</property>
EOF
sudo chmod 666 $hs
sudo sed -i '/<configuration>/r./HS' $hs
sudo chmod 644 $hs
