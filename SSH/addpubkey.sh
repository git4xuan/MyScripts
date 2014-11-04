#!/bin/bash

#The VPS was first created and I have to configture it.
#Here is a Script to add my personal public Key.

mkdir /root/.ssh/
mv /etc/ssh/sshd_config{,.bak}
rm -f /etc/ssh/sshd_config
cat ./files/sshd_config_sample >>  /etc/ssh/sshd_config
cat ./files/id_rsa_2048onekey.pub >> /root/.ssh/authorized_keys
chmod 600   /root/.ssh/authorized_keys
chmod 700  /root/.ssh/
/etc/init.d/sshd restart


