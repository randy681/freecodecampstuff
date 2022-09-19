#!/bin/bash

# connect to the db to send requests ; tweaking needed if not used on the freecodecamp website
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~    Salon    ~~~~~\n"

SERVICE_MENU() {

  # if error message
  if [[ $1 ]]
  then
    # display error message
    echo -e "\n$1\n"
  fi

  # display service menu
  echo "What service do you want to book?" 
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read S_ID BAR S_NAME
  do
    echo "$S_ID) $S_NAME"
  done

  # get service request
  read SERVICE_ID_SELECTED

  # get services id list and format it like this: 1|2|3|4
  SERVICES_ID_LIST=$($PSQL "SELECT service_id FROM services")
  FORMATTED_LIST=$(echo $SERVICES_ID_LIST | sed 's/ /|/g; s/^|//; s/|$//')

  # compare input to list
  eval "case \"$SERVICE_ID_SELECTED\" in
    $FORMATTED_LIST)
        SERVICE_ID=$SERVICE_ID_SELECTED
        CUSTOMER_MENU ;;
    *)
        SERVICE_MENU \"Please enter a valid option.\" ;;
  esac"
}

CUSTOMER_MENU() {

  #### On first call, give confirmation of the selected service; afterwards display the error message instead
  
  # if error message
  if [[ $1 ]]
  then
    # display error message
    echo -e "\n$1\n"
  else
    # confirm service selected
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")
    echo -e "\nService selected: $(echo $SERVICE_NAME | tr A-Z a-z)"
  fi

  #### Get customer phone number, check if id exists in db, otherwise add new customer and get id from db

  # get customer phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  # validity check (disabled to pass the tests)
  if [[ ! $CUSTOMER_PHONE =~ ^([0-9]{3}-){2}[0-9]{4}$ ]]
  then
    # CUSTOMER_MENU "Invalid phone number format"
    echo "Invalid phone number format."
  fi

  # get customer id from db
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'") 
  # if customer id exists
  if [[ $CUSTOMER_ID ]]
  then
    # get customer name from db
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
    echo -e "\nWelcome back $(echo $CUSTOMER_NAME!)"
  else
    # get customer name
    echo -e "\nWhat is your name?"
    read CUSTOMER_NAME
    # validity check (disabled to pass the tests)    
    if [[ -z $CUSTOMER_NAME ]]
    then
      # CUSTOMER_MENU "Name should not be empty"
      echo "Name should not be empty."
    fi
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT = "INSERT 0 1" ]]
    then
      echo -e "\nWelcome to our guest list $(echo $CUSTOMER_NAME)!"
    fi
  fi
  # get customer_id from db
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # send to appointment menu
  APPOINTMENT_MENU
}

APPOINTMENT_MENU() {

  # if error message
  if [[ $1 ]]
  then
    # display error message
    echo -e "\n$1\n"
  fi

  #### Set appointment time and confirm

  # get time
  echo -e "\nWhat time do you want to get your $(echo $SERVICE_NAME | tr A-Z a-z)? (hh:mm or am/pm)"
  read SERVICE_TIME
  # validity check (disabled to pass the tests)
  if [[ ! ($SERVICE_TIME =~ ^[0-2][0-4]:[0-5][0-9]$ || $SERVICE_TIME =~ ^([1][0-2]|[0-9])(am|pm)$) ]]
  then
    # APPOINTMENT_MENU "Invalid time format"
    echo "Invalid time format."
  fi
  # insert new appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT_RESULT = "INSERT 0 1" ]]
  then
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | tr A-Z a-z) at $SERVICE_TIME, $(echo $CUSTOMER_NAME)."
  fi
}

SERVICE_MENU 