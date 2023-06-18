#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "


MAIN_MENU() {
SERVICE_IDS=()
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?"

while read SERVICE_ID BAR SERVICE_NAME
do
  if [[ $SERVICE_ID =~ ^[1-9][0-9]* ]]
  then
    SERVICE_IDS+=("$SERVICE_ID")
    echo "$SERVICE_ID) $SERVICE_NAME"
  fi
done <<< "$(echo -e "$($PSQL "SELECT * FROM services;")")"
#read number
read SERVICE_ID_SELECTED
#if not number
#return to main menu

while [[ ! "${SERVICE_IDS[*]}" =~ "$SERVICE_ID_SELECTED" ]]
do
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?"

echo -e "$($PSQL "SELECT * FROM services;")" | while read SERVICE_ID BAR SERVICE_NAME
do
  if [[ $SERVICE_ID =~ ^[1-9][0-9]* ]]
  then
    echo "$SERVICE_ID) $SERVICE_NAME"
  fi
done
read SERVICE_ID_SELECTED
done

SERVICE_NAME_RESULT="$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")"

#ask for number
echo -e "\nWhat's your phone number?"
#if not found
read CUSTOMER_PHONE
CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
if [[ -z $CUSTOMER_ID ]]
then
#create new customer
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME

WRITE_CUSTOMER_TO_DB_RESULT="$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")"
CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
fi

#ask for time
echo -e "\nWhat time would you like your$SERVICE_NAME_RESULT, $CUSTOMER_NAME?"
read SERVICE_TIME
WRITE_APPOINTMENT_TO_DB_RESULT="$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")"

echo -e "\nI have put you down for a$SERVICE_NAME_RESULT at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU