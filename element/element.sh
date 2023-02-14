#!/bin/bash

PrintResult() {
  IFS="| " read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE <<< "$SQL_RESULT"

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
}

if [[ $# < 1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
p=$1

# if is a number, search it as atomic_number
SEARCH="select atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type  from elements inner join properties using(atomic_number) inner join types using(type_id)"
if [[ $p =~ ^[0-9]+$ ]]; then 
  SQL_RESULT=$($PSQL "$SEARCH where atomic_number='$p'");
  if [[ -z $SQL_RESULT ]]; then 
    echo "I could not find that element in the database."
    exit 0
  fi
  PrintResult "$SQL_RESULT"
else
    SQL_RESULT=$($PSQL "$SEARCH where name='$p'");
    if [[ ! -z $SQL_RESULT ]]; then 
      PrintResult "$SQL_RESULT"
      exit 0
    fi
    SQL_RESULT=$($PSQL "$SEARCH where symbol='$p'");
    if [[ ! -z $SQL_RESULT ]]; then 
      PrintResult "$SQL_RESULT"
      exit 0
    fi
    echo "I could not find that element in the database."
fi
