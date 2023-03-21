#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:" 
read ANSWER
if [[ ${#ANSWER} -gt 22 ]]
then 
  echo "Your username cant be longer than 22"
  exit
fi


USER=$($PSQL "SELECT * FROM users WHERE username='$ANSWER'")
GAME_COUNT=$($PSQL "SELECT COUNT(*) FROM users WHERE username='$ANSWER'")
BEST=$($PSQL "SELECT MIN(score) from users WHERE username='$ANSWER'")

if [[ -z $USER ]]
  then
  echo "Welcome, $ANSWER! It looks like this is your first time here".
    else
    echo "Welcome back, $ANSWER! You have played $GAME_COUNT games, and your best game took $BEST guesses."
  fi

USERNAME=$ANSWER


RANDOM_NUMBER=$(( $RANDOM %1000 + 1 ))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000: " 
read ANSWER


GUESS_RANDOM() {

if [[ $1 ]]
then
  echo "$1" 
  read ANSWER
fi

if [[ ! $ANSWER =~ ^[0-9]+$ ]]
then 
  GUESS_RANDOM "That is not an integer, guess again:"
else
  if [[ $ANSWER -gt $RANDOM_NUMBER ]]
  then  
    ((GUESS_COUNT=GUESS_COUNT+1))
    GUESS_RANDOM "It's lower than that, guess again:"
  elif [[ $ANSWER -lt $RANDOM_NUMBER ]]
  then 
  ((GUESS_COUNT=GUESS_COUNT+1))
    GUESS_RANDOM "It's higher than that, guess again:"
  else
    ((GUESS_COUNT=GUESS_COUNT+1))
    INSERT=$($PSQL "INSERT INTO users VALUES('$USERNAME',$GUESS_COUNT)")
    echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi
fi

}
GUESS_RANDOM