#!/bin/bash

INPUT_FILE="task6.csv"
OUTPUT_FILE="output.csv"
LOG_FILE="warnings.log"

echo "" > $OUTPUT_FILE
echo "" > $LOG_FILE

while IFS=, read -r id name phone; do

    cleaned_phone=$(echo $phone | tr -cd '[:digit:]')
    

    if [[ $cleaned_phone =~ ^[0-9]{10}$ ]]; then

        formatted_phone=$(echo $cleaned_phone | sed 's/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]\{4\}\)/(\1) \2-\3/')
        echo "$id,$name,$formatted_phone" >> $OUTPUT_FILE
    else

        echo "Warning: Incorrect phone number format for ID $id, Name $name, Phone $phone" >> $LOG_FILE
    fi
done < $INPUT_FILE


