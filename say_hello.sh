#!/bin/bash

#initializing hour variable
hour=`date +"%T" | cut -d ':' -f 1`

#if condition to check different  intrevals to print the respective messages
if [ $hour -ge 5 -a $hour -lt 12 ]
then
    echo "Good Morning `whoami`, Have a nice day!"

elif [ $hour -ge 12 -a $hour -lt 13 ]
then
    echo "Good Noon `whoami`, Have a nice day!"

elif [ $hour -ge 14 -a $hour -lt 17 ]
then
    echo "Good Afternoon `whoami`, Have a nice day!"

elif [ $hour -ge 17 -a $hour -lt 21 ]
then
    echo "Good Evening `whoami`, Have anice day!"

else
    echo "Good night `whoami`, Have a nice day!"
fi
#displaying date and time info.
echo "This is `date +"%A" | cut -d " " -f 1 ` `date | cut -d " " -f 3` in `date | cut -d " " -f2` of `date | cut -d " " -f 6` (`date +"%r" | cut -d " " -f 1` `date +"%r" | cut -d " " -f 2`)"
