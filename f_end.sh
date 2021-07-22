#!/usr/bin/bash
LOG=/tmp/roboshop.log
PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo  -e "$1\t\t..."
}

PRINT "WHILE LOOP"