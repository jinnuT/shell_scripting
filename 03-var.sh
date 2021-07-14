#!/usr/bin/bash

A=10
echo The value of A=$A
DATE="2021-13-07"
echo Welcome, Today date = $DATE

## command substitution
nou=$(who | wc -l)
echo Number of users = $nou