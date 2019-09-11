# Bash-Rock-Paper-Scissors
A short bash script to play Rock Paper Scissors via Command Line Interface.

Author: Brandon Lavello

## BASIC USE

This script is called ```rps.sh```, and it is called through the ```bash``` command. 

```bash
$ bash rps.sh
```

The first line in this script ```!#/bin/bash."``` specifies the file path to BASH so that the shell uses the correct interpreter.

There are 4 scorekeeping variables to track the games to be printed WITHIN the program.  These are user_wins, comp_wins, ties, and the amount of games played.  The next set of variables is used to OUTPUT a log into a directory.  The variables used are ```info_string``` to build the line that is printed out in the log file, the `curr_win` hold the current winner of the game.  The `user_curr` holds the current users choice, and the `comp_curr` hols the current computer choice.


Next, there is a log function.  I chose to use a function for the log to prevent repitition.  Within this function, I used `info_string` to build the output line, then I used `mkdir -p` to create a directory if there is not an existing directory, and do nothing if there is an existing directory.  I filled in the name of the file as `rps_$(date +%B_%Y)` The date option `%B` fills in the month, and the `%Y` options adds the year.  Finally, I echo out `info_string` into a text file using the filestream followed by the same `rps_$(date +%B_%Y)/` to direct it to the new directory, followed by `GamePlay_$(date +%B_%m-%A_%H_%M).out`  This creates a file (or adds to it if there is an existing one) with the date and timestamp in the name.


Next, there is a rps function.  This function takes the user input, generates a random computer input, and determines the result of the game.  The computer value is generated using the random number variable and mod'ing it by 3 to produce a 0, 1, or a 2 as the output.  Then, the program goes through 7 if/elif statements to determine if the user or the computer won the game.  In the fuctions, it compares, sets the variables appropriately, increments the appropriate variables, and then calls the log function with the `$user_curr` (user move) value, the `$comp_curr` (computer move) value, and finally `$curr_win` (the winner of the current game).  

After the function declarations comes the actual script.  The whole script is wrapped in a while loop that will repeat the whole program until it the while loop is broken.  

The first thing the User will see is `Choose (R)ock, (P)aper, (S)cissors, or (Q)uit.`  The script reads in the users next input with `read choice`. 

This flows into a case statement opened by `case $choice in` that reads in the choice for each option (including both upper and lower case options).  

In the cases of `rR,pP, or qQ`, the variables are set to the appropriate values (Rock=0, Paper=0, Scissors=0) and calls the rps function with the user choice value passed into it. 

In the case of `qQ`, it echos out the report of the game record, and then breaks out of the while loop, ending the program. \*) accounts for any incorrect input. If incorect input is entered, it will continue to loop until one of the 4 correct options is listed. The case statement ends with "esac".
