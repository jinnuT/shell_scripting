#!/usr/bin/bash
LOG=/tmp/roboshop.log
PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo  -e "$1\t\t..."
}

STAT_CHECK(){
  if [ $? -eq 0 ]; then
    echo -e "\e[32mDone..\e[0m"
  else
    echo -e  "\e[31mFail..\e[0m"
    echo -e  "\e[31m Check the log file for more details, Log File - $LOG\e[0m"
  fi
}

PRINT "WHILE LOOP"
p=4
while [ $p -ne 0 ]; do
  PRINT "value of p = $p"
  p=$(($p-1))
done
STAT_CHECK $?
var=$(seq 1 100)
txt=Jinnu
PRINT "FOR LOOP"
for txt in $var ; do
  PRINT txt
done
STAT_CHECK $?