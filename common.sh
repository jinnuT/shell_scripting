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
