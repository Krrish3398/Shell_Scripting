#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 13-0-2022
Description: Write a script for arithmetic calculator using command line arguments
Sample Input: 25 + 41
Sample Output: 25 + 41 = 66
Documentation


if [ $# -eq 0 ]
then
   echo Error : Please pass the arguments through command line

   echo 
 elif [ $# -eq 3 ]
    then
	case $2 in
	   
	   +)	echo "$1 $2 $3 = `expr "$1 + $3" | bc`";;

	   -)	 echo "$1 $2 $3 = `expr "$1 - $3" | bc`";;
	    
	   x)  echo "$1 $2 $3 = `expr "scale=2 ; 1 * $3" | bc`";; 
	    
	   /)  echo "$1 $2 $3 = `expr "scale=2 ; $1 / $3" | bc`";;

	   *)  echo Please pass a vaide operator
		;;
	esac
    else
	echo Error : Please pass 3 arguments

    fi
