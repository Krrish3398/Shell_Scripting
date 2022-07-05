#!/bin/bash


<<Documentation
Name: Krishna Chiatanya V.
Date: 15-03-2022
Description:A cript to convert string lower to upper and upper to lower
Sample input: ./upper_lower.sh file.txt
1 – Lower to upper
2 – Upper to lower
Please select option : 1
Sample output:
WHAT IS OS?
WHAT ARE THE DIFFERENT OS?
WHEN IS OS USED?
WHAT IS PARTITION AND ITS USE?
HOW MANY PARTITIONS CAN BE DONE?
Documentation


#storing cla into a variable
file=$@
#condition to check if cla are passed are not
if [ $# -ne 0 ]
then
    #condition to check if file is present and has some content
    if [ -s $file ]
    then
	#taking input from user
	echo 1 - Lower to Upper
	echo 2 - Upper to Lower
	read -p "Please select option : " num
	#if inpt is 1 then convert the contents of file to upper case
	if [ $num -eq 1 ]
	then
	    tr [:lower:] [:upper:] < $file
	#if input is 2 then convert the contents of file to lower case
	elif [ $num -eq 2 ]
	then
	    tr [:upper:] [:lower:] < $file
	fi
    else
	echo Error: No contents inside the file  #display error message
    fi
else
    echo Error: Please pass the file name through command line  #display error message
fi
