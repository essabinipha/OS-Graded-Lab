#!/bin/bash
input_file=$1

# Basic check for input file
if [ ! -f "$input_file" ]; then
    echo "Error: input file not found"
    exit 1
fi

# Clear output files if they already exist
> vowels.txt
> consonants.txt
> mixed.txt

# Read word by word, ignoring case
for word in $(cat "$input_file"); do
    # Only Vowels
    if [[ "$word" =~ ^[aeiouAEIOU]+$ ]]; then
        echo "$word" >> vowels.txt
    # Only Consonants
    elif [[ "$word" =~ ^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+$ ]]; then
        echo "$word" >> consonants.txt
    # Starts with Consonant and contains both
    elif [[ "$word" =~ ^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] ]]; then
        echo "$word" >> mixed.txt
    fi
done

echo "Categorization complete. Files generated: vowels.txt, consonants.txt, mixed.txt"
