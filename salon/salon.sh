#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "
echo -e "\n~~~~~ MY SALON ~~~~~\n"


MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "select * from services order by service_id")
  if [[ -z $SERVICES ]]; then
    EXIT
  else 
    echo "$SERVICES" | while IFS="| " read SERVICE_ID NAME
    do 
      echo "${SERVICE_ID}) ${NAME}"
    done
  fi  
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    MAIN_MENU "Input invalid. What would you like today?"
  else 
    SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
    SERVICE_NAME=$(echo ${SERVICE_NAME} | sed -r 's/^ *| *$//g')
    if [[ -z $SERVICE_NAME ]]; then
      MAIN_MENU "I could not find that service. What would you like today?"
    else 
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_NAME ]]; then 
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        CUSTOMER_NAM=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
        # create customer
        SQL_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
      fi
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your ${SERVICE_NAME}, ${CUSTOMER_NAME}?"
      read SERVICE_TIME
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID', '$SERVICE_ID_SELECTED')")
      echo -e "\nI have put you down for a $SERVICE_NAME at ${SERVICE_TIME}, ${CUSTOMER_NAME}."
    fi
  fi

}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU "Welcome to My Salon, how can I help you?"

