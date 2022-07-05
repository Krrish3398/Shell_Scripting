#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 18-03-2022
Description:A script to delete empty lines from a file
Sample Input:
1. ./user_ids.sh
O/p: 
Total count of user ID between 500 to 10000 is: 2

2. ./user_ids.sh 0 100
Sample O/p:
Total count of user ID between 0 to 100 is : 3

3. ./user_ids.sh 100
Sample O/P:
Error : Please pass 2 arguments through CL.
Usage : ./user_ids.sh 100 200

4. ./user_ids.sh 200 100
Sample O/P:
Error : Invalid range. Please enter the valid range through CL.
Documentation

#initializing array with 3rd field of the directory /etc/passd
array=(`cat /etc/passwd | cut -d ":" -f 3`)
#initializing counter
count=0

#initializing count function
count_fun()
{
    for i in  ${array[@]}        #iterate over all array elements
    do
	if [[ $i -ge $1 && $i -le $2 ]]	#congition to check if entered cla are within the range	
	then
	    #echo $i
	    count=`expr $count + 1`	#incrementing count
	fi
    done
    echo Total count of user ID between $1 to $2 is: $count
}

if [ $# -eq 0 ] 	#condition to check if no cla is entered
then
    count_fun 500 10000	#calling function 
elif [ $# -eq 2 ] 	#condition to check if entered cla are equal to 2
then
    if [ $2 -gt $1 ]	#if 2nd cla is greater than 1st cla
    then 
	count_fun $1 $2	#count number of users with user id's b/w given range
    else
	echo Error : Invalid range. Please enter the valid range through CL.
    fi
else			
    echo Error: Please pass 2 arguments through CL #display error message
    echo Usage: ./$0 $@
fi	

