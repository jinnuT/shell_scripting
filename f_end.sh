#!/usr/bin/bash

LOG=/tmp/rbshop.log
rm -f $LOG

STAT_CHECK(){
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mdone..\e[0m"
  else
    echo -e "\e[31mfail..\e[0m"
    exit 1
fi

}

echo -n -e "Installing Nginx\t"
yum install nginx -y >>$LOG
STAT_CHECK $?

echo -n -e "Enabling Nginx\t\t"
systemctl enable nginx >>$LOG
STAT_CHECK $?

echo -n -e "Starting Nginx\t\t"
systemctl start nginx >>$LOG
STAT_CHECK $?
#################################################systemctl status nginx >>$LOG




## 1) Cleaning up all the output and error message showing in the terminal
##    -- Output from command should not be displayed on the screen
##    -- use the redirect (> or &> or 1> or 2>) the log message to a desired folder