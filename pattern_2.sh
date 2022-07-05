#!/bin/bash

<<Documentation
Name: Krishna Chaitanya V.
Date: 11-03-2022
Description: To generate a pattern by taking input from the user
Sample input: 4
Sample output:
1 
2 3
4 5 6
7 8 9 10
Documentation


read -p "Enter the number : " n #read input from the user

count=1

for row in `seq $n`             #for loop to iterate over rows    
do
    for col in `seq $row`       #for loop to iterate over columns
    do
	echo -n "$count "	#printing the pattern
	count=$(($count+1))	#incrementing the count 
    done
    echo			#moving to next line
done

