#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_GOAL OPP_GOAL
do 
if [[ $YEAR != 'year' ]]; then
  # get winner id
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
  if [[ -z $WIN_ID ]]; then 
    SQL_RESULT=$($PSQL "insert into teams(name) values('$WIN')")
    if [[ $SQL_RESULT == "INSERT 0 1" ]]; then
      echo "Insert winner team: $WIN"
      WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
    fi
  fi
  # get opp id
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
  if [[ -z $OPP_ID ]]; then 
    SQL_RESULT=$($PSQL "insert into teams(name) values('$OPP')")
    if [[ $SQL_RESULT == "INSERT 0 1" ]]; then
      echo "Insert opponent team: $OPP"
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    fi
  fi
  SQL_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WIN_GOAL, $OPP_GOAL)")
  if [[ $SQL_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into games, $YEAR : $ROUND : $WIN_ID : $OPP_ID : $WIN_GOAL : $OPP_GOAL
  fi
fi
done

