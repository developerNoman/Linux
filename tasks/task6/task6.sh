#!/bin/bash

INPUT_FILE="task6.csv"
OUTPUT_FILE="formattedResult.csv"
LOG_FILE="warnings.log"

# > "$OUTPUT_FILE"
# > "$LOG_FILE"

if [ -e "$INPUT_FILE" ]; then
  echo "The file '$INPUT_FILE' exists."
else
  echo "The file '$INPUT_FILE' does not exist."
fi
if [ -r "$INPUT_FILE" ]; then
  echo "The file '$INPUT_FILE' is readable."
else
  echo "The file '$INPUT_FILE' is not readable or does not exist."
fi

echo -e "First Name\tLast Name\tEmail\tPhone Number\tDomain\tFull Name" > "$OUTPUT_FILE"

format_phone() {
    local phone=$1
    digits=$(echo "$phone" | tr -cd '[:digit:]')
    if [[ $digits =~ ^[0-9]{10}$ ]]; then
        formatted_phone=$(echo "$digits" | sed 's/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]\{4\}\)/(\1) \2-\3/')
        echo "$formatted_phone"
    else
        echo "INVALID"
    fi
}


tail -n +2 "$INPUT_FILE" | while IFS=',' read -r firstname lastname email phone; do
    domainname=$(echo "$email" | awk -F '@' '{print $2}')
    fullname="$firstname $lastname"
    formatted_phone=$(format_phone "$phone")
    
    if [[ $formatted_phone != "INVALID" ]]; then
        echo "$firstname,$lastname,$email,$formatted_phone,$domainname,$fullname" >> "$OUTPUT_FILE"
    else
        echo "Incorrect format for $firstname, $lastname, $email, $phone" >> "$LOG_FILE"
    fi
done


sort -t ',' -k 6 "$OUTPUT_FILE" -o "$OUTPUT_FILE"


total_rows1=$(wc -l < "$INPUT_FILE")
total_rows2=$(wc -l < "$OUTPUT_FILE")
total_rows3=$((total_rows1 - total_rows2))

echo "Total number of rows in input file: $total_rows1"
echo "Total number of rows in formatted file: $total_rows2"
echo "Total number of rows in log file: $total_rows3"


echo "Top 10 most common email domains:"
awk -F ',' 'NR>1 {split($3, parts, "@"); print parts[2]}' "$INPUT_FILE" | sort | uniq -c | sort -rn | head -n 10 | awk '{print $2}'
