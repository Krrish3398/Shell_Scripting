#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 16-03-2022
Description:Display the longest and shortest user-names on the system
Sample input: 
./largest_username.sh 
Sample outpt:
The Longest Name is: speech-dispatcher
The Shortest Name is:lp
Documentation



#to get the contents of the directory etc/passwd and store only first field into an array
array=(`cat /etc/passwd | cut -d ":" -f 1 `)


#initilization
longletter_count=0
shortletter_count=${#array[0]}

#echo ${array[0]}
#echo $shortletter_count

#calculating total number of elements in the array
arr_len=`expr ${#array[*]} - 1`
#echo $arr_len

#loop to get longest and shortest usernames
for i in `seq 0 1  $arr_len`
do
  
    user=${array[$i]}

   # echo $user

    wd_count=${#array[$i]}
   # echo $wd_count

    if [ $wd_count -ge $longletter_count ]
    then
    #if the wd_count is greater than previously saved longletter_count, update the longest word to be the current user and longletter_count to current wd_cont	
	longest_wd=$user
	#echo "longest_wd : $longest_wd"

	longletter_count=$wd_count
	#echo "longestletter_count : $longletter_count"

    elif [ $wd_count -le $shortletter_count ]
    then

    ###if the wd_count is smaller than previously saved longletter_count, update the shortest word to be the current user and shortletter_count to current wd_cont    
	shortest_wd=$user
	#echo "shortest_wd : $shortest_wd"

	shortletter_count=$wd_count
	#echo "shortest_count : $shortletter_count"
    fi

done

echo "The Shortest name is : $shortest_wd"
echo "The longest name is : $longest_wd"
