#!/bin/bash
ENABLED=`cat /selinux/enforce`
if [ "$ENABLED" == "1" ];then
echo -e "Selinux is enabled, \033[1;31mdisabling the Selinux!!!\033[0m"
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
sudo reboot
else
echo "Selinux is already disabled"
fi

