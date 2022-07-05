#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 16-03-2022
Description:Given album name and corresponding directory, this scripts renames the jpg files with new name passed through command line
Sample input: Before executing the script
$ ls
DSN001.jpg DSN002.jpg DSN003.jpg DSN004.jpg DSN005.jpg
1) ./rename_album.sh day_out
Sample output:
All .jpg files in current directory is renamed as
day_out001.jpg day_out002.jpg day_out003.jpg day_out005.jpg day_out004.jpg
Sample input
2) ./rename_album.sh
Sample output
Error : Please pass the prefix name through command line.
Documentation

#passing contents of directory into an array
array=(`ls *.jpg`)

#condition to check if cla passed is equal to one or not
if [ $# -eq 1 ]
then
    for i in ${array[@]}		#loop to iterate over all elements in arraay
    do
	newname=`echo $i | tr -d [:alpha:]` # deleting the alphabits and storing only numeric values in newname
	ext=`echo $i | cut -d "." -f 2`  #cut  the second part of the extention(ie after ".")
        mv $i $1$newname$ext		#printing renamed files
    done
    echo All .jpg files in current directry is renamed as
    echo `ls`
else
    echo Error : Please pass the prefix name through command line
fi

