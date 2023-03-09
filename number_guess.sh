#!/bin/bash

PSQL="psql -X --tuples-only --username=freecodecamp --dbname=number_guess -c"

echo "Enter your username:"
read USERNAME

USER_AVAILABILITY_CHECK=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")

BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM users INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")

# if username is new
if [[ -z $USER_AVAILABILITY_CHECK ]]
then
# insert new user
INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
echo "Welcome, $USERNAME! It looks like this is your first time here."
else
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDON_NUMBER=$((1 + $RANDOM % 1000))
NR_GUESS=1
echo "Guess the secret number between 1 and 1000:"

while read NUMBER
  do
  #check if number is integer
    if [[ ! $NUMBER =~ ^[0-9]+$ ]]
      then
      echo "That is not an integer, guess again:"
      else
      # check if it is the number, smaller or greater
      if [[ $NUMBER -eq $RANDON_NUMBER ]]
        then
        break;
        else
          if [[ $NUMBER -gt $RANDON_NUMBER ]]
          then
           echo -n "It's lower than that, guess again:"
          elif [[ $NUMBER -lt $RANDON_NUMBER ]]
          then
          echo -n "It's higher than that, guess again:"
        fi
      fi
    fi
    NR_GUESS=$(($NR_GUESS + 1 ))
  done

if [[ $NR_GUESS == 1 ]]
  then
    echo "You guessed it in $NR_GUESS tries. The secret number was $RANDON_NUMBER. Nice job!"
  else
    echo "You guessed it in $NR_GUESS tries. The secret number was $RANDON_NUMBER. Nice job!"
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

INSERT_GAME=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($NR_GUESS, $USER_ID)")

