#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 23-03-2022
Description:Use a recursive function to print each argument passed to the function
Sample Input:
./recursion.sh How are you? I am fine
Sample Output:
How
are
you?
I
am
fine

Test Case 2: 
./recursion.sh
Sample output:
Error : Pass the arguments through command line.

Test Case 3:
./recursion.sh 1 12 123 1234 12345 123456
Sample Output:
1
12
123
1234
12345
123456

Documentation

#initializing array with all cla
array=($@)
#initializing counter
n=0
len=$#

#condition to check if command line arguments are passed or not
if [ $# -eq 0 ]
then
    echo Error : Pass the arguments through command line.	#error message

else
    #defining a function called recursion
    function recursion()
    {
	echo $1   		#printing first positional argument
    	n=$(($n+1))		#incrementing counter
    	if [ $len -eq $n ]	#condition to check if counter is equal to length of total cla's
    	then
	    return
	else
	    recursion ${array[$n]}	#calling recursion function
	fi
    }
    recursion $@

fi

