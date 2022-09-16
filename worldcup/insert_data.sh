#! /bin/bash
# Script to insert data from games.csv into worldcup database

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#truncate the data before running the script
echo $($PSQL "TRUNCATE games, teams")

#loop through games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != 'year' ]]
then 
   #get winner_id from teams
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  #if not there
  if [[ -z $WINNER_ID ]]
  then

    #insert winner to teams
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into teams, $WINNER"
    fi

    #get winner_id from teams
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  fi

#get opponent_id from teams 
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  #if not there
  if [[ -z $OPPONENT_ID ]]
  then

    #insert opponent to teams
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Insert into teams, $OPPONENT"
    fi

    #get opponent_id from teams 
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  fi


#insert game to games
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
    echo "Insert into games, $YEAR $WINNER - $OPPONENT"
  fi

fi
done
