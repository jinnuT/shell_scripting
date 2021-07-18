#!/usr/bin/bash

LOG=/tmp/rbshop.log
rm -f $LOG

echo -e "\t\t\e[32mInstalling Nginx....\t\e[0m"
yum install nginx -y >>$LOG
echo -e "\t\t\e[32mEnabling Nginx....\t\e[0m"
systemctl enable nginx >>$LOG
echo -e "\t\t\e[32mStarting Nginx....\t\e[0m"
systemctl start nginx >>$LOG
#################################################systemctl status nginx >>$LOG




## 1) Cleaning up all the output and error message showing in the terminal
##    -- Output from command should not be displayed on the screen
##    -- use the redirect (> or &> or 1> or 2>) the log message to a desired folder