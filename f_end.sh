#!/usr/bin/bash

LOG=/tmp/rbshop.log


yum install nginx -y >>$LOG
systemctl enable nginx >>$LOG
systemctl start nginx >>$LOG
systemctl status nginx >>$LOG




## 1) Cleaning up all the output and error message showing in the terminal
##      - use the redirect (> or &> or 1> or 2>) the log message to a desired folder