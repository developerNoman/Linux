#!/bin/bash

INPUT_FILE="input.csv"
OUTPUT_FILE="output.csv"
LOG_FILE="error.log"

# Header for the output file
echo "First Name,Last Name,Full Name,Email,Phone Number,Domain" > $OUTPUT_FILE

# Function to format phone numbers (example function, adjust as needed)
format_phone() {
    phone=$1
    # Basic example: Strip non-digit characters and ensure it has 10 digits
    formatted=$(echo "$phone" | tr -d -c 0-9)
    if [[ ${#formatted} -eq 10 ]]; then
        echo "$formatted"
    else
        echo "INVALID"
    fi
}

# Read the input file and process each line
while IFS=, read -r firstname lastname email phone; do
    # Skip header line
    if [[ "$firstname" == "First Name" ]]; then
        continue
    fi

    # Extract domain from email using awk
    domainname=$(echo "$email" | awk -F '@' '{print $2}')

    # Format phone number
    formatted_phone=$(format_phone "$phone")

    # Combine first name and last name into full name
    fullname="$firstname $lastname"

    if [[ $formatted_phone != "INVALID" ]]; then
        echo "$firstname,$lastname,$fullname,$email,$formatted_phone,$domainname" >> "$OUTPUT_FILE"
    else
        echo "Warning: Incorrect phone number format for Name $firstname $lastname, Email $email, Phone $phone" >> "$LOG_FILE"
    fi
done < "$INPUT_FILE"

# Count the total number of rows in the log file
total_rows=$(wc -l < "$LOG_FILE")
total_rows2=0  # Assuming this is for subtracting specific lines if needed, otherwise set it to 0 or a specific value

# Calculate the difference
total_rows_diff=$(echo "$total_rows - $total_rows2" | bc)

# Print the total number of rows in the log file
echo "Total number of rows in log file: $total_rows_diff"

