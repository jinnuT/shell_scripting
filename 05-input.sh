#!/usr/bin/bash


##--Input can be loaded into special variable
##--And those variables are 0-n,*,@,#

## To access the name of the script or file
echo "File name = "$0
## To access the first argument of the input
echo "First argument input = "$1
## To access the second argument of the input
echo "Second argument input = "$2
## To access all the parsed values in the argument

echo "All the argument values = "$*
#echo "All the argument values = "$@

echo "Total number of arguments in the input = "$#
