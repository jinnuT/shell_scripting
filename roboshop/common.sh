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
PRINT(){
  echo -n -e "$1"
}

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
  echo -e "\e[31mYou should be a root user or sudo user to coninue with the script\e[0m"
  exit 2
fi



