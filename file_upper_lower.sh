#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 14-03-2022
Description:A script to print chess board
Documentation


#storing output of ls into an array
array=($(ls))
for i in ${array[*]} 			#loop to iterate over all elements in the array
do
    if [ -f $i ]				#condition to check if the current array element is file or not
    then 
	file_lower=`echo $i | cut -d "." -f 1 | tr  [:upper:] [:lower:]`   #translating the first part of the file name (ie., before ".")to lower case 
	ext=`echo $i | cut -d "." -f 2 | tr [:upper:] [:lower:]`		#translating the second part of the file name (ie., after ".")to lower case 
	if [ `echo $file_lower.$ext` != $i ]  							#condition to check if translated file name and original file name is same or not
	then
	   mv $i `echo $file_lower.$ext`								#if different moving/renaming newfilename to the directory
       fi
   else
       file_upper=`echo $i | tr [:lower:] [:upper:]`				#else part if for directory, translates directory names to upper case
	if [ $file_upper != $i ]										#condition to check if translated file name and original file name is same or not
	then
	    mv $i $file_upper											#if different moving/renaming newfilename to the directory
	fi
	
    fi
done
echo Files are rename in lowercase and directories are renamed in upper case