#!/usr/bin/bash

## Declare the function

sample(){
  echo "Hello, I'm a sample function"
  echo first argument inside the sample function = $1
  echo Second argument inside the sample function = $2
  b=007
}
sample Jithu Santa
##-----Argument passing inside and outside the function------------------------------------------
echo first argument inside the main function = $1
echo second argument inside the main function = $2

##----Accessing variables declared inside the function and outside (main)-------------------------
num=7
sample
echo value of inside the sample function = $b

##-----LOOPS----------------------------------------------------------------------------------------

echo b=$b

for var in 1 2
do
  sample
done

echo "----------WHILE LOOP---------------------------------------------------------------------"

while [ $num -le 10 ]
do
  sample
  num=$(($num+1))

done