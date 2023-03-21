#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then 
 echo Please provide an element as an argument.
 else

#if argument is atomic number
if [[ $1 =~ ^[0-9]+$ ]]
then 
  #get element where atomic number=$1
  ELEMENT=$($PSQL "SELECT * FROM elements LEFT JOIN PROPERTIES USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1");
else
  ELEMENT=$($PSQL "SELECT * FROM elements LEFT JOIN PROPERTIES USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'");
fi


if [[ -z $ELEMENT ]]
  then 
    echo I could not find that element in the database.
  else
   echo "$ELEMENT" | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELT_POINT BOIL_POINT TYPE
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
    done
  fi
fi
