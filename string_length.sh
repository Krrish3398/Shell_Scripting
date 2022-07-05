#!/bin/bash


<<Documentation
Name: Krishna Chiatanya V.
Date: 13-0-2022
Description:A script to print the length of each and every string using arrays
Sample Input:hello hai how are you?
Sample Output:
Length of string (hello) - 5
Length of string (hai) - 3
Length of string (how) - 3
Length of string (are) - 3
Length of string (you?) - 4
Documentation

#Storing the command line arguments in an array
arr=($@)

#condition to check if the arguments are passed are not
if [ $# -ne 0 ] 
then
    for i in `seq 0 1 $((${#arr[@]}-1))`      #loop to iterate  over index of array elements
    do
	echo "Length of string (${arr[$i]}) - ${#arr[$i]}"    #printing the string length
    done
else
    echo Error: Please pass the arguments through command-line.  #printing error message
fi


