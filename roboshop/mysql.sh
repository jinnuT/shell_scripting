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
PRINT "Reset MySQL Root Password"
DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $(NF-0)}')
echo "show databases;" | mysql -uroot -pRoboShop@1 &>>$LOG
if [ $? -ne 0 ]; then
  echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" | mysql --connect-expired-password -uroot -p${DEFAULT_PASSWORD} &>>$LOG
fi
STAT_CHECK $?

PRINT "Uninstall MySQL Password Policy" 
echo SHOW PLUGINS | mysql -uroot -pRoboShop@1 &>>$LOG | grep -i validate_password &>>$LOG
if [ $? -eq 0 ]; then
  echo "uninstall plugin validate_password;" | mysql -uroot -pRoboShop@1 &>>$LOG
fi
STAT_CHECK $?


PRINT "Download Schema"
curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Load Schema"
cd /tmp && unzip -o mysql.zip &>>$LOG && cd mysql-main && mysql -uroot -pRoboShop@1 <shipping.sql &>>$LOG
STAT_CHECK $?

