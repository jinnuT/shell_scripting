#!/usr/bin/bash
LOG=/tmp/roboshop.log

echo -e "Installing Nginx\t\t.....\t\e[32mdone\e[0m"
yum install nginx -y >>$LOG
echo "-----------------------------------------------------"
echo -e "Enabling Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl enable nginx >>$LOG
echo "-----------------------------------------------------"
echo -e "Starting Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl start nginx >>$LOG
echo "-----------------------------------------------------"
echo -e "Checking Status Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl status nginx >>$LOG


