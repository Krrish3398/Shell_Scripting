#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 17-03-2022
Description:A script to print contents of a directory without ls command
Sample input:

Let assume your pwd is /home/user/ECEP/Linux_Systems/
1. ./output_ls.sh
Sample o/p: Assignments Classwork

Sample I/P: 2. ./ouput_ls.sh ~ ~/ECEP
Sample:O/P
/home/user:
Downloads Documents Desktop Music Pictures Public Videos
ECEP
/home/user/ECEP:
Linux_Systems Advnc_C Linux_Internals Data_Structures MC

Sample I/P:
3. ./ouput_ls.sh Test
Sample O/P:
output_ls.sh: Cannot access ‘Test’ : No such a file or directory.
Documentation


#condition to check if cla passed are more than zero or not
if [ $# -gt 0 ]
then
    for i in $@		#loop to iterate over all cla's 
    do
	if [ -d $i ]	#condition to check if passed argument is directory or not
	then
	    cd $i	#changing the directory 
	    echo `pwd`: #printing current working directory
	    echo *	#printing all the contents  in the dir
	    cd ~ 	#going back to home directory
	else
	    echo Cannot access $i : No such file or directory.
	fi
	echo
    done
else			#if no cla are passed printing current directory contents
    echo *
fi


