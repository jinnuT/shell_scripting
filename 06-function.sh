#!/usr/bin/bash

## Declare the function

sample(){
  echo "Hello, I'm a sample function"
  b=10
  echo num=$num
}

echo b=$b
num=2
for var in 1 2
do
  sample
done

while [ $num -le 10 ]
do
  sample
  num=$(($num+1))

done