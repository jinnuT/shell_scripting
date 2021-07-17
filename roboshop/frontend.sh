#!/usr/bin/bash
LOG=/tmp/roboshop.log

echo "Installing Nginx\t\t.....\t\e[32mdone\e[0m"
yum install nginx -y >$LOG

echo "Enabling Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl enable nginx >$LOG

echo "Starting Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl start nginx >$LOG

echo "Checking Status Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl status nginx >$LOG


