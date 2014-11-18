#!/bin/bash
# source
yum install make gcc mysql-server mysql-devel libcurl-devel net-snmp-devel php php-gd php-xml php-mysql php-mbstring php-bcmath httpd wget lrzsz telnet lsof -y

echo "Input the Version of zabbix-server:"
echo "You can get it from http://"
read -p "Enter the version you want:" zabbix_version
if [ "$zabbix_version"= "" ]; then
	exit 1
fi
echo "========================================="
echo "The Zabbix install will start"
echo "========================================="

get_char ()
{
SAVEDSTTY `stty -g`
stty echo
stty cbreak
dd if=/dev/tty bs=1 count=1 2> /dev/null
stty -raw
stty echo
stty $SAVEDSTTY
}

echo ""
echo "Please enter any key to start or Ctrl-C to break "
char = `get_char`

echo "============Check files=================="
if [ -s zabbix-$zabbix_version.tar.gz ]; then
     echo "zabbix-$zabbix_version.tar.gz [found]"
else
     echo "No needed files found , download now..."
     wget -c http://iweb.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$zabbix_version/zabbix-$zabbix_version.tar.gz
     if [ $? -eq 0 ]; then
         echo "Download successfully!"
     else
         echo "Error,The version you entered may incorrect,please check"
         echo "Your input version is $zabbix_version"
		 sleep 5
		 exit 1
	 fi
  
fi

#Begin Install Shell




