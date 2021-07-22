#!/usr/bin/bash
LOG=/tmp/roboshop.log
PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo  -e "$1\t\t..."
}

PRINT "WHILE LOOP"
p=4
while [ $p -ne 0 ]; do
  PRINT "value of p = $p"
  p=$(($p-1))
done