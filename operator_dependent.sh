#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 15-03-2022
Description:A cript to convert string lower to upper and upper to lower
Sample input: 1234+
Sample output: Sum of digits = 10
Documentation

#passing the cla to a variable
arg=$@

#condition to check if elements are passed through cla are not
if [ $# -ne 0 ]
then
    #getting the operator using offset method
    optr=`echo ${arg:${#arg}-1 :1}`
  
    #using case statements to perform operations based on operator
    case $optr in
			
	+)  sum=0						#performing addition	
	    for i in `seq 0 1 $(expr ${#arg} - 2)`	#for loop to iterate over 0th position to 2nd last element
	    do
		var=$((${arg:$i:1}))					#getting values one by one
                #echo $var
		sum=`expr $var + $sum`					#addition operation
	    done
	    echo "Sum of digits = $sum"
	    ;;
	-)  
	    sub=$((${arg:0:1}))					#performing subtraction
	    for i in `seq 1 1 $(expr ${#arg} - 2)`   	#for loop to iterate over 0th position to 2nd last element
	    do
		var=$((${arg:$i : 1}))						#getting values one by one
		sub=$(($sub - $var))						#sub operation
	    done
	    echo "Subtraction of digits = $sub"
	    ;;
	x) 							#performing multiplication			
	    mul=1
	    for i in `seq 0 1 $(expr ${#arg} - 2)` 	#for loop to iterate over 0th position to 2nd last element
	    do
		var=$((${arg:$i:1}))					#getting values one by one
		mul=`expr "$var  * $mul" | bc`
	    done
	    echo "Multiplication of digits = $mul"
	    ;;
	/) 							#performing division			
	    div=$((${arg:0:1}))
		for i in `seq 1 1 $(expr ${#arg} - 2)`		#for loop to iterate over 0th position to 2nd last element
	    do
		var=$((${arg:$i:1}))						#getting values one by one
		div=`expr "scale=2; $div / $var" | bc`
	    done
	    echo "Division of digits = $div"
	    ;;

	*)	#dispalying error message if no valide operator is passed
		echo "Error: Operator missing or invalid operator, please pass operator as last digit (+,-,x,/)"
		;;

		esac
else
	echo Error : Please pass the arguments through CL.	#error message if no cla are passed
	echo Usage : ./operator_dependent.sh 2345+
fi
