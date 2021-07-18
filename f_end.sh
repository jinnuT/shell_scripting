#!/usr/bin/bash
source common.sh

PRINT "Installing Nginx\t"
yum install nginx -y >>$LOG
STAT_CHECK $?

PRINT "Enabling Nginx\t\t"
systemctl enable nginx >>$LOG
STAT_CHECK $?

PRINT "Starting Nginx\t\t"
systemctl start nginx >>$LOG
STAT_CHECK $?
#################################################systemctl status nginx >>$LOG




## 1) Cleaning up all the output and error message showing in the terminal
##    -- Output from command should not be displayed on the screen
##    -- use the redirect (> or &> or 1> or 2>) the log message to a desired folder