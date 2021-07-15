#!/usr/bin/bash

## Declare the function

sample(){
  echo "Hello, I'm a sample function"
  echo first argument inside the sample function =$1
}

##-----Argument passing inside and outside the function------------------------------------------
echo first argument inside the main function =$1

##----Accessing variables declared inside the function and outside (main)-------------------------
#num=6
#sample
#echo value of b=$b

##-----LOOPS----------------------------------------------------------------------------------------

#echo b=$b
#num=2
#for var in 1 2
#do
#  sample
#done

#while [ $num -le 10 ]
#do
#  sample
#  num=$(($num+1))

#done