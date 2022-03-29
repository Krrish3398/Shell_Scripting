#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 14-03-2022
Description:A script to delete empty lines from a file
Sample Input:
Input file.txt
Hello
        

How
            

are


you?
Sample Output:
Empty lines are deleted
Hello
How
are
you?
Documentation


#condition to check if cla are passed or not
if [ $# -ne 0 ]
then

    sed -i '/^[[:space:]]*$/d' $1     #deleting all empty lines. lines with spaces or tabs 
    echo Empty lines are deleted      #printing message
    cat $1			      #printing contents of the file
   
else
    echo Error:Please pass the fine name through command line #printing erormessage if cla are not passsed
fi

