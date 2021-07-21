#!/usr/bin/bash

source common.sh

PRINT "Setup MySQL Repos"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STAT_CHECK $?

PRINT "Install MySQL\t"
yum install mysql-community-server -y &>>$LOG
STAT_CHECK $?

PRINT "Start MySQL Service"
systemctl enable mysqld &>>$LOG && systemctl start mysqld &>>$LOG
STAT_CHECK $?

#Now a default root password will be generated and given in the log file.
# grep temp /var/log/mysqld.log

