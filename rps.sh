#!/bin/bash

#SCOREKEEPING_VARIABLES
user_wins=0
comp_wins=0
ties=0
games=0


#LOG_DATA_VARIABLES
info_string=""
curr_win=""
user_curr=""
comp_curr=""


log () {
	info_string="$(date +%H:%M:%S) $(date +%m-%d-%y)   User: $user_curr   Computer: $comp_curr   Winner: $curr_win"
	mkdir -p "rps_$(date +%B_%Y)"
	echo "$info_string" >> "rps_$(date +%B_%Y)/GamePlay_$(date +%B_%d-%A_%H_%M).out"
}


rps () {

computer=$(($RANDOM%3))

if [ "$user" == "$computer" ];
then
	comp_curr=$user_curr
	curr_win="Tie"
	echo "It's a tie!"
	((ties++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

elif [ $user == 0 ] && [ $computer == 1 ];
then
	comp_curr="Paper   "
	curr_win="Computer"
	echo "User:$user_curr"
	echo "Computer: $comp_curr "
	echo "Paper Covers Rock! Computer Wins!"
	((comp_wins++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

elif [ $user == 0 ] && [ $computer == 2 ];
then
	comp_curr="Scissors"
	curr_win="User"
	echo "User: $user_curr"
	echo "Computer: $comp_curr"
	echo "Rock Crushes Scissors! User Wins!"
	((user_wins++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

elif [ $user == 1 ] && [ $computer == 0 ];
then
	comp_curr="Rock    "
	curr_win="User"
	echo "User: $user_curr"
	echo "Computer: $comp_curr"
	echo "Paper Covers Rock! User Wins!"
	((user_wins++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

elif [ $user = 1 ] && [ $computer = 2 ];
then
	comp_curr="Scissors"
	curr_win="Computer"
	echo "User: $user_curr"
	echo "Computer: $comp_curr"
	echo "Scissors Cut Paper! Computer Wins!"
	((comp_wins++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

elif [ $user = 2 ] && [ $computer = 0 ];
then
	comp_curr="Rock    "
	curr_win="Computer"
	echo "User: $user_curr"
	echo "Computer: $comp_curr"
	echo "Rock Crushes Scissors! Computer Wins!"
	((comp_wins++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

elif [ $user = 2 ] && [ $computer = 1 ];
then
	comp_curr="Paper   "
	curr_win="User"
	echo "User: $user_curr"
	echo "Computer: $comp_curr"
	echo "Scissors Cut Paper! User Wins!"
	((user_wins++))
	((games++))
	log "$user_curr" "$comp_curr" "$curr_win"

else
	echo "Somethings Wrong"
	break
fi

}





while true; do

echo " "  
echo "Choose (R)ock, (P)aper, (S)cissors, or (Q)uit."
read choice

case "$choice" in
	[rR])
		user=0
		user_curr="Rock    "
		rps user
		;;
	[pP])
		user=1
		user_curr="Paper   "
		rps user
		;;
	[sS])
		user=2
		user_curr="Scissors"
		rps user
		;;
	[qQ])
		echo " "
		echo " "
		echo "==========="
		echo "--REPORT-- "	
		echo "==========="
		echo " "
		echo "Games Played: $games"
		echo "User Wins: $user_wins"
		echo "Computer Wins: $comp_wins"
		echo "Ties: $ties"
		echo " "
		break
		;;
	*)
		echo "Please choose a correct option."
		echo ""
		;;
esac

done
