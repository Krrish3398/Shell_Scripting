#!/bin/bash

<<Documentation
Name: Krishna Chaitanya V.
Date: 11-03-2022
Description: To generate a pattern by taking input from the user
Sample input: 4
Sample output:
1 
1 2
1 2 3
1 2 3 4
Documentation


read -p "Enter the number : " n #read input from the user

for row in `seq $n`             #for loop to iterate over rows    
do
    for col in `seq $row`       #for loop to iterate over columns
    do
	echo -n $col            #printing the pattern
    done
    echo			#moving to next line
done

