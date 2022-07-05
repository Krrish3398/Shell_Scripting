#!/bin/bash

<<Documentation
Name: Krishna Chiatanya V.
Date: 17-03-2022
Description:A script to print system information using commands
Sample Input:
./system_info.sh
1. Currently logged users
2. Your shell directory
3. Home directory
4. OS name & version
5. Current working directory
6. Number of users logged in
7. Show all available shells in your system
8. Hard disk information
9. CPU information.
10. Memory Informations
11. File system information.
12. Currently running process.
Enter the choice : 2
Sample Output:
Your shell directory is /bin/bash

Documentation


#initialization
var="y"

#loop to iterate over menu.
while [ $var = "y" ]
do
    echo "1. Currently logged in user"
    echo "2. Your shell directory"
    echo "3. Home Directory"
    echo "4. OS name and version"
    echo "5. Current working directory"
    echo "6. Number of users logged in"
    echo "7. Show all available shells in your system"
    echo "8. Hard disk information"
    echo "9. CPU information"
    echo "10. Memory information"
    echo "11. File System information"
    echo "12. Currently running process"
    echo ""
    read -p "enter the choice : " choice
    echo ""
    #switch case to select any perticular option from user.
    case $choice in
	'1') 
	    echo "Currently logged in user : `whoami`"
	    ;;
	'2')
	    echo "Your shell directory : $SHELL"
	    ;;
	'3')
	    echo "Home Directory : $HOME" 
	    ;;
       	'4')
	    echo "OS name and version : `uname -a`"
	    ;;
	'5')
	    echo "Current working directory : `pwd`"
	    ;;
	'6')
	    echo "Number of users logged in : `w`"
	    ;;
	'7')
	    echo "Show all available shells in your system : "
	    cat /etc/shells
	    ;;
	'8')
	    echo "Hard disk information : "
	    hwinfo
	    ;;
	'9')
	    echo "CPU information : "
	    cat /proc/cpuinfo
	    ;;
	'10')
	    echo "Memory information : "
	    cat /proc/meminfo
	    ;;
	'11')
	    echo "File System information : "
	    df
	    ;;
	'12')
	    echo "Currently running process : "
	    ps
	    ;;
	*)
	    echo "Error : Invalid option, please enter valid option"
	    ;;
    esac
    #read input from user
    read -p "Do you want to continue(y/n)?" var
done    
