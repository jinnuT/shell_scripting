#!/usr/bin/bash

## Declare the function

sample(){
  echo "Hello, I'm a sample function"
}

num=5
for var in 1 2 3
do
  sample
done

while [ $num -le 10 ]
do
  sample
  num=$(($num+1))
done