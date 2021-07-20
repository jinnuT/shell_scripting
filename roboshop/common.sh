#!/usr/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
  echo -e "\e[31mYou should be a root user or sudo user to coninue with the script\e[0m"
  exit 2
fi

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK(){
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mdone..\e[0m"
  else
    echo -e "\e[31mfail..\e[0m"
    echo -e "\e[33mCheck the log file for more details, log file -$LOG\e[0m"
    exit 1
  fi
}
PRINT(){
  echo -e "\n#######################\t$1\t#######################" &>>$LOG
  echo -n -e "$1\t\t"
}





