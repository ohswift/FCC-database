#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

generateRandom() {
  echo $(( $RANDOM % 1000 + 1 ))
}

echo "Enter your username:"
read USER_NAME
USER_NAME=$(echo $USER_NAME | sed -r 's/^ *| *$//g')

USER_ID=$($PSQL "select user_id from users where name='$USER_NAME'")
if [[ -z $USER_ID ]]; then 
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  SQL_RESULT=$($PSQL "insert into users(name) values('$USER_NAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USER_NAME'")
else
  # search game data
  SQL_RESULT=$($PSQL "select count(*),min(try_count) from games where user_id='$USER_ID'")
  if [[ -z SQL_RESULT ]]; then 
    GAME_PLAYED=0
    BEST_PLAY=0
  else
    IFS="| " read GAME_PLAYED BEST_PLAY <<< "$SQL_RESULT"
  fi
  echo "Welcome back, $USER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_PLAY guesses."
fi

GUESS_TRY=0
RAND_NUM=$( generateRandom )
# echo $RAND_NUM

echo "Guess the secret number between 1 and 1000: "

while true
do 
  read GUESS_NUM
  if [[ ! $GUESS_NUM =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESS_TRY=$(( $GUESS_TRY + 1 ))

  if [[ $GUESS_NUM == $RAND_NUM ]]; then
    # insert to game db
    echo "You guessed it in $GUESS_TRY tries. The secret number was $RAND_NUM. Nice job!"
    SQL_RESULT=$($PSQL "insert into games(user_id,try_count) values('$USER_ID','$GUESS_TRY')")
    exit 0
  fi

  if [[ $GUESS_NUM < $RAND_NUM ]]; then
    echo "It's higher than that, guess again: "
  else
    echo "It's lower than that, guess again: "
  fi

done
