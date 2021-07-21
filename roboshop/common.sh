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

####### NODEJS FUNCTION ################################
NODEJS() {

  PRINT "Install nodejs\t\t"
  yum install nodejs make gcc-c++ -y &>>$LOG
  STAT_CHECK $?

  PRINT "Add Roboshop Application User "
  id roboshop &>>$LOG
  if [ $? -ne 0 ]; then
    useradd roboshop &>>$LOG
  fi
  STAT_CHECK $?


  PRINT "Download Application Code"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip" &>>$LOG
  STAT_CHECK $?


  PRINT "Extract Downloaded code\t"
  cd /home/roboshop && unzip /tmp/${COMPONENT}.zip &>>$LOG && rm -rf ${COMPONENT} && mv ${COMPONENT}-main ${COMPONENT} &>>$LOG
  STAT_CHECK $?

  PRINT "Installing Nodejs Dependancies"
  cd /home/roboshop/${COMPONENT} && npm install --unsafe-perm &>>$LOG
  STAT_CHECK $?

  PRINT "Fix Application Permissions"
  chown roboshop:roboshop /home/roboshop -R &>>$LOG
  STAT_CHECK $?

  PRINT "Update systemD file\t"
  sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.roboshop.internal/" -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/" -e "s/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/" /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/user.service
  STAT_CHECK $?

  PRINT "Start ${COMPONENT} Service\t"
  systemctl daemon-reload &>>$LOG && systemctl restart ${COMPONENT} &>>$LOG && systemctl enable ${COMPONENT} &>>$LOG
  STAT_CHECK $?
}





