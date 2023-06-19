#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER="$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")"

if [[ -z $USER ]]
then
USERINERT_RESULT="$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")"
echo "Welcome, $USERNAME! It looks like this is your first time here."
else
read USERNAME GAMES_PLAYED BEST_GUESS <<< "$(echo $USER | sed 's/|/ /g')"
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
fi

echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=$((0))

TO_GUESS=$RANDOM
TO_GUESS=$(($TO_GUESS%1000+1))
read USER_GUESS
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
while [[ $USER_GUESS != $TO_GUESS ]]
do
if [[ ! $USER_GUESS =~ [1-9][0-9]* ]]
then
echo "That is not an integer, guess again:"
read USER_GUESS
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
else
if (( $USER_GUESS < $TO_GUESS ))
then
echo "It's higher than that, guess again:"
read USER_GUESS
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
else
if (( $USER_GUESS > $TO_GUESS ))
then
echo "It's lower than that, guess again:"
read USER_GUESS
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
fi
fi
fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $TO_GUESS. Nice job!"
UPDATE_NUMBER_OF_GAMES="$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME'")"
FEWEST_GUESSES="$($PSQL "SELECT fewest_guesses FROM users WHERE username='$USERNAME'")"
if [[ ! -z $FEWEST_GUESSES ]]
then
if (( $NUMBER_OF_GUESSES < $FEWEST_GUESSES ))
then
UPDATE_FEWEST_GUESSES="$($PSQL "UPDATE users SET fewest_guesses=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")"
fi
else
UPDATE_FEWEST_GUESSES="$($PSQL "UPDATE users SET fewest_guesses=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")"
fi