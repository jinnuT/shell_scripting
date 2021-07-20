#!/usr/bin/bash

source common.sh

PRINT "Install nodejs\t\t\t"
yum install nodejs make gcc-c++ -y &>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application User \t"
useradd roboshop &>$LOG
STAT_CHECK $?
#catalogue
#$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
#$ cd /home/roboshop
#$ unzip /tmp/catalogue.zip
#$ mv catalogue-main catalogue
#$ cd /home/roboshop/catalogue
#$ npm install