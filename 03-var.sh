#!/usr/bin/bash

A=10
echo The value of A=$A
DATE="2021-13-07"
echo Welcome, Today date = $DATE

## command substitution
nou=$(who | wc -l)
echo Number of users = $nou

## date with command substitution
DATE=$(date +%F)
echo Today, date is $DATE

## date with individual format (US date format - month-day-year)

DATE_US=$(date +%m-%d-%Y)
## Note : year is always in Capital Letter
echo "Date is in US format = "$DATE_US
echo "OR"
DATE_US=$(date +%m/%d/%Y)
echo "Date in US format = " $DATE_US
echo "**********************************************"
## echo COURSE NAME=$(COURSE_NAME) ## this is Wrong command
echo COURSE NAME=${COURSE_NAME}
echo COURSE NAME=$COURSE_NAME

echo "*************************************************************"

echo MY NAME IS = $NAME
echo MY NAME IS = ${NAME}

echo "*************************************************************"
