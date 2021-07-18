#!/usr/bin/bash
source common.sh

PRINT "Installing Nginx\t"
yum install nginx -y &>$LOG
STAT_CHECK $?

PRINT "Download Frontend"
curl -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>$LOG
STAT_CHECK $?

PRINT "Remove all the old HTDocs"
cd /usr/share/nginx/html &>$LOG && rm -rf * &>$LOG
STAT_CHECK $?

PRINT "Extract Frontend Archives"
unzip /tmp/frontend.zip &>$LOG && mv frontend-main/* . &>$LOG && mv static/* . &>$LOG && rm -rf frontend-master static &>$LOG
STAT_CHECK $?

PRINT "Update Roboshop Config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>$LOG
STAT_CHECK $?

PRINT "Enabling Nginx\t\t"
systemctl enable nginx &>$LOG
STAT_CHECK $?

PRINT "Starting Nginx\t\t"
systemctl restart nginx &>$LOG
STAT_CHECK $?



#################################################systemctl status nginx >>$LOG




## 1) Cleaning up all the output and error message showing in the terminal
##    -- Output from command should not be displayed on the screen
##    -- use the redirect (> or &> or 1> or 2>) the log message to a desired folder