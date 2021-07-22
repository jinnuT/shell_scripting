#!/usr/bin/bash

PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo -n -e "$1\t\t..."
}

PRINT "WHILE LOOP"