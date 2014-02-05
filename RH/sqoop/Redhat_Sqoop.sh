_Sq="sqoop"
sudo rpm -qa | grep -i $_Sq
if [ $? -ne 0 ];then
sudo yum install $_Sq -y
else
echo "$_Sq is already installed in your system"
fi

_Sq1="sqoop2-server"
sudo rpm -qa | grep -i $_Sq1
if [ $? -ne 0 ];then
sudo yum install $_Sq1 -y
else
echo "$_Sq1 is already installed in your system"
fi

_Sq2="sqoop2-client"
sudo rpm -qa | grep -i $_Sq2
if [ $? -ne 0 ];then
sudo yum install $_Sq2 -y
else
echo "$_Sq2 is already installed in your system"
fi

sudo /sbin/service sqoop2-server start
