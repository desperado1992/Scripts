#!/bin/bash
/bin/bash /tmp/RH/Iptables.sh
/bin/bash  /tmp/RH/cmserver/Redhat_Mysql_CMServer.sh
/bin/bash  /tmp/RH/Redhat_Repo_Creation.sh
/bin/bash  /tmp/RH/cmserver/Redhat_CMServer_Daem_Installation.sh

