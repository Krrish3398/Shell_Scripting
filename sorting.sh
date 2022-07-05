#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 15-03-2022
Description:A script to sort a given number in ascending or descending order
Sample input: 
/sorting.sh -a 5 4 6 2 3 8 9 7 1
Sample output: Ascending order of array is 1 2 3 4 5 6 7 8 9
Sample input:
/sorting.sh -d 5 4 6 2 3 8 9 7 1
Sample output: Descending order of array is 9 8 6 5 4 3 2 1
Documentation

#initilizing the first cla to a variable
arg=$1
#initilizing remaining cla to an array
array=(${@:2})
#calculating length of the array
size=${#array[@]}

#condition to check CLA are passed or not
if [ $# -ne  0 ]
then
	#case statements to check passed arg is -a or -d
    case $arg in
	-a) #sorting the elements in ascending order
	    for i in `seq 0 1 $(($size - 1))`
	    do
		for j in `seq 0 1 $(($size - i - 1))`
		do
		    if [[ ${array[$j]} -gt ${array[$(($j+1))]} ]]
		    then
			temp=${array[$j]}
			array[$j]=${array[$(($j+1))]}
			array[$(($j+1))]=$temp
		    fi
		done
	    done
	    echo Ascending order of array is ${a[@]}
	    ;;

	-d) #sorting elements in desending order
		for i in `seq 0 1 $(($size - 1))`
	    do
		for j in `seq 0 1 $(($size - i - 1))`
		do
		    if [[ ${array[$j]} -lt ${array[$(($j+1))]} ]]
		    then
			temp=${array[$j]}
			array[$j]=${array[$(($j+1))]}
			array[$(($j+1))]=$temp
		    fi
		done
	    done
	    echo Descending order of array is ${array[@]}
	    ;;
	*)    
		echo Please pass the choice.		#error message if user did not pass -a or -d
		echo "/sorting -a/-d 4 23 5 6 3"

    esac
else 
	echo  Error : Please pass the argument through command line.
	echo  "Usage : ./sorting -a/-d 4 23 5 6 3"  
fi

