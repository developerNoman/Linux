#!/bin/bash
file="task6.csv"
outputFile="formattedsssResult.csv"
LOG_FILE="warning.log"


#checking that the file exist+readable or not (task1)
if [[ ! -f "$file" ]]; then
  echo "Error: The file '$file' does not exist."
  exit 1
fi
if [[ ! -r "$file" ]]; then
  echo "Error: The file '$file' is not readable."
  exit 1
fi
echo "The file '$file' exists and is readable."


#making the formatted.csv file (task2)
cp  "$file" "$outputFile"

echo ""First Name,Last Name,Email,Phone Number,Full Name,Domain"" > $outputFile
echo "" > $LOG_FILE


awk -F ',' 'NR>1 {split($3, parts, "@"); print $1","$2","$3","$4","$1" "$2 "," parts[2]}' "$file" | sort -t ',' -k 5 >> "$outputFile"


#report
total_rows=$(wc -l < "$file")

echo "Total number of rows in input file: $total_rows"


total_rows2=$(wc -l < "$outputFile")

echo "Total number of rows in formatted file: $total_rows2"


domain_counts=$(awk -F ',' '{print $6}' "$outputFile"| tail -n +2)
top_domains=$(echo "$domain_counts" | head -n 10)
echo "Top 10 most common email domains:"
echo "$top_domains" | sort | uniq -c | sort -rn | head -n 10 | awk '{print $2" ("$1" occurrences)"}'



