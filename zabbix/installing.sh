tar -xzvf zabbix-*.tar.gz
cd zabbix*
$location=`pwd`

#Create user 
groupadd zabbix
useradd -g zabbix zabbix

#add server
#Create database


##

cd $location
./configure --enable-server --enable-agent --with-mysql --enable-ipv6 --with-net-snmp --with-libcurl --with-libxml2
make install

###change php.ini file in /usr/local/***


###edit configure files
##/usr/local/etc/zabbix_***






