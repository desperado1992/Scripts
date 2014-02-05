#!/bin/bash
NEWDATE=`date +%T --date '300 seconds'`
while [ `date +%T` != $NEWDATE ] ;do
sudo cat /tmp/ZooUpdation*.txt | grep NameNode1
 if [ "$?" == "1" ];then
 echo "nn is not updated"
 continue
 else
 echo "nn is updated"
 nn=`cat /tmp/ZooUpdation*.txt | grep NameNode1 | awk '{print $2}'`
 hs="/etc/hbase/conf/hbase-site.xml"
sudo chmod 666 $hs
sudo cat > $hs << EOF
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
<name>hbase.zookeeper.quorum</name>
<value>$nn</value>
</property>
<property>
<name>hbase.cluster.distributed</name>
<value>true</value>
</property>
<property>
<name>hbase.rootdir</name>
<value>hdfs://$nn:8020/hbase</value>
</property>
</configuration>
EOF
sudo chmod 644 $hs
break
fi
done
