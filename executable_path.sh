#!/bin/bash
<<Documentation
Name: Krishna Chaitanya V.
Date: 25-03-2022
Description: For each directory in the $PATH , dispaly the number of executable files in that directory
Sample Execution:
. ./executable_path.sh
Current dir: /usr/local/sbin
current count: 0
Current dir: /usr/local/bin
current count: 0
Current dir: /usr/sbin
current count: 205
Current dir: /usr/bin
current count: 1889
Current dir: /sbin
current count: 187
Current dir: /bin
current count: 159
Current dir: /usr/games
current count: 5
Current dir: /usr/local/games
current count: 0
Total – 2445
Documentation

#initializing an array with contents of $PATH
array=(`echo $PATH | tr ":" " "`)
total=0
#loop to iterate over array
for i in ${array[@]}
do
    if [[ -e $i ]]	#condition to check if path is present or not
    then
	cd $i		#change path to specifed path
	arr=(`ls $i`)	#storing all the file and direcotries into an array
	count=0
	for j in ${arr[@]} 	#loop to iterate over contents present in specied path
	do
	    if [ -x $j -a -f $j ] 	#checking if the element is file and if its executable or not
	    then
		count=`expr $count + 1` #if true increment count
	    fi
	done
	total=`expr $total + $count`    #calculating total count
	
	echo current dir: $i	#displaying directory and count
	echo current count: $count
    fi
done
echo Total- $total			#dispalying total counts
