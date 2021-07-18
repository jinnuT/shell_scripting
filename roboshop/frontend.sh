#!/usr/bin/bash
LOG=/tmp/roboshop.log
rm -f $LOG                    ##### Deleting exiting log already saved inside

###echo -e "Installing Nginx\t\t.....\t\e[32mdone\e[0m"
yum install nnginx -y &>>$LOG  ##### &> means attaching both output and error in one file
#echo $?                       ##### Exit command will display 0 if it is successful
if [ $? -eq 0 ]; then
  echo -e "\e[32mnginx Successfully Installed\e[0m"
else
  echo -e "\e[31mnginx Installation Failed\e[0m"
fi

###echo -e "Enabling Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl enable nginx &>>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32mngnix Successfully Enabled\e[0m"
else
  echo -e "\e[31mnginx Enabling Failed\e[0m"
fi

###echo -e "Starting Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl start nginx &>>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32mnginx Successfully Started\e[0m"
else
  echo -e "\e[31mnginx Starting Failed\e[0m"
fi
###echo -e "Checking Status Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl status nginx &>>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32mnginx Status Checked succesfully\e[0m"
else
  echo -e "\e[31mnginx Status Checking Failed\e[0m"
fi