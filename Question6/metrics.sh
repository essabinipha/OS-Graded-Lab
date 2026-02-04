#!/bin/bash

# Ensure input file exists
if [ ! -f "input.txt" ]; then
    echo "Error: input.txt not found"
    exit 1
fi

# Convert text to a list of words
words=$(tr -s ' ' '\n' < input.txt)

echo "--- Text Metrics ---"

# Use awk to find longest/shortest by comparing character lengths
echo "Longest word: $(echo "$words" | awk '{print length, $0}' | sort -nr | head -1 | cut -d' ' -f2-)"
echo "Shortest word: $(echo "$words" | awk '{print length, $0}' | sort -n | head -1 | cut -d' ' -f2-)"

# Calculate average length using awk sum and count
echo "Average word length: $(echo "$words" | awk '{sum += length($0); n++} END {if (n>0) print sum/n}')"

# Use sort -u and wc to count unique entries
echo "Total unique words: $(echo "$words" | sort -u | wc -l)"
