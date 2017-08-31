#! /bin/bash

function random_wall () 
{
	# BACKUP IMAGES IN CASE OF GOING DARK
	path_name="/Users/Furkan/Pictures/Selection/"
	my_number=$[RANDOM%$1+1]
	my_wall="$path_name$2-$my_number.jpg"
	sec1='tell application "System Events" to set picture of every desktop to ("'
	# IF INTERNET WORKS
	fooShell=$(python PATH_TO_FILE/pull_and_change.py)
	echo $fooShell
	if [ "$fooShell" == "FAIL" ]
	then
	sec1+=$my_wall
	sec2='" as POSIX file as alias)'
	sec1+=$sec2
	else
	sec1+=$fooShell
	sec2='" as POSIX file as alias)'
	sec1+=$sec2
	fi
	osascript -e "$sec1"
}

hour=$(date +"%H")
if [ $hour -ge "5" ] && [ $hour -le "9" ]
then
random_wall 8 early-morning
fi

if [ $hour -ge "9" ] && [ $hour -lt "13" ]
then
random_wall 17 morning
fi

if [ $hour -ge "13" ] && [ $hour -lt "17" ]
then
random_wall 19 midday
fi

if [ $hour -ge "17" ] && [ $hour -lt "20" ]
then
random_wall 15 afternoon
fi

if [ $hour -ge "20" ] || [ $hour -lt "5" ]
then
random_wall 19 night
fi
