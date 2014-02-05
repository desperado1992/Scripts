_P="pig"
sudo rpm -qa | grep -i $_P
if [ $? -ne 0 ];then
sudo yum install $_P -y
else
echo "$_P is already installed in your system"
fi
