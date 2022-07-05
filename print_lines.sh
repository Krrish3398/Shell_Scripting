#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 13-03-2022
Description: A script to print contents of file from given line number to next given number of lines.
Sample Input: 5 3 myfile.txt
Sample Output: 
line number 5
line number 6
line number 7
Documentation



#condition to check if number of arguments passed is not equal to 0
if [ $# -eq 3 ]
then
    actual_len=`cat $3 | wc -l`    #finding total number of lines present in the file

    req_len=`expr $1 + $2 - 1`     #calculating required lines to be present in the file

    if [ $actual_len -gt $req_len ] #checking if number of lines present in file is greater than the number of lines to be displayed

    then

    var=`expr $actual_len - $1 + 1` 
    tail -$var $3 | head -$2          # printing the lines as per input from cla
    else
    # printing error message
    echo Error: $3 is having only $actual_len lines. file should have atleast $req_len lines
    fi
else
    echo Error: arguuments missing!
    echo Usage: ./file_filter.sh start_line upto_line filename
    echo "For eg. ./file_filter.sh 5 5 <file>"
fi
