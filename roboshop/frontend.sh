#!/usr/bin/bash
LOG=/tmp/roboshop.log
rm -f $LOG                    ##### Deleting exiting log already saved inside

PRINT(){
  echo -e "\t..."$1
}

STAT_CHECK1() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mnginx Successfully Installed\e[0m"
  else
    echo -e "\e[31mnginx Installation Failed\e[0m"
    exit 1
  fi
}

STAT_CHECK2() {

  if [ $1 -eq 0 ]; then
    echo -e "\e[32mngnix Successfully Enabled\e[0m"
  else
    echo -e "\e[31mnginx Enabling Failed\e[0m"
    exit 1
  fi
}

STAT_CHECK3() {

  if [ $1 -eq 0 ]; then
    echo -e "\e[32mngnix Successfully Started\e[0m"
  else
    echo -e "\e[31mnginx Start Failed\e[0m"
    exit 1
  fi
}

STAT_CHECK4() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mnginx Status Checked succesfully\e[0m"
  else
    echo -e "\e[31mnginx Status Checking Failed\e[0m"
    exit 1
  fi
}

###echo -e "Installing Nginx\t\t.....\t\e[32mdone\e[0m"
yum install nginx -y &>>$LOG  ##### &> means attaching both output and error in one file
#echo $?                       ##### Exit command will display 0 if it is successful
STAT_CHECK1 $?

###echo -e "Enabling Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl enable nginx &>>$LOG
STAT_CHECK2 $?

###echo -e "Starting Nginx\t\t\t.....\t\e[32mdone\e[0m"
systemctl start nginx &>>$LOG
STAT_CHECK3 $?

###echo -e "Checking Status Nginx\t\t.....\t\e[32mdone\e[0m"
systemctl status nginx &>>$LOG
STAT_CHECK4 $?
