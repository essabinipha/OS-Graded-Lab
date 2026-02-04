#!/bin/bash
dirA=$1
dirB=$2

# Check if both directory arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: ./sync.sh <directory1> <directory2>"
    exit 1
fi

echo "--- Comparison Results ---"

echo "Files present only in $dirA:"
comm -23 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo -e "\nFiles present only in $dirB:"
comm -13 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo -e "\nChecking for content mismatches in common files..."
for file in $(comm -12 <(ls "$dirA" | sort) <(ls "$dirB" | sort)); do
    # cmp -s checks if files are identical without printing output
    if ! cmp -s "$dirA/$file" "$dirB/$file"; then
        echo "MISMATCH: $file has different content."
    else
        echo "MATCH: $file is identical."
    fi
done
