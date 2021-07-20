#!/usr/bin/bash

source common.sh

PRINT "Install Redis Repos\t"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STAT_CHECK $?

PRINT "Install Redis\t\t"
# yum-config-manager --enable remi
yum install redis -y --enablerepo=remi &>>$LOG
STAT_CHECK $?

PRINT "Update Redia Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf
STAT_CHECK $?
#Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf

PRINT "Start Redis Service\t"
systemctl enable redis && systemctl restart redis &>>$LOG
STAT_CHECK $?