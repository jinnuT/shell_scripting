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


PRINT "Extract Downloaded code"
cd /home/roboshop && unzip /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue && cd /home/roboshop/catalogue && npm install
STAT_CHECK $?

