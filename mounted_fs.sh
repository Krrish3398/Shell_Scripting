#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 17-03-2022
Description:Write a script to determine whether a given file system or mount point is mounted
Sample input: 
1. ./mounted_fs.sh /dev/sda2
Sample output:
File-system /dev/sda2 is mounted on / and it is having 98%
used space with 3298220 KB free.
Sample Input:
2. ./mounted_fs.sh /dev
Sample output:
/dev is not mounted.
Sample input:
3. ./mounted_fs.sh
Sample output
Error : Please pass the name of the file-system through command line.
Documentation



#initializing an array with first field df command ie File system 
file_sys=(`df -h | tr -s " " | cut -d " " -f 1`)

#initializing an array  with  mounted on info of df command
mount_on=(`df -h | tr -s " " | cut -d " " -f 6`)

#initializing an array with used percentages 
use_percent=(`df -h | tr -s " " | cut -d " " -f 5`)

#initializing an array with contents of available space
avail_space=(`df | tr -s " "| cut -d " " -f 4`)

#condition to check if cla is passed or not
if [ $# -eq 0 ]
then
    echo Error: Please pass the name of the file-system through command line.
else
    index=-1 			#initializing a varaible index
    for i in `seq 1 1  $((${#file_sys[@]} - 1))` 	#loop to iterate over every ekement of array starting from 1st index 
    do
	if [ $1 = ${file_sys[$i]} ]		#condition to check if cla is equal to array elements
	then
	    index=$i				#if any array element is matched with cla store it in index variable.
	fi
    done

    if [ $index -eq -1 ]			#if index is equal to init value
    then
	echo "$1 is not mounted."		#print not mounted message
    else
	echo "File-system $1 is mounted on ${mount_on[$index]} and it is having ${use_percent[$index]} used space with ${avail_space[$index]} KB free"
    fi
fi