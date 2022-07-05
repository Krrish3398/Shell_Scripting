#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 18-03-2022
Description:Use pipes or redirection to create an infinite feedback loop.
Sample Input:
./redirection.sh
Sample O/P: 
Before loop file contents
Hai hello
After loop file contents
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Documentation


echo Hai Hello > file.txt							#content redirection

echo "Before loop, file content: "

cat file.txt										#displaying contents in file.txt

echo "After loop, file contents: "

tail -f file.txt >> file.txt | tail -f file.txt 	#creating an infinite feedback loop.
