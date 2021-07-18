#!/usr/bin/bash
LOG=/tmp/roboshop.log
rm -f $LOG                    ##### Deleting exiting log already saved inside

###echo -e "Installing Nginx\t\t.....\t\e[32mdone\e[0m"
yum install nginx -y &>>$LOG  ##### &> means attaching both output and error in one file
#echo $?                       ##### Exit command will display 0 if it is successful
if [ $? -eq 0 ]; then
  echo -e "\t...\e[32m nginx Successfully Installed\e[0m"
else
  echo -e "\t...\e[32m nginx Installation Failed\e[0m"
fi

###echo -e "Enabling Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl enable nginx &>>$LOG
if [ $? -eq 0 ]; then
  echo -e "\t...\e[32mngnix_Successfully_Enabled\e[0m"
else
  echo -e "\t...\e[32mnginx_Enabling_Failed\e[0m"
fi

###echo -e "Starting Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl start nginx &>>$LOG
if [ $? -eq 0 ]; then
  echo -e "\t...\e[32mnginx_Successfully_Started\e[0m"
else
  echo -e "\t...\e[32mnginx_Starting_Failed\e[0m"
fi
###echo -e "Checking Status Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl status nginx &>>$LOG
if [ $? -eq 0 ]; then
  echo -e "\t...\e[32mnginx_Status_Checking\e[0m"
else
  echo -e "\t...\e[32mnginx_Status_Checking_Failed\e[0m"
fi