#!/usr/bin/bash

## Declare the function

sample(){
  echo "Hello, I'm a sample function"
}

num=2
for var in 1 2 3
do
  echo "var = "$var
  sample
done

while [ $num -le 10 ]
do
  sample
  echo "num = "$num
  num=$(($num+1))

done