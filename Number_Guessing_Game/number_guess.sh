#!/bin/bash

# Connect to the db ; tweaking needed if not used on the freecodecamp website
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Display title
echo "~~ Random Number Guesser ~~"

# Helper function to check username validity
STRING_LENGTH() {

STRING="$1"
# Count characters, remove 1 for new line
echo "$STRING" | wc --chars | while read CHAR_COUNT
do 
  echo $(($CHAR_COUNT -1))
done
}

# Welcome user and check for existing record on db
WELCOME_MENU() {

  # Display error message if any
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nEnter your username:"
  fi

  # Ask for username
  read USER_NAME

  # Validity check (0 < username < 30)
  USER_NAME_LENGTH=$(STRING_LENGTH $USER_NAME)
  if [[ $USER_NAME_LENGTH == 0 ]]
  then
    WELCOME_MENU -e "\nUsername should not be empty!"
  elif [[ ! $USER_NAME_LENGTH > 30 ]]
  then
    WELCOME_MENU -e "\nUsername is too long!"
  fi

  # Get user id from db if it exists
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")

  # Handle user welcome
  if [[ $USER_ID ]]
  then
    
    # Query count of games played and min guesses
    TOTAL_GAMES=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL"SELECT MIN(game_guesses) FROM games WHERE user_id=$USER_ID")
    echo -e "\nWelcome back, $USER_NAME! You have played $TOTAL_GAMES games, and your best game took $BEST_GAME guesses."
  else
    
    # Add new user
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME')")
    if [[ $INSERT_USER_RESULT = "INSERT 0 1" ]]
    then 
      echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
    else
      echo -e "\nSomething went wrong while registering a new user!"
      # exit
    fi
    # Get user id from db
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")
  fi

  # Start game
  START_GAME
}

# Initialize random number and counter and launch game
START_GAME() {

  # Generate a random number between 1 and 1000
  RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

  # Initialize guess count
  GUESS_COUNT=0

  # Play
  GUESS
}

# Handle user guesses until victory
GUESS() { 

  # Display error message if any
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
  echo -e "\nGuess the secret number between 1 and 1000:"
  fi 

  # Ask for user guess
  read USER_GUESS 

  # Validity check 
  if [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
  then
    GUESS "That is not an integer, guess again:"
  fi

  # Increment guess count
  GUESS_COUNT=$(( GUESS_COUNT + 1 ))

  # Evaluate guess  
  if (( $USER_GUESS < $RANDOM_NUMBER ))
  then
    GUESS "It's higher than that, guess again:"
  elif (( $USER_GUESS > $RANDOM_NUMBER ))
  then
    GUESS "It's lower than that, guess again:"
  elif (( $USER_GUESS == $RANDOM_NUMBER ))
  then
    RECORD_GAME
  fi
  echo -e "\nSomething went wrong while guessing!"
}

# Add game record to the db
RECORD_GAME() {
    
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(game_guesses, user_id) VALUES($GUESS_COUNT, $USER_ID)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
    echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    exit
  fi
  echo -e "\nSomething went wrong while registering a game record!"
}

WELCOME_MENU
