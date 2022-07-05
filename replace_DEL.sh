#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 26-03-2022
Description:Write a script to replace 20% lines in a C file randomly and replace it with the pattern
Sample Input:

1. ./replace_DEL.sh main.c
Sample  output:

Before replacing
#incude <stdio.h>
int main()
{
         printf(“Hello world\n”);
}
After replacing
#incude <stdio.h>
int main()
{
<-----------Deleted------------>
}
2. ./replace_DEL.sh main1.c
Error : No such a file.
3. ./replace_DEL.sh main2.c
Error : main2.c is empty file. So can’t replace the string.
4. ./replace_DEL.sh
Error : Please pass the file name through command line.
Documentation

#function to replace 20% lines in a C file randomly and replace with pattern
function rand(){
    total_lines=`wc -l $1 | cut -d " " -f 1`		#finding total number of lines present in the file
    #echo  total lines---- $total_lines			
    res=`expr "0.2 * $total_lines" | bc`			#calculating 20% of total lines
    lines_twenty=`printf "%.0f" $res`				#rounding off to zero decimal places
    #echo $lines_twenty

    for i in  `seq $lines_twenty`					#loop to iterate
    do
	rand=`shuf -i 1-$total_lines  -n1`				#generating random number
	#echo $rand
	sed -i $rand's/.*/<-----------Deleted------------>/g' $1	#replacing the particular line with the pattern
    done

}

#condition to check if cla is passed or not
if [ $# -gt 0 ]
then
    if [ -e  $1 ]									#condition to check if file exists or not
    then
	if [ -s $1 ] 									#Codition to check if file has contents or not
	then
	    echo Before replacing
	    cat $1										#printing file content
	    echo after replacing
	    rand $1										#function call
	    cat $1										#printing file content after replacing
	else
	    echo "Error: $1 is empty file. So can't replace the string"
	fi
    else
	echo Error: No Such file 
    fi
else
echo  Error: Please pass the file name through command line
fi
