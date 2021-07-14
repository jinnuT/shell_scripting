#!/usr/bin/bash

echo Hello World
# printing message in multiple lines
echo -e "Hello, \n\tWorld"

# syntax for enabling the color
#--------------------------------
# echo -e "\e[COLOURCODEmMESSAGE"
# REED    31
# GREEN   32
# YELLOW  33
# BLUE    34
# MAGENTA 35
# CYAN    36

echo testing color without disabling them
echo ------------------------------------
echo -e "\e[31mJinnu in RED"
echo writing some plain text
echo -e "\e[35mJinnu in MAGENTA"
echo writing some plain text


echo testing color with disabling them
echo ------------------------------------
echo -e "\e[31mJinnu in RED\e[0m"
echo writing some plain text
echo -e "\e[35mJinnu in MAGENTA\e[0m"
echo writing some plain text
