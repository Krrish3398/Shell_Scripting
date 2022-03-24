#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 14-03-2022
Description:A script to print chess board
Documentation


#initialization
n=8

for row in `seq $n`                      #loop to iterate over rows
do
    
    for col in `seq $n`		        	# loop to iterate over columns
    do
       	if [ $(($(($row+$col))%2)) -eq 0 ]	#if sum is even then print white else print black
       	then
	    echo -e -n "\e[47m  "	        #change color to white

       	else
	    echo -e -n "\e[40m  "	        #change color to black

       	fi
    done
    echo -e "\e[0m"			            #default color
done
echo



