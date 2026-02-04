#!/bin/bash

# Validate that the input file exists
if [ ! -f "emails.txt" ]; then
    echo "Error: emails.txt not found"
    exit 1
fi

# Extract valid email addresses using regex and remove duplicates
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt | sort | uniq > valid.txt

# Extract invalid email addresses
grep -vE '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

echo "Processing complete."
echo "Valid emails saved to valid.txt"
echo "Invalid emails saved to invalid.txt"
