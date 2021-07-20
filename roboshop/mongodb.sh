#!/usr/bin/bash
source common.sh

PRINT "Setting up Repository\t"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT_CHECK $?

PRINT "Install Mongodb\t\t"
yum install -y mongodb-org &>$LOG
STAT_CHECK $?

#Update Liste IP address from 127.0.0.1 to 0.0.0.0 in config file
#PRINT "Update Mongodb Listen Address\t"
#Config file: /etc/mongod.conf



#systemctl enable mongod
# systemctl start mongod


#then restart the service

# systemctl restart mongod