#!/usr/bin/bash

source common.sh

PRINT "Install nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application User "
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
  useradd roboshop &>>$LOG
fi
STAT_CHECK $?


PRINT "Download Application Code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STAT_CHECK $?


PRINT "Extract Downloaded code\t"
cd /home/roboshop && unzip /tmp/catalogue.zip &>>$LOG && rm -rf catalogue && mv catalogue-main catalogue &>>$LOG
STAT_CHECK $?

PRINT "Installing Nodejs Dependancies"
cd /home/roboshop/catalogue && npm install --unsafe-perm &>>$LOG
STAT_CHECK $?

PRINT "Fix Application Permissions"
chown roboshop:roboshop /home/roboshop -R &>>$LOG
STAT_CHECK $?

PRINT "Update systemD file\t"
sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" /etc/systemd/system/catalogue.service && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT_CHECK $?

PRINT "Start Catalogue Service\t"
systemctl daemon-reload &>>$LOG && systemctl start catalogue &>>$LOG && systemctl enable catalogue &>>$LOG
STAT_CHECK $?