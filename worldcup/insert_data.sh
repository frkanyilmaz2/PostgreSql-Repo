#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE teams,games RESTART IDENTITY")


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Inserting teams 
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then
    
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
   
    if [[ -z $WINNER_ID ]]
      then 
      INSERT_TEAM_NAME=$($PSQL "Insert INTO teams(name) Values('$WINNER')")
      if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]]
        then
          echo Inserted into teams, $WINNER
      fi
    fi
   if [[ -z $OPP_ID ]]
     then
      INSERT_TEAM_FROM_OPPS=$($PSQL "Insert INTO teams(name) Values('$OPPONENT')")
      if [[ $INSERT_TEAM_FROM_OPPS == "INSERT 0 1"  ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi

  
if [[ $YEAR != "year" && $ROUND != "round" && $WINNER != "winner" && $OPPONENT != "opponent" 
&& $WINNER_GOALS != "winner_goals"
&& $OPPONENT_GOALS != "opponent_goals" ]]
 
  then
  WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
  OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
  
  INSERT_TO_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals)
    VALUES('$YEAR','$ROUND',$WINNER_ID,$OPP_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  
  fi 

  fi
done
