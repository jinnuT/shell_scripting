#!/usr/bin/bash
source common.sh

PRINT "Installing Nginx\t\t"
yum install nginx -y &>$LOG
STAT_CHECK $?

PRINT "Download Frontend\t\t"
curl -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>$LOG
STAT_CHECK $?

PRINT "Remove all the old HTDocs\t"
cd /usr/share/nginx/html &>$LOG && rm -rf * &>$LOG
STAT_CHECK $?

PRINT "Extract Frontend Archives\t"
unzip /tmp/frontend.zip &>$LOG && mv frontend-main/* . &>$LOG && mv static/* . &>$LOG && rm -rf frontend-master static &>$LOG
STAT_CHECK $?

PRINT "Copy Roboshop Config\t\t"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>$LOG
STAT_CHECK $?

PRINT "Update Roboshop Config\t\t"
sed -i -e "/catalogue/ s/localhost/catalogue.roboshop.internal/" /etc/nginx/default.d/roboshop.conf
STAT_CHECK $?

PRINT "Enabling Nginx\t\t\t"
systemctl enable nginx &>$LOG
STAT_CHECK $?

PRINT "Starting Nginx\t\t\t"
systemctl restart nginx &>$LOG
STAT_CHECK $?



