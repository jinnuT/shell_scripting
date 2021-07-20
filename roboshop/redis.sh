#!/usr/bin/bash

source common.sh

PRINT "Install Redis Repos"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STAT_CHECK $?

PRINT "Install Redis\t"
# yum-config-manager --enable remi
yum install redis -y --enablerepo=remi &>>$LOG
STAT_CHECK $?

#Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf

#Start Redis Database

# systemctl enable redis
# systemctl start redis