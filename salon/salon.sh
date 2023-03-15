#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ My Salon ~~~~~\n"
echo -e "\nWelcome to my Salon, how can I help you\n"

SERVICE_CHOICE () {
   
   if [[ $1 ]]
   then 
    echo "$1"
   fi

   SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")
   #display services
   echo -e "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
   do 
   if [[  ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      echo "$SERVICE_ID) $SERVICE_NAME"
    fi
   done

   #ask for which service to chose and get service_id
  read SERVICE_ID_SELECTED
 
  SERVICE_COUNT=$($PSQL "SELECT COUNT(*) FROM services" )

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ || $SERVICE_ID_SELECTED -gt $SERVICE_COUNT ]]
    then
      SERVICE_CHOICE "I could not find that service. What would you like today?"
    else
  
    #get customer info

    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE;

    CUSTOMER_NAME=$($PSQL "SELECT name FROm customers WHERE phone='$CUSTOMER_PHONE'")

    #if not exist 
    if [[ -z $CUSTOMER_NAME ]]
    then
    #get customer name
      echo -e "\nI don't have a record for that phone number. What's your name?"
      read CUSTOMER_NAME
      #insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi

     #get appointment time
    echo -e "\nAt what time do you wish to get an appointment?"
    read SERVICE_TIME

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
   #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    #insert to appointments
    INSERT_APP_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
  # send to main_menu
}

SERVICE_CHOICE
