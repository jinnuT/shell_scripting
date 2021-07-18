#!/usr/bin/bash

LOG=/tmp/rbshop.log
rm -f $LOG

echo -n -e "Installing Nginx....\t\t"
yum install nginx -y >>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32mdone..\e[0m"
else
  echo -e "\e[31mfail..\e[0m"
fi
echo -n -e "Enabling Nginx...."
systemctl enable nginx >>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32mdone..\e[0m"
else
  echo -e "\e[31mfail..\e[0m"
fi
echo -n -e "Starting Nginx...."
systemctl start nginx >>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32mdone..\e[0m"
else
  echo -e "\e[31mfail..\e[0m"
fi
#################################################systemctl status nginx >>$LOG




## 1) Cleaning up all the output and error message showing in the terminal
##    -- Output from command should not be displayed on the screen
##    -- use the redirect (> or &> or 1> or 2>) the log message to a desired folder