#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else
if [[ $1 =~ [0-9][0-9]* ]]
then
ELEMENT="$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")"
else
ELEMENT="$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1'")"
if [[ -z $ELEMENT ]]
then 
ELEMENT="$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$1'")"
fi
fi

if [[ ! -z $ELEMENT ]]
then
read ROW ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_TRUE <<< "$(echo $ELEMENT | sed "s/|/ /g")"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_TRUE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
else
echo "I could not find that element in the database."
fi
fi
