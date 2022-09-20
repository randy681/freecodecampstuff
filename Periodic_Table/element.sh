#!/bin/bash

# connect to the db to send requests; tweaking needed if not used on the freecodecamp website
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# check if arg1 is empty
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# check arg1 type
if [[ $1 =~ ^[0-9]*$ ]]
then
  CONDITION="WHERE atomic_number=$1"
elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
then 
  CONDITION="WHERE symbol='$1'"
else
  CONDITION="WHERE name='$1'"
fi

# get element from db
ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) $CONDITION")

# check if db response is empty
if [[ ! $ELEMENT ]]
then
  echo "I could not find that element in the database."
else
  # format output
  echo "$ELEMENT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
fi
